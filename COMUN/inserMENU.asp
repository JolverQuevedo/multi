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
DES = ucase(TRIM(Request.QueryString("DES")))

    
if cod=null or cod = "" then
    kad=" SELECT TOP 1 MENU from menu  ORDER BY MENU DESC"
    RS.Open kad, CNN
        cOd=RS.FIELDS("MENU")
    RS.Close
end if
'	busca si encuentra un c�digo duplicado

	CAD =   " SELECT menu FROM menu " & _
			" WHERE  DESMENU = '"&DES&"' "
	RS.Open CAD, CNN
	Response.Write(CAD)
	'Response.END
if NOT RS.EOF OR NOT RS.BOF then	
	IF RS.RecordCount > 0 THEN	
		RS.Close
			CAD =	" UPDATE  menu set " & _
					" menu		= '"&COD&"',  " & _
					" desmenu	= '"&DES&"'  " & _
					" WHERE   " & _
					" menu = '"&COD&"' ; "
	end if 	
else	
	CAD =	" insert into menu SELECT TOP 1 RIGHT('00'+cast(MENU+1 as varchar(2)),2) as menu,'"+des+"' as desmenu FROM MENU ORDER BY MENU DESC"
End if
'Response.Write (CAD)
'Response.Write("../menu.asp?POS="+COD )
'Response.end
' Inicia transacci�n , para que los datos no queden a medias

Cnn.Execute(CAD)
    Cnn.close
'regresa a la p�gina de donde fu� llamado, para que vea que agreg� el registro



%>
<script language="javascript" type="text/jscript">
    alert("Se registr�/actualiz� correctamente");
    

    window.opener.location.replace = 'http://intranet/multi/menus.asp?pos=<%=COD%>'
    setTimeout(function () {window.close();},500)
</script>
</BODY>
</HTML>
