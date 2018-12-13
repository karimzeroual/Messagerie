<%
  ope = Request.Form("LOPE")
  listid = Request.Form("CBMsg")

  Response.write "OPE : " & ope & "<br> liste des id : " & listid
%>