--FUNZIONE DI BASE 3
--Questa risulta essere la funzione di rimozione di un'allievo identificato da NUM_TESSERA in input da una categoria con eta
--specifica,se esso gioca appunto in essa

CREATE OR REPLACE PROCEDURE RIMUOVI_DA_SQUADRA(NUM_TESSERA CHAR,CATEGORIA VARCHAR,ETA NUMBER) IS

BEGIN 
DELETE 
FROM GIOCA_IN 
WHERE N_TESSERINO_GIOCA=NUM_TESSERA AND CATEGORIA_S_GIOCA=CATEGORIA AND ETA_S_GIOCA=ETA;

EXCEPTION 
WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR(-20200,'Tale allievo non e presente nella categoria ' || categoria ||','||ETA);
END;