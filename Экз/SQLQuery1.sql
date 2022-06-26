Create database PodgKEx1;
use PodgKEx1;
create table Tovar
(ID int primary key,
 item nvarchar(50),
 cena int
);
create table Pokupatel
(ID int primary key,
 Pokupat nvarchar(50),
 id_item int foreign key references Tovar(ID)
);

select Tovar.item, cena, Pokupat from Tovar inner join Pokupatel on Tovar.ID = Pokupatel.id_item where item like 'test1' or item like 'test2' order by cena;
select count(Pokupatel.id_item) as [Count], Tovar.[date] from Tovar inner join Pokupatel on Tovar.ID = Pokupatel.id_item where Tovar.[date] between '2019-01-01' and '2020-02-02' and Pokupatel.map like 'Витебск' group by [date];
select max(cena), Pokupat from Tovar inner join Pokupatel on Tovar.ID = Pokupatel.id_item where item like 'test1' or item like 'test2' group by Pokupatel.Pokupat;
select Tovar.item, sum(cena) as [Sum] from Tovar inner join Pokupatel on Tovar.ID = Pokupatel.id_item group by Tovar.item order by [Sum] desc;
select Tovar.item, avg(cena) as [Avg] from Tovar inner join Pokupatel on Tovar.ID = Pokupatel.id_item where Pokupatel.map in ('Витебск') group by Tovar.item order by [Avg];
select avg(cena) as [Avg], Pokupatel.Pokupat from Tovar inner join Pokupatel on Tovar.ID = Pokupatel.id_item group by Pokupatel.Pokupat having count(Pokupatel.Pokupat) >= 5;
select Pokupatel.Pokupat, sum(cena) as [Sum] from Tovar inner join Pokupatel on Tovar.ID = Pokupatel.id_item group by Pokupatel.Pokupat order by [Sum] desc;
select Pokupatel.Pokupat from Tovar inner join Pokupatel on Tovar.ID = Pokupatel.id_item where Tovar.[date] in ('2022-04-04') or Tovar.[date] in ('2021-03-03') or Tovar.[date] like '20%' group by Pokupatel.Pokupat;