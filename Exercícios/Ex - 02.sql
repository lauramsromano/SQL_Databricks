-- Databricks notebook source
-- DBTITLE 1,Exercício 06:
-- 06. Lista de Pedidso feitos em dez 2017 e entregues com atraso.

SELECT * 
FROM silver_olist.pedido
WHERE YEAR(dtPedido) = 2017 
AND MONTH(dtPedido) = 12
AND descSituacao = 'delivered'
AND date(dtEntregue) > date(dtEstimativaEntrega)

-- COMMAND ----------

-- DBTITLE 1,Exercicio 07:
-- 07. Lista de pedidos com 2 ou mais parcelas menores de 20 reais

SELECT *,
    ROUND(vlPagamento / nrPacelas, 2) AS vlParcela
FROM silver_olist.pagamento_pedido
WHERE nrPacelas >= 2
AND (vlPagamento / nrPacelas) < 20

-- COMMAND ----------

-- DBTITLE 1,Exercicio 08:
-- Defina os itens de pedido nos grupos abaixo: 
---- frete inferior a 10%
---- frete entre 10% e 25%
---- frete entre 25% e 50%
---- frete maior que 50%

SELECT *,
      vlPreco + vlFrete AS vlTotal,
      vlFrete / (vlPreco + vlFrete) AS pctFrete,
      
      CASE
        WHEN vlFrete / (vlPreco + vlFrete) <= 0.1 THEN '10%'
        WHEN vlFrete / (vlPreco + vlFrete) <= 0.25 THEN '10% A 25%'
        WHEN vlFrete / (vlPreco + vlFrete) <= 0.5 THEN '25% A 50%'
        ELSE '+50%'
      END AS descFretePct

FROM silver_olist.item_pedido
