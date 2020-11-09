CREATE OR REPLACE FUNCTION FNC_CONSULTA_MORADOR(P_ID IN NUMBER, P_NOME  VARCHAR2) RETURN VARCHAR2
AS
vNome CONDOMINIO_ECOVILA.nome%type;
vBloco  CONDOMINIO_ECOVILA.bloco%type;
vAp      CONDOMINIO_ECOVILA.apartamento%type;
BEGIN

IF (P_ID IS NULL OR P_NOME IS NULL)  THEN
RETURN 'MORADOR NÃO LOCALIZADO!  VERIFIQUE SE VOCÊ DIGOU O CÓDIGO OU NOME DO MORADOR CORRETAMENTE';
END IF;
IF (P_ID IS NOT NULL AND P_NOME IS NULL) THEN
    SELECT nome,bloco,apartamento
    INTO vNome,vBloco,vAp
    FROM VMoradores_Ecovila
    WHERE  ID = P_ID;
--EXIBINDO NO CONSOLE O RETORNO DA VIEW
 dbms_output.put_line('Nome : ' || vNome  ||  ' Bloco :  '|| vBloco || ' Apartamento '|| vAp);
RETURN 'Nome : ' || vNome  ||  ' Bloco :  '|| vBloco || ' Apartamento '|| vAp;

IF (P_NOME IS NOT NULL AND P_ID  IS NULL) THEN
    SELECT nome,bloco,apartamento
    INTO vNome,vBloco,vAp
    FROM VMoradores_Ecovila
    WHERE  nome = P_NOME;
 dbms_output.put_line('Nome : ' || vNome  ||  ' Bloco :  '|| vBloco || ' Apartamento '|| vAp);
RETURN 'Nome : ' || vNome  ||  ' Bloco :  '|| vBloco || ' Apartamento '|| vAp;
END IF;
END IF;


END;