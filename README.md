# ORACLE-PLSQL
Estudo referente as boas práticas do PLSQL - criando uma tabela para um condomínio onde a inserção dos dados estão sendo realizada através de procedures com validações básicas e o retorno das consultas estão sendo realizadas através de duas funções distintas uma para consultar por id e outra pelo nome do moradora, aos poucos o projeto irá ficar mais complexo e com a codificação mais enxuta, porém o objetivo é tentar criar um fluxo que seja de fácil manutenção e que garanta a confiabilidade e integridade dos registros.


#ORACLE XE 18

##PROCEDIMENTO PARA CONFIGURAR UM NOVO USUARIO
-  ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE
-  CREATE USER dbaoracle IDENTIFIED BY dbaoracle DEFAULT TABLESPACE users;
-  Liberando privilegios para o novo usuário.
-  GRANT connect,resource TO dbaoracle;
