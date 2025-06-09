-- (1)
SELECT address, changeday 
FROM cust_attr 
WHERE custid = 1;

-- (2)
SELECT phone, changeday 
FROM cust_attr 
WHERE custid = 1;

-- (3)
SELECT phone 
FROM cust_attr 
WHERE custid = 1 
ORDER BY changeday ASC 
LIMIT 1;

-- (4)
SELECT phone 
FROM cust_attr 
WHERE custid = 1 
  AND changeday = '2024-01-01'
ORDER BY changeday ASC 
LIMIT 1;
