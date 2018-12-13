<%
If(Len(Session("idUser")) = 0) then
Session("Msg") = "Veuillez vous identifier"
Response.redirect("LoginForm.asp")
End if
%>

<html>
<head>
 <title>composer un message</title>
</head>
<body bgcolor="lightgreen">
   <center><h1>composer un message</h1></center>



</body>
</html>