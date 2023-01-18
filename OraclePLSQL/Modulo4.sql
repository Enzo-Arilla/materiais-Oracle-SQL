DECLARE 
   
   TYPE Rec_Aluno IS RECORD
   (
     cod_aluno NUMBER NOT NULL := 0,
     nome TALUNO.NOME%TYPE,
     cidade TALUNO.CIDADE%TYPE
   );
   
   Registro rec_aluno;

BEGIN
   registro.cod_aluno := 50;
   registro.nome := 'Master';
   registro.cidade := 'Novo Hamburgo';
   Dbms_Output.Put_Line('Código: ' || registro.cod_aluno);
   Dbms_Output.Put_Line('Nome: ' || registro.nome);
   Dbms_Output.Put_Line('Cidade: ' || registro.cidade);
END;

DECLARE 
  reg TALUNO%ROWTYPE;
  vCep VARCHAR(10) := '13160-354';
BEGIN
  SELECT COD_ALUNO, NOME, CIDADE
  INTO REG.COD_ALUNO, REG.NOME, REG.CIDADE
  FROM TALUNO
  WHERE COD_ALUNO = 1;
  
  vCep := '13168-356';
  reg.salario := 1500;
  reg.cep := vCep;
  
  Dbms_Output.Put_Line('Código: ' || reg.cod_aluno);
  Dbms_Output.Put_Line('Nome: ' || reg.nome);
  Dbms_Output.Put_Line('Cidade: ' ||reg.cidade);
  Dbms_Output.Put_Line('Cep: ' || reg.cep);
  Dbms_Output.Put_Line('Salário: ' || reg.salario);
END;

DECLARE 
  TYPE T_ALUNO IS TABLE OF TALUNO.NOME%TYPE
  INDEX BY BINARY NUMBER;
  
  REGISTRO T_ALUNO;
BEGIN
  REGISTRO(1) := 'MARCIO';
  REGISTRO(2) := 'JOSE';
  REGISTRO(3) := 'PEDRO';
  Dbms_Output.Put_Line('Nome 1: ' || registro(1));
  Dbms_Output.Put_Line('Nome 2: ' || registro(2);
  Dbms_Output.Put_Line('Nome 3: ' || registro (3);
END;

SELECT COD_ALUNO, NOME
FROM TALUNO WHERE COD_ALUNO = 1;

DECLARE 
  TYPE nome_type IS TABLE OF TALUNO.NOME %TYPE;
  nome_table nome_type := nome_type();
  
BEGIN
  nome_table.EXTEND;
  nome_table(1) := 'Pedro';
  nome_table.EXTEND;
  nome_table(2) := 'Marcio';
  Dbms_Output.Put_Line('Nome 1: ' || nome_table(1));
  Dbms_Output.Put_Line('Nome 2: ' || nome_table(2));
END;

DECLARE 
  TYPE tipo IS TABLE OF VARCHAR2(30) INDEX BY VARCHAR2(2);
  uf_capital tipo;
BEGIN
  uf_capital('RS') := 'PORTO ALEGRE';
  uf_capital('RJ') := 'RIO DE JANEIRO';
  uf_capital('PR') := 'CURITIBA';
  uf_capital('MT') := 'CUIABA';
  Dbms_Output.Put_Line(uf_capital('RS'));
  Dbms_Output.Put_Line(uf_capital('RJ'));
  Dbms_Output.Put_Line(uf_capital('PR'));
  Dbms_Output.Put_Line(uf_capital('MT'));
END;

DECLARE 
  TYPE nome_varray IS VARRAY(5) OF TALUNO.NOME%TYPE;
  nome_vetor nome_varray := nome_varray();
BEGIN
  nome_vetor.EXTEND;
  nome_vetor(1) := 'Marcio';
  Dbms_Output.Put_Line(nome_vetor(1));
END;