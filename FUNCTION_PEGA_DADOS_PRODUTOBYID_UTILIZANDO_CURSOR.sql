CREATE OR REPLACE FUNCTION FNC_PEGA_DADOS_PRODUTO(P_ID IN NUMBER) RETURN VARCHAR2
IS
--CRIANDO CURSOR
CURSOR cPegaReg(parametro number) is
SELECT * FROM PRODUTOS WHERE ID = parametro;


rec cPegaReg%ROWTYPE;
BEGIN
    IF (P_ID IS NOT NULL) THEN
        OPEN cPegaReg(P_ID);
            FETCH cPegaReg INTO rec;
            LOOP
              EXIT WHEN cPegaREg%notfound;
              IF (rec.id is not null ) then                                                                                                             --CONVERTENCO DADOS PARA EXIBIR DUAS CASAS DECIOMAIS NO FINAL
              return 'PRODUTO : CÓDIGO: '||rec.id||' DESCRICAO :' || rec.nome || ' VL_UNITARIO: R$' || TO_CHAR(rec.valor,'9999.99');
              else
               return 'N'; -- REGISTRO NÃO LOCALIZADO
              end if;
             END LOOP;
        CLOSE cPegaReg;
    END IF;
END;