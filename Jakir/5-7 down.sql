select department_id, department_Name,
location_id, city
from departments
natural join locations
where department_id in(20, 50, 40);