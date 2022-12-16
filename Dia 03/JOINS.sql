-- Databricks notebook source
-- DBTITLE 1,LEFT JOIN: 
-- Tabela esquerda (left) como referência:

SELECT T1.*,
        T2.descUF
        
FROM silver_olist.pedido AS T1 

RIGHT JOIN silver_olist.cliente AS T2
ON T1.idCliente = T2.idCliente

-- COMMAND ----------

-- DBTITLE 1,RIGHT JOIN:
-- Tabela direita (right) como referência:



-- COMMAND ----------

-- DBTITLE 1,INNER JOIN:
-- Não há tabela referência, trás as correspondências de ambas.

SELECT T1.*,
        T2.descUF
        
FROM silver_olist.pedido AS T1 

RIGHT JOIN silver_olist.cliente AS T2
ON T1.idCliente = T2.idCliente
