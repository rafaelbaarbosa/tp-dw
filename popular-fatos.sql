/**** SCRIPT USADO PARA PREENCHER TABELAS DE FATOS ****/

insert into FatoNotas (IdPais, NotaCiencias, NotaCienciasM, NotaCienciasH, NotaMatematica, NotaMatematicaM, NotaMatematicaH, NotaLeitura, NotaLeituraM, NotaLeituraH)
select a.IdPais, a.[2015  YR2015 ], b.[2015  YR2015 ], c.[2015  YR2015 ], d.[2015  YR2015 ], e.[2015  YR2015 ], f.[2015  YR2015 ], g.[2015  YR2015 ], h.[2015  YR2015 ], i.[2015  YR2015 ]
from 
(
	select * from [Notas2015] as N left outer join [DimPais] as P on N.[Country Code] = P.[IdPais]
	where N.[Series Code] = 'LO.PISA.SCI'
) as a
inner join
(
	select * from [Notas2015] as N left outer join [DimPais] as P on N.[Country Code] = P.[IdPais]
	where N.[Series Code] = 'LO.PISA.SCI.FE'
) as b
 on a.IdPais = b.IdPais
 inner join
 (
	select * from [Notas2015] as N left outer join [DimPais] as P on N.[Country Code] = P.[IdPais]
	where N.[Series Code] = 'LO.PISA.SCI.MA'
 ) as c
 on b.IdPais = c.IdPais
 inner join
(
	select * from [Notas2015] as N left outer join [DimPais] as P on N.[Country Code] = P.[IdPais]
	where N.[Series Code] = 'LO.PISA.MAT'
) as d
 on c.IdPais = d.IdPais
 inner join
(
	select * from [Notas2015] as N left outer join [DimPais] as P on N.[Country Code] = P.[IdPais]
	where N.[Series Code] = 'LO.PISA.MAT.FE'
) as e
 on d.IdPais = e.IdPais
 inner join
(
	select * from [Notas2015] as N left outer join [DimPais] as P on N.[Country Code] = P.[IdPais]
	where N.[Series Code] = 'LO.PISA.MAT.MA'
) as f
 on e.IdPais = f.IdPais
 inner join
(
	select * from [Notas2015] as N left outer join [DimPais] as P on N.[Country Code] = P.[IdPais]
	where N.[Series Code] = 'LO.PISA.REA'
) as g
 on f.IdPais = g.IdPais
 inner join
(
	select * from [Notas2015] as N left outer join [DimPais] as P on N.[Country Code] = P.[IdPais]
	where N.[Series Code] = 'LO.PISA.REA.FE'
) as h
 on g.IdPais = h.IdPais
 inner join
(
	select * from [Notas2015] as N left outer join [DimPais] as P on N.[Country Code] = P.[IdPais]
	where N.[Series Code] = 'LO.PISA.REA.MA'
) as i
 on h.IdPais = i.IdPais;

 insert into FatoMedalhas (IdPais, IdAtleta, QtdMedalhas, QtdMedalhasOuro, QtdMedalhasPrata, QtdMedalhasBronze)
 select [nationality], [id], (gold + silver + bronze) as QtdMedalhas, gold, silver, bronze from athletes;
