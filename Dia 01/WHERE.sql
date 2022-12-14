-- Databricks notebook source
SELECT * 
FROM silver_olist.pedido
WHERE descSituacao = 'delivered'
-- LIMIT 100
-- sempre usar o LIMIT na parte de descoberta dos dados

-- leia-se: selecione todas as colunas da tabela silver onde a situação do pedido seja entregue (delivered)

-- COMMAND ----------

-- AND

SELECT * 
FROM silver_olist.pedido
WHERE descSituacao = 'delivered' 
AND year(dtPedido) = '2018'

-- leia-se: selecione todas as colunas da tabela silver onde a situação do pedido seja entregue (delivered) para pedidos realizados no ano de 2018

-- COMMAND ----------

-- OR

SELECT * 
FROM silver_olist.pedido
WHERE (descSituacao = 'shipped' OR descSituacao = 'canceled') 
AND year(dtPedido) = '2018'

-- leia-se: selecione todas as colunas da tabela silver onde a situação do pedido seja entregue ou cancelada (delivered or cancelend) para pedidos realizados no ano de 2018

-- COMMAND ----------

-- IN

SELECT * 
FROM silver_olist.pedido
WHERE descSituacao IN ('shipped', 'canceled') 
AND year(dtPedido) = '2018'

-- leia-se: selecione todas as colunas da tabela silver onde a situação do pedido seja entregue ou cancelada (delivered or cancelend) para pedidos realizados no ano de 2018

-- COMMAND ----------

SELECT *, 
        datediff(dtEstimativaEntrega, dtAprovado) AS DiferencaDias

FROM silver_olist.pedido

WHERE descSituacao IN ('shipped', 'canceled') 
AND year(dtPedido) = '2018' 
AND datediff(dtEstimativaEntrega, dtAprovado) >30

-- leia-se: selecione todas as colunas da tabela pedido onde a situação do pedido seja entregue ou cancelada (delivered or cancelend) para pedidos realizados no ano de 2018 e a diferença entre a estimativa de entrega e a data de aprovação seja maior que trinta dias (ou seja, está em atraso)
