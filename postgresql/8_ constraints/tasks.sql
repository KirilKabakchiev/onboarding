-- Резюме:

-- PRIMARY KEY
-- - може от един или повече атрибути
-- - не се допускат повторения
-- - не се допускат NULL стойности
-- - в една релация не може да има повече от един PK
-- (кажи за Identity)

-- UNIQUE
-- - може от един или повече атрибути
-- - не се допускат повторения
-- - допуска се NULL, но зависи кое СУБД ползваме
-- - в една релация може да има много UNIQUE ограничения

-- FOREIGN KEY
-- - реферира PK в друга или _същата_ таблица (в презентацията има пропуск)
-- - броят и типът на съставящите го атрибути трябва да съвпада с тези на PK
-- - допускат се повторения
-- - допуска се NULL
-- - в една релация може да има много FK

-------------

-- Зад. 1.
-- а) Да се направи така, че да не може два филма да имат еднаква дължина.
-- б) Да се направи така, че да не може едно студио да има два филма с еднаква дължина

-- Зад. 2. Изтрийте ограниченията от първа задача от Movie.

-- Зад. 3.
-- а) За всеки студент се съхранява следната информация:
-- фак. номер - от 0 до 99999, първичен ключ;
-- име - до 100 символа;
-- ЕГН - точно 10 символа, уникално;
-- e-mail - до 100 символа, уникален;
-- рождена дата;
-- дата на приемане в университета - трябва да бъде поне 18 години след рождената;
-- за всички атрибути задължително трябва да има зададена стойност (не може NULL)

-- б) добавете валидация за e-mail адреса - да бъде във формат <нещо>@<нещо>.<нещо>

-- в) създайте таблица за университетски курсове - уникален номер и име

-- всеки студент може да се запише в много курсове и във всеки курс
-- може да има записани много студенти.
-- При изтриване на даден курс автоматично да се отписват всички студенти от него.