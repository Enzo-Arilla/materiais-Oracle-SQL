CREATE OR REPLACE FUNCTION CONSULTA_PRECO
(pCod_Curso NUMBER) 
RETURN NUMBER
AS
  vValor NUMBER;
BEGIN  
  SELECT valor INTO vValor FROM TCURSO
  WHERE cod_curso = pCod_Curso;
  
  RETURN (vValor);
END;

DECLARE 
  vCod NUMBER := &codigo;
  vValor NUMBER;
BEGIN
  vValor := consulta_preco(vCod);
  Dbms_Output.Put_Line('Preço do curso: ' || vValor);
END;

CREATE OR REPLACE FUNCTION existe_aluno
(pCod_Aluno IN TALUNO.Cod_Aluno%TYPE)
RETURN BOOLEAN
IS
  vAluno NUMBER(10);
BEGIN
  SELECT cod_Aluno
  INTO   vAluno
  FROM   TALUNO
  WHERE cod_aluno = pCod_Aluno;
  RETURN (TRUE);
EXCEPTION
  WHEN others THEN
    RETURN (FALSE);
END;

DECLARE
  vCodigo NUMBER := 2;
BEGIN
  IF existe_aluno(vCodigo) THEN
    Dbms_Output.Put_Line('Código encontrado');
  ELSE
    Dbms_Output.Put_Line('Código não encontrado');
  END IF;
END;

CREATE OR REPLACE PROCEDURE cadastra_aluno
(pCod_Aluno IN TALUNO.COD_ALUNO%TYPE,
 pNome      IN TALUNO.NOME%TYPE,
 pCidade    IN TALUNO.CIDADE%TYPE,
 pEstado    IN TALUNO.ESTADO%TYPE)
IS
BEGIN
  IF ( NOT existe_aluno(pCod_Aluno) ) THEN 
     INSERT INTO TALUNO(cod_aluno, nome, cidade, estado)
     VALUES (pCod_Aluno, pNome, pCidade, pEstado);
     Dbms_Output.Put_Line('Aluno cadastrado com sucesso');
  ELSE
    Dbms_Output.Put_Line('Código já existe');
  END IF;
END;

DECLARE
BEGIN
   cadastra_aluno(25, 'PAULO', 'CUIABA', 'MT');
END;

SELECT * FROM TALUNO;

