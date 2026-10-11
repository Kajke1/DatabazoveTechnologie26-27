CREATE OR REPLACE PROCEDURE get_customer_sales(IN p_customer_id VARCHAR)
LANGUAGE plpgsql
AS $$
DECLARE
    total_sales NUMERIC(10,2);
    record_count INT;
BEGIN
    
    SELECT SUM(sales), COUNT(*) 
    INTO total_sales, record_count
    FROM orders
    WHERE customer_id = p_customer_id;

    
    RAISE NOTICE 'Zákazník: %, Celkový predaj: %, Počet objednávok: %', 
        p_customer_id, total_sales, record_count;
END;
$$;
