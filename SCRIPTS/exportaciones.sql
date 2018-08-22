/*
-- columnas adicionales para asignar las FACTURAS

ALTER TABLE PO_MOVI ADD
FECEMB CHAR(10),
FACEXP CHAR(10),
FACPRO CHAR(10)

-- MODIFICA EL VIEW PARA QUE SE VEAN LAS COLUMNSA NUEVAS
ALTER VIEW VIEW_POS_MOVI
AS
SELECT DISTINCT 
                      dbo.PO_MOVI.ID, MODELADOR.dbo.POS.PO, MODELADOR.dbo.POS.OFI, REPLACE(MODELADOR.dbo.[PO-DETA].COLOR, ' ', '') AS COLOR, 
                      MODELADOR.dbo.[PO-DETA].UBI, dbo.PO_MOVI.EMPRESA AS CIA, MODELADOR.dbo.POS.CLIENTE AS CODCLI, LTRIM(RTRIM(MODELADOR.dbo.CLIENTE.NOMBRE)) 
                      AS NOMCLI, MODELADOR.dbo.[PO-DETA].FOB, LTRIM(RTRIM(MODELADOR.dbo.ESTILOS.ESTCLI)) AS ESTCLI, 
                      LTRIM(RTRIM(MODELADOR.dbo.ESTILOS.DESCRIPCION)) AS ESTILO, dbo.PO_MOVI.MOV, dbo.PO_MOVI.GUIA, dbo.PO_MOVI.RUC, 
                      RSCONCAR.dbo.CP0001MAES.AC_CNOMBRE AS NOMPRO, dbo.PO_MOVI.DEFECTO AS CODDEF, dbo.DEFECTOS.DESCRIPCION AS DESDEF, 
                      dbo.PO_MOVI.PIEZA AS CODPZA, dbo.PIEZAS.DESCRIPCION AS DESPZA, dbo.PO_MOVI.SERVICIO AS CODSER, dbo.SERVICIOS.DESCRIPCION AS DESSER, 
                      dbo.PO_MOVI.CONDICION AS CODCON, dbo.CONDICIONES.DESCRIPCION AS DESCON, MODELADOR.dbo.[PO-DETA].T0, MODELADOR.dbo.[PO-DETA].T1, 
                      MODELADOR.dbo.[PO-DETA].T2, MODELADOR.dbo.[PO-DETA].T3, MODELADOR.dbo.[PO-DETA].T4, MODELADOR.dbo.[PO-DETA].T5, MODELADOR.dbo.[PO-DETA].T6, 
                      MODELADOR.dbo.[PO-DETA].T7, MODELADOR.dbo.[PO-DETA].T8, MODELADOR.dbo.[PO-DETA].T9, MODELADOR.dbo.[PO-DETA].CAN0 AS Q0, 
                      MODELADOR.dbo.[PO-DETA].CAN1 AS Q1, MODELADOR.dbo.[PO-DETA].CAN2 AS Q2, MODELADOR.dbo.[PO-DETA].CAN3 AS Q3, 
                      MODELADOR.dbo.[PO-DETA].CAN4 AS Q4, MODELADOR.dbo.[PO-DETA].CAN5 AS Q5, MODELADOR.dbo.[PO-DETA].CAN6 AS Q6, 
                      MODELADOR.dbo.[PO-DETA].CAN7 AS Q7, MODELADOR.dbo.[PO-DETA].CAN8 AS Q8, MODELADOR.dbo.[PO-DETA].CAN9 AS Q9, dbo.PO_MOVI.CAN0 AS C0, 
                      dbo.PO_MOVI.CAN1 AS C1, dbo.PO_MOVI.CAN2 AS C2, dbo.PO_MOVI.CAN3 AS C3, dbo.PO_MOVI.CAN4 AS C4, dbo.PO_MOVI.CAN5 AS C5, dbo.PO_MOVI.CAN6 AS C6, 
                      dbo.PO_MOVI.CAN7 AS C7, dbo.PO_MOVI.CAN8 AS C8, dbo.PO_MOVI.CAN9 AS C9, dbo.PO_MOVI.MOTIVO AS CODMOT, dbo.MOTIVOS.DESCRIPCION AS DESMOT, 
                      dbo.PO_MOVI.BOLSA, dbo.PO_MOVI.LINEA AS CODLIN, dbo.LINEAS.DESCRIPCION AS DESLIN, MODELADOR.dbo.ESTILOS.CODARTICULO AS CODART, 
                      MODELADOR.dbo.ESTILOS.DESMODELADOR AS DESART, MODELADOR.dbo.COTIZACION.PROTO, MODELADOR.dbo.COTIZACION.VERSION, dbo.PO_MOVI.ESTADO, 
                      MODELADOR.dbo.POS.CODEST, dbo.PO_MOVI.FECDOC, dbo.PO_MOVI.FECEMB, dbo.PO_MOVI.FACEXP, dbo.PO_MOVI.FACPRO
FROM         MODELADOR.dbo.COTIZACION INNER JOIN
                      dbo.PO_MOVI INNER JOIN
                      RSCONCAR.dbo.CP0001MAES ON RSCONCAR.dbo.CP0001MAES.AC_CCODIGO = dbo.PO_MOVI.RUC COLLATE Modern_Spanish_CI_AS INNER JOIN
                      dbo.CONDICIONES ON dbo.CONDICIONES.CODIGO = dbo.PO_MOVI.CONDICION INNER JOIN
                      dbo.DEFECTOS ON dbo.DEFECTOS.CODIGO = dbo.PO_MOVI.DEFECTO INNER JOIN
                      dbo.PIEZAS ON dbo.PO_MOVI.PIEZA = dbo.PIEZAS.CODIGO INNER JOIN
                      dbo.SERVICIOS ON dbo.PO_MOVI.SERVICIO = dbo.SERVICIOS.CODIGO INNER JOIN
                      MODELADOR.dbo.[PO-DETA] INNER JOIN
                      MODELADOR.dbo.POS ON MODELADOR.dbo.[PO-DETA].PO = MODELADOR.dbo.POS.PO INNER JOIN
                      MODELADOR.dbo.CLIENTE ON MODELADOR.dbo.POS.CLIENTE = MODELADOR.dbo.CLIENTE.CODIGO INNER JOIN
                      MODELADOR.dbo.ESTILOS ON MODELADOR.dbo.POS.CLIENTE = MODELADOR.dbo.ESTILOS.CLIENTE AND 
                      MODELADOR.dbo.POS.CODEST = MODELADOR.dbo.ESTILOS.CODEST ON dbo.PO_MOVI.UBI = MODELADOR.dbo.[PO-DETA].UBI AND 
                      dbo.PO_MOVI.PO = MODELADOR.dbo.[PO-DETA].PO INNER JOIN
                      dbo.MOTIVOS ON dbo.PO_MOVI.MOTIVO = dbo.MOTIVOS.CODIGO INNER JOIN
                      dbo.LINEAS ON dbo.PO_MOVI.LINEA = dbo.LINEAS.CODIGO ON MODELADOR.dbo.COTIZACION.COTIZACION = MODELADOR.dbo.POS.COTIZACION
GO
*/
SELECT  ESTCLI,PO, COLOR, DESSER, RUC,NOMPRO, (C0+C1+C2+C3+C4+C5+C6+C7+C8+C9) AS TOTAL , GUIA,
FECEMB, FACEXP, FACPRO

FROM view_pos_movi WHERE CODCLI= '00001' AND MOV = 'I' and po ='215-267' 
and codser ='04' 
--GROUP BY PO, COLOR,MOV, DESSER, NOMPRO, estcli,ruc , GUIA
ORDER BY 1,2,3,4 ; 

-- aumentar coloumna para fecha de despacho, factura de exportacion, factura del proveedor
-- en una opcion aparte de ACABADOS