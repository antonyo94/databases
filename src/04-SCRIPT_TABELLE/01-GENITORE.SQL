DROP TABLE GENITORE;

--GENITORE
CREATE TABLE GENITORE (
	CF_G CHAR(7),
	NOME_G VARCHAR2(15),
	COGNOME_G VARCHAR2(15),
	RUOLO_G VARCHAR2(15)  NOT NULL,
	CONSTRAINT GENITORE_PK PRIMARY KEY (CF_G),
	CONSTRAINT DEFINIZIONE_RUOLO CHECK(UPPER(RUOLO_G) IN ('MADRE','PADRE'))
);