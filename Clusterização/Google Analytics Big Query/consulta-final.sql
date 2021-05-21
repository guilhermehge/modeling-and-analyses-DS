# ---------------------- Consulta final após estudo do banco de dados ---------------------- #
# Encontrei tudo o que precisava na tabela SESSIONS, isto é:
/* ● Sessões - ao contar, antes de agrupar, o número de sessões de um mesmo usuário utilizando a coluna fullVisitorId; 
   ● Sessões conversoras - ao contar, utilizando a coluna totals_transactions quantas vezes o usuário converteu. Para isso basta contar as linhas em que totals_transactions > 0;
   ● Quantidade de transações - Somando a coluna totals_transactions
   ● Receita - Somando a coluna totals_totalTransactionRevenue obtém-se o total da receita de cada cliente que converteu;
   ● Receita média por transação - Calculando a média (excluindo as sessões que não tiveram compra) da coluna totals_totalTransactionRevenue;
   ● Data da última transação - Utilizando MAX(date); */

USE analytics;

SELECT 
    fullVisitorId as ID_usuario,
    COUNT(fullVisitorId) as n_sessoes,
    COUNT(CASE WHEN totals_transactions > 0 THEN 1 END) AS sessoes_conversoras, # Case When para contar apenas as sessões nas quais houve transação
    SUM(totals_transactions) AS qtde_transacoes,
    ROUND(SUM(totals_totalTransactionRevenue)/1000000,2) as soma_receitas, # Já dividi o valor por 1 milhão conforme explica o BigQuery Schema
    ROUND(AVG(NULLIF(totals_totalTransactionRevenue,0))/1000000,2) as media_receitas_transacao, # NULLIF para ignorar os casos em que não houve transação para fazer a média por transação corretamente. O MySQL 
    MAX(date) as data_ultima_transacao
FROM
    sessions
GROUP BY fullVisitorId # Agrupado por cliente
HAVING qtde_transacoes > 0 # Como queremos usuários QUE CONVERTERAM, podemos remover as transações = 0 após o agrupamento, assim conseguimos saber o total de sessões daquele usuário
ORDER BY soma_receitas DESC; # Ordenação decrescente por receita (soma)

# Autor: Guilherme Henrique Garcia Elias