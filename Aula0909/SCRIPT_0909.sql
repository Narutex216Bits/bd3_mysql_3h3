use empregados_icoma;
/*Select simples*/
select * from empregado;
/*Filtro de Estado Civil*/ 
select cod_emp from empregado where civil like 'V';
/*Filtro por atributo da tabela extrangeira com uso de subquery*/
select * from dependente where cod_emp in(
	select cod_emp from empregado where civil like 'V'
);
/*Desafio quero os dependentes dos funcionários com mais de 5 anos de empresa.*/
/*Desafio quero os dependentes dos funcionários com mais de 40 anos de idade.*/
