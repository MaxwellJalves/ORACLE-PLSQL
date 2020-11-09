--CRIANDO VIEW PARA ISOLAR O BANCO DE DADOS
CREATE VIEW VMoradores_Ecovila AS
SELECT * FROM CONDOMINIO_ECOVILA;
--INICIANDO BLOCO ANONIMO PARA VALIDAR O RETORNO DA VIEW
DECLARE
vNome CONDOMINIO_ECOVILA.nome%type;
vBloco  CONDOMINIO_ECOVILA.bloco%type;
vAp      CONDOMINIO_ECOVILA.apartamento%type;
BEGIN

SELECT nome,bloco,apartamento
INTO vNome,vBloco,vAp
FROM VMoradores_Ecovila
where ID = 1;
--EXIBINDO NO CONSOLE O RETORNO DA VIEW
 dbms_output.put_line('Nome : ' || vNome  ||  ' Bloco :  '|| vBloco || ' Apartamento '|| vAp);
end;