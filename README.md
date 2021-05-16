# ORACLE-PLSQL
Estudo referente as boas práticas do PLSQL - criando uma tabela para um condomínio onde a inserção dos dados estão sendo realizada através de procedures com validações básicas e o retorno das consultas estão sendo realizadas através de duas funções distintas uma para consultar por id e outra pelo nome do moradora, aos poucos o projeto irá ficar mais complexo e com a codificação mais enxuta, porém o objetivo é tentar criar um fluxo que seja de fácil manutenção e que garanta a confiabilidade e integridade dos registros.


#ORACLE XE 18

# Configurando um novo usuário

-  ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE
-  CREATE USER dbaoracle IDENTIFIED BY dbaoracle DEFAULT TABLESPACE users;
-  Liberando privilegios para o novo usuário.
-  GRANT connect,resource TO dbaoracle;

# Criando TABELAS para realização de testes

- CREATE TABLE seguimentoMercado(id number(5),razao_social varchar2(100));

- CREATE TABLE cliente(
  id number(5),
  razao_social varchar(100),
  cnpj varchar2(20),
  segmentoMercado_id number(5),
  data_inclusao Date,
  faturamentoPrevisto number(10,2),
  categoria varchar(20));


ALTER TABLE seguimentoMercado ADD CONSTRAINT seguimentoMercado_id_pk PRIMARY KEY(id);

ALTER TABLE cliente ADD CONSTRAINT cliente_id_pk PRIMARY KEY (ID);

ALTER TABLE cliente ADD CONSTRAINT cliente_segMercado_fk FOREIGN KEY(segmentoMercado_id) REFERENCES seguimentoMercado(id);
