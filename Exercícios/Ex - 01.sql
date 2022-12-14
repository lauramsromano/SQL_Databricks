-- Databricks notebook source
-- DBTITLE 1,Exercicio 1: 
-- 01. Selecione todos os clientes paulistanos (nasceu na cidade de São Paulo):

SELECT * 
FROM silver_olist.cliente
WHERE descCidade = 'sao paulo'

-- COMMAND ----------

-- DBTITLE 1,Exercício 02:
-- 02. Selecione todos os clientes paulistas (nasceu no estado de São Paulo):

SELECT * 
FROM silver_olist.cliente
WHERE descUF = 'SP'

-- COMMAND ----------

-- DBTITLE 1,Exercício 03:
-- 03. Selecione todos os venderes fluminense e paulistas:

SELECT * 
FROM silver_olist.vendedor
WHERE descUF in ('SP', 'RJ')

-- COMMAND ----------

-- DBTITLE 1,Exercício 04:
-- 04. Selecione todos os venderes cariocas e paulistas:

SELECT * 
FROM silver_olist.vendedor
WHERE descCidade = 'rio de janeiro'
OR descUF = 'SP'

-- COMMAND ----------

-- DBTITLE 1,Exercício 5:
-- 05. Selecione produtos de perfurmaria e bebês com altura maior que 5cm:

SELECT * 
FROM silver_olist.produto
WHERE descCategoria in ('perfumaria', 'bebes') 
AND vlComprimentoCm > 5
