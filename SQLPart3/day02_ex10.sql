SELECT 
    person_name1.name AS person_name1,
    person_name2.name AS person_name2,
    person_name1.address AS common_address
FROM person AS person_name1
INNER JOIN person AS person_name2 ON person_name1.id > person_name2.id
AND person_name1.address = person_name2.address
ORDER BY 
    person_name1.name,
    person_name2.name,
    common_address
