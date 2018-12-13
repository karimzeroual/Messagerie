<%
    dim login , passwd
    
	login = Request("TLogin")
	passwd = Request("TPasswd")
	
	 Set cx = Server.CreateObject("ADODB.Connection")
	 cx.Open Application("PCSQLSERVER")

     'req = "ReqUserVerif '" & login & "','" & passwd & "'"
	 req = "Select * from TUSERS where Login='" & login & "'" & " and Passwd ='" & passwd & "'"
	 'req = "Select * from TUsers"

	 Set rs = Server.CreateObject("ADODB.RecordSet")
	' rs.Open "select * from TUSERS where Login=", Application("PCSQLSERVER")
	 rs.Open req, cx , 3 , 3 
	 
	 if(rs.RecordCount = 1) then
	  Response.write "<br> User Id : " & rs("idUser")
	  Session("IdUser") = rs("idUser")
	  Response.redirect("UserFrameset.asp")
	  Else
	     Session("IdUser") = ""
	     Session("Log") = login
		 Session("Pas") = passwd
		 Session("Msg") = "Login et/ou mot de passe incorrect"
	     Response.redirect("LoginForm.asp")
	 End if 
	 
	 rs.close()
	 Set rs = nothing
	 cx.close() 

%>

<!--
if(rs.RecordCount = 1) then
	  Response.write "<br> User Id : " & rs("idUser")
	  Session("IdUser") = rs("idUser")
	  Response.redirect("UserFrameset.asp")
	  Else
	     Session("IdUser") = ""
	     Session("Log") = login
		 Session("Pas") = passwd
		 Session("Msg") = "Login et/ou mot de passe incorrect"
	     Response.redirect("LoginForm.asp")
	 End if 




       rs.Open "Select * from TUsers", Application("PCSQLSERVER")
do until rs.EOF		 
     for each x in rs.fields
        response.write(x.name)
        response.write(" = ")
        response.write(x.value) & "<br>"
    next
	rs.MoveNext

loop
rs.close
-->