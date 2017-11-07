#Left Join, Join On
#Returns information on all clients that employee 3 is assigned to
select * from clients left outer join workers on client_assigned_emp_id where emp_id = 3;

#having subquery
#get all machines owned by client 2 that cost more than 1000 dollars
select machine_id from (select * from machines 
                        inner join installed_parts on installed_machine_id = machine_id
                        inner join parts on part_id = installed_part_id
                        group by machine_id
                        having sum(part_price) > 1000) As T where T.machine_client_id = 2;

#all, corellated subquery
#get Machines that have Cast Iron Metal standard and that are a higher price than all High Alloy machines
select machine_id from machines 
inner join installed_parts on installed_machine_id = machine_id
inner join parts on part_id = installed_part_id
where machine_metal_standards = 'Cast Iron'
group by machine_id 
having sum(part_price) >= all(select sum(part_price) from machines 
                                inner join installed_parts on installed_machine_id = machine_id
                                inner join parts on part_id = installed_part_id
                                where machine_metal_standards = 'High Alloy'
                                group by machine_id);

#Date Function
#get all services that happned on the 5th of any month
select * from services where dayofmonth(service_date) = 5;