<%
If(Len(Session("idUser")) = 0) then
Session("Msg") = "Veuillez vous identifier"
Response.redirect("LoginForm.asp")
End if

 Status = Request.QueryString("idStatus")  'parameter de GET  and Request.Form("idStatus")  parameter de POST

     IdER = "idEmetteur"
      	ER = "Emetteur"
      if (Status = 4) then
      	IdER = "idRecepteur"
      	ER = "Recepteur"
      END if	

Set cx = Server.CreateObject("ADODB.Connection")
	 cx.Open Application("PCSQLSERVER")

     'req = "ReqUserVerif '" & login & "','" & passwd & "'"
	 'req = "Select * from TUSERS where Login='" & login & "'" & " and Passwd ='" & passwd & "'"
	 req = "Select * from TMESSAGES where idRecepteur=" & Session("IdUser") & " and Status=" & Status 
          
	 Set rs = Server.CreateObject("ADODB.RecordSet")
	' rs.Open "select * from TUSERS where Login=", Application("PCSQLSERVER")
	 rs.Open req, cx , 3 , 3 
%>

<html>
<head>
 <title>Liste des messages</title>
 <meta charset="UTF-8">
 <script type="text/javascript">
 	 var nbm = <%= Rs.RecordCount%> ;
 	 var nbmc = 0 ;
 	function SelectAll(cbg , VCBM)
 	{
 	   var nbm = VCBM.length ;

       for (var i=0 ; i<nbm ; i++) 
       {
           VCBM[i].checked = cbg.checked ;
       }

       if(cbg.checked)
       {
       	nbmc = nbm ;
       }else
       {
         nbmc = 0 ; 
       }
 	}

    function SetChange(cbm, cbg)
    {

       if (cbm.checked)
       {
          nbmc++;
          if(nbm === nbmc)
          {
          	cbg.checked = true;
          }
       }else
       {
       	 nbmc--;
       	 cbg.checked = false;
       }
    }
    
    function Verif()
    {
    	if(nbmc== 0)
    	 {
    		alert('Veuillez selectionner un ou plusieurs messages') ;
    	    return ;
    	  } 
    	  document.getElementById('MessageListeForm').action = "MessageListeAction.asp" ;
    	  document.getElementById('MessageListeForm').method = "POST" ;
    	  document.getElementById('MessageListeForm').submit() ;
    }

 </script>
</head>
<body bgcolor="gold">
   <center><h1>Liste des messages</h1></center>
   <br>

   <form namae="MessageListeForm" id="MessageListeForm" >
    <center>
     <select name="LOPE" id="LOPE">
     	<% If ( Status = "1" ) then %>
     	 <option value="2" >Marquer comme lu</option>
     	 <option value="3" >Marquer comme supprimer</option>
     	<% ElseIf ( Status = "2" ) then %>
     	 <option value="1" >Marquer comme non lu</option>
     	 <option value="3" >Marquer comme supprimer</option>
     	<% ElseIf ( Status = "3" ) then %>
     	 <option value="1" >Marquer comme non lu</option>
     	 <option value="3" >Marquer comme lu</option>
     	 <option value="-1" >Supprimer definitivement</option>
     	<% ElseIf ( Status = "4" ) then %>
     	 <option value="1" >Envoyer</option>
     	 <option value="-1" >Supprimer definitivement</option>
     	<%End If%>
     </select>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
     <input type="button" name="BTValider" id="BTValider" value="valider" onclick="javascript:Verif();">
    </center> 
   <br>
   <table border="1" align="center">
   	  <tr>
   	  	<td align="center" valign="center" width="100" ><b><%=ER %></b></td>
   	  	<td align="center" valign="center" width="300" ><b>Sujet</b></td>
   	  	<td align="center" valign="center" width="300" ><b>Date</b></td>
   	  	<td align="center" valign="center" width="50" >
            <input type="checkbox" name="CBSelectAll" id="CBSelectAll" 
                 onclick="javascript:SelectAll(this , document.getElementsByName('CBMsg'));">
   	  	</td>
   	  </tr><% 
   	    i = 0
   	    nbe = UBound(Application("TabCol")) + 1
   	   WHILE NOT Rs.EOF %>
   	  <tr bgcolor="<%=Application("TabCol")(i mod nbe) %>">
   	  	<td align="center" valign="center" width="100" ><%=Rs(IdER) %></td>
   	  	<td align="center" valign="center" width="100" ><%=Rs("Sujet") %></td>
   	  	<td align="center" valign="center" width="100" ><%=Rs("DateEnvoi") %></td>
   	  	<td align="center" valign="center" width="100" >
        <input type="checkbox" name="CBMsg" id="CBMsg_<%=Rs("IdMessage") %>" value="<%=Rs("IdMessage") %>" onclick="javascript:SetChange(this, document.getElementById('CBSelectAll'));">

   	  	</td>
   	  </tr><% 
   	         i = i + 1 
   	       Rs.MoveNext
         WEND%>
   </table>
   </form>
</body>
</html>
<%
	 rs.close()
	 Set rs = nothing
	 cx.close()
	 Set cx = nothing
%>







