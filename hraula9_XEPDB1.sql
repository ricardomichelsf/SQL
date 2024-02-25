-- Sess�o 9 
-- Utilizando Fun??es de Convers?o e Express?es Condicionais 

-- Utilizando a Fun??o TO_CHAR com Datas

SELECT
    last_name,
    TO_CHAR(hire_date,
        'DD/MM/YYYY HH24:MI:SS') DT_ADMISS�O
FROM employees;

SELECT
    sysdate,
    TO_CHAR(sysdate,
        'DD "de" Month "de" YYYY HH24:MI:SS') DATA
FROM dual;

SELECT
    last_name,
    TO_CHAR(hire_date,
        'DD, "de" Month "de" YYYY') DT_ASMISS�O
FROM employees;

SELECT 
    last_name,
    TO_CHAR(hire_date,
        'FMDD, "de" MOnth "de" YYYY') DT_ADMISS�O
FROM employees;

--Utilizando a Fun��o TO_CHAR com N�meros 

SELECT
    first_name,
    last_name,
    TO_CHAR(salary,
        'L99G999G999D99') SALARIO
FROM employees;

-- Utilizando a Fun��o TO_NUMBER

SELECT
    TO_NUMBER('12000,50')
FROM dual;

--Utilizando a Fun��o TO_DATE

SELECT
    TO_DATE('6/02/2020',
        'DD/MM/YYYY') DATA
FROM dual;

SELECT
    first_name,
    last_name,
    hire_date
FROM employees
WHERE hire_date = TO_DATE('17/06/2003','DD/MM/YYYY');

--Utilizando Fun��es Aninhadas

SELECT 
    first_name,
    last_name,
    ROUND(MONTHS_BETWEEN(
        SYSDATE, hire_date),0) NUMERO_MESES
FROM employees
WHERE hire_date = TO_DATE('17/06/2003','DD/MM/YYYY');

--Utilizando a Fun��o NVL

SELECT
    last_name, salary, NVL(commission_pct, 0), salary*12 SALARIO_ANUAL,
    (salary*12) + (salary*12*NVL(commission_pct, 0)) REMUNERACAO_ANUAL
FROM employees;

--Utilizando a Fun��o COALESCE

SELECT
    COALESCE(NULL,
        NULL, 'Express�o 3'),
    COALESCE(NULL,
        'Express�o 2', 'Express�o 3'),
    COALESCE('Express�o 1',
        'Express�o 2', 'Express�o 3')
FROM dual;

SELECT 
    last_name, employee_id, commission_pct, manager_id,
    COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id),
    'Sem percentual de comiss�o e sem gerente')
FROM employees;

--Utilizando a Fun��o NVL2

SELECT
    last_name, salary, commission_pct,
    NVL2(commission_pct,10, 0) PERCENTUAL_ALTERADO
FROM employees;

--Utilizando a Fun��o NULLIF

SELECT
    NULLIF(1000,1000),
    NULLIF(1000,2000)
FROM dual;


SELECT 
    first_name, last_name,
    LENGTH(first_name) "Express�o 1",
    LENGTH(first_name) "Express�o 2",
    NULLIF(LENGTH(first_name),
    LENGTH(last_name)) RESULTADO
FROM employees;

--Express�o CASE

SELECT last_name, job_id, salary,
                            CASE job_id
                                WHEN 'IT_PROG'
                                    THEN 1.10*salary
                                WHEN 'ST_CLERK'
                                    THEN 1.15*salary
                                WHEN 'SA_REP'
                                    THEN 1.20*salary
                                ELSE salary
                            END "NOVO SALARIO"
FROM employees
WHERE job_id IN ('IT_PROG','SA_REP', 'ST_CLERK');

--Utilizando a Fun��o DECODE

SELECT last_name, job_id, salary,
DECODE(job_id,  'IT_PROG' , 1.10*salary,
                'SY_CLERK', 1.15*salary,
                'SA_REF'  , 1.20*salary
                          , salary) "NOVO SALARIO"
FROM employees;