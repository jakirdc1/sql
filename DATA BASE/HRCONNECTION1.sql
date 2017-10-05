select employee_id, job_id
from employees
union
select department_id, job_id
from job_history;