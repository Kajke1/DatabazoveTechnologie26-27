CREATE OR REPLACE PROCEDURE apply_regional_discount(
    IN region_name VARCHAR,
    IN discount_rate NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE orders
    SET sales = sales * (1 - discount_rate)
    WHERE region = region_name;

    RAISE NOTICE 'Zľava %. aplikovaná pre región %', discount_rate * 100, region_name;
END;
$$;
