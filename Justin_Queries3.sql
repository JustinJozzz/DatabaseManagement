#Left Join, Join On
select * from clients left outer join workers on client_assigned_emp_id where emp_id = 3;

#having subquery
select machine_id from (select * from machines 
                        inner join installed_parts on installed_machine_id = machine_id
                        inner join parts on part_id = installed_part_id
                        group by machine_id
                        having sum(part_price) > 1000) As T where T.machine_client_id = 2;

#all, corellated subquery
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
select * from services where dayofmonth(service_date) = 5;