# Creating Views 
#Clients and the balance they have

CREATE OR REPLACE VIEW clients_balance AS
SELECT client_id, name AS client, (invoice_total - payment_total ) AS balance
FROM clients
JOIN invoices USING (client_id)
group by client_id;

# dropping views
#DROP VIEW clients_balance
#We can also update views which dont include aggregate, group by/having clause

#View for top customers

SELECT customer_id, CONCAT(first_name,' ',last_name ) As customer, points
FROM customers
ORDER BY points DESC
LIMIT 5;












