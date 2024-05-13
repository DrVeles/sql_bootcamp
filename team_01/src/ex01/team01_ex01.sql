insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION get_current_date(cur_date timestamp,
		currency_name varchar) RETURNS NUMERIC AS $$
	DECLARE 
	 rate NUMERIC;
	BEGIN 
		rate = COALESCE(
		(SELECT rate_to_usd
		 FROM currency AS cur
		 JOIN balance AS b ON b.currency_id = cur.id 
		 WHERE cur.updated < cur_date AND cur.name = currency_name
		 ORDER BY cur.updated DESC
		 LIMIT 1),
		 (SELECT rate_to_usd
		 FROM currency AS cur
		 JOIN balance AS b ON b.currency_id = cur.id 
		 WHERE cur.updated > cur_date AND cur.name = currency_name
		 ORDER BY cur.updated
		 LIMIT 1)
		);
		RETURN rate;
	END;
$$ LANGUAGE plpgsql;


WITH cte_main_date AS (
     SELECT c.name AS currency_name,
	        b.money*get_current_date(b.updated, c.name) AS currency_in_usd,
	        b.updated,
	        b.user_id
	  FROM balance AS b
	  JOIN currency AS c ON c.id = b.currency_id
	  GROUP BY  currency_in_usd, b.updated,  b.user_id, c.name
)

SELECT COALESCE(u.name,'not defined') AS name, 
	   COALESCE(u.lastname,'not defined') AS lastname, 
	   da.currency_name,
	   da.currency_in_usd
FROM cte_main_date AS da
LEFT JOIN "user" AS u ON da.user_id = u.id 
ORDER BY name DESC, lastname, da.currency_name ASC;
