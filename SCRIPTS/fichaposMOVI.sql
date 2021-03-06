USE [MULTI]
GO
/****** Object:  StoredProcedure [dbo].[FICHAPOSmovi]    Script Date: 05/28/2014 12:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =======================================================================
-- Author:		MABEL MOLINA
-- Create date: 20-05-2014
-- Description:	Devuelve los campos de cabecera de la Ficha de PO PARA
--				MOVIMIENTOS DE ACABADO
-- =======================================================================
ALTER procedure  [dbo].[FICHAPOSmovi]  
@IDD VARCHAR(10) as

if @IDD = 'AUTO' or @IDD =''

	select  isnull(RIGHT('0000000000'+(SELECT CONVERT(NUMERIC,MAX([ID])) + 1 FROM  PO_MOVI ),10), '0000001000') AS [ID],
	'' as PO,		'' as OFI,		'' AS COLOR,	'' AS UBI,		'' AS CIA,		'' as CODCLI, 	'' as NOMCLI,	
	0  as FOB,		'' as ESTCLI,	'' as ESTILO,	'' as MOV,		'' AS GUIA,		'' AS RUC,		'' AS NOMPRO,
	'' as CODDEF,	'' as DESDEF,	'' as CODPZA,	'' as DESPZA,	'' AS CODSER,	'' AS DESSER,
	'' AS CODCON,	'' as DESCON,	'' as T0,		0  as C0	,	'' AS T1,		0  as C1,
	'' AS T2,		0  AS C2,		'' AS T3,		0  AS C3,		'' AS T4,		0  as C4,
	'' AS T5,		0  AS C5,		'' AS T6,		0  AS C6,		'' AS T7,		0  as C7,
	'' AS T8,		0  AS C8,		'' AS T9,		0  AS C9,		'' as estado,	'' AS CODEST	
else
SELECT	ID, PO, OFI, COLOR, UBI, CIA, CODCLI, NOMCLI, 
		FOB, ESTCLI, ESTILO, MOV, GUIA, RUC, NOMPRO, 
		CODDEF, DESDEF, CODPZA, DESPZA, CODSER, 
		DESSER, CODCON, DESCON, T0, C0, T1, C1, 
		T2, C2, T3, C3, T4, C4, T5, C5, T6, C6, 
		T7, C7, T8, C8, T9, C9, ESTADO, codest
FROM MULTI.dbo.VIEW_POS_MOVI