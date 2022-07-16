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













