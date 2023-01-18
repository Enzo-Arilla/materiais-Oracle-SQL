DECLARE 
  vValor NUMBER(8,2);
  vNome VARCHAR2(30);
BEGIN
  SELECT valor, nome
  INTO vValor, vNome
  FROM TCURSO
  WHERE COD_CURSO >= &cod_Curso;
  Dbms_Output.Put_Line('Valor: ' || TO_CHAR(vValor, 'FM9999.99'));
  
  Dbms_Output.Put_Line('Curso:' || INITCAP(vNome));
END;

SELECT * FROM TCURSO;

DECLARE 
  vDt_compra TCONTRATO.DATA%TYPE;
  vDt_curso TCONTRATO.DATA%TYPE;
BEGIN
   SELECT DATA, DATA + 10
   INTO vDt_compra, vDt_curso
   FROM TCONTRATO
   WHERE COD_CONTRATO = &Contrato;
   Dbms_Output.Put_Line('Data compra: ' || vDt_compra);
   Dbms_Output.Put_Line('Data curso: ' ||  vDt_curso);
END;

SELECT * FROM TCONTRATO;

SELECT MAX(COD_CONTRATO) FROM TCONTRATO;

CREATE SEQUENCE SEQ_CONTRATO START WITH 8;

DECLARE
  vCod TCONTRATO.COD_CONTRATO%TYPE;
BEGIN
  SELECT SEQ_CONTRATO.NEXTVAL
  INTO vCod FROM DUAL;
  
  INSERT INTO TCONTRATO(COD_CONTRATO, DATA,
                        COD_ALUNO, DESCONTO)
  VALUES(vCod, SYSDATE, 2, NULL);
  
  Dbms_Output.Put_Line('Criado Contrato: ' || vCod);
END;

COMMIT;

SELECT SEQ_CONTRATO.CURRVAL FROM DUAL;
  
SELECT * FROM TCONTRATO;

DECLARE
  vValor TCURSO.Valor%TYPE := &Valor;
BEGIN
  UPDATE TCURSO SET
  Valor = Valor + vValor
  WHERE carga_horaria >= 30;
END;

SELECT * FROM TCURSO;

DECLARE 
  vContrato TCONTRATO.COD_CONTRATO%TYPE := &contrato;
BEGIN 
  DELETE FROM TCONTRATO
  WHERE COD_CONTRATO = vContrato;
END;

SELECT * FROM TCONTRATO;

DECLARE 
  vContrato NUMBER := &cod_contrato;
  vTexto VARCHAR2(50);
BEGIN
  UPDATE TCONTRATO SET
  desconto = desconto - 2
  WHERE COD_CONTRATO >= vContrato;
  
  vTexto := SQL%ROWCOUNT;
  
  Dbms_Output.Put_Line(vTexto || ' linhas atualizadas.');
END;

