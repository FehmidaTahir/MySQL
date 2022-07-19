#Updating tables by using stored procedures
DELIMITER $$
USE `sql_invoicing`$$
CREATE PROCEDURE update_payments (
	invoice_id CHAR(5),
    payment_amount DECIMAL (9,2),
    payment_date DATE
)
BEGIN
	IF payment_amount >= 0 THEN
		SIGNAL SQLSTATE '22003' 
		SET MESSAGE_TEXT = 'Invalid payment amount' ;
	END IF;
	UPDATE invoices i
    SET 
		i.payment_total = payment_amount,
        i.payment_date = payment_date
        WHERE i.invoice_id = invoice_id;
		
END$$

DELIMITER ;

# Update by calling the stored procedure
