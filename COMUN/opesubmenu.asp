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
    COD = TRIM(Request.QueryString("COD"))
    MENU = ucase(TRIM(Request.QueryString("MENU")))
    CAD = "DELETE FROM multi..submenu WHERE MENU='"&MENU&"' AND SUBMENU='"+COD+"'"
    RESPONSE.Write("<script language='javascript' type='text/jscript'>window.opener.location.replace = 'http://intranet/multi/comun/buscasubmenu.asp?menu="+MENU+"';window.close()</script>")
else 
    if ope = "I" then
        MENU = TRIM(Request.QueryString("MENU"))
        DESC = ucase(TRIM(Request.QueryString("DESC")))
        PROG = ucase(TRIM(Request.QueryString("PROG")))
        ESTADO = ucase(TRIM(Request.QueryString("ESTADO")))
        CAD = "INSERT INTO SUBMENU (MENU,SUBMENU,DESCRIPCION,PROGRAMA,ESTADO) select top 1 '"+MENU+"',RIGHT('00'+''+RTRIM(LTRIM(SUBMENU+1)),2),'"+DESC+"','"+PROG+"','"+ESTADO+"' from SUBMENU where menu ='"+MENU+"' order by SUBMENU desc"
        response.Write(cad)
        RESPONSE.Write("<script language='javascript' type='text/jscript'>window.opener.location.replace = 'http://intranet/multi/comun/buscasubmenu.asp?menu="+MENU+"';window.close()</script>")    
    end if
    if ope = "A" then
        COD = TRIM(Request.QueryString("COD"))
        MENU = TRIM(Request.QueryString("MENU"))
        DESC = ucase(TRIM(Request.QueryString("DESC")))
        PROG = ucase(TRIM(Request.QueryString("PROG")))
        ESTADO = ucase(TRIM(Request.QueryString("ESTADO")))
        CAD = "update MULTI..SUBMENU set DESCRIPCION='"+DESC+"',PROGRAMA='"+PROG+"',estado='"+ESTADO+"' where MENU='"+MENU+"' and SUBMENU='"+COD+"'"
        response.Write(cad)
        RESPONSE.Write("<script language='javascript' type='text/jscript'>window.opener.location.replace = 'http://intranet/multi/comun/buscasubmenu.asp?menu="+MENU+"';window.close()</script>")    
    end if
end if
    

Cnn.Execute(CAD)
'Cnn.close

%>

</BODY>
</HTML>
