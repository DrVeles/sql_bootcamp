SELECT address, formula, average,
        (CASE
            WHEN formula > average THEN 'true'
            ELSE 'false'
        END) AS comparison
FROM (SELECT address, round(max(age) - min(age) / max(age::numeric), 2) AS formula,
       round(avg(age), 2) AS average
      FROM person
      GROUP BY address) AS t
ORDER BY address;


