DECLARE 
  x NUMBER;
  y NUMBER;
  c NUMBER;
BEGIN
  x := 10;
  y := 20;
  c := x + y;
  Dbms_Output.Put_Line('Resultado: ' || c); 
END;



DECLARE 
  VDESCONTO NUMBER(6,2) := 0.50;
  VCIDADE VARCHAR2(30) := 'NOVO HAMBURGO';
  VCOD_ALUNO TALUNO.COD_ALUNO%TYPE := 5;
  VTOTAL NUMBER(8,2) := 1345.89;
BEGIN
  VTOTAL := ROUND(VTOTAL * VDESCONTO, 2);
  Dbms_Output.Put_Line('Total: ' || VTOTAL);
  VDESCONTO := 1.20;
  VCIDADE := INITCAP(VCIDADE);
  Dbms_Output.Put_Line('Cidade: ' || VCIDADE);
  Dbms_Output.Put_Line('Desconto: ' || VDESCONTO);
  Dbms_Output.Put_Line('Aluno: ' || VCOD_ALUNO);
END;

DECLARE 
  VPRECO1 NUMBER(8, 2) := 10;
  VPRECO2 NUMBER(8, 2) := 20;
  VFLAG BOOLEAN;
BEGIN
  VFLAG := (VPRECO1>VPRECO2);
  IF (VFLAG = TRUE) THEN
    Dbms_Output.Put_Line('Verdadeiro');
  ELSE
    Dbms_Output.Put_Line('Falso');
  END IF;
  
  IF(VPRECO1>VPRECO2) THEN
    Dbms_Output.Put_Line('vPreco1 é maior');
  ELSE
    Dbms_Output.Put_Line('vPreco2 é maior');
  END IF;
END;

VARIABLE VDESCONTO2 NUMBER;

DECLARE
  VCOD_ALUNO NUMBER := 1;
BEGIN
  :VDESCONTO2 := 0.90;
  Dbms_Output.Put_Line('desconto 2: ' || :VDESCONTO2);
  
  UPDATE TCONTRATO SET
  TOTAL = TOTAL * :VDESCONTO2
  WHERE COD_ALUNO = VCOD_ALUNO;
END;

SELECT * FROM TCONTRATO;

DECLARE 
  VTESTE VARCHAR2(10) := 'JOSE';
BEGIN
  
  DECLARE 
    VTESTE VARCHAR2(10) := 'PEDRO';
  BEGIN
    Dbms_Output.Put_Line('Bloco Interno: ' || VTESTE);
  END;
  
  Dbms_Output.Put_Line('Bloco Externo: ' || VTESTE);
END;