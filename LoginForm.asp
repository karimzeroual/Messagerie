<html>
<head>
 <title>Page de Connexion</title>
 <script>
  function verif()
  {
     var login = document.getElementById('TLogin') ;
	 var passwd = document.getElementById('TPasswd') ;
	 if(login.value.length == 0)
	 {
	    alert('Veuillez saisir le login') ;
		login.focus() ;
		return ;
	 }
	 if(passwd.value.length == 0)
	 {
	    alert('Veuillez saisir le mot de passe') ;
		passwd.focus() ;
		return ;
	 }
	 document.getElementById('FormLogin').submit() ;
  }
 </script>
</head>
<body bgcolor="#778899" style="opacity:1">
 <table cellspacing="0" cellpadding="0" width="100%" height="100%">
  <tr>
   <td align="center" valign="middle" style="font-size: 4cm">
   <form method="post" action="LoginAction.asp" name="FormLogin" id="FormLogin" target="top">
    <table border="0" cellspacing="0" cellpadding="0" height="130" >
		 <caption align="center" style="font-size: 21px; color:maroon" >
			<h4 style="border-bottom:3px solid white">Saisir votre login et votre mot de passe</h4>
		 </caption>
	   <tr height="30">
			<td align="right" valign="middle" style="font-size: 25px; color:lightcyan" >
				<b>login &ensp;</b>
			</td>
		  <td align="center" valign="middle" >
			 <input type="text" name="TLogin" id="TLogin" value="<%=Session("Log") %>" maxlength="10" 
			    style="width: 200 ; font-weight: bold ;" placeholder=" Entrez le nom d'utilisateur">
		  </td>
	   </tr>
	   <tr height="30">
	    <th align="right" valign="middle" style="font-size: 25px; color:lightcyan" >
				<b>mot de passe &ensp;</b>
			</th>
		  <td align="center" valign="middle" >
			 <input type="password" name="TPasswd" id="TPasswd" maxlength="10" value="<%=Session("Pas") %>" 
			    style="width: 200; font-weight: bold ;" placeholder=" Entrez le mot de passe">
		  </td>
	   </tr>
	   <% If (Len(Session("Msg")) > 0 ) then  %>
		  <tr height="30">
	       <td align="right" valign="middle" colspan="2" style="color:lightcyan" >
				<span style="color:red"><%=Session("Msg") %></span>
			</td>
	   </tr>
		<% End if %>
	   <tr height="30">
		  <td align="right" valign="middle" width="300" colspan="2">
		   <input type="button" name="BTNLogin" id="BTNLogin" value="Se Connecter" onclick="verif() ;">
		  </td>
	   </tr>
	  </table>
   </form>	
   </td>
  </tr>
 </table> 
<%
Session("Log")=""
Session("Pas")=""
Session("Msg")=""
%>
</body>
</html>