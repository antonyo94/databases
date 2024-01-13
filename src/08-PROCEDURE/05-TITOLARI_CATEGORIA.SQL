--PROCEDURA 5
--Viene automatizzato il sistema di calcolo ed inserimento dei titolari per categoria in ogni singolo ruolo,controllando in background per ogni 
--allievo della categoria se deve essere rimosso dai titolari o inserito come tale in un determinato ruolo definito in input.
--TABELLE_COINVOLTE:GIOCA_IN,ALLIEVO,SOSTIENE
--USER: Viene invocata dal mister quando necessario aggiornare i titolari di una categoria in un determinato ruolo.

CREATE OR REPLACE PROCEDURE TITOLARI_CATEGORIA(CATEGORIA VARCHAR,ETA NUMBER,RUOLO_IN CHAR) IS
CURSOR PUNT IS
SELECT *
FROM GIOCA_IN
WHERE CATEGORIA_S_GIOCA=CATEGORIA AND ETA_S_GIOCA=ETA
FOR UPDATE OF TITOLARE,RUOLO;
ALLIEVI PUNT%ROWTYPE;

BEGIN
OPEN PUNT;
LOOP
FETCH PUNT INTO ALLIEVI;
EXIT WHEN PUNT%NOTFOUND;
INSERISCI_TITOLARE(ALLIEVI.N_TESSERINO_GIOCA,CATEGORIA,ETA,RUOLO_IN);
END LOOP;
CLOSE PUNT;

EXCEPTION 
WHEN NO_DATA_FOUND THEN NULL;
COMMIT;
END;
