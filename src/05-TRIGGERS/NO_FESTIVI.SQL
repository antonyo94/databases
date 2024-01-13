--TRIGGER 10
--Controllo dinamico che stabilisce,come regola aziendale,il sabato e la domenica o come giorni di riposo o come giorni 
--in cui affrontare le partite.

CREATE OR REPLACE TRIGGER NO_FESTIVI
BEFORE INSERT ON ALLENAMENTO
FOR EACH ROW
DECLARE
GIORNO CHAR(3);
FESTIVO EXCEPTION;

BEGIN 
SELECT OTTIENI_GIORNO(:NEW.DATA_ALL) INTO GIORNO
FROM DUAL;
IF GIORNO='SAB' OR GIORNO='DOM' THEN
RAISE FESTIVO;
END IF;


EXCEPTION
WHEN FESTIVO THEN
RAISE_APPLICATION_ERROR (-20330,'Non possono esserci allenamenti di ' || LOWER(GIORNO));	
END;  