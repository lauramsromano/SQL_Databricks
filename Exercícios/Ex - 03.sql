-- Databricks notebook source
-- DBTITLE 1,Exercicio 08:
-- JOINS

-- Qual a categoria que mais tem produto vendido:

SELECT T2.descCategoria,
      COUNT(*)
      
FROM silver_olist.item_pedido AS T1

LEFT JOIN silver_olist.produto AS T2

ON T1.idProduto = T2.idProduto

GROUP BY T2.descCategoria

ORDER BY COUNT(*) DESC

-- COMMAND ----------

-- DBTITLE 1,Exercício 09:
-- Qual categoria tem produtos mais caro em média:

SELECT T2.descCategoria,
      AVG(T1.vlPreco)

FROM silver_olist.item_pedido AS T1

LEFT JOIN silver_olist.produto AS T2

ON T1.idProduto = T2.idProduto 

GROUP BY T2.descCategoria

ORDER BY AVG(T1.vlPreco) DESC

-- COMMAND ----------

-- DBTITLE 1,Exercicio 10:
-- Os clientes de qual estado pagam mais frete:

SELECT 
      T3.descUF,
      AVG(T1.vlFrete) AS FreteMedio

FROM silver_olist.item_pedido AS T1 
LEFT JOIN silver_olist.pedido AS T2 -- primeiro join
ON T1.idPedido = T2.idPedido

LEFT JOIN silver_olist.cliente AS T3 -- segundo join
ON T2.idCliente = T3.idCliente

GROUP BY T3.descUF
ORDER BY FreteMedio DESC

-- COMMAND ----------

-- DBTITLE 1,Exercicio 11:
-- Os clientes de qual estado pagam em média frete acima de 40 reais:

SELECT 
      T3.descUF,
      AVG(T1.vlFrete) AS FreteMedio

FROM silver_olist.item_pedido AS T1 
LEFT JOIN silver_olist.pedido AS T2 -- primeiro join
ON T1.idPedido = T2.idPedido

LEFT JOIN silver_olist.cliente AS T3 -- segundo join
ON T2.idCliente = T3.idCliente

GROUP BY T3.descUF
HAVING FreteMedio > 40

ORDER BY FreteMedio DESC
