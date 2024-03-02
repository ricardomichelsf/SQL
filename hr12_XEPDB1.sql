-- seção 12

--Aula 1 Utilizando Sub-Consultas Single-Row

SELECT first_name, last_name, job_id, salary
FROM employees
WHERE salary > (SELECT avg(nvl(salary,0)) FROM employees);

--Utili\ando Sub-consultas na Cláusula HAVING

SELECT e1.department_id, MAX(e1.salary)
FROM employees e1
GROUP BY e1.department_id
HAVING MAX(salary) < (select avg(e2.salary) FROM employees e2);

-- Erros utilizando Sub-consultas Single-row

select employee_id, first_name, last_name
FROM employees
WHERE salary = (select avg(nvl(salary,0)) 
                from employees group by department_id);
                
-- O que ocorre quando a Sub-Consulta retorna nenhuma linha

select employee_id, first_name, last_name
from employees
where last_name = (select last_name from employees 
                    where last_name = 'Suzuki');
                    
-- Aula 2
-- Sub-Consultas Multiple-row

select employee_id, firdt_name, last_name
from employees
where salary in (select avg(nvl(salary,0)) from employees group by department_id);

--Utilizando operador NOT IN em Sub-consultas Multiple-row

select employee_id, firdt_name, last_name
from employees
where salary not in (select avg(nvl(salary,0)) from employees group by department_id);

-- Utilizando operador ANY em Sub-consultas Multiple-row

select employee_id, firdt_name, last_name
from employees
where salary < ANY (select salary from employees where job_id = 'IT_PROG');

--Utilizando operador ALL em Sub-consultas Multiple-Row

select employee_id, last_name, job_id, salary
from employees
where salary < ALL (select salary from employees where job_id = 'IT_PROG');

--Cuidados com Valores Nulos em uma Sub-consulta com o Operador IN

select emp.employee_id, emp.last_name
from employees emp
where emp.employee_id IN (select mgr.manager_id from employees mgr);

--Cuidados com Valores Nulos em uma Sub-consulta com o Operador NOT IN

select emp.employee_id, emp.last_name
from employees emp
where emp.employee_id NOT IN (select mgr.manager_id from employees mgr);

--Aula 3

--Utilizando operador EXISTS e NOT EXISTS

-- Utilizando operador EXISTS

select d.departmet_id, d.department_name
from departments d
where exists (select e.department_id from employees e where d.department_id = e.department_id);

-- Utilizando operador NOT EXISTS

select d.departmet_id, d.department_name
from departments d
where not exists (select e.department_id from employees e where d.department_id = e.department_id);

--Aula 4

--Utilizando Sub-Consultas Correlacionais

select e1.employee_id, e1.first_name, e1.last_name, e1.department_id, e1.salary
from employees e1
where e1.salary >= (select trunc(avg(nvl(salary,0)),0)
                    from empoyees e2
                    where e1.department_id = e2.department_id);

select trunc(avg(nvl(salary,0)),0)
from employees e2
where e2.deparment_id = 60;

--Aula 5

--Utilizando subb-consultas Multiple-Column

select e1.employee_id, e1.first_name, e1.job_id, e1.salary
from employees e1
where (e1.job_id, e1.salary) in (select e2.job_id, MAX(e2.salary)
                                 from employees e2
                                 group by e2.job_id);

--Aula 6

--Utilizando Sub-Consultas na Cláusula FROM

select empregados.employee_id, empregados.first_name, empregados.last_name, empregados.job_id,
        empregados.salary, ROUND(max_salary_job.max_salary,2) MAX_SALARY, empregados.salary - ROUND(max_salary_job.max_salary,2) DIFERENCA
from employees empregados
left join (select e2.job_id, MAX(e2.salary) max_salary from employees e2
            group by e2.job_id) max_salary_job 
            on empregados.job_id = max_salary_job.job_id;
            
