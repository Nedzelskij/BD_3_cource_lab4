INSERT INTO
    storages (stor_id, stor_address)
VALUES
    ('1', '123 Main Street'),
    ('2', '500 Park Street'),
    ('3', '555 High Street'),
    ('4', '1000 5th Avenue'),
    ('5', '42 Galaxy Road');
INSERT INTO
    vegetables (prod_id, prod_name, prod_condition, prod_price_kg)
VALUES
    ('BGG03', 'potato', 'fresh', 20),
    ('CVV12', 'tomato', 'fresh', 50),
    ('BBE65', 'peas', 'fresh', 70),
    ('TYT78', 'pumkin', 'fresh', 25),
    ('UUQ39', 'cucumber', 'fresh', 130),
	('BGG25', 'pointed grourd', 'fresh', 10),
    ('VVW22', 'raddish', 'fresh', 35),
    ('EEE65', 'garlic', 'fresh', 150),
    ('QWE11', 'onion', 'fresh', 35),
    ('KIN57', 'cabbage', 'fresh', 45);
INSERT INTO
    supermarkets (sup_id, sup_address, sup_name)
VALUES
    ('11', '90 Main Street', 'Market Plus'),
    ('12', '54 Park Street', 'QL'),
    ('13', '125 High Street', 'Еverything is cheap'),
    ('14', '10 3th Avenue', 'Super products'),
    ('15', '34 Galaxy Road', 'Perfection');
INSERT INTO
    deliveries (del_date, stor_id, prod_id, sup_id, del_quantity_kg)
VALUES
    ('2023-05-01', '1', 'BGG03', '11', 20),
    ('2023-07-02', '2', 'EEE65', '13', 10),
    ('2023-01-01', '3', 'BGG03', '15', 22),
    ('2023-10-11', '4', 'UUQ39', '11', 15),
    ('2023-06-26', '5', 'BBE65', '11', 9),
	('2023-07-05', '1', 'UUQ39', '12', 11),
	('2023-11-01', '1', 'TYT78', '15', 12),
	('2023-03-30', '4', 'BGG03', '14', 30),
	('2023-03-14', '5', 'QWE11', '13', 5),
	('2023-05-22', '2', 'KIN57', '13', 8);
INSERT INTO
    storage_vegetables (stor_id, prod_id, stor_prod_quantity_kg)
VALUES
    ('1', 'BGG03', 140),
    ('3', 'BGG03', 34.5),
    ('4', 'BGG03', 12.2),
	('5', 'BGG03', 102),
	('2', 'EEE65', 34),
    ('3', 'QWE11', 55),
    ('5', 'EEE65', 20),
	('1', 'UUQ39', 77),
    ('2', 'KIN57', 81);
	