#CREATING STORED PROCEDURE TO GET BALANCE OF INVOICES GRWATER THAN 0
#DELIMITER IS SPECIFICALLY BEING USED AS THE QUERY IS IN MySQL
DELIMITER $$
CREATE  PROCEDURE invoice_balance ()
BEGIN
	SELECT invoice_id,
    (invoice_total - payment_total )> 0 AS balance
	FROM invoices
	WHERE (invoice_total - payment_total )> 0;
END $$
DELIMITER ;

#CALL invoice_balance;
#This procedure can also be dropped by using the following query
#DROP PROCEDURE IF EXISTS invoice_balance; 


#Creating procedures with parameters
#DROP PROCEDURE IF EXISTS clients_by_state;
DELIMITER $$
CREATE PROCEDURE  clients_by_state(
state CHAR(2))
BEGIN
	SELECT *
	FROM clients c
	WHERE c.state = state;
END$$
DELIMITER ;
 #Call the procedure by givingt the value of the state you want to search for
CALL clients_by_state('CA');

# Procedure for returning invoices of a goven client
DROP PROCEDURE IF EXISTS invoices_by_client;
DELIMITER $$
CREATE PROCEDURE  invoices_by_client(
client_name VARCHAR(50))
BEGIN
	SELECT *
	FROM invoices i
	JOIN clients c 
		USING (client_id)
	WHERE c.name = client_name;
END$$
DELIMITER ;
 #Call the procedure by givingt the value of the state you want to search for
CALL invoices_by_client('Vinte');

#Procedure with default values

DELIMITER $$
CREATE PROCEDURE  clients_by_state_default(
state CHAR(2))
BEGIN
	IF state IS NULL THEN 
    SET state ="CA";
    END IF;
	SELECT *
	FROM clients c
	WHERE c.state = state;
END$$
DELIMITER ;

# Call the procedure
CALL clients_by_state_default(NULL);

#Setting the default value to show data of all states if null

DELIMITER $$
CREATE PROCEDURE  clients_by_state_all(
state CHAR(2))
BEGIN
	IF state IS NULL THEN 
		SELECT * FROM clients;
	ELSE 
		SELECT * FROM clients c
		WHERE c.state = state;
    END IF;
END$$
DELIMITER ;

# Call the procedure
CALL clients_by_state_all(NULL);

#Another method of doing the same procedure 

DELIMITER $$
CREATE PROCEDURE  clients_by_state_all(
state CHAR(2))
BEGIN
	
		SELECT * FROM clients c
		WHERE c.state = IFNULL(state, c.state);
    
END$$
DELIMITER ;

#Get payments by Client ID and the payment method

DELIMITER $$
CREATE PROCEDURE get_payments_method(
client_id CHAR(8),
payment_method_id VARCHAR(25))
BEGIN
	SELECT *
    FROM payments p
	WHERE p.client_id = IFNULL(client_id, p.client_id)
    AND p.payment_method = IFNULL(payment_method_id, p.payment_method);
END $$
DELIMITER ;

# Get payments by payment method name

DELIMITER $$
CREATE PROCEDURE get_payments_method_name(
client_id CHAR(8),
payment_method_name VARCHAR(25))
BEGIN
	SELECT *
    FROM payments p
    JOIN payment_methods pm
	WHERE p.client_id = IFNULL(client_id, p.client_id)
    AND pm.name = IFNULL(payment_method_name, pm.name);
END $$
DELIMITER ;























