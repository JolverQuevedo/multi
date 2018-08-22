Update RSFACCAR..AL0001ARTI 
AR_CTIPOI='s',											-- DATOS GENERALES -- > FLAG ARTICULO SIN COSTEO
AR_CFDECI='N',											-- DATOS DE GENERALES DECVIMAL 
AR_CFSERIE='N',											-- DATOS DE GENERALES --> SERIE
AR_CFLOTE='N',											-- DATOS DE GENERALES --> LOTE
AR_CESTADO='V',											-- DATOS DE GENERALES --> ESTADO DEL ARTICULO
AR_CUSUMOD='sist',										-- DATOS DE GENERALES --> USUARIO
AR_DFECMOD=Convert(datetime,'06/03/2014 00:00:00',103), -- DATOS DE GENERALES --> fecha modificacion	

AR_CTIPEXI='03',										-- DATOS GERNERALES --> TIPO DE EXISTENCIA PARA SUNAT
AR_CANOFAB='',											-- DATOS GENERALES --> A�O DE FABRICACION

AR_CFLGRCN='s',				-- DATOS DE VENTAS --> AFECTO A RECARGO POR CONSUMO
AR_CFSTOCK='N',				-- DATOS DE VENTAS --> CONTROL DE STOCK
AR_NPRECI1=0,AR_NPRECI2=0,	-- DATOS DE VENTAS --> PRECIO
AR_NPRECI3=0,AR_NPRECI4=0,	-- DATOS DE VENTAS --> PRECIO
AR_NPRECI5=0,AR_NPRECI6=0,	-- DATOS DE VENTAS --> PRECIO
AR_CFPRELI='N',				-- DATOS DE VENTAS --> PRECIO LIBRE
AR_CFRESTA='N',				-- DATOS DE VENTAS --> DESCUENTO POR IMPORTE
AR_NPERC1=10,				-- DATOS DE VENTAS --> PORCENTAJE DE PERCEPCION
AR_NPERC2=11,				-- DATOS DE VENTAS --> PORCENTAJE DE PERCEPCION 2
AR_NDETRA=12,				-- DATOS DE VENTAS --> PORCENTAJE DE DETRACCION
AR_NTASRCN=25,				-- DATOS de VENTAS --> RECARGO POR CONSUMO
AR_CTIPDES='11',			-- DATOS DE VENTAS --> NO EXISTE NADA EN TABLA RELACIONADA
AR_NDESCTO=22,				-- DATOS DE VENTAS --> PORCENTAJE DE DESCUENTO
AR_NPDIS=23,				-- DATOS DE VENTAS --> PORCENTAJE DE DISTRIBUIDOR
AR_NPCOM=24,				-- DATOS DE VENTAS --> PORCENTAJE DE COMISION
AR_NMARVTA='1',				-- DATOS DE VENTAS --> margen de ventas
AR_CMONVTA='US',			-- DATOS DE VENTAS --> MONEDA DE VENTA
AR_NIGVPOR=18,				-- DATOS DE VENTAS --> IGV VENTA
AR_NISCPOR=0,				-- DATOS DE VENTAS --> % DE IGV

AR_DFECCOM=Convert(datetime,'19/03/2013',103), -- DATOS DE COMPRAS --> fecha de compra
AR_DFECCOS=GETDATE(),			-- DATOS DE COMPRAS --> FECHA DEL COSTEO
AR_CMONCOS = 'US',				-- DATOS DE COMPRAS --> MONEDA DE COSTEO
AR_NPRECOS= 0.009,				-- DATOS DE COMPRAS --> PRECIO DE COSTO
AR_CCODPRO='20133530003',		-- DATOS DE COMPRAS --> RUC PROVEEDOR
AR_CMONFOB='MN',				-- DATOS DE COMPRAS --> MONEDA DEL PRECIO FOB
AR_NPREFOB=5.2,					-- DATOS DE COMPRAS --> PRECIO FOB
AR_CMONCOM='us',				-- DATOS DE COMPRAS --> MONEDA DE compra
AR_NPRECOM=5.2,					-- DATOS DE COMPRAS --> precio de compra
AR_CCLAART='av',				-- DATOS DE COMPRAS --> CLASE DE ARTICULO
AR_CPARARA='5555',				-- DATOS DE COMPRAS --> PARTIDA ARANCELARIA
AR_CCATEGO='',					-- DATOS DE COMPRAS -->  CATEGORIA ARANCELARIA
AR_NIGVCPR=18,					-- DATOS DE COMPRAS -->  %IGV DE COMPRA 

AR_TOBSERV='',		-- DATOS COMPLEMENTARIOS --> OBSERVSACIONES
AR_NFACREF=0,		-- DATOS COMPLEMENTARIOS --> FACTOR DE CONVCERSION
AR_CFUNIRE='N',		-- DATOS COMPLEMENTARIOS --> FLAG PARA SABER SI HAY UNIDAD DE REFERENCIA
AR_NPESO=10,		-- datos complementarios --> PESO EN KILOS
AR_NVOLUME=11,		-- datos complementarios --> VOLUMEN EN M3
AR_NAREA=12,		-- datos complementarios --> AREA M2
AR_CMEDIDA='11 ',	-- datos complementarios --> MEDIDA
AR_CANNO='2010',	-- datos complementarios --> A�O
AR_CGROSOR='GRUE',	-- datos complementarios --> GROSOR
AR_NFACTOR=11,		-- datos complementarios --> FACTOR DE REFERENCIA
AR_NANCHO=22,		-- datos complementarios --> ancho
AR_NLARGO=33,		-- datos complementarios --> largo
AR_CUNIREF='',		-- datos complementarios --> CODIGO DE UNIDAD DE REFERENCIA
AR_CDISENO='00',	-- datos complementarios dise�o
AR_CMEDNEU='00',	-- datos complementarios medida
AR_CINDCAR='3',		-- datos complementarios indice de carga
AR_CCOLOR='bn',		-- datos complementarios
AR_CTALLA='ll'		-- datos complementarios

Where AR_CCODIGO='0000010000000000'

