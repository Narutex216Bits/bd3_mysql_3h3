SELECT * FROM empregado;
SELECT * FROM departamento;
SELECT * FROM dependente;

/*Query com Chaves Estrangeiras*/
select 
	e.nome as empregado,
	d.nome as dependente
from
	empregado e,
    dependente d
where
	e.cod_emp = d.cod_emp;

/*Query com SubQuery*/
select 
	d.*,
    e.nome as empregado,
    (format((datediff(now(), e.dt_nascimento) / 365), 0)) as idade,
    (format((datediff(now(), e.dt_admissao) / 365), 0)) as tempo_empresa
from
	dependente d,
    empregado e
where
	d.cod_emp in (
    select cod_emp from empregado where (format((datediff(now(), dt_admissao) / 365), 0) < 22)
    )
and 
e.cod_emp = d.cod_emp;

/*View com uso de MySQL*/

create view vw_bounus_desenvolvimento
as
select
	d.*,
    (format((datediff(now(), d.dt_nascimento) / 365), 0)) as idade_dep,
    e.nome as empregado,
    (format((datediff(now(), e.dt_admissao) / 365), 0)) as tempo_empresa,
    (e.salario * 0.15) as bonus_dependente,
    "Desenvolvimento" as departamento
from
	empregado e,
	dependente d
where
	d.cod_emp in(
		select cod_emp from empregado where cod_depto = 3
	)
and
	e.cod_emp = d.cod_emp;
    
select * from vw_bounus_desenvolvimento;
	