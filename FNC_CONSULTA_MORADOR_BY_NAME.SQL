create or replace NONEDITIONABLE FUNCTION FNC_CONSULTA_MORADOR_BY_NAME(P_NOME IN VARCHAR2) RETURN VARCHAR2
AS
vNome CONDOMINIO_ECOVILA.nome%type;
vBloco  CONDOMINIO_ECOVILA.bloco%type;
vAp      CONDOMINIO_ECOVILA.apartamento%type;
vCheckVeiculo CONDOMINIO_ECOVILA.temveiculo%TYPE;
BEGIN

    IF (P_NOME IS NULL )  THEN
                RETURN 'MORADOR NÃO LOCALIZADO!  VERIFIQUE SE VOCÊ DIGOU O CÓDIGO OU NOME DO MORADOR CORRETAMENTE';
    END IF;
    --
    IF (P_NOME IS NOT NULL ) THEN
        SELECT nome,bloco,apartamento,temveiculo
        INTO vNome,vBloco,vAp,vCheckVeiculo
        FROM VMoradores_Ecovila
        WHERE  NOME =P_NOME;
        dbms_output.put_line(vCheckVeiculo);
         IF (vCheckVeiculo = 'S') THEN
          --  vCheckVeiculo := 'SIM'  ;  --O PROJETO FOI ESTRUTURADO PARA ACEITAR 2 CARCTERES CASO TENTE PASSAR 3 A FUNCTION IRA COMPILAR SEM PROBLEMA POREM NO RETORNO SE CAIR NESSA VALIDACAO IRA RETORNAR ERRO DE TAMANHO DA COLUNA 
            vCheckVeiculo := 'SIM';   --UTILIZANDO 2 CARACTERES IRA SER ACEITO SEM CRITICA  
          --CORRECAO EXECUTAR [ALTER TABLE CONDOMINIO_ECOVILA MODIFY  TEMVEICULO VARCHAR(3);]
             dbms_output.put_line(vCheckVeiculo ||'SIM');
         ELSE
             vCheckVeiculo := 'NAO';
         END IF;
        DBMS_OUTPUT.PUT_LINE('validando o CHECK'||vCheckVeiculo);
        CASE
           WHEN vNome IS NULL THEN RETURN  'OPS ! DADOS NÃO LOCALIZADO NO BANCO DE DADOS';
           WHEN vBloco  IS NULL THEN RETURN  'OPS ! DADOS NÃO LOCALIZADO NO BANCO DE DADOS';
           WHEN vNome IS NOT NULL THEN RETURN 'Nome : ' || vNome  ||  ' Bloco :  '|| vBloco || ' Apartamento '|| vAp ||'POSSUI VEICULO  :'|| vCheckVeiculo;
        END CASE;
    END IF;
END;