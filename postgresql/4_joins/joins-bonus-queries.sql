SET search_path = movies;

--wsi4ki aktiori koito ne sa wuw filmi
SELECT * FROM MOVIESTAR
                  left join STARSIN ON name = STARNAME
where starname is null;

--wsi4ki produkti koito ne se prodawat
SET search_path = pc;
select *
from product p
         left join pc on pc.model = p.model
         left join laptop on laptop.model = p.model
         left join printer on printer.model = p.model
where pc.model is null and laptop.model is null and printer.model is null;

--za wsqka durjava da se izvadqt imenata na korabite koito nikoga ne sa y4astwali w bitka
SET search_path = ships;
select * from classes c
                  join ships s on c.class = s.class
                  left join outcomes o on s.name = o.ship
where o.ship is null;

-- imenata i godinite na pyskane na wsi4ki korabi, 4ieto ime sywpada s imeto na klasa im
SET search_path = ships;
select name, launched
from ships where name = class;


--si4ki durjavi koito imat potunali w bitka korabi distinct country
SET search_path = ships;
select *
from classes c
         join ships s on c.class = s.class
         join outcomes o on s.name = o.ship
where o.result = 'sunk';

--wsi4ki durjavi koito nqmat nito 1 potunal korab (moje i korabite prosto da ne sa u4astawli w bitki)
select distinct country
from classes c
where country not in
      ( select distinct country
        from classes c
                 join ships s on c.class = s.class
                 join outcomes o on s.name = o.ship
        where o.result = 'sunk');


--durjavite  koito imat razli4en kalibur ne6to si
SET search_path = ships;
select distinct c1.country
from classes c1
         join classes c2 on c1.country = c2.country
where c1.bore <> c2.bore;


--test
SET search_path = movies;
select *
from MOVIEEXEC me
         full join MOVIESTAR ms on me.name = ms.name;
--wsi4ki hora - aktiori, producenti, nqkoi moje da sa i 2te
SET search_path = movies;
select case
           when me.name is null then ms.name
           else me.name
           end as name
from MOVIEEXEC me
         full join MOVIESTAR ms on me.name = ms.name;

--stranite koito proizvejdat korabi s nai golqm broi orudiq
SET search_path = ships;
select distinct country
from classes
where numguns >= ALL( select numguns from classes);

-- 1. Всички актьори, които не са играли във филми
-- (т.е. нямаме информация в кои филми са играли)

SET search_path = movies;
select NAME
from MOVIESTAR
         left join STARSIN on NAME = STARNAME
where MOVIETITLE is null;

-- 2. Производител, модел и тип на продукт за всички
-- продукти, които не се продават, т.е. има кортеж в
-- релацията Product, но няма кортеж в съответната
-- релация PC/Laptop/Printer

SET search_path = pc;
select distinct p.maker, p.model, p.type
from product p
         left join laptop l on p.model = l.model
         left join pc p1 on p.model = p1.model
         left join printer pr on p.model = pr.model
where l.code is null
  and p1.code is null
  and pr.code is null;

-- 3. За всяка държава да се изведат имената на
-- корабите, които никога не са участвали в битка

SET search_path = ships;
select country, name, ship
from classes c
         join ships s on c.class = s.class
         left join outcomes o on s.name = o.ship
where o.ship is null;

-- задача 1: Имената и годините на поскане на вода на всички
-- кораби, чието име съвпада с името на класа им.

SET search_path = ships;
select name, LAUNCHED
from ships
where NAME = CLASS;

-- задача 4: Всички държави, които имат потънали в битка кораби

SET search_path = ships;
select distinct country
from CLASSES
         join ships on CLASSES.CLASS = ships.CLASS
where ships.NAME in (select ship
                     from OUTCOMES
                     where RESULT = 'sunk');

--задача 5: Всички държави, които нямат нито един потънал кораб
-- (това вкчва държави с кораби, които не са участвали в битки и т.н.)

SET search_path = ships;
select distinct country
from CLASSES
where COUNTRY not in (select distinct country
                      from CLASSES
                               join ships on CLASSES.CLASS = ships.CLASS
                      where ships.NAME in (select ship
                                           from OUTCOMES
                                           where RESULT = 'sunk'));

--задача 7: Държавите, които имат класове с различен калибър
--(напр. САЩ имат с 14 калибър класове с 16
-- калибър, докато Великобритания има само класове с 15)

SET search_path = ships;
select distinct c1.COUNTRY
from CLASSES c1
         join CLASSES c2 on c1.COUNTRY = c2.COUNTRY
where c1.BORE != c2.BORE;

-- задача 8: Комп-те, които са по-евтини от всеки лаптоп
-- и принте на същия производител

SET search_path = pc;
select p1.*
from product p
         join pc p1 on p.model = p1.model
where p1.price < All (select la.price
                      from product k
                               join laptop la on la.model = k.model
                      where k.maker = p.maker)
  and p1.price < All (select pr.price
                      from product l
                               join printer pr on pr.model = l.model
                      where l.maker = p.maker);

-- задача 10: Страните, които произвеждат кораби с най-голям брой оръдия
--(numguns)

SET search_path = ships;
select distinct country
from CLASSES
where NUMGUNS >= All (select NUMGUNS
                      from CLASSES);


-- Някои хора за продуценти, други са актьори, трети са и двете.
-- За всеки човек да се изведе рожденна дата и networth (ако има)

SET search_path = movies;
select ms.BIRTHDATE, me.NETWORTH
from MOVIEEXEC me
         full join MOVIESTAR ms on me.NAME = ms.NAME;