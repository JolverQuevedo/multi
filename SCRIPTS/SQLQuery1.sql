SELECT top 6 AVIOS.CODIGO AS CODIGO, 
AVIOS.DESCRIPCION AS DESCRIPCION, 
famavios.tipoavio as TIP, 
AVIOS.UNIDAD AS UN , 
MONEDA AS M,
str(COSTO, 10,5) AS COSTO, 
AVIOS.FECHA, 
AVIOS.USUARIO, 
AVIOS.ESTADO AS E, 
FAMAVIOS.DESCRIPCION AS FAM, 
FAMAVIOS.CORREL as COR, 
monedas.DESCRIPCION AS MON, 
TIPAVI.DESCRIPCION AS TIPO, 
unidades.descripcion as UNI, 
AVIOS.TIPEXPLO,
AVIOS.STAT 
from AVIOS 
LEFT OUTER JOIN FAMAVIOS ON FAMAVIOS.CODIGO = LEFT(AVIOS.CODIGO,2) 
LEFT OUTER JOIN TIPAVI ON FAMAVIOS.TIPOAVIO = TIPAVI.CODIGO 
INNER JOIN MONEDAs ON AVIOS.moneda = monedas.CODIGO 
INNER JOIN UNIDADES ON AVIOS.UNIDAD = UNIDADES.UNIDAD 
where AVIOS.CODIGO >= '' AND AVIOS.ESTADO = 'A' 
ORDER BY AVIOS.CODIGO 