USE [MULTI]
GO
/****** Object:  StoredProcedure [dbo].[BuscaMOVD_PRN_OC]    Script Date: 10/15/2013 11:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[BuscaMOVD_PRN_OC]
(
	@CNUMORD	varchar(15),
	@TBL1		VARCHAR(50), -- RS_ALMOVD
	@TBL2		VARCHAR(50), -- RSFACCAR..AL0001MOVD
	@TBL3		VARCHAR(50), -- RS_ALMOVC
	@TBL4		VARCHAR(50)  -- RS_ALMOVD_TALLA0001
)
AS

declare @strsql1    nvarchar(4000)

SET @strsql1 = ' SELECT A.*,B.C6_NPREUN1,'
SET @strsql1 = @strsql1 + ' Tallas=CASE WHEN Detallado=''S'''
SET @strsql1 = @strsql1 + ' THEN LTRIM(dbo.concat_Tallas(A.calma,A.ctd,A.cnumdoc,A.citem,''' +@TBL4+ ''''+ ')) '
SET @strsql1 = @strsql1 + ' ELSE '''' END, 	C.CP_CNUMDOC '
SET @strsql1 = @strsql1 + 'FROM '+(@TBL1)+' A INNER JOIN '+(@TBL2)+' B ON(A.CALMA=B.C6_CALMA COLLATE Modern_Spanish_CI_AS '
SET @strsql1 = @strsql1 + ' AND A.CTD=B.C6_CTD COLLATE Modern_Spanish_CI_AS '
SET @strsql1 = @strsql1 + ' AND A.CNUMDOC=B.C6_CNUMDOC COLLATE Modern_Spanish_CI_AS  '
SET @strsql1 = @strsql1 + ' AND A.CITEM=B.C6_CITEM COLLATE Modern_Spanish_CI_AS )'
SET @strsql1 = @strsql1 + '	LEFT JOIN '+(@TBL3)+' C ON (A.calma=C.C5_CALMA AND A.CTD=C.C5_CTD AND A.CNUMDOC=C.C5_CNUMDOC) '
SET @strsql1 = @strsql1 + ' Where CNUMORD ='''+@CNUMORD + ''''
SET @strsql1 = @strsql1 + ' Order By CAlma,CNUMDOC'
--print @strsql1
exec sp_executesql @strsql1
