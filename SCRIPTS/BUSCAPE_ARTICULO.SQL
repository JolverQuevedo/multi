USE [MULTI]
GO
/****** Object:  StoredProcedure [dbo].[BuscaPE_Articulo]    Script Date: 10/10/2013 11:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[BuscaPE_Articulo]
(
	@OC_CNUMORD		VARCHAR(20),
	@OC_CCODIGO		VARCHAR(25),
	@TBL1			VARCHAR(50),
	@TBL2			VARCHAR(50)
)
AS
declare @strsql1    nvarchar(4000)

SET @strsql1 = ' Select C5_CALMA Almacen, C5_CCODMOV Mov, C5_CTD TD, C5_CNUMDOC Num_Doc, C5_DFECDOC Fec_Doc, C5_CRFNDOC '
SET @strsql1 = @strsql1 + ' Doc_Ref, B.C6_NCANTID Cantidad, C5_CGLOSA1 Glosa, C5_DFECCRE Fec_Cre, C5_CUSUCRE UsuCre '
SET @strsql1 = @strsql1 + ' From '+(@tbl1)+' A  '
SET @strsql1 = @strsql1 + ' INNER JOIN '+(@tbl2)+ ' B '
SET @strsql1 = @strsql1 + ' ON(A.C5_CALMA=B.C6_CALMA AND A.C5_CTD=B.C6_CTD AND A.C5_CNUMDOC=B.C6_CNUMDOC)'
SET @strsql1 = @strsql1 + ' WHERE A.C5_CNUMORD = '''+ @OC_CNUMORD +''''
SET @strsql1 = @strsql1 + '  AND B.C6_CCODIGO='''+ @OC_CCODIGO+''''
SET @strsql1 = @strsql1 + ' ORDER BY C5_CTD+C5_CNUMDOC'
--print @strsql1
exec sp_executesql @strsql1 



