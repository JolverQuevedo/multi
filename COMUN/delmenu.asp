<%@ Language=VBScript %>
<!--#include file="../includes/Cnn.inc"-->

<%Response.Buffer = TRUE %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<BODY>

<%
'*********************** OJO **********************
'REVISAR EL LARGO DE LAS COLUMNAS de la tabla
'*********************** OJO **********************
COD = ucase(TRIM(Request.QueryString("COD")))
    
'	busca si encuentra un código duplicado

	CAD =   " SELECT menu FROM menu " & _
			" WHERE  menu = '"&COD&"' "
	RS.Open CAD, CNN
	Response.Write(CAD)
	

		RS.Close
			CAD =	 " delete FROM menu " & _
			" WHERE  menu = '"&COD&"' "
'Response.Write (CAD)
'Response.Write("../menu.asp?POS="+COD )
'Response.end
' Inicia transacción , para que los datos no queden a medias

Cnn.Execute(CAD)
    Cnn.close
'regresa a la página de donde fué llamado, para que vea que agregó el registro
    


%>
<script language="javascript" type="text/jscript">
    window.close();
    window.opener.location.replace = 'http://intranet/multi/menus.asp'
</script>
</BODY>
</HTML>
