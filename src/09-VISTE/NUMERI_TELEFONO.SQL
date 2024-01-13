--VISTA 3
--La seguente vista permette di visualizzare i recapiti telefonici dei genitori degli allievi da contattare in caso di necessità.
--Vengono suddivisi in categorie con età crescenti ed ordinati in base ai nomi e cognomi degli allievi.
CREATE OR REPLACE VIEW NUMERI_TELEFONO AS
SELECT  G1.CATEGORIA_S_GIOCA AS CAT,G1.ETA_S_GIOCA AS ETA,A.N_TESSERINO AS COD,A.COGNOME_A AS COGN_ALL,A.NOME_A AS NOME_ALL,T.TELEFONO_G AS TEL
FROM ALLIEVO A,GENITORE G,TELEFONO_G T,GIOCA_IN G1
WHERE A.CF_G_ALLIEVO=G.CF_G AND G.CF_G=T.CF_G_TELEFONO AND G1.N_TESSERINO_GIOCA=A.N_TESSERINO
ORDER BY G1.ETA_S_GIOCA,A.COGNOME_A,A.NOME_A DESC