-- (1)
SELECT * 
FROM R 
WHERE A = 'a2';

-- (2)
SELECT A, B 
FROM R;

-- (3)
SELECT * 
FROM R 
JOIN S ON R.C = S.C;
