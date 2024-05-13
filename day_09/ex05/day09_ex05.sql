DROP FUNCTION IF EXISTS fnc_persons_male();
DROP FUNCTION IF EXISTS fnc_persons_female();

CREATE OR REPLACE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
RETURNS TABLE (id person.id%TYPE, name person.name%TYPE, age person.age%TYPE,
               gender person.gender%TYPE, address person.address%TYPE) AS $$
SELECT id, name, age, gender, address FROM person WHERE gender = pgender;
$$ LANGUAGE sql;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();