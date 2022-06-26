use KR
CREATE TABLE AUD_TYPE
	(   Kod_AUD int primary key,
	    Name_AUD nvarchar(50)
           ) ;
CREATE TABLE AUD
	(   Kod_A int primary key,
	    Tip_AUD int foreign key references AUD_TYPE(Kod_AUD),
		Vmest_AUD int default '1' check (Vmest_AUD >=1 and Vmest_AUD <=150)
           ) ;

---
select AUD_TYPE.Kod_AUD, AUD_TYPE.Name_AUD, AUD.Vmest_AUD
from AUD_TYPE inner join AUD
on AUD_TYPE.Kod_AUD = AUD.Tip_AUD;

---
select AUD_TYPE.Name_AUD, MAX(AUD.Vmest_AUD) as [Максимальная вместимость], SUM(AUD.Vmest_AUD) as [Суммарная вместимость], COUNT(AUD.Tip_AUD) as [Общее количество аудиторий данного типа]
from AUD_TYPE inner join AUD
on AUD_TYPE.Kod_AUD = AUD.Tip_AUD
group by AUD_TYPE.Name_AUD;
