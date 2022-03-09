-- ----------------------------------------------------------
-- Author Juan Pablo Allin Cañas - jpac.647@gmail.com
-- Version: 0.0.0
-- ----------------------------------------------------------

-- ----------------------------------------------------------
-- Products sold by typing document type and document number.
-- ----------------------------------------------------------

SELECT p.product_id, p.product_name, p.product_price
FROM client c
JOIN receipt r ON c.client_id = r.client_client_id
JOIN product_receipt pr ON pr.receipt_receipt_id = r.receipt_id
JOIN product p ON p.product_id = pr.product_product_id
WHERE c.client_doc_type ='CC' AND c.client_doc_number ='4444555666'
ORDER BY product_id;

-- ----------------------------------------------------------------------
-- Consult products by name, which must show who has been their supplier.
-- ----------------------------------------------------------------------

SELECT s.supp_id, s.supp_name
FROM  supplier s
LEFT JOIN Product p ON p.supplier_supp_id = s.supp_id
WHERE p.product_name = 'Cerveza'
GROUP BY s.supp_id, s.supp_name;

-- ----------------------------------------------------
-- Most sold product and quantity from greater to minor
-- ----------------------------------------------------

SELECT p.product_name, COUNT(p.product_id) AS Cantidad
FROM product p, product_receipt pr
WHERE pr.product_product_id = p.product_id
GROUP BY product_name
ORDER BY COUNT(p.product_id) DESC;