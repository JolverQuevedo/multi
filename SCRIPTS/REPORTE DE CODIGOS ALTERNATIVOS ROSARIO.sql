SELECT  distinct --AT_CCODIGO, AR_CDESCRI, 
AT_CCODCLI, CL_CNOMCLI
 AT_CCODAL, f6_ncantid AS CANT, f6_nprecio AS PVP, F6_CNUMSER, F6_CNUMDOC, F6_DFECDOC
FROM RSFACCAR..AL0001CODA, RSFACCAR..AL0001ARTI, RSFACCAR..FT0001CLIE,  RSFACCAR..FT0001Acud 
WHERE AT_CCODIGO=AR_CCODIGO AND AT_CCODIGO = F6_CCODIGO AND AT_CCODCLI=CL_CCODCLI and f6_ctd = 'FT'
/* AND YEAR(F6_DFECDOC) = 2014
AND AT_CCODAL = '13940184'
and AT_CCODIGO = '02108000XX'
AND AT_CCODAL = '13940184'
ORDER BY AT_CCODIGO, AT_CCODCLI
*/
order by 2

/*SELECT  *
FROM RSFACCAR..FT0001Acud*/