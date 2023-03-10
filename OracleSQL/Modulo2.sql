SELECT * FROM TALUNO;

SELECT CONCAT(COD_ALUNO, NOME) FROM TALUNO;

SELECT COD_ALUNO || ' - ' || NOME FROM TALUNO;

SELECT NOME, INITCAP(NOME) FROM TALUNO;

SELECT NOME, INSTR(NOME, 'R') FROM TALUNO;

SELECT NOME, LENGTH(NOME) FROM TALUNO;

SELECT NOME, LOWER(NOME) FROM TALUNO;

SELECT NOME, UPPER(NOME) FROM TALUNO;

SELECT * FROM TALUNO;

SELECT INITCAP('JOSE DA SILVA') FROM DUAL;

SELECT LPAD(COD_ALUNO, 5, '0') FROM TALUNO;

SELECT RPAD(SALARIO, 8, '0') FROM TALUNO;

SELECT NOME, SUBSTR(NOME, 1, 3) FROM TALUNO;

SELECT REPLACE(NOME, 'R', '$') FROM TALUNO;

SELECT * FROM TALUNO
WHERE LOWER(NOME) = 'marcio';

SELECT * FROM TALUNO
WHERE UPPER(NOME) = 'MARCIO';

SELECT * FROM TALUNO
WHERE UPPER(SUBSTR(CIDADE, 1, 3)) = 'CAN';

UPDATE TALUNO SET
SALARIO = 633.47
WHERE COD_ALUNO = 1;

SELECT
  SALARIO,
  REPLACE(SALARIO, ',', ''),
  RPAD(SALARIO, 10, '0'),
  LPAD(SALARIO, 10, '0'),
  LPAD(REPLACE(SALARIO, ',',''), 10, '0')
FROM TALUNO;

SELECT * FROM DUAL;
SELECT SYSDATE FROM DUAL;

SELECT ROUND(45.925, 2),
       TRUNC(45.929, 2),
       MOD(10, 2) AS RESTO_DIVISAO,
       TRUNC(1.99),
       TRUNC(1.99, 2)
FROM DUAL;

SELECT DATA, SYSDATE , DATA + 5 FROM TCONTRATO;
SELECT SYSDATE - DATA AS DIF_DIAS FROM TCONTRATO;
SELECT TRUNC(SYSDATE - DATA) AS DIAS FROM TCONTRATO;
SELECT SYSDATE, SYSDATE + 15 / 1440 AS ADD_MINUTOS FROM TCONTRATO;
SELECT SYSDATE, SYSDATE + 30 / (3600 * 24) AS ADD_SEGUNDOS FROM TCONTRATO;

SELECT SYSDATE, TRUNC(SYSDATE) FROM DUAL;

SELECT MONTHS_BETWEEN(SYSDATE, SYSDATE-90) AS DIF_MES FROM DUAL;

SELECT ADD_MONTHS(SYSDATE, 5) AS ADICIONA_MES_DATA FROM DUAL;

SELECT NEXT_DAY(SYSDATE, 'QUARTA-FEIRA') AS PROXIMA_QUARTA_DATA FROM DUAL;

SELECT LAST_DAY(SYSDATE) AS ULTIMO_DIA_MES FROM DUAL;

SELECT ROUND(SYSDATE, 'MONTH') AS PRIMEIRO_DIA_PROXIMO_MES FROM DUAL;

SELECT TRUNC(SYSDATE, 'MONTH') AS PRIMEIRO_DIA_PROXIMO_MES FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'DD') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'DD//MM/YYYY') AS DATA FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'DD/MM') AS DIA_MES FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'DD') AS DIA FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'MM') AS MES FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY') AS ANO FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YY')  AS ANO FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'MONTH') AS MES1 FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'D') AS DIA_SEMANA FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'DY') AS DIA_SEMANA FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'DAY') AS DIA_SEMANA1 FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YEAR') AS ANO FROM DUAL;

SELECT TO_CHAR(SYSDATE, '"NOVO HAMBURGO", fmDAY "," DD "de" YYYY') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'HH24:MI') AS HORA_MIN FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HORA_MIN_SEG FROM DUAL;

SELECT TO_CHAR(SALARIO, '99999.99') SALARIO1, TRIM(TO_CHAR(SALARIO, 'L99G999D99')) SALARIO2
FROM TALUNO;

SELECT * FROM TCONTRATO;

SELECT TOTAL, DESCONTO, DESCONTO+TOTAL, NVL(DESCONTO, 0),
       NVL(DESCONTO, 0) + TOTAL, NVL2(DESCONTO, TOTAL, -1)
FROM TCONTRATO;

SELECT * FROM TALUNO;

UPDATE TALUNO SET NOME = NULL
WHERE COD_ALUNO = 5;

SELECT COD_ALUNO, NVL(NOME, 'SEM NOME') FROM TALUNO;

UPDATE TALUNO SET
ESTADO = 'AC'
WHERE COD_ALUNO = 2;

UPDATE TALUNO SET
ESTADO = 'SC'
WHERE COD_ALUNO = 4;

UPDATE TALUNO SET
ESTADO = 'RJ'
WHERE COD_ALUNO = 5;

SELECT NVL(NOME, 'SEM NOME'), ESTADO,
       CASE
         WHEN ESTADO = 'RS' THEN 'GAUCHO'
         WHEN UPPER(ESTADO) = 'AC' THEN 'ACREANO'
         WHEN ESTADO = 'RJ' AND SALARIO > 500 THEN 'CARIOCA'
         ELSE 'OUTROS'
       END AS APELIDO
FROM TALUNO;

SELECT NVL(NOME, 'SEM NOME'), ESTADO,
       DECODE(ESTADO, 'RS', 'GAUCHO',
                      'AC', 'ACREANO',
                      'SP', 'PAULISTA',
                            'OUTROS')  AS APELIDO
FROM TALUNO;