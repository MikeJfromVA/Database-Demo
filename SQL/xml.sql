SELECT * FROM customer;

SELECT cus_fname, cus_lname, cus_balance
FROM customer;

SELECT xmlforest (cus_fname, cus_lname, cus_balance) 
FROM customer;

SELECT xmlelement(name "customer", xmlattributes ( cus_fname ||' '|| cus_lname AS "name" ),
xmlforest ( cus_balance AS "balance", cus_areacode || '-' || cus_phone AS "phone"))
FROM customer;
