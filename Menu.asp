<%
If(Len(Session("idUser")) = 0) then
Session("Msg") = "Veuillez vous identifier"
Response.redirect("LoginForm.asp")
End if
%>

<html>
<head>
 <meta charset="UTF-8">
 <title>Menu</title>
</head>
<body bgcolor="pink">
   <center><h1>MENU</h1></center>

   <a href="MessageForm.asp?IdStatus=0" target="Data">Composer un message</a><br><br>
   <a href="MessageListe.asp?IdStatus=1" target="Data">Messages recus</a><br><br>
   <a href="MessageListe.asp?IdStatus=2" target="Data">Messages lus</a><br><br><!-- Message nest pas lus-->
   <a href="MessageListe.asp?IdStatus=3" target="Data">Messages supprimés</a><br><br>
   <a href="MessageListe.asp?IdStatus=4" target="Data">Messages sauvegardés</a><br><br>

</body>
</html>