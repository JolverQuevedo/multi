

CREATE TABLE HILADO (
HILO 		CHAR(3)		NOT NULL PRIMARY KEY,
DESCRIPCION	CHAR(100) 	NOT NULL,
UNIDAD		CHAR(2) 	NOT NULL REFERENCES UNIDADES(UNIDAD),
MONEDA		CHAR(1) 	NOT NULL REFERENCES MONEDAS(CODIGO),
COSTO		FLOAT 		NOT NULL DEFAULT 0,
USUARIO 	CHAR(10) 	NOT NULL,
FECHA		SMALLDATETIME	NOT NULL DEFAULT {FN NOW()},
ESTADO 		CHAR(1) 	NOT NULL DEFAULT 'A'
)
GO

ALTER TABLE MONEDAS 
WITH NOCHECK ADD 
	CONSTRAINT [PK_MONEDAS] PRIMARY KEY  NONCLUSTERED 
	(	 [CODIGO]
	)  ON [PRIMARY] 
go

ALTER TABLE [MATERIA-PRIMA] DROP COLUMN
TIPO
GO

CREATE TABLE MERCADOS (
CODIGO 		CHAR(4)		NOT NULL PRIMARY KEY,
DESCRIPCION	CHAR(100) 	NOT NULL,
USUARIO 	CHAR(10) 	NOT NULL,
FECHA		SMALLDATETIME	NOT NULL DEFAULT {FN NOW()},
ESTADO 		CHAR(1) 	NOT NULL DEFAULT 'A'
)
GO
CREATE TABLE TIPOSERVICIO (
CODIGO 		CHAR(3)		NOT NULL PRIMARY KEY,
DESCRIPCION	CHAR(100) 	NOT NULL,
USUARIO 	CHAR(10) 	NOT NULL,
FECHA		SMALLDATETIME	NOT NULL DEFAULT {FN NOW()},
ESTADO 		CHAR(1) 	NOT NULL DEFAULT 'A'
)
GO
CREATE TABLE SERVICIOS (
CODIGO 		CHAR(6)		NOT NULL PRIMARY KEY,
DESCRIPCION	CHAR(100) 	NOT NULL,
TIPO		CHAR(3)     NOT NULL REFERENCES TIPOSERVICIO(CODIGO),
COSTO		FLOAT		NOT NULL DEFAULT 0,
MONEDA		CHAR(1)		NOT NULL REFERENCES MONEDAS(CODIGO),
UNIDAD		CHAR(2) 	NOT NULL REFERENCES UNIDADES(UNIDAD),
USUARIO 	CHAR(10) 	NOT NULL,
FECHA		SMALLDATETIME	NOT NULL DEFAULT {FN NOW()},
ESTADO 		CHAR(1) 	NOT NULL DEFAULT 'A'
)
GO
ALTER TABLE SERVICIOS ADD
MERMA FLOAT NOT NULL DEFAULT 0

ALTER TABLE PRENDAS DROP COLUMN PESOBRUTO

CREATE TABLE LINEAPRENDAS (
CODIGO 		CHAR(1)		NOT NULL PRIMARY KEY,
DESCRIPCION	CHAR(100) 	NOT NULL,
USUARIO 	CHAR(10) 	NOT NULL,
FECHA		SMALLDATETIME	NOT NULL DEFAULT {FN NOW()},
ESTADO 		CHAR(1) 	NOT NULL DEFAULT 'A'
)
GO
CREATE PROCEDURE MODELODETA  
@COD CHAR(13)
AS
SELECT 
	PP.CODIGO, 
	PP.DESCRIPCION, 
	PP.TALLA AS CODTAL,
	PD.TALLA ,
	PD.COLOR, 
    CC.DESCRIPCION AS DESCOL, 
	UNIDADES =SUM(CASE WHEN PP.UNIDAD = 'DD' THEN PD.UNIDADES/12 ELSE PD.UNIDADES END),	
	PP.CLIENTE,
	PD.USUARIO, 
    	MIN(PD.FECHA) AS FECHA, 
	PD.ESTADO, PP.UNIDAD
FROM 	PRENDADETA 	PD 
	FULL    OUTER JOIN 	COLORES 	CC 	ON  PD.COLOR 	= CC.CODIGO 
	FULL OUTER   JOIN 	PRENDAS 	PP 	ON 	PD.PRENDA 	= PP.CODIGO
WHERE PP.CODIGO = @COD AND PP.ESTADO = 'A'  AND PD.CALIDAD='0' 
      AND PD.ESTADO = 'A'
GROUP BY PP.CODIGO, PP.DESCRIPCION, PP.TALLA,
	PD.COLOR, CC.DESCRIPCION, PP.CLIENTE,PD.ESTADO,
    PP.UNIDAD, PD.USUARIO, PD.ESTADO , PD.TALLA

ORDER BY CC.DESCRIPCION
GO

CREATE TABLE COLORES (
CODIGO 		CHAR(6)			NOT NULL PRIMARY KEY,
DESCRIPCION	CHAR(100) 		NOT NULL,
CLIENTE		CHAR(6)			NOT NULL REFERENCES EMPRESAS(CLIENTE),
USUARIO 	CHAR(10) 		NOT NULL,
FECHA		SMALLDATETIME	NOT NULL DEFAULT {FN NOW()},
ESTADO 		CHAR(1) 		NOT NULL DEFAULT 'A'
)
GO

CREATE INDEX COL_CLI
   ON COLORES (CLIENTE, CODIGO)

go

DROP TABLE TELAS

CREATE TABLE TIPTEL (
CODIGO 		CHAR(1)		NOT NULL PRIMARY KEY,
DESCRIPCION	CHAR(100) 	NOT NULL,
USUARIO 	CHAR(10) 	NOT NULL,
FECHA		SMALLDATETIME	NOT NULL DEFAULT {FN NOW()},
ESTADO 		CHAR(1) 	NOT NULL DEFAULT 'A'
)
GO




CREATE TABLE TELAS (
TELA 		CHAR(6)			NOT NULL PRIMARY KEY,
DESCRIPCION	CHAR(150) 		NOT NULL,
TIPOTELA	CHAR(1)			NOT NULL REFERENCES TIPTEL(CODIGO),
FAMILIA		CHAR(2)			NOT NULL REFERENCES FAMTELAS(FAMTELA),
DIAMETRO	INT				NOT NULL,
GALGA		INT				NOT NULL,
PESOCRU		FLOAT			NOT NULL,
PESOACA		FLOAT			NOT NULL,
RENDTUB		FLOAT,
RENDABI		FLOAT,
ANCHTUB		FLOAT,
ANCHABI		FLOAT,
MONEDA		CHAR(1)			NOT NULL REFERENCES MONEDAS(CODIGO),
COSTO		FLOAT,
UNIDAD		CHAR(2)			NOT NULL REFERENCES UNIDADES(UNIDAD),
HIL1		CHAR(12)		NOT NULL REFERENCES HILADO(HILO),
HIL2		CHAR(12),
HIL3		CHAR(12),
POR1		INT				NOT NULL,
POR2		INT,
POR3		INT,
ANCHCRU		FLOAT,
USUARIO 	CHAR(10) 		NOT NULL,
FECHA		SMALLDATETIME	NOT NULL DEFAULT {FN NOW()},
ESTADO 		CHAR(1) 		NOT NULL DEFAULT 'A'
)
GO


SELECT TELA, T1.DESCRIPCION, TIPOTELA, 
TT.DESCRIPCION, T1.FAMILIA, FM.DESCRIPCION,
DIAMETRO AS DIA, GALGA, PESOCRU, PESOACA, 
RENDTUB, RENDABI, ANCHTUB, ANCHABI, 
T1.MONEDA AS MON, T1.COSTO, 
MM.DESCRIPCION AS DESMON, T1.UNIDAD AS UNI,
HIL1, H1.DESCRIPCION AS DES1, POR1,
HIL2, H2.DESCRIPCION AS DES2, POR2,
HIL3, H3.DESCRIPCION AS DES3, POR3
FROM TELAS T1
INNER JOIN TIPTEL TT ON TT.CODIGO = T1.TIPOTELA
INNER JOIN FAMTELAS FM ON FM.FAMTELA = T1.FAMILIA
INNER JOIN MONEDAS MM ON MM.CODIGO = T1.MONEDA
INNER JOIN HILADO H1 ON T1.HIL1 = H1.HILO
LEFT OUTER JOIN HILADO H2 ON T1.HIL2 = H2.HILO
LEFT OUTER JOIN HILADO H3 ON T1.HIL3 = H3.HILO


CREATE procedure  FICHAPROTO  @pro char(10), @ver char(3) as


DECLARE  @n int

set @n= (select count(*) from protos where proto = @PRO and version =@VER)

if @pro = '' OR @pro is null OR @n<=0

	select  	'' as proto, '' as version, 	'' as tip, 	'' as des, '' as codcli, '' as codtem, '' as codgen, 	'' as codtel, '' as codtal,   '' as codtip,
	'' as fot, 	'' as tel, 	'' as cli, 	'' as tem, '' as gen, '' as tal,'' as rat, '' as est,'' as codrat, '' as codest, '' as cotizacion,'' as solicita, '' as ddp

else

	select p.proto,p.version,p.cotizacion,p.tipprenda as codtip,  p.descripcion as des,p.cliente as codcli,p.temporada as codtem, 
	p.genero as codgen,p.tela as codtel,p.tallas as codtal,  p.proporcion as codrat,p.estilo as codest,p.foto as fot, 
	te.descripcion as tel,e.nombre as cli, t.descripcion as tem, g.descripcion as gen, tl.tallas as tal,pr.proporcion as rat, 
	es.descripcion as est,tp.descripcion as tip,po.solicita,po.ddp
	from protos p
	inner join telas te on te.tela = p.tela
	inner join empresas e on e.cliente = p.cliente
	inner join temporadas t on t.codigo = p.temporada  
	inner join generos g on g.genero = p.genero 
	inner join tipprenda tp on tp.tipo = p.tipprenda
	inner join estilos es on es.estilo = p.estilo and es.cliente = p.cliente
	inner join [proto-obs]po on po.proto=p.proto and po.version=p.version
	left outer join tallas tl on tl.tallas = p.tallas 
	left outer join proporciones pr	on pr.proporcion = p.proporcion 
	where p.proto = @PRO and p.version =@VER
GO

ALTER TABLE ESTILOS 
WITH NOCHECK ADD 
	CONSTRAINT [FK_ESTILO_GENERO] PRIMARY KEY  NONCLUSTERED 
	(	 [GENERO] REFERENCES GENEROS(GENERO)
	)  ON [PRIMARY] 
go