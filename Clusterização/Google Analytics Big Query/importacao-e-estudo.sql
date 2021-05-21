# --------------------- Criação do banco de dados --------------------- #

CREATE DATABASE analytics;

USE analytics;

# --------------------- Criação das tabelas utilizando o auxílio do software HeidiSQL --------------------- #
# Nesse caso não me preocupei em utilizar ENUM ou BOOLEAN em variáveis de true or false. Como não vou alimentar o BD, utilizei VARCHAR mesmo e para consulta posso procurar pela string "True"

CREATE TABLE `analytics`.`hits` (
	`dataSource` VARCHAR(256) NULL,
	`fullVisitorId` VARCHAR(256) NOT NULL,
	`hitNumber` INT NOT NULL,
	`hour` INT NULL,
	`isEntrance` VARCHAR(256) NULL,
	`isExit` VARCHAR(256) NULL,
	`isInteraction` VARCHAR(256) NOT NULL,
	`latencyTracking` TEXT NULL,
	`minute` INT NULL,
	`promotion` TEXT NOT NULL,
	`referer` TEXT NULL,
	`time` INT NULL,
	`type` VARCHAR(256) NOT NULL,
	`visitId` INT NOT NULL,
	`appInfo_screenDepth` VARCHAR(256) NULL,
	`appInfo_landingScreenName` VARCHAR(256) NOT NULL,
	`appInfo_exitScreenName` VARCHAR(256) NOT NULL,
	`appInfo_screenName` VARCHAR(256) NOT NULL,
	`page_searchKeyword` VARCHAR(256) NULL,
	`page_pagePathLevel1` VARCHAR(256) NOT NULL,
	`page_hostname` VARCHAR(256) NOT NULL,
	`page_pagePathLevel3` VARCHAR(256) NULL,
	`page_pageTitle` VARCHAR(256) NULL,
	`page_searchCategory` VARCHAR(256) NULL,
	`page_pagePath` VARCHAR(256) NOT NULL,
	`page_pagePathLevel2` VARCHAR(256) NULL,
	`page_pagePathLevel4` VARCHAR(256) NULL,
	`contentGroup_contentGroup3` VARCHAR(256) NOT NULL,
	`contentGroup_contentGroup1` VARCHAR(256) NOT NULL,
	`contentGroup_previousContentGroup1` VARCHAR(256) NOT NULL,
	`contentGroup_previousContentGroup3` VARCHAR(256) NOT NULL,
	`contentGroup_contentGroup5` VARCHAR(256) NOT NULL,
	`contentGroup_contentGroup2` VARCHAR(256) NOT NULL,
	`contentGroup_contentGroupUniqueViews2` VARCHAR(256) NULL,
	`contentGroup_contentGroupUniqueViews1` VARCHAR(256) NULL,
	`contentGroup_contentGroupUniqueViews3` VARCHAR(256) NULL,
	`contentGroup_previousContentGroup4` VARCHAR(256) NOT NULL,
	`contentGroup_contentGroup4` VARCHAR(256) NOT NULL,
	`contentGroup_previousContentGroup2` VARCHAR(256) NOT NULL,
	`contentGroup_previousContentGroup5` VARCHAR(256) NOT NULL,
	`eCommerceAction_option` VARCHAR(256) NULL,
	`eCommerceAction_action_type` VARCHAR(256) NULL,
	`eCommerceAction_step` INT NOT NULL,
	`eventInfo_eventAction` VARCHAR(256) NULL,
	`eventInfo_eventLabel` VARCHAR(256) NULL,
	`eventInfo_eventCategory` VARCHAR(256) NULL,
	`promotionActionInfo_promoIsClick` VARCHAR(256) NULL,
	`promotionActionInfo_promoIsView` VARCHAR(256) NULL,
	`social_hasSocialSourceReferral` VARCHAR(256) NOT NULL,
	`social_socialInteractionNetworkAction` VARCHAR(256) NOT NULL,
	`social_socialNetwork` VARCHAR(256) NOT NULL,
	`transaction_localTransactionTax` INT NULL,
	`transaction_transactionShipping` INT NULL,
	`transaction_transactionCoupon` VARCHAR(256) NULL,
	`transaction_currencyCode` VARCHAR(256) NULL,
	`transaction_affiliation` VARCHAR(256) NULL,
	`transaction_transactionTax` INT NULL,
	`transaction_localTransactionRevenue` INT NULL,
	`transaction_localTransactionShipping` INT NULL,
	`transaction_transactionId` VARCHAR(256) NULL,
	`transaction_transactionRevenue` INT NULL,
	`item_currencyCode` VARCHAR(256) NULL,
	`item_transactionId` VARCHAR(256) NULL
);

CREATE TABLE `analytics`.`products` (
	`fullVisitorId` VARCHAR(256) NOT NULL,
	`hitNumber` INT NOT NULL,
	`isClick` VARCHAR(256) NULL,
	`isImpression` VARCHAR(256) NULL,
	`localProductPrice` INT NULL,
	`localProductRevenue` INT NULL,
	`productBrand` VARCHAR(256) NOT NULL,
	`productCouponCode` VARCHAR(256) NULL,
	`productListName` VARCHAR(256) NOT NULL,
	`productListPosition` INT NULL,
	`productPrice` INT NULL,
	`productQuantity` INT NULL,
	`productRevenue` INT NULL,
	`productSKU` VARCHAR(256) NOT NULL,
	`productVariant` VARCHAR(256) NOT NULL,
	`v2ProductCategory` VARCHAR(256) NOT NULL,
	`v2ProductName` VARCHAR(256) NOT NULL,
	`visitId` INT NOT NULL
);

CREATE TABLE `analytics`.`sessions` (
	`channelGrouping` VARCHAR(256) NOT NULL,
	`date` DATE NOT NULL,
	`fullVisitorId` VARCHAR(256) NOT NULL,
	`socialEngagementType` VARCHAR(256) NOT NULL,
	`visitId` INT NOT NULL,
	`visitNumber` INT NOT NULL,
	`visitStartTime` INT NOT NULL,
	`salesRegion` VARCHAR(256) NULL,
	`device_mobileDeviceMarketingName` VARCHAR(256) NOT NULL,
	`device_screenColors` VARCHAR(256) NOT NULL,
	`device_deviceCategory` VARCHAR(256) NOT NULL,
	`device_flashVersion` VARCHAR(256) NOT NULL,
	`device_mobileDeviceBranding` VARCHAR(256) NOT NULL,
	`device_mobileDeviceModel` VARCHAR(256) NOT NULL,
	`device_screenResolution` VARCHAR(256) NOT NULL,
	`device_mobileDeviceInfo` VARCHAR(256) NOT NULL,
	`device_language` VARCHAR(256) NOT NULL,
	`device_browserSize` VARCHAR(256) NOT NULL,
	`device_browser` VARCHAR(256) NOT NULL,
	`device_operatingSystemVersion` VARCHAR(256) NOT NULL,
	`device_browserVersion` VARCHAR(256) NOT NULL,
	`device_operatingSystem` VARCHAR(256) NOT NULL,
	`device_mobileInputSelector` VARCHAR(256) NOT NULL,
	`device_isMobile` VARCHAR(256) NOT NULL,
	`geoNetwork_metro` VARCHAR(50) NOT NULL,
	`geoNetwork_city` VARCHAR(256) NOT NULL,
	`geoNetwork_country` VARCHAR(256) NOT NULL,
	`geoNetwork_cityId` VARCHAR(256) NOT NULL,
	`geoNetwork_subContinent` VARCHAR(20) NOT NULL,
	`geoNetwork_longitude` VARCHAR(256) NOT NULL,
	`geoNetwork_latitude` VARCHAR(256) NOT NULL,
	`geoNetwork_continent` VARCHAR(256) NOT NULL,
	`geoNetwork_networkDomain` VARCHAR(50) NOT NULL,
	`geoNetwork_networkLocation` VARCHAR(256) NOT NULL,
	`geoNetwork_region` VARCHAR(256) NOT NULL,
	`totals_pageviews` INT NULL,
	`totals_newVisits` INT NULL,
	`totals_totalTransactionRevenue` INT NULL,
	`totals_hits` INT NOT NULL,
	`totals_bounces` INT NULL,
	`totals_timeOnSite` INT NULL,
	`totals_transactions` INT NULL,
	`totals_sessionQualityDim` INT NULL,
	`totals_visits` INT NOT NULL,
	`totals_transactionRevenue` INT NULL,
	`trafficSource_adContent` VARCHAR(256) NULL,
	`trafficSource_campaign` VARCHAR(256) NOT NULL,
	`trafficSource_source` VARCHAR(256) NOT NULL,
	`trafficSource_referralPath` VARCHAR(180) NULL,
	`trafficSource_isTrueDirect` VARCHAR(256) NULL,
	`trafficSource_keyword` VARCHAR(256) NULL,
	`trafficSource_medium` VARCHAR(256) NOT NULL
);

# --------------------- Estudando as tabelas --------------------- #
SELECT * FROM hits;
SELECT * FROM products;
SELECT * FROM sessions;

# --------------------- Hits --------------------- #

# Estudo de hits
SELECT * FROM hits;
SELECT * from hits where fullVisitorId = 5188499487823367321;
SELECT DISTINCT eCommerceAction_option from hits where eCommerceAction_option <> ""; # Billing and Shipping, Payment e Review
SELECT DISTINCT transaction_currencyCode FROM hits; # só há USD, tanto faz usar local ou sem local
SELECT DISTINCT fullVisitorId from hits;

# eCommerceAction_option
SELECT 
    h.fullVisitorId,
    h.eCommerceAction_option,
    s.totals_totalTransactionRevenue
FROM
    hits h
        JOIN
    sessions s
WHERE
    h.fullVisitorId = s.fullVisitorId
        AND h.eCommerceAction_option <> ''; # Pelo que se pode ver, o usuário ter selecionado Payment ou Review não implica em receita

SELECT 
    h.fullVisitorId,
    h.eCommerceAction_option,
    s.totals_totalTransactionRevenue
FROM
    hits h
        JOIN
    sessions s
WHERE
    h.fullVisitorId = s.fullVisitorId
        AND s.totals_totalTransactionRevenue <> 0; # Pelo que se pode ver, o usuário ter selecionado Payment ou Review não implica em receita

# eCommerceAction_action_type
SELECT 
    h.fullVisitorId,
    h.visitId,
    h.eCommerceAction_option,
    h.eCommerceAction_action_type,
    s.totals_totalTransactionRevenue
FROM
    hits h
        JOIN
    sessions s
WHERE
    h.fullVisitorId = s.fullVisitorId
        AND h.eCommerceAction_action_type =6
        GROUP BY visitId
        ; # Observa-se que há revenue para valores de 0 a 6. 
          # Isso ocorre devido aos hits que reportam dados ao google analytics para cada sessão

#eventInfo_eventAction
SELECT 
    h.fullVisitorId,
    h.visitId,
    h.eCommerceAction_option,
    h.eCommerceAction_action_type,
    h.eventInfo_eventAction,
    s.totals_totalTransactionRevenue
FROM
    hits h
        JOIN
    sessions s
WHERE
    h.fullVisitorId = s.fullVisitorId
        AND h.eCommerceAction_action_type <> 0
        GROUP BY visitId
        ; #Variável não é muito útil ao problema

# TransactionRevenue, localTransactionRevenue, currencyCode, transactionId

SELECT 
    h.fullVisitorId,
    h.visitId,
    h.eCommerceAction_option,
    h.eCommerceAction_action_type,
    h.transaction_transactionId,
    h.transaction_transactionRevenue,
    h.transaction_localTransactionRevenue,
    s.totals_totalTransactionRevenue,
    s.totals_transactions,
    h.transaction_currencyCode
    #h.promotion
FROM
    hits h
        JOIN
    sessions s
WHERE
    h.fullVisitorId = s.fullVisitorId
		AND h.transaction_transactionId <> ''
        AND h.eCommerceAction_action_type = 6
        #AND h.promotion <> ''
        GROUP BY fullVisitorId
        ; # Observações no docx

# --------------------- Products --------------------- #
# Estudo de products
SELECT * FROM products;

SELECT * FROM products WHERE productQuantity <> 0 GROUP BY fullVisitorId ; #Temos 29423 usuários diferentes

SELECT * FROM products WHERE localProductRevenue <> 0;

SELECT productSKU, v2ProductName FROM products GROUP BY productSKU; #1655 produtos diferentes nessa lista


# --------------------- Sessions --------------------- #
# Encontrei tudo o que precisava na tabela SESSIONS, isto é:
/* ● Sessões - ao contar, antes de agrupar, o número de sessões de um mesmo usuário utilizando a coluna fullVisitorId; 
   ● Sessões conversoras - ao contar, utilizando a coluna totals_transactions quantas vezes o usuário converteu. Para isso basta contar as linhas em que totals_transactions > 0;
   ● Quantidade de transações - Somando a coluna totals_transactions
   ● Receita - Somando a coluna totals_totalTransactionRevenue obtém-se o total da receita de cada cliente que converteu;
   ● Receita média por transação - Calculando a média (excluindo as sessões que não tiveram compra) da coluna totals_totalTransactionRevenue;
   ● Data da última transação - Utilizando MAX(date); */

SELECT * FROM sessions;

SELECT 
    fullVisitorId,
    #COUNT(CASE WHEN totals_transactions > 0 THEN 1 END),
    totals_transactions,
    totals_totaltransactionRevenue,
    totals_totaltransactionRevenue,
    date
FROM
    sessions
WHERE

        fullVisitorId = 628708827036512143
#GROUP BY fullVisitorId
#HAVING totals_transactions <> 0
;

SELECT DISTINCT totals_transactions FROM sessions;

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
GROUP BY fullVisitorId
HAVING qtde_transacoes > 0 # Como queremos usuários QUE CONVERTERAM, podemos remover as transações = 0 após o agrupamento, assim conseguimos saber o total de sessões daquele usuário
ORDER BY soma_receitas DESC;

SELECT DISTINCT fullVisitorId from sessions;
