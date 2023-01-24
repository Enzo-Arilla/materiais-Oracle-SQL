INSERT ALL
  INTO TCURSO (cod_curso, nome, valor)
  INTO TALUNO (cod_aluno, nome, salario)
      SELECT cod_contrato+50, 'INSERT ALL', 1013
      FROM TCONTRATO
      WHERE COD_CONTRATO=1;
      
SELECT * FROM TCURSO;

SELECT * FROM TALUNO;

CREATE SEQUENCE seq_curso START WITH 100;

