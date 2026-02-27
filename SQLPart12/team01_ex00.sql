SELECT * FROM "user";
SELECT * FROM balance;
SELECT * FROM currency;

-- ex00
WITH raw_data AS (
	SELECT
		COALESCE(u.name, 'not defined') AS name,
		COALESCE(u.lastname, 'not defined') AS lastname,
		b.type AS type,
		b.money AS money,
		COALESCE(c.name, 'not defined') AS currency_name
	FROM "user" u
	FULL OUTER JOIN balance b
		ON u.id = b.user_id
	LEFT JOIN currency c
		ON b.currency_id = c.id
	GROUP BY 1, 2, 3, 4, 5
),
aggregated_data AS (
	SELECT name,
		lastname,
		type,
		SUM(money) AS volume,
		currency_name,
		COALESCE((	
			SELECT rate_to_usd
			FROM currency
			WHERE name = currency_name
			ORDER BY updated DESC
			LIMIT 1
		), 1) AS last_rate_to_usd
	FROM raw_data
	GROUP BY name, lastname, type, currency_name
)

SELECT *, last_rate_to_usd * volume AS total_volume_in_usd
FROM aggregated_data
ORDER BY name DESC, lastname ASC, type ASC;
