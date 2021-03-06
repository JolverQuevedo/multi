USE [MULTI]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[concat_Tallas]
(	@CALMA		char(4),
	@CTD		char(2),
	@CNUMDOC	char(11),
	@CITEM		char(4),
	@TBL		varchar(25)
)
RETURNS VARCHAR(MAX) AS BEGIN
DECLARE @p VARCHAR(MAX);
--DECLARE 	@TBL1		varchar(25)
SET @p = '';
if @tbl = 'RS_ALMOVD_TALLA0001' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0001 
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0002' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0002
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0003' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0003
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0004' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0004
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0005' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0005
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0006' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0006
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0007' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0007
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0008' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0008
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0009' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0009
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0010' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0010
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0011' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0011
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0012' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0012
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0013' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0013
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0014' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0014
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0015' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0015
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0016' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0016
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0017' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0017
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0018' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0018
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0019' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0019
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden
if @tbl = 'RS_ALMOVD_TALLA0020' 
	Select @p=@p+'  '+rtrim(talla)+'/'+rtrim(cast(cantidad as varchar(10)))
	From   RS_ALMOVD_TALLA0020
	WHERE CALMA=@CALMA AND CTD=@CTD AND CNUMDOC=@CNUMDOC AND CITEM=@CITEM
	Order by Orden


RETURN @p
END




/*	@CALMA	char(4),
	@CTD	char(2),
	@CNUMDOC	char(11),
	@CITEM	char(4),
	@tbl	varchar(25)
)
RETURNS VARCHAR(MAX) 
AS 
BEGIN
declare @strsql1    nvarchar(4000)
--RS_ALMOVD_TALLA
DECLARE @p VARCHAR(MAX);
DECLARE @OI VARCHAR(MAX);
SET @strsql1 = '	SET @p = '''';'							
SET @strsql1 = @strsql1 + ' 	Select ' + @p + '''=''' 
SET @strsql1 = @strsql1 +	 	@p + '''  ''' +  'rtrim(talla)'+ '''+''' + '''/'''	+ '+'
SET @strsql1 = @strsql1 + ' 	rtrim(cast(cantidad as varchar(10)))'
SET @strsql1 = @strsql1 + ' 	From ' + (@TBL)
SET @strsql1 = @strsql1 + ' 	WHERE CALMA='''+@CALMA +''''
SET @strsql1 = @strsql1 + '     AND CTD='''+ @CTD + ''''
SET @strsql1 = @strsql1 + '		AND CNUMDOC=+'''+@CNUMDOC+''''
SET @strsql1 = @strsql1 + '		AND CITEM=+'''+@CITEM+''''
SET @strsql1 = @strsql1 + ' 	Order by Orden '
declare @oStText nvarchar(3000)
  set @oStText = N'@strsql1 ' 
execute sp_executesql @oStText= @oi OUTPUT;
  return @oi
END
*/