-- Databricks notebook source
-- DBTITLE 1,GROUP BY:
-- GROUP BY:

SELECT
    descUF, 
    count(*)
FROM silver_olist.cliente
GROUP BY descUF 
ORDER BY descUF

-- leia-se: agrupe as linhas pela informações da coluna descUF (estados) e conte o total

-- COMMAND ----------

SELECT
    descUF, 
    count(DISTINCT idClienteUnico)
FROM silver_olist.cliente
GROUP BY descUF 
ORDER BY descUF

-- leia-se: agrupe as linhas pela informações da coluna descUF (estados) e conte o total de clientes unicos por estado
