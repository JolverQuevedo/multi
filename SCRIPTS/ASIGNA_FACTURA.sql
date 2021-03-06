USE [MULTI]
GO
/****** Object:  StoredProcedure [dbo].[RS_OC_U_ALMOVC_FACTURA]    Script Date: 08/10/2013 10:50:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ASIGNA_FACTURA]
(
	@CALMA			CHAR(4),
	@CTD			CHAR(2),
	@CNUMDOC		CHAR(11),
	@TIPDOC			CHAR(2),
	@NUMFACTURA		CHAR(20),
	@CODUSUARIO		VARCHAR(15),
	@TBL			VARCHAR(50)
)
AS
SET NOCOUNT ON

declare @strsql1    nvarchar(4000)

SET @strsql1 = 'IF EXISTS ( SELECT * FROM '+(@tbl)+' WHERE C5_CALMA ='+''''+  @calma + '''' 
SET @strsql1 = @strsql1 + ' and c5_ctd=' + '''' + @ctd+'''' + ' and c5_cnumdoc= '+''''+ @CNUMDOC+''''
SET @strsql1 = @strsql1 + '	) UPDATE ' + (@tbl)
SET @strsql1 = @strsql1 + '	SET CP_CTIPDOC= ''' + @TIPDOC + ''''+', CP_CNUMDOC=''' + @NUMFACTURA + ''''
SET @strsql1 = @strsql1 + ' , FECMOD = GETDATE(), CODUSUMOD = ''' + @CODUSUARIO + ''''
SET @strsql1 = @strsql1 + '	WHERE C5_CALMA = ''' + @CALMA + '''' 
SET @strsql1 = @strsql1 + ' AND C5_CTD = ''' + @CTD + ''''
SET @strsql1 = @strsql1 + ' AND C5_CNUMDOC = ''' + @CNUMDOC + ''''
SET @strsql1 = @strsql1 + ' ELSE 	INSERT INTO ' + (@tbl)
SET @strsql1 = @strsql1 + ' (C5_CALMA, C5_CTD, C5_CNUMDOC, CP_CTIPDOC, CP_CNUMDOC, FECCREA, CODUSUCRE) VALUES ( '
SET @strsql1 = @strsql1 + '''' + @CALMA+ '''' + ' , ' +''''+ @CTD+'''' + ', ' +''''+ @CNUMDOC + '''' + ', '
SET @strsql1 = @strsql1 + '''' + @TIPDOC + ''''+ ', ' + '''' + @NUMFACTURA +'''' +  ',  GETDATE(), '+ '''' + @CODUSUARIO + ''''+ ' )'


print @strsql1
exec sp_executesql @strsql1

--EXEC ASIGNA_FACTURA '00JT', 'PE', '00009016625', 'FT', 'factura del sele', 'usuario', 'RS_ALMOVC0001'
