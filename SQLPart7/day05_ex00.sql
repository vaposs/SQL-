-- удаляем индекси для повторного создания
DROP INDEX IF EXISTS idx_1;
DROP INDEX IF EXISTS idx_menu_pizzeria_id;
DROP INDEX IF EXISTS idx_menu_unique;
DROP INDEX IF EXISTS idx_person_covering;
DROP INDEX IF EXISTS idx_person_name;
DROP INDEX IF EXISTS idx_person_order_menu_id;
DROP INDEX IF EXISTS idx_person_order_multi;
DROP INDEX IF EXISTS idx_person_order_order_date;
DROP INDEX IF EXISTS idx_person_order_person_id;
DROP INDEX IF EXISTS idx_person_visits_person_id;
DROP INDEX IF EXISTS idx_person_visits_pizzeria_id;

--создаем индексы
CREATE INDEX idx_person_visits_person_id ON person_visits(person_id);
CREATE INDEX idx_person_visits_pizzeria_id ON person_visits(pizzeria_id);
CREATE INDEX idx_menu_pizzeria_id ON menu(pizzeria_id);
CREATE INDEX idx_person_order_person_id ON person_order(person_id);
CREATE INDEX idx_person_order_menu_id ON person_order(menu_id);


-- Команда для проверки индексов в терминале
-- \i di





/*
индексы создаются только для внешних ключей ссылочных типов данных, в данных таблицах они обозначенны:
 constraint fk_person_visits_pizzeria_id foreign key  (pizzeria_id) references pizzeria(id)
 constraint fk_person_visits_person_id foreign key  (person_id) references person(id),
 constraint uk_person_visits unique (person_id, pizzeria_id, visit_date),
 constraint fk_menu_pizzeria_id foreign key (pizzeria_id) references pizzeria(id));
 constraint fk_order_person_id foreign key (person_id) references person(id),
 constraint fk_order_menu_id foreign key (menu_id) references menu(id)
 
 для остальных таблиц (данных) уже существует древовидная структура индексов благодаря полям bigint primary key (уникальным значениям)
*/

