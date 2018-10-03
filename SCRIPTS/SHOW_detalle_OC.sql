USE [MULTI]
GO
/****** Object:  StoredProcedure [dbo].[SHOW_Detalle_OC]    Script Date: 10/10/2013 11:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SHOW_Detalle_OC]
(
	@OC_CNUMORD		VARCHAR(20),
	@TBL1			VARCHAR(50)
)
AS

SET NOCOUNT ON 

declare @strsql1    nvarchar(4000)

SET @strsql1 = 'Select A.OC_CITEM Item, A.OC_CCODIGO Codigo, A.OC_CDESREF Descripcion, '
SET @strsql1 = @strsql1 + ' A.OC_COMENTA Observ, A.OC_CUNIDAD Unidad, A.OC_NCANORD as Cant_Ordenada, '
SET @strsql1 = @strsql1 + '		OC_NPREUN2 Prec_Orig, OC_NIGVPOR IGV_Por ,OC_NPREUNI Prec_Final '
SET @strsql1 = @strsql1 + 'From '+@TBL1 + ' A '
SET @strsql1 = @strsql1 + 'WHERE A.OC_CNUMORD =''' +  @OC_CNUMORD  + ''''
SET @strsql1 = @strsql1 + ' ORDER BY A.OC_CITEM '
--print @strsql1
exec sp_executesql @strsql1 