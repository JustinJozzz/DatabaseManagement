/*number of services by each employee, using alias*/
SELECT EMP_LNAME, EMP_FNAME, COUNT(*) AS SERVICE_COUNTS FROM WORKERS
INNER JOIN SERVICES ON SERVICE_EMP_ID = EMP_ID
GROUP BY EMP_LNAME, EMP_FNAME
HAVING SERVICE_COUNTS >= 2;

/*all installed parts of machine 2*/
SELECT INSTALLED_PART_ID
FROM INSTALLED_PARTS WHERE INSTALLED_MACHINE_ID = 2;

/*Aggregate and Sum*/
SELECT INSTALLED_PART_ID, SUM(PART_PRICE) AS MACHINE_PART_COST 
FROM INSTALLED_PARTS
INNER JOIN PARTS ON PART_ID = INSTALLED_PART_ID 
GROUP BY INSTALLED_PART_ID;

SELECT * FROM WORKERS
INNER JOIN CLIENTS ON EMP_ID = CLIENT_ASSIGNED_EMP_ID;

/*LOGICAL*/
SELECT CLIENT_ID, CLIENT_ASSIGNED_EMP_ID
FROM   CLIENTS
WHERE  CLIENT_MACHINE_ID IN (1, 2);

/*EXISTS*/
SELECT *
FROM   WORKERS
WHERE  EMP_ID IS NOT NULL;