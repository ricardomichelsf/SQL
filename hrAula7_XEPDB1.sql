-- Se��o 7 - Aula 1
-- Restringindo e Ordenando Dados
--

--Utilizando a cla�sula WHERE

SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 100;

SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE job_id = 'IT_PROG';

-- Utiilzando Strings de caracteres na cl�usula WHERE

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE last_name = 'King';

SELECT first_name, last_name, job_id, department_id, hire_date
FROM employees
WHERE hire_date = '30/01/04';

--Utilizando operadores de compara��o na cl�usula WHERE

SELECT last_name, salary
FROM employees
WHERE salary >= 10000;

--Selecionando faixas de valores utilizando o operador WHERE

SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 10000 AND 15000;

--Utilizando valores dentro de uma lista utilizando o operador IN

SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');


SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id IN ('SA_REP') 
AND salary >= 7500
ORDER BY salary;

-- Utilizando o operador LIKE

SELECT first_name, last_name, job_id
FROM employees
WHERE first_name LIKE 'Sa%';

-- Combinando o uso de v�rios caracteres curinga

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '_a%';

--Compara��o com valor NULL

SELECT last_name, manager_id
FROM employees
WHERE manager_id = NULL;

--Utilizando a express�o de compara��o IS NULL

SELECT last_name, manager_id
FROM employees
WHERE manager_id is NULL;

-- Utikizando o operador AND

SELECT employee_id, last_name, job_id,salary
FROM employees
WHERE salary >= 5000
AND job_id = 'IT_PROG';

-- Utikizando o operador OR

SELECT employee_id, last_name, job_id,salary
FROM employees
WHERE salary >= 5000
OR job_id = 'IT_PROG';

-- Utikizando o operador NOT

SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');

--Regras de Preced�ncia

SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP' OR job_id = 'IT_PROG') AND salary > 10000;

--UTilizando a cl�usula ORDER BY - Ordem Crescente

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date ASC;

-- ASC � opcional

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date;

--UTilizando a cl�usula ORDER BY - Ordem descendente

SELECT last_name, job_id, hire_date
FROM employees
ORDER BY hire_date DESC;

--Utilizando a cl�usula ORDER BY - Referenciando ALIAS

SELECT employee_id, last_name, salary*12 salario_anual
FROM employees
ORDER BY salario_anual;

--Utilizando a cl�usula OREDER BY - Referenciando a Pos��o

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 4;

-- Utilizando a cl�usula ORDER BY - Multiplas colunas ou express�es

SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC;

-- Utilizado Vari�veis de Substitui��o - & serve para o usu�rio digitar um valor

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &emloyee_id;

-- Utilizando Vari�veis de Substitui��o - &&

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &&emloyee_id;

-- Utilizando Vari�veis de Substitui��o com valores tipo Character e Date
-- & dentro de aspas simples voc� escreve um valor em character para ele procurar 

SELECT last_name, department_id, job_id, salary*12
FROM employees
WHERE job_id = '&job_id';

-- Utilizando o comando DEFINE

DEFINE employee_id = 101

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_id;

DEFINE employee_id

UNDEFINE employee_id