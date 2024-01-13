--FUNZIONE BASE  1
--Funzione che permette a partitre da una certa data in input di ottenere il corrispondente giorno della settimana.
CREATE OR REPLACE FUNCTION OTTIENI_GIORNO(DATA_IN DATE)RETURN CHAR IS
GIORNO CHAR(3);

BEGIN 
SELECT TO_CHAR(TO_DATE(DATA_IN,'DD-MM-YYYY HH24:MI:SS'),'DY') INTO GIORNO
FROM DUAL;
RETURN GIORNO;
END;