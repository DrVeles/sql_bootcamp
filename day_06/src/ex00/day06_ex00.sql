CREATE TABLE  person_discounts (
    id bigint PRIMARY KEY,
    person_id bigint,
    CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person(id),
    pizzeria_id bigint,
    CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria(id),
    discount numeric);