-- SELECT * FROM "user";
-- SELECT * FROM currency;
-- SELECT * FROM balance;

SELECT DISTINCT name, lastname, type, sum(money) AS volume, currency_name, last_rate_to_usd,
       sum(money) * last_rate_to_usd AS total_volume_in_usd
FROM(SELECT DISTINCT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    balance.type AS type,
    balance.money AS money,
    COALESCE(currency.name, 'not defined') AS currency_name,
    COALESCE(first_value(currency.rate_to_usd)
        over(partition by currency.id order by currency.updated desc), 1)
        as last_rate_to_usd
    FROM
        balance
    FULL JOIN
        "user" u ON balance.user_id = u.id
    FULL JOIN
        currency ON balance.currency_id = currency.id) AS t
GROUP BY
    name, lastname, type, currency_name, last_rate_to_usd
ORDER BY name DESC, lastname, type;
