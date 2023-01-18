DECLARE 
  vCod taluno.cod_aluno%TYPE := 1;
  vCidade taluno.cidade%TYPE;
  x NUMBER;
BEGIN
  SELECT CIDADE INTO vCidade
  FROM TAluno
  WHERE cod_aluno = vCod;
  X := 0 / 0;
  Dbms_Output.Put_Line('Cidade: ' || vCidade);
EXCEPTION
  WHEN no_data_found THEN
    RAISE_APPLICATION_ERROR(-20001, 'Aluno Inexistente! ' || SQLCODE || ' ' || SQLERRM);
  WHEN too_many_rows THEN
    RAISE_APPLICATION_ERROR(-20002, 'Registro Duplicado! ' || SQLCODE || ' ' || SQLERRM);
  WHEN others THEN
    RAISE_APPLICATION_ERROR(-20003, 'Exceção Desconhecida! ' || SQLCODE || ' ' || SQLERRM);
END;

CREATE TABLE CONTASCURSO
(
  Codigo NUMBER NOT NULL PRIMARY KEY,
  Valor NUMBER(10,2),
  Juros NUMBER(10,2),
  Vencimento DATE
);

INSERT INTO CONTASCURSO VALUES (100, 550, 50, SYSDATE-10);

SELECT * FROM CONTASCURSO;

COMMIT;

DECLARE
  vDt_vencimento DATE;
  vConta NUMBER := 100;
  eConta_vencida EXCEPTION;
BEGIN
  SELECT vencimento INTO vDt_vencimento
  FROM CONTASCURSO WHERE codigo = vConta;
  IF vDt_vencimento < TRUNC(SYSDATE) THEN
    RAISE eConta_vencida;
  END IF;
EXCEPTION
  WHEN eConta_vencida THEN
    Dbms_Output.Put_Line('Conta vencida');
    UPDATE CONTASCURSO SET valor = valor + juros
    WHERE codigo = vConta;
END;

SELECT * FROM CONTASCURSO;

DECLARE
   eFk_inexistente EXCEPTION;
   PRAGMA EXCEPTION_INIT(eFk_inexistente, -02291);
BEGIN
  INSERT INTO TBAIRROCURSO VALUES (100, 100, 'ERRO');
EXCEPTION
   WHEN eFk_Inexistente THEN
     RAISE_APPLICATION_ERROR(-20200, 'Cidade não existe!');
END;

SELECT * FROM TBAIRROCURSO;
SELECT * FROM TCIDADECURSO;

