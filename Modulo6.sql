SELECT * FROM TDESCONTO;

INSERT INTO TDESCONTO(CLASSE, INFERIOR, SUPERIOR)
VALUES ('&cla', &inf, &sup);

SELECT * FROM TDESCONTO
WHERE CLASSE = '&cla';

UPDATE TDESCONTO SET 
INFERIOR = &inf,
SUPERIOR = &sup
WHERE CLASSE = '&cla';

DELETE FROM TDESCONTO
WHERE CLASSE = '&cla';

CREATE TABLE TDESCONTOA
  AS SELECT * FROM TDESCONTO;
  
SELECT * FROM TDESCONTOA;

COMMIT;

DELETE FROM TDESCONTOA;

ROLLBACK;

TRUNCATE TABLE TDESCONTOA;

SELECT * FROM TDESCONTOA;

SAVEPOINT UPD_B;

UPDATE TDESCONTO SET
SUPERIOR = 88
WHERE CLASSE = 'B';

SAVEPOINT UPD_A;

UPDATE TDESCONTO SET
SUPERIOR = 99
WHERE CLASSE = 'A';

SELECT * FROM TDESCONTO;

SAVEPOINT INS_OK;

INSERT INTO TDESCONTO(CLASSE, INFERIOR, SUPERIOR)
VALUES ('&cla', &inf, &sup);

SELECT * FROM TDESCONTO;

ROLLBACK TO SAVEPOINT INS_OK;

ROLLBACK TO SAVEPOINT UPD_A;

ROLLBACK TO SAVEPOINT UPD_B;

DROP TABLE TDESCONTOA;