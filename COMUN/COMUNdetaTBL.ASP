<body>
<script ID="clientEventHandlersJS" LANGUAGE="javascript">
// *****************************************************************************************
//    SOLO SIRVE PARA EL MOVIMIENTO DE POS ORQUE TIENE UN INDICE COMPUESTO POR 3 COLUMNAS
// *****************************************************************************************
var pag2 =  '&tbl=' + alias 

var opc = "directories=no,status=no,titlebar=yes,toolbar=no,hotkeys=no,location=no,";
opc += "menubar=no,resizable=yes,scrollbars=yes,left=0,top=0,height=550,width=700";


function dd(ff) 
{	var pos = parseInt(ff,10)
	var t = document.all.TABLA;
	if ((oldrow%2) ==0)
		eval("document.all.fila" + oldrow + ".style.backgroundColor='<%=(Application("color2"))%>'");
	else
		eval("document.all.fila" + oldrow + ".style.backgroundColor='<%=(Application("color1"))%>'");
	// PINTA LA LINEA DEL COLOR OSCURO (PREDETERMINADO )
	eval("document.all.fila"+ff+".style.backgroundColor='<%=(Application("barra"))%>'");
	// Rellena los valores en los textbox
	thisForm.PO.value   = ltrim(t.rows(pos).cells(0).innerText );
	thisForm.UBI.value  = ltrim(t.rows(pos).cells(1).innerText) ;
    thisForm.ID.value   = ltrim(t.rows(pos).cells(2).innerText) ;
	nuevo = 0
	oldrow=pos
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
function pagina() 
{	var t = document.all.TABLA;
	var i = t.rows.length -1;
	// captura el valor del �ltimo c�digo mostrado en el GRID
	var cad = '&po='+ trim(t.rows[i].cells[0].innerText);
    cad += '&ubi='  + trim(t.rows[i].cells[1].innerText);
    cad += '&id='   + trim(t.rows[i].cells[2].innerText);
    //alert(pag+cad+pag2)
	window.location.replace(pag +cad+ pag2 )	;
}
function primera() 
{	window.location.replace(pag  + pag2)	;
}
function atras() 
{	var t = document.all.TABLA;
	var cad = 'comun/BACKpos.asp?pos='+ trim('<%=trim(request.QueryString("pos"))%>') ;
    cad += '&po=' + trim(t.rows[1].cells[0].innerText) ;
    cad += '&ubi='+ trim(t.rows[1].cells[1].innerText) ;
    cad += '&id=' + trim(t.rows[1].cells[2].innerText) ;
    cad += '&alias=' + TBL + '&pag=20';
	//alert(cad)
	//return true;
	window.location.replace(cad)	;
}
function ultima() 
{	var cad = 'comun/LASTpos.asp?pos='+ trim('<%=trim(request.QueryString("pos"))%>') ;
	cad += '&alias='+ TBL + '&pag=20' ;
    //alert(cad)
	window.location.replace( cad );
}
function VALIDA()
{	
	if (window.thisForm.COD.value == "" && largo > 0 && window.thisForm.COD.value!= 'AUTO')
	{	alert('Debe Informar el C�digo');
		window.thisForm.COD.focus();
		return false;
	}
	else {	cad = window.thisForm.COD.value;
			ff = trim(window.thisForm.COD.value);
			if(ff.length > largo && largo > 0 && window.thisForm.COD.value!='AUTO')
			{	alert("El c�digo no puede tener m�s de " + largo + " d�gitos")
				return false;
			}
	}
	if (trim(window.thisForm.DES.value) == "" && largo2 > 0 )
	{	alert('Debe Informar la Descripci�n');
		window.thisForm.DES.focus();
		return false;
	}		
	else
	{	thisForm.DES.value = Left(ltrim(rtrim(thisForm.DES.value)),largo2)
		}
	return true;
}

function imprime()
{	cad = 'REPORTES/FILTROS_PO_MOVI.asp?CLI='+ trim('<%=trim(request.QueryString("pos"))%>') ;
   // alert(cad)
	window.open(cad,"Reporte_Dinamico",opc)
}
	
function BUSCA() 
{	if (trim(window.thisForm.kod.value) == '' && trim(window.thisForm.ds.value) == '')
	{	alert("Debe informar al menos el C�digo o la descripci�n");
		window.thisForm.kod.focus();
	}
/*  document.all.ACTIV.style.visibility='visible'
    document.all.ACTIV.height="150"
    document.all.ACTIV.width="100%"
*/
    var cad =  'search/SEARCHtbl.asp?pos=' + Left(thisForm.kod.value,largo) 
        cad += '&des='+ ltrim(window.thisForm.ds.value) ;
		cad += '&tbl=' + '<%=tbl%>'
        cad += '&pk=codigo&ds=descripcion' 
        cad += '&alias='+ '<%=trim(tbl) %>' 
	    cad += '&url='+ url;
     //   alert(cad)
	document.all.ACTIV.src=(cad)

	return true;
}
</SCRIPT>
