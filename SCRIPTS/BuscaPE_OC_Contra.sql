USE [MULTI]
GO
/****** Object:  StoredProcedure [dbo].[BuscaPE_OC_Contra]    Script Date: 10/10/2013 11:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[BuscaPE_OC_Contra]
(
	@OC_CNUMORD		VARCHAR(20),
	@TBL1		VARCHAR(55),
	@TBL2		VARCHAR(50)
)
AS
SET NOCOUNT ON
declare @strsql1    nvarchar(4000)

SET @strsql1 = 'Select A.C5_CALMA AS Alm, A.C5_CCODMOV AS Mov, A.C5_CTD AS TD, A.C5_CNUMDOC AS NUM_DOC , '
SET @strsql1 = @strsql1 + ' A.C5_DFECDOC AS Fec_Doc, C5_CRFNDOC AS Doc_Ref, CP_CNUMDOC as Factura, C5_CGLOSA1 AS Glosa, '
SET @strsql1 = @strsql1 + ' C5_DFECCRE AS Fec_Crea, C5_CUSUCRE AS Usr_Crea '
SET @strsql1 = @strsql1 + ' From ' + (@tbl1) + ' A '
SET @strsql1 = @strsql1 + ' LEFT JOIN '+(@tbl2)+' B ON(A.C5_CALMA collate SQL_Latin1_General_CP1_CI_AI=B.C5_CALMA '
SET @strsql1 = @strsql1 + 'AND A.C5_CTD  collate SQL_Latin1_General_CP1_CI_AI=B.C5_CTD '
SET @strsql1 = @strsql1 + 'AND A.C5_CNUMDOC collate SQL_Latin1_General_CP1_CI_AI=B.C5_CNUMDOC)'
SET @strsql1 = @strsql1 + ' WHERE A.C5_CNUMORD ='''+ @OC_CNUMORD + ''''
SET @strsql1 = @strsql1 + ' ORDER BY A.C5_CTD+A.C5_CNUMDOC '

print @strsql1
exec sp_executesql @strsql1
