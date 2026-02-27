-- ex01
-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT
	COALESCE(u.name, 'not defined') AS name,
	COALESCE(u.lastname, 'not defined') AS lastname,
	c.name AS currency_name,
	COALESCE(
	(
		SELECT cc.rate_to_usd
		FROM currency cc
		WHERE cc.name = c.name
			AND cc.updated < b.updated
		ORDER BY cc.updated DESC
		LIMIT 1
	),
	(
		SELECT cc.rate_to_usd
		FROM currency cc
		WHERE cc.name = c.name
			AND cc.updated > b.updated
		ORDER BY cc.updated ASC
		LIMIT 1
	)
	) * b.money AS currency_in_usd
FROM balance b
FULL OUTER JOIN "user" u
	ON u.id = b.user_id
INNER JOIN currency c
	ON b.currency_id = c.id
GROUP BY u.name, u.lastname, c.name, b.money, b.updated
ORDER BY name DESC, lastname ASC, currency_name ASC;

----------------------------------------------
-- WITH extracted_transactions
-- AS (
-- 	SELECT
-- 		COALESCE(u.name, 'not defined') AS name,
-- 		COALESCE(u.lastname, 'not defined') AS lastname,
-- 		c.name AS currency_name,
-- 		b.money AS money,
-- 		b.updated AS balance_updated
-- 	FROM "user" u
-- 	FULL OUTER JOIN balance b
-- 		ON u.id = b.user_id
-- 	INNER JOIN currency c
-- 		ON b.currency_id = c.id
-- 	GROUP BY u.name, lastname, currency_name, money, balance_updated
-- )
-- SELECT name,
-- 	lastname,
-- 	currency_name,
-- 	COALESCE(
-- 		(
-- 			SELECT c.rate_to_usd
-- 			FROM currency c
-- 			WHERE c.name = et.currency_name
-- 			AND c.updated < et.balance_updated
-- 			ORDER BY c.updated DESC
-- 			LIMIT 1
-- 		),
-- 		(
-- 			SELECT c.rate_to_usd
-- 			FROM currency c
-- 			WHERE c.name = et.currency_name
-- 			AND c.updated > et.balance_updated
-- 			ORDER BY c.updated ASC
-- 			LIMIT 1
-- 		)
-- 	) * money AS currency_in_usd
-- FROM extracted_transactions et
-- ORDER BY name DESC, lastname ASC, currency_name ASC;
