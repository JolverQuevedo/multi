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
            cad="select SUBMENU,DESCRIPCION,PROGRAMA,ESTADO from multi..submenu where MENU='"+menu+"'"
            'response.Write(cad)
            RS.Open CAD, Cnn
        %>
    <%		LIMITE =  rs.fields.count - 1	
                CONT=1
            %>
        <table id="TABLA" align="center"  bordercolor="#FFFFFF" bgcolor="<%=Application("color2")%>"  cellpadding="2"  cellspacing="1"  border="1" >
        <tr  bgcolor=#294052  >
        
        <%for I=0 to LIMITE %>
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

            <td><%=RS("submenu") %></td>
            <td><%=RS("DESCRIPCION") %></td>
            <td><%=RS("programa") %></td>
            <td><%=RS("estado") %></td>


		</tr>
	    <%RS.MOVENEXT %>
        <%CONT = CONT + 1%>
        <%LOOP %>

	
    </table>
    <table border=0 align=center  cellspacing=5>
	<tr>
		<td > 
			<img src="../images/primera.png" style="cursor:pointer;" onclick="primera()" alt="PRIMERA PAGINA">
		</td>
		<td >
			<img src="../IMAGES/PREV.png" alt="PAGINA ANTERIOR" onclick="atras()" style="cursor:pointer;"> 
		</td>
		<td >
			<img src= "../images/up.png" alt="REGISTRO ANTERIOR" onclick="retrocede()" style="cursor:pointer;"> 
		</td>
		<td >
			<img src="../images/down.png" alt="REGISTRO SIGUIENTE" onclick="avanza()"  style="cursor:pointer;"> 
		</td>
		<td>
			<img src="../images/next.png" alt="PAGINA SIGUIENTE" onclick="pagina()" style="cursor:pointer;"> 
		</td>
		<td>
			<img src= "../images/last.png" alt="ULTIMA PAGINA" onclick="ultima()" style="cursor:pointer;"> 
		</td>
		<td>		
		<img src="../images/PRINT.PNG" alt="IMPRESION" onclick="imprime()" style="cursor:pointer;">	
	</td>
    <td>		
		<img src="../images/lupa.PNG" alt="Busca" onClick="document.all.seeker.style.display='block'" style="cursor:pointer;">	
	</td>
    <td id="seeker" name="seeker" style="display:none">
	<table align="center"  width="100%" bordercolor="#FFFFFF" bgcolor="lightgrey"  cellpadding="0"  cellspacing="1"  border="1" >
	  <tr>  
	    <td  bgcolor='<%=Application("COLOR2")%>'><font face="arial" color='<%=Application("Titulo")%>' size="1">
		    <b>Usuario</b></font></td>
		<td><input id="cd" name="cd" value=""/> </td>    
	  </tr>
	  <tr>  
	    <td  bgcolor='<%=Application("COLOR2")%>'><font face="arial" color='<%=Application("Titulo")%>' size="1">
		    <b>Nombre</b></font></td>
		<td><input id="ds" name="ds" value="" /> </td>    
	  </tr>
	  <tr>  
	    <td  bgcolor='<%=Application("COLOR2")%>' align="center" style="cursor:pointer" onClick="document.all.seeker.style.display='none'">
	        <font face="arial" color="red" size="1">
		    <b><u>(X) Cerrar</u></b></font></td>
		<td  bgcolor='<%=Application("COLOR2")%>' align="CENTER" style="cursor:pointer" onClick="BUSCA('<%=urlBase%>','<%=alias%>')">
		<font face="arial" color='<%=Application("Titulo")%>' size="1">
		    <b><U>FILTRAR</U></b></font></td>
	  </tr>
	 </table> 
	</td>			
	</tr>
</table>


    <table	width="100%" border="0" id="DATAENTRY" name=DATAENTRY style="display:block;">
<tr><td>
        <table	align="center" cellpadding="2" cellspacing="1"  bgcolor='<%=(Application("color1"))%>' border="1">
          <tr valign="middle"> 
            <td width="10%" class="Estilo8" align="right">
              Codigo: 
             </td>
            <td bgcolor=WHITE WIDTH=20% valign=middle> 
              <input type="text" id="COD" name="COD" style="width:100%" valign=middle 	tabindex="-1" readonly maxlength="4">
            </td>

           <td width="10%" class="Estilo8" align="right"> 
              DESCRIPCION :
               </td>
            <td bgcolor=WHITE > 
              <input type="text" id="DES" name="DES" style="width:100%"
              >
            </td>
               <td width="10%" class="Estilo8" align="right"> 
              PROGRAMA :
               </td>
            <td bgcolor=WHITE > 
              <input type="text" id="PROGRAMA" name="PROGRAMA" style="width:100%"
              >
            </td>
              <td width="10%" class="Estilo8" align="right"> 
              ESTADO :
               </td>
            <td bgcolor=WHITE > 
                <input type="text" id="ESS" name="ESS" STYLE="WIDTH:100%" >
            </td>
               
              
          </tr>
           
        </table>


    <table border=0 align=center  cellspacing=3>
<tr>
		<td>
		<img src="../images/NEW.png"  alt="REGISTRO EN BLANCO" onclick="NUEVO_onclick();document.getElementById('DES').focus();" style="cursor:pointer;">	
	</td>
	<td>		
		<img src="../images/ok.png" alt="GRABAR" onclick="grab()" style="cursor:pointer;">	
	</td>			
	<td>		
		<img src="../images/DEL.png" alt="ELIMIAR REGISTRO"
			onclick="elimina(document.getElementById('COD').value)" style="cursor:pointer;">	
	</td>		
</tr>
</table>


    <script>
        var auto=0;
var url = '../menus.asp?pos='
var alias = 'SUBMENU'
var TBL = 'SUBMENU'
var PK  = 'SUBMENU'
var DS  = 'descripcion'
var pag = 'SUBMENU.asp?POS='
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
	        
	        thisForm.COD.value = ltrim(t.rows(pos).cells(0).innerText );
	        thisForm.DES.value = ltrim(t.rows(pos).cells(1).innerText) ;
	        thisForm.PROGRAMA.value = ltrim(t.rows(pos).cells(2).innerText) ;
	        thisForm.ESS.value = ltrim(t.rows(pos).cells(3).innerText) ;
            

	        thisForm.COD.readOnly= true;
            thisForm.DES.readOnly= false;
            thisForm.PROGRAMA.readOnly = false ;
	        thisForm.ESS.readOnly = false ;



            nuevo = 0;
	        oldrow = pos;
	        return true;
        }
        function NUEVO_onclick(){
            thisForm.COD.value ="";
	        thisForm.DES.value = "" ;
	        thisForm.PROGRAMA.value = "";
	        thisForm.ESS.value = "A" ;
        }
        function elimina( val ){
            cad="http://intranet/multi/comun/opesubmenu.asp?menu=<%=menu%>&COD="+document.all.COD.value+"&ope=E";
            var open=window.open(cad,"pag","toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=400,height=400");
        }
        function act(){
            var cod=document.getElementById('COD').value;
            var des=document.getElementById('DES').value;
            var programa=document.getElementById('PROGRAMA').value;
            var ess=document.getElementById('ESS').value;
            cad="http://intranet/multi/comun/opesubmenu.asp?cod="+cod+"&menu=<%=menu%>&ope=A&DESc="+des+"&PROG="+programa+"&ESTADO="+ess;
            alert(cad);
            var open=window.open(cad,"pag","toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=400,height=400");
        }
        function grab(){
            if(document.getElementById("COD").value == ""){
                save();
        
            }else{
                act();
        
            }
        }
        function save(){
            
            var des=document.getElementById('DES').value;
            var programa=document.getElementById('PROGRAMA').value;
            var ess=document.getElementById('ESS').value;
            cad="http://intranet/multi/comun/opesubmenu.asp?menu=<%=menu%>&ope=I&DESc="+des+"&PROG="+programa+"&ESTADO="+ess;
            alert(cad);
            var open=window.open(cad,"pag","toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=400,height=400");
        }
        

        function imprime()
        {	cad = '../REPORTES/prnTBL.asp?tbl=' +TBL

	        window.open(cad)
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
        dd2('1');

    </script>
</body>
</html>
</form>