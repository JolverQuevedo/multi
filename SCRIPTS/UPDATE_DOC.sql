USE [MULTI]
GO
/****** Object:  StoredProcedure [dbo].[RS_MOV_U_ENT_SAL]    Script Date: 09/28/2013 12:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--DROP PROCEDURE [dbo].[UPDATE_DOC]
GO
ALTER PROCEDURE [dbo].[UPDATE_DOC]
(
	@CALMA		char(4),
	@CTD		char(2),
	@CNUMDOC	char(11),
	@TBL1		VARCHAR(25),
	@TBL2		VARCHAR(25),
	@TBL3		VARCHAR(25),
	@TBL4		VARCHAR(25)

)
AS
SET NOCOUNT ON 

Declare @SQL nvarchar(max)
Set @SQL = ' Select Top 1 * Into #CAB From ' + @TBL1
SET @SQL = @SQL + ' Where c5_calma='''+@calma+''''
SET @SQL = @SQL + ' and c5_ctd='''+ @ctd+''''
SET @SQL = @SQL + ' and c5_cnumdoc= '''+ @CNUMDOC+''''
SET @SQL = @SQL + ' AND C5_CSITUA<>''A'''

SET @SQL = @SQL + ' Select A.* Into #MOVD From '+ @TBL2 
SET @SQL = @SQL + ' A INNER JOIN #CAB B ON (CALMA=C5_CALMA collate Modern_Spanish_CI_AS AND CTD=C5_CTD collate Modern_Spanish_CI_AS AND CNUMDOC=C5_CNUMDOC collate Modern_Spanish_CI_AS) SELECT * INTO #TALLA FROM ' + @TBL3
SET @SQL = @SQL + ' Where calma='''+@calma+''''
SET @SQL = @SQL + ' and ctd='''+ @ctd+''''
SET @SQL = @SQL + ' and cnumdoc= '''+ @CNUMDOC+''''

SET @SQL = @SQL + ' Select C6_CALMA,C6_CTD,C6_CNUMDOC,C6_CITEM,C5_DFECDOC,C5_CRFTDOC,C5_CRFNDOC,C5_CTIPMOV,C5_CCODMOV,C6_CCODIGO,C6_CDESCRI,
	C6_NCANTID,C5_CCODPRO,C5_CNOMPRO,C5_CNUMORD
Into #DETALLE From ' + @TBL4 
SET @SQL = @SQL + ' INNER JOIN #CAB ON (C6_CALMA=C5_CALMA AND C6_CTD=C5_CTD AND C6_CNUMDOC=C5_CNUMDOC) DELETE #DETALLE WHERE C6_CCODIGO IN(''TXT'',''.'')'

SET @SQL = @SQL + ' DELETE ' + @TBL3
SET @SQL = @SQL + ' Where calma='''+@calma+''''
SET @SQL = @SQL + ' and ctd='''+@ctd+''''
SET @SQL = @SQL + ' and cnumdoc='''+@CNUMDOC+''''

SET @SQL = @SQL + ' DELETE ' + @TBL2
SET @SQL = @SQL + ' WHERE calma='+''''+@calma+''''+' and ctd='+''''+@ctd+''''+' and cnumdoc='''+@CNUMDOC +''''

SET @SQL = @SQL + ' Insert into ' +@TBL2
SET @SQL = @SQL + ' (CALMA,CTD,CNUMDOC,CITEM,DFECDOC,CRFTDOC,CRFNDOC,CTIPMOV,CCODMOV,CCODIGO,CDESCRI,NCANTID,CCODPROV,CNOMPROV,CNUMORD)
Select * From #DETALLE '

SET @SQL = @SQL + ' UPDATE ' + @TBL2
SET @SQL = @SQL + ' SET UNIMED=B.UNIMED, COLOR=B.COLOR,LOTE=B.LOTE, KGBRUTO=B.KGBRUTO,KGNETO=B.KGNETO,KGNETOPROV=B.KGNETOPROV, 
	KGBRUTOPROV=B.KGBRUTOPROV, BULTOS=B.BULTOS,CONOS=B.CONOS, OBSERV=B.OBSERV,CodTipoMov=B.CodTipoMov FROM '+ @TBL2
SET @SQL = @SQL + ' A INNER JOIN #MOVD B ON(A.CALMA=B.CALMA AND A.CTD=B.CTD AND A.CNUMDOC=B.CNUMDOC AND A.CITEM=B.CITEM AND A.CCODIGO=B.CCODIGO)'

SET @SQL = @SQL + ' INSERT ' + @TBL3 
SET @SQL = @SQL + ' SELECT * FROM #TALLA '
--select top 50 * from RS_ALMOVD
--print @sql
exec sp_executesql @sql
