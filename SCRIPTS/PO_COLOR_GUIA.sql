USE [MULTI]
GO
/****** Object:  StoredProcedure [dbo].[PO_COLOR_GUIA]    Script Date: 05/02/2015 04:42:00 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MABEL MOLINA
-- Create date: 08-07-2014
-- Description:	MUESTRA LO DISPONIBLE POR TIPO 
--				DE SERVICIO PARA HACER GUIA
-- =============================================
ALTER PROCEDURE [dbo].[PO_COLOR_GUIA]
	-- Add the parameters for the stored procedure here
	@EST			CHAR(50),
	@RUC			CHAR(18),
	@SER			CHAR(2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 select PO, CODART,  color, tot=sum(c0+c1+c2+c3+c4+c5+c6+c7+c8+c9) , ID, isnull(ar_cdescri,'NO EXISTE EN REAL') AS DESCRIP
from view_pos_movi 
where MOV = 'S' AND GUIA='' 
	and estcli = @EST and ruc =  @ruc AND CODSER = @SER
GROUP BY CODART,  color, po, ID,ar_cdescri

END
