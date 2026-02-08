DROP VIEW v_persons_female;
DROP VIEW v_persons_male;

CREATE VIEW v_persons_female AS
SELECT * 
FROM person
WHERE person.gender = 'female';

CREATE VIEW v_persons_male AS
SELECT * 
FROM person
WHERE person.gender = 'male';

SELECT name
FROM v_persons_female
UNION ALL
SELECT name
FROM v_persons_male
ORDER BY name