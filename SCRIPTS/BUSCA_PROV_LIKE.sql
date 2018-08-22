USE [MULTI]
GO
/****** Object:  StoredProcedure [dbo].[BUSCA_PROV_LIKE]    Script Date: 10/10/2013 11:42:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[BUSCA_PROV_LIKE]
(
	@Busqueda1 		varchar(15),
	@TBL1			VARCHAR(50)
)
as
set nocount on 

DECLARE @strSql as nvarchar(1000)

SET @strSql = 'Select TOP 100 AC_CCODIGO,AC_CNOMBRE From ' + @TBL1
			  + ' WHERE AC_CVANEXO=''P'' AND AC_CESTADO=''V'' AND (AC_CNOMBRE like '+ char(39) +'%'+@Busqueda1+'%'+char(39)+')'

SET @strSql = @strSql + ' ORDER BY AC_CNOMBRE'
--print  @strSql
exec sp_executesql @strSql 

set nocount off 

--EXEC BUSCA_PROV_LIKE 'KBO' , 'RSFACCAR..CP0001MAES' 

