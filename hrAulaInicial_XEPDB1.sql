describe employees;

desc employees;

desc departments;

desc jobs;

desc locations;

SELECT * 
FROM Jobs;

SELECT *
FROM departments;

select *
from employees;

-- Selecione colunas especificas
select department_id, location_id
from departments;

SELECT employee_id, first_name, last_name, salary
from employees;

SELECT department_id, department_name, manager_id
FROM departments;

SELECT
    job_id,
    job_title
FROM
    jobs;

--Utilizando operadores aritméticos

SELECT first_name, last_name, salary, salary * 1.15
FROM employees;

-- Regras de Procedência de operadores

SELECT first_name, last_name, salary, salary + 100 * 1.15
FROM employees;

-- Utilizando parênteses para alterar a precedência

SELECT first_name, last_name, salary, (salary + 100) *1.15
FROM employees;

-- Entenddendo o valor NULL

SELECT first_name, last_name, job_id, salary, commission_pct
FROM employees;

--Utoilizando Valores Nulos em expressões aritméticas

SELECT first_name,  last_name, job_id, commission_pct, 200000 * commission_pct
FROM employees
WHERE commission_pct IS NULL;

-- Utilizando Alias de Coluna

SELECT first_name  nome, last_name  sobrenome, salary  salário
FROM employees;

SELECT first_name nome, last_name sobrenome, salary salário
FROM employees;

SELECT first_name "Nome", last_name "Sobrenome", salary "Salário ($)", commission_pct "Percentual de comissão"
FROM employees;

-- Utilizando Operadores de concatenação

SELECT first_name || ' ' || last_name || ', data de admissão: ' || hire_date "Funcionário"
FROM employees;

-- Utilizando Operador de concatenação e Strings de caracteres

SELECT first_name || ' ' || last_name || ', salário: ' || salary "Funcionário"
FROM employees;

-- Utilizando Operador alternativo para aspas

SELECT department_name || q'[ Departament's MAnager Id: ]'
|| manager_id "Departamento e Gerente"
FROM departments;

-- Linhas duplicadas

SELECT DISTINCT department_id
FROM employees;

SELECT Distinct last_name
FRom employees;

SELECT DISTINCT last_name, first_name
FROM employees;

-- Utilizando DISTINCT para eliminar linhas duplicadas

