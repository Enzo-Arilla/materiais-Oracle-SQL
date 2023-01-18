DECLARE
  vNome VARCHAR2(30) := 'Outro';
  vCidade VARCHAR2(30);
  vEstado VARCHAR2(2);
BEGIN
  IF (vNome = 'Gaucho') THEN
    vCidade := 'Porto Alegre';
    vEstado := 'RS';
  ELSIF (vNome = 'Carioca') THEN
    vCidade := 'Rio de Janeiro';
    vEstado := 'RJ';
  ELSE
    IF (vEstado='SP') THEN
      vCidade := 'Paulista';
    ELSE
      vCidade := 'Outros';
      vEstado := 'XX';
    END IF;
  END IF;
  Dbms_Output.Put_Line(vCidade || ' - ' || vEstado);
END;

DECLARE 
  vEstado VARCHAR2(2) := 'RJ';
  vNome VARCHAR2(30);
BEGIN
  CASE
    WHEN vEstado = 'RS' THEN vNome := 'Gaucho';
    WHEN vEstado = 'RJ' OR vEstado = 'ES' THEN vNome := 'Carioca';
  ELSE
    vNome := 'Outros';
  END CASE;
  Dbms_Output.Put_Line('Apelido: ' || vNome);
END;

DECLARE
  vContador NUMBER := 0;
BEGIN
  LOOP
    vContador := vContador + 1;
    Dbms_Output.Put_Line(vContador);
    EXIT WHEN vContador = 10;
  END LOOP;
  Dbms_Output.Put_Line('Fim do LOOP');
END;

DECLARE 
  vContador NUMBER;
BEGIN
  FOR vContador IN 1..10
  LOOP
    Dbms_Output.Put_Line('For Loop: ' || vContador);
  END LOOP;
END;

DECLARE 
  vContador NUMBER  := 0;
  vTexto VARCHAR(10);
BEGIN
  WHILE vContador < 10
  LOOP
    vContador := vContador + 1;
    IF (vContador MOD 2) = 0 THEN
      vTexto := 'Par';
    ELSE
      vTexto := 'Impar';
    END IF;
    Dbms_Output.Put_Line(vContador || ' -> ' || vTexto);
  END LOOP;
END;


    


  