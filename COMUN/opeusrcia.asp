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

OPE = ucase(TRIM(Request.QueryString("OPE")))
CAD = ""

if ope = "E" then
    cod = TRIM(Request.QueryString("COD"))
    des = ucase(TRIM(Request.QueryString("des")))
    CAD = "delete from MULTI..[USR-CIA] where USUARIO = '"+cod+"' and CIA='"+des+"'"
    response.Write(cad)
    Cnn.Execute(CAD)
    RESPONSE.Write("<script language='javascript' type='text/jscript'>alert('eliminado');parent.location.replace = 'http://intranet/multi/comun/buscausrcia.asp?usr="+cod+"';window.close()</script>")
else 
    if ope = "I" then
        cod = TRIM(Request.QueryString("COD"))
        des = ucase(TRIM(Request.QueryString("des")))
        CAD = "insert into MULTI..[USR-CIA] values('"+cod+"','"+des+"')"
        response.Write(cad)
    Cnn.Execute(CAD)
        RESPONSE.Write("<script language='javascript' type='text/jscript'>alert('Nuevo');parent.location.replace = 'http://intranet/multi/comun/buscausrcia.asp?usr="+cod+"';window.close()</script>")
    end if
    if ope = "A" then
        cod = TRIM(Request.QueryString("COD"))
        des = ucase(TRIM(Request.QueryString("des")))
        old = ucase(TRIM(Request.QueryString("ciaold")))
        CAD = "update MULTI..[USR-CIA] set cia='"+des+"' where usuario='"+cod+"' and cia='"+old+"'"
        response.Write(cad)
        Cnn.Execute(CAD)
        RESPONSE.Write("<script language='javascript' type='text/jscript'>alert('Actualizado');parent.location.replace = 'http://intranet/multi/comun/buscausrcia.asp?usr="+cod+"';window.close()</script>")
    end if
end if
    


'Cnn.close

%>

</BODY>
</HTML>
