--se��o 8
--Utilizando Fun��es Single Row

-- Fun��es de convers�o Mai�scula & Min�scula

SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name = 'KING';

SELECT employee_id, last_name, department_id
FROM employees
WHERE UPPER(last_name) = 'KING';

-- Fun��es de Manipula��o de Caracteres

SELECT CONCAT('Curso: ','Introdu��o Oracle 21c'), SUBSTR('Introdu��o Oracle 21c',1,11),
    LENGTH('Introdu��o Oracle 21c'), INSTR('Introdu��o Oracle 21c','Oracle')
FROM dual;,


SELECT first_name "Nome", LPAD(first_name, 20, ' ') "Nome alinhado a direita", RPAD(first_name, 20, ' ') "Nome alinhado a esquerda"
FROM employees;

SELECT job_title, REPlACE(job_title, 'President', 'Presidente') CARGO
FROM jobs
WHERE job_title = 'President';

-- Fun��es tipo NUMBER

SELECT ROUND(45.923,2),ROUND(45.923,0)
FROM dual;

SELECT TRUNC(45.923,2), TRUNC(45.923,0)
FROM dual;

SELECT MOD(1300,600) RESTO
FROM dual;

SELECT ABS(-9), SQRT(9)
from dual;

--Fun��es tipo DATE

SELECT sysdate -- Retorna a data atual
FROM dual;

DESC dual

SELECT * 
FROM dual;

SELECT 30000 * 1.25
FROM dual;

-- C�lculos com Datas

SELECT sysdate, sysdate + 40, sysdate + 22, sysdate - 30
FROM dual;

SELECT last_name, ROUND((SYSDATE-hire_date)/7,2) "SEMANAS DE TRABALHO'"
FROM employees;

--OUTRAS Fun��es tipo DATE

SELECT first_name, last_name, ROUND(MONTHS_BETWEEN(sysdate,hire_date),2)"MESES DE TRABALHO"
FROM employees;

SELECT SYSDATE, ADD_MONTHS(SYSDATE,3), NEXT_DAY(SYSDATE,'SEXTA FEIRA'), LAST_DAY(SYSDATE)
FROM dual;

SELECT sysdate, ROUND(SYSDATE, 'MONTH'), ROUND(SYSDATE, 'YEAR'), TRUNC(SYSDATE, 'MONTH'),
    TRUNC(SYSDATE, 'YEAR')
FROM dual;

--Essa � bastante utulizada

SELECT SYSDATE, TO_CHAR(TRUNC(SYSDATE), 'DD/MM/YYYY HH24:MI:SS')
FROM dual;
