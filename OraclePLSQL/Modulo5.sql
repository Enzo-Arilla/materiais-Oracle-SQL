DECLARE 
   vCod_Aluno TALUNO.COD_ALUNO%TYPE;
   vNome TALUNO.NOME%TYPE;
   CURSOR c1 IS
     SELECT COD_ALUNO, NOME
     FROM TALUNO;
BEGIN
   OPEN c1;
   LOOP 
      FETCH c1 INTO vCod_Aluno, vNome;
      EXIT WHEN c1%ROWCOUNT > 10 OR c1%NOTFOUND;
      Dbms_Output.Put_Line('Código: ' || 
        LPAD(vCod_Aluno, 4, '0') || ' - ' || 'Nome: ' || vNome);
   END LOOP;
   CLOSE c1;
END;

DECLARE 
   CURSOR c1 IS 
      SELECT * FROM TALUNO;
   Reg c1%ROWTYPE;
 BEGIN
    OPEN c1;
    LOOP 
       FETCH c1 INTO reg;
       EXIT WHEN c1%ROWCOUNT > 10 OR c1%NOTFOUND;
       Dbms_Output.Put_Line('Código: ' || 
                   LPAD(reg.cod_aluno, 5, '0') || '-' ||
                   'Nome: ' || reg.nome);
    END LOOP;
    CLOSE C1;
END;

DECLARE 
  CURSOR c1 IS
    SELECT * FROM TALUNO;
  Reg TALUNO%ROWTYPE;
BEGIN
  FOR reg IN c1 
  LOOP
    Dbms_Output.Put_Line('Código: ' || 
        LPAD(reg.cod_aluno, 5, '0') || ' - ' || 'Nome: ' || reg.nome);
  END LOOP;
END;

DECLARE
  Reg TALUNO%ROWTYPE;
BEGIN
  FOR reg IN (SELECT * FROM TALUNO)
  LOOP
    Dbms_Output.Put_Line('Código: ' || 
    LPAD(reg.cod_aluno, 5, '0') || ' - ' || 'Nome: ' || reg.nome);
  END LOOP;
END;

DECLARE
  CURSOR c1 (pCod_aluno NUMBER) IS
    SELECT *
    FROM TALUNO
    WHERE Cod_aluno = pCod_aluno
    FOR UPDATE OF NOME NOWAIT;
  
  Reg c1%ROWTYPE;
BEGIN
  OPEN c1(&codigo);
  FETCH c1 INTO reg;
  Dbms_Output.Put_Line('Código: ' ||
     LPAD(reg.cod_aluno, 5, '0') || ' - ' || 'Nome: ' || reg.nome);
  CLOSE c1;
END;

DECLARE 
   CURSOR c1 IS
     SELECT nome FROM TALUNO
     FOR UPDATE;
   Reg_aluno c1%ROWTYPE;
BEGIN
   FOR reg_aluno IN c1
   LOOP
      UPDATE TALUNO
      SET nome = INITCAP(reg_aluno.nome)
      WHERE CURRENT OF c1;
      Dbms_Output.Put_Line('Nome: ' || INITCAP(reg_aluno.nome));
   END LOOP;
   COMMIT;
END;






 
