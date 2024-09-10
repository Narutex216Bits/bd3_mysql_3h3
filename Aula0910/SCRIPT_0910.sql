SELECT * FROM empregado;
SELECT * FROM departamento;
SELECT * FROM dependente;

/* Query com chaves estrangeiras*/

SELECT 
	e.nome AS empregado,
	d.nome AS dependente
FROM
	empregado e,
	dependente d
WHERE
	e.cod_emp = d.cod_emp;
    
    /* Query com subquery */
    
    SELECT
		d.*,
        e.nome AS empregado,
        (FORMAT((datediff(now(), e.dt_nascimento)/365),0))as idade,
        (FORMAT((datediff(now(), e.dt_admissao)/365),0))as tempo_empresa
	FROM
		dependente d,
        empregado e
	WHERE
		d.cod_emp IN (
	SELECT
		cod_emp
	FROM
		empregado
	WHERE
		(FORMAT((datediff(now(), e.dt_admissao)/365),0)<22))
	AND
		e.cod_emp = d.cod_emp;
        
/* View com uso de MySQL*/

SELECT
	d.*,
    (FORMAT((datefiff(now(), d.dt_nascimento)/365), 0)) AS idade_dep,
    e.nome AS empregado,
    (FORMAT((datediff(now(), d.dt_admissao)/365), 0)) AS tempo_empresa,
    (e.salario * 0.15) AS bonus_Dependente,
    "Desenvolvimento" AS departamento
FROM
	empregado e,
    dependente d
WHERE
	d.cod_emp IN(SELECT cod_emp FROM empregado WHERE cod_depto = 3)
AND
	e.cod_emp = d.cod_emp;

SELECT
	*
FROM
	VW_bonus_desenvolvimento;
	
    
