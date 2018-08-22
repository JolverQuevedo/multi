<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>

<!--#include file="../includes/Cnn.inc"-->
<!--#include file="./FUNCIONESCOMUNES.ASP"-->

<%Session.CodePage="850" %>
<%Dim pageSize 
pageSize = 10
'****************************************
' Definir el NOMBRE de la Tabla base
'****************************************
Dim ALIAS
alias = "submenu"
'*********************************************
' Definir el NOMBRE de la columna del ORDER BY
'*********************************************
Dim indice
indice = "submenu"
'*********************************************
' Definir el NOMBRE de la PAGINA ASP de inicio
'*********************************************
Dim urlBase
urlBase = "submenu.asp"
%><form name="thisForm" METHOD="post" ><HTML>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script>
        

    </script>
</head>
<body>

        <%	
            
            menu=request.QueryString("menu")
            usr=request.QueryString("usr")
            cad="SELECT DISTINCT T1.SUBMENU AS ID, T1.DESCRIPCION, PERFIL = (SELECT PERFIL FROM [USR-OPC] T3 WHERE USUARIO = '"+usr+"' AND T3.MENU=T1.MENU AND T3.SUBMENU = T1.SUBMENU),t1.MENU,t1.SUBMENU  FROM SUBMENU T1, [USR-OPC] T2 WHERE (T1.MENU = '"+menu+"') ORDER BY 1 "
            'response.Write(cad)
            RS.Open CAD, Cnn
        %>
    <%		LIMITE =  rs.fields.count - 1	
                CONT=1
            %>
        <table id="TABLA" align="center"  bordercolor="#FFFFFF" bgcolor="<%=Application("color2")%>"  cellpadding="2"  cellspacing="1"  border="1" >
        <tr  bgcolor=#294052  >
        
        <%for I=0 to LIMITE-2 %>
	        <td align="center" style="color:#fff;padding:5PX 5PX" class="Estilo8">
		        <%=RS.FIELDS(I).NAME%>
	        </td>
        <%next%>	
        </tr>

        <% DO WHILE NOT RS.EOF%>
		<tr bgcolor="<% if CONT mod 2  = 0 THEN 
                response.write(Application("color1"))
                else
	            response.write(Application("color2"))
	            end IF%>"
	            onclick="dd('<%=(cont)%>')" id="fila<%=Trim(Cstr(cont))%>">

            <td><%=RS(0) %></td>
            <td><%=RS(1) %></td>
            <td>
                
                <SELECT id="PER<%=cont%>" class=datos onchange="cambiaestado('<%=usr%>','<%=RS(3)%>','<%=RS(4)%>',this.value)"> 
                    <OPTION value=0 <%if 0=RS(2) then  %>selected<% end if %>></OPTION>
                    <OPTION value=1 <%if 1=RS(2) then  %>selected<% end if %>>UPDATER</OPTION>
                    <OPTION value=2 <%if 2=RS(2) then  %>selected<% end if %>>READONLY</OPTION>
                    <OPTION value=3 <%if 3=RS(2) then  %>selected<% end if %>>WEB</OPTION>
                </SELECT>
            </td>
            


		</tr>
	    <%RS.MOVENEXT %>
        <%CONT = CONT + 1%>
        <%LOOP %>

	
    </table>


   


   
    <iframe src="" id="miiframe" style="display:none;width:500px;height:500px"></iframe>

    <script>
        var auto=0;
var url = '../usrcia.asp?pos='
var alias = 'usrcia'
var TBL = 'usrcia'
var PK  = 'usrcia'
var DS  = 'descripcion'
var pag = 'usrcia.asp?POS='
var chk = ''
var marca = 0
var oldrow = 1
var largo = 4  // es el largo del PK (se usa en el dataentry)
var largo2 = 10  // es el largo del descriptor
var oldrow = 1
var olddata = ''
var funcionalidad = 'comun/insersubmenu.asp?pos='
mm = -1
// necesito la misma variable en jscript y vbscript para la navegacion
var pagesize = 10
        var desantiguo="";

        function cambiaestado(user,menu,submenu,perfil){
            cad="http://intranet/multi/comun/opeusropc.asp?usuario="+user+"&menu="+menu+"&submenu="+submenu+"&perfil="+perfil;
            //alert(cad);
            document.getElementById("miiframe").src=cad;
        }


        function dd2(ff) {
            var t = document.all.TABLA;
            var pos = parseInt(ff);
            dd(ff);
        }
        function dd(ff) 
        {	var pos = parseInt(ff,10)
	        var t = document.all.TABLA;
            
	        if ((oldrow % 2) == 1){
		        eval("document.all.fila" + oldrow + ".style.backgroundColor='#FFFFFF'");
            }
	        else{
		        eval("document.all.fila" + oldrow + ".style.backgroundColor='#dbe3cd'");
            }
	        eval("document.all.fila"+ff+".style.backgroundColor='#FFC9AE'");
	        
	       
            nuevo = 0;
	        oldrow = pos;
            
           


	        return true;
        }
        



        function retrocede() 
{	var t = document.all.TABLA;
	var ff = 1;
	if (oldrow>1)
		dd(oldrow-1)
    else 
        dd(1)    ;
}
function avanza() 
{	var t = document.all.TABLA;
	var ff = 1;
	
  var max 
  ff =oldrow  + 1
  max =  t.rows.length -1;
  if (ff <= max)
   {dd(ff); }
}

        function imprime()
        {	cad = '../REPORTES/prnTBL.asp?tbl=' +TBL

	        document.getElementById('miiframe').src=cad;
        }
	
        dd2('1');

    </script>
</body>
</html>
</form>