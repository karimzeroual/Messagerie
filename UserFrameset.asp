<%
If(Len(Session("idUser")) = 0) then
Session("Msg") = "Veuillez vous identifier"
Response.redirect("LoginForm.asp")
End if
%>
<html>
<head>
<frameset cols="150,*">
 <frame name="Menu" src="Menu.asp" frameborder="0" noresize></frame>
 <frame name="Data" src="Data.asp" frameborder="0" noresize></frame>
</frameset>
</head>
</html>