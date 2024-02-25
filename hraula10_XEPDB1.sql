--Sess�o 10 aula 1
-- Agreganddo dados utilizando Fun��es de Grupo

--Utilizando as Fun��es AVG e SUM

SELECT
    AVG(salary),
    SUM(salary)
FROM employees;

-- Utilizando as Fun��es MIN e MAX

SELECT
    MIN(salary),
    MAX(salary)
FROM employees;

SELECT
    MIN(hire_date),
    MAX(hire_date)
FROM employees;

SELECT
    MIN(first_name),
    MAX(first_name)
FROM employees;


--Utilizando a Fun��o COUNT
--(*) sempre vai retornar o n�emro de todas as linhas

SELECT
    COUNT(*)
FROM employees;

SELECT
    COUNT(commission_pct)
FROM employees;

SELECT
    COUNT(commission_pct),
    COUNT(*)
FROM employees;

SELECT
    COUNT(NVL(commission_pct,0))
FROM employees;

--Utilizando a Fun��o COUNT com DISTINCT

SELECT
    COUNT(DISTINCT department_id)
FROM employees;

SELECT
    COUNT(department_id)
FROM employees;

--Fun��es de grupo e valores Nulos

SELECT
    AVG(commission_pct)
FROM employees;

--Tratamentode NULOS em Fun��es de Grupo

SELECT
    AVG(NVL(commission_pct,0))
FROM employees;


--Sess�o 10 aula 2
--Agregando dados utilizando Fun��es de Grupo
--Criando Grupos utilizando a Cl�usula GROUP BY

SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

--Utilizando a Cl�uasula GROUP by com mais de uma coluna ou Express�o

SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

--Consultas incorretas utilizando Fun��es de Grupo

SELECT
    department_id,
    AVG(salary)
FROM employees;

--COrrigindo consultas incoorretas utilizando Fun��es de Grupo

SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id;

-- Consultas incorretas utilizando Fun��es de Grupo

SELECT
    department_id,
    MAX(salary)
FROM employees
WHERE MAX(salary) > 10000
GROUP BY department_id;

--Corrigindo consultas incorretas utilizando Fun��es de Grupo
--Restringindo Grupos utilizando a cl�usula HAVING

SELECT first_name,
    department_id,
    MAX(salary)
FROM employees
GROUP BY first_name, department_id
HAVING MAX(salary) > 10000;

SELECT
    job_id,
    SUM(salary) TOTAL
FROm employees
WHERE job_id <> 'SA_REP'
GROUP BY job_id
HAVING SUM(salary) > 10000
ORDER BY SUM(salary);

--Aninhando Fun��es de Grupo

SELECT
    MAX(AVG(salary))
FROM employees
GROUP BY department_id;

SELECT
    AVG(salary)
FROM employees
GROUP BY department_id;
