COMMENT ON TABLE person_discounts IS 'таблица которая хранить id человека, id пиццерии и процент скидки человека в данной пицерии';
COMMENT ON COLUMN person_discounts.id IS 'унакальное значение ключа';
COMMENT ON COLUMN person_discounts.person_id IS 'персональный индификатор пользователя';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'персональный индификатор пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'процент скидки';
 
-- \dt+ <имя таблици>    посмотреть коментарии к таблице
-- \d+ <имя таблици>     посмотреть коментарии к полям таблицы

-- \dt+ person_discounts
-- \d+ person_discounts