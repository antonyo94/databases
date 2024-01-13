--TRIGGER 12
--Il seguente vincolo fa si che venga rispettata la durata dei singoli allenamenti facendo in modo,dato l'unico campo a disposizione in cui si allena
--la stessa squadra,che due squadre non si allenino contemporaneamente o almeno che una squadra non entri in campo prima che l'altra finisca la seduta

CREATE OR REPLACE TRIGGER NO_SOVRAPPOSTI
BEFORE INSERT ON ALLENAMENTO
FOR EACH ROW
DECLARE
CURSOR POINT IS
SELECT DATA_ALL,DURATA
FROM ALLENAMENTO
WHERE TO_CHAR(DATA_ALL,'DD-Mon-YYYY')=TO_CHAR(:NEW.DATA_ALL,'DD-Mon-YYYY');
CUR_ALL POINT%ROWTYPE;
DATA_MAX DATE;
SOVRAPPOSTI EXCEPTION;

BEGIN 
OPEN POINT;
LOOP
FETCH POINT INTO CUR_ALL;
EXIT WHEN POINT%NOTFOUND;
SELECT CUR_ALL.DATA_ALL+((CUR_ALL.DURATA-1)/60)/24 INTO DATA_MAX
FROM DUAL;
IF :NEW.DATA_ALL BETWEEN CUR_ALL.DATA_ALL AND DATA_MAX THEN
RAISE SOVRAPPOSTI;
END IF;
END LOOP;
CLOSE POINT;

EXCEPTION 
WHEN SOVRAPPOSTI THEN RAISE_APPLICATION_ERROR(-20300,'Non possono esserci due allenamenti sovrapposti');
END;



