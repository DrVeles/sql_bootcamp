CREATE SEQUENCE seq_person_discounts;
SELECT SETVAL('seq_person_discounts', (SELECT max(id) FROM person_discounts));
ALTER TABLE person_discounts
ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');
