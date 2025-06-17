SELECT ADDRESS.*, PEOPLE.*
FROM PEOPLE
INNER JOIN ADDRESS
ON ADDRESS.id=PEOPLE.id; -- rough work


-- 10.1 Join table PEOPLE and ADDRESS, but keep only one address information for each person (we don't mind which record we take for each person). 
    -- i.e., the joined table should have the same number of rows as table PEOPLE
SELECT PEOPLE.name, MIN(ADDRESS.address)
FROM PEOPLE
INNER JOIN ADDRESS 
ON PEOPLE.id = ADDRESS.id
GROUP BY PEOPLE.name;

-- 10.2 Join table PEOPLE and ADDRESS, but ONLY keep the LATEST address information for each person. 
    -- i.e., the joined table should have the same number of rows as table PEOPLE
SELECT PEOPLE.id,PEOPLE.name,ADDRESS.address,ADDRESS.updatedate
FROM PEOPLE
INNER JOIN ADDRESS ON PEOPLE.id = ADDRESS.id
INNER JOIN (
SELECT id, MAX(updatedate) AS latest_update
FROM ADDRESS
GROUP BY id
) AS latest_addresses 
ON ADDRESS.id = latest_addresses.id AND ADDRESS.updatedate = latest_addresses.latest_update;

