#Converts the service datetime from West Coast Timezone to East Coast Time Zone because our database is on the west coast
select Service_Type, Service_Emp_ID, Service_Machine_Id, Convert_tz(Service_date, '-08:00', '-05:00') As Service_Date
from services;

#Gets a list of the cost of each machine based on the installed parts
SELECT INSTALLED_PART_ID, SUM(PART_PRICE) AS MACHINE_COST 
FROM INSTALLED_PARTS
INNER JOIN PARTS ON PART_ID = INSTALLED_PART_ID 
GROUP BY INSTALLED_PART_ID;

#Get a list of the full names of each employee
select Concat(Emp_FName, " ", Emp_LName) As Full_Name from workers;

#Gets the average price of a part and formats it with a dollars sign and two decimal places
select Concat("$", CONVERT(avg(part_price), Char(7))) as Average_Part_Price from parts;

#Gets a list of employee IDs and the employee's initials.
select Emp_id, Concat(Substring(Emp_FName, 1, 1), Substring(Emp_LName, 1, 1)) As Emp_Initials from workers;

