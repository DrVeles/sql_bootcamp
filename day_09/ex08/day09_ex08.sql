CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INT DEFAULT 10)
RETURNS TABLE (fib INT) AS $$
DECLARE
    first_n INT := 0;
    second_n INT := 1;
    temp_n INT;
BEGIN
    WHILE first_n < pstop LOOP
        fib := first_n;
        RETURN NEXT;
        temp_n := first_n + second_n;
        first_n := second_n;
        second_n := temp_n;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();