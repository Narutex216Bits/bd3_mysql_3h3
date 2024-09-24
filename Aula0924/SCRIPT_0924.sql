use empregados_icoma;

select * from empregados_icoma;

create view vw_pagamento_setembro
as
select *,
	(salario * 0.75) as INSS_F,
	(salario * 0.75) as INSS_E,
	(salario * 0.08) as FGTS,
	(salario / 12) as decimo_e
from empregado;

select
*,
	format((FGTS+decimo_e+INSS_E),2) as Deposito,
	format((salario - INSS_F),2) as liquido
from vw_pagamento_setembro;

select
*,
	format((FGTS+decimo_e+INSS_E),2) as Deposito,
	format((salario - INSS_F),2) as liquido,
    format(((salario * 0.4) * 60)/2.44) as Consignado,
    format(((salario - INSS_F) * 0.4) * 60)/2.44) as Consignado
from vw_pagamento_setembro;


Equação juros compostos
M = C(1 + i)t