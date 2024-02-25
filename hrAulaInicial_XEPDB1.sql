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

--Utilizando operadores aritm�ticos

SELECT first_name, last_name, salary, salary * 1.15
FROM employees;

-- Regras de Proced�ncia de operadores

SELECT first_name, last_name, salary, salary + 100 * 1.15
FROM employees;

-- Utilizando par�nteses para alterar a preced�ncia

SELECT first_name, last_name, salary, (salary + 100) *1.15
FROM employees;

-- Entenddendo o valor NULL

SELECT first_name, last_name, job_id, salary, commission_pct
FROM employees;

--Utoilizando Valores Nulos em express�es aritm�ticas

SELECT first_name,  last_name, job_id, commission_pct, 200000 * commission_pct
FROM employees
WHERE commission_pct IS NULL;

-- Utilizando Alias de Coluna

SELECT first_name  nome, last_name  sobrenome, salary  sal�rio
FROM employees;

SELECT first_name nome, last_name sobrenome, salary sal�rio
FROM employees;

SELECT first_name "Nome", last_name "Sobrenome", salary "Sal�rio ($)", commission_pct "Percentual de comiss�o"
FROM employees;

-- Utilizando Operadores de concatena��o

SELECT first_name || ' ' || last_name || ', data de admiss�o: ' || hire_date "Funcion�rio"
FROM employees;

-- Utilizando Operador de concatena��o e Strings de caracteres

SELECT first_name || ' ' || last_name || ', sal�rio: ' || salary "Funcion�rio"
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

