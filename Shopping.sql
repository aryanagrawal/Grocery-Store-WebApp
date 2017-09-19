
use ShoppingMall;

create table product (
barcode		int,
name		varchar(255),
category	varchar(255),
price		decimal,
qty			int,
primary key (barcode)
);

create table orderHist (
	orderID		int,
	pID			int,
	qty			int,
	price		decimal,
	primary key (orderID,pID)
);

create table pOrder (
	orderID		int,
	pdate		varchar(10),
	total		decimal,
	cID			int,	
	state		varchar(2),
	city		varchar(20),
	zip			int,
	address		varchar(80),
	primary key (orderID)
);


create table customer (
	custID		int,
	username	varchar(255),
	password	varchar(255),
	surName		varchar(30),
	fName		varchar(30),
	gender		varchar(1),
	state		varchar(2),
	city		varchar(20),
	zip			int,
	address		varchar(80),
	email		varchar(80),
	primary key (custID)
);

create table employee (
	eID			int,
	username	varchar(255),
	password	varchar(255),
	surName		varchar(30),
	fName		varchar(30),
	gender		varchar(1),
	salary		int,
	mID			int,
	position 	varchar(20),
	primary key (eID)
);




/*INSERT IN TO THE EMPLOYEE TABLE*/
INSERT INTO product values (18237372, 'Ketchup', 'Condiment', 1.75, 38);
INSERT INTO product values (16273699, 'Mustard', 'Condiment', 2, 43);
INSERT INTO product values (11122332, 'Hot Sauce', 'Condiment', 1.25, 30);
INSERT INTO product values (90284955, 'Asparagus', 'Vegetable', 3, 16);
INSERT INTO product values (66664738, 'Carrots', 'Vegetable', 1, 14);
INSERT INTO product values (22839411, 'Spinach', 'Vegetable', 2.5, 18);
INSERT INTO product values (93827789, 'Broccoli', 'Vegetable', 2.25, 26);
INSERT INTO product values (33625344, 'Pineapple', 'Fruit', 3, 36);
INSERT INTO product values (29876532, 'Banana', 'Fruit', 0.49, 78);
INSERT INTO product values (10182741, 'Orange', 'Fruit', 0.35, 54);
INSERT INTO product values (12948332, 'Bacon', 'Meat', 6.75, 112);
INSERT INTO product values (10001110, 'Chicken', 'Meat', 7.7, 100);
INSERT INTO product values (45647587, 'Hamburgers', 'Meat', 30, 96);
INSERT INTO product values (58697786, 'Hot Dogs', 'Meat', 3.75, 102);
INSERT INTO product values (78697013, 'Blue Cheese', 'Cheese', 13, 38);
INSERT INTO product values (92837466, 'Mozzarella', 'Cheese', 9.23, 36);
INSERT INTO product values (63555461, 'Parmesan', 'Cheese', 5.67, 20);
INSERT INTO product values (10109283, 'Water', 'Beverage', 2, 40);
INSERT INTO product values (86756993, 'Beer', 'Beverage', 8.35, 90);
INSERT INTO product values (90909091, 'Antacid', 'Medicine', 4.67, 26);
INSERT INTO product values (90909092, 'Aspirin', 'Medicine', 5.25, 20);
INSERT INTO product values (65324410, 'Cookies', 'Snack', 3.75, 24);
INSERT INTO product values (96758400, 'Bagels', 'Baked Good', 4.25, 34);
INSERT INTO product values (59687000, 'Sliced Bread', 'Baked Good', 3.33, 44);
INSERT INTO product values (53410010, 'Baked Bread', 'Baked Good', 2.33, 68);
INSERT INTO product values (40404119, 'Milk', 'Dairy', 1.67, 54);
INSERT INTO product values (98344570, 'Eggs', 'Dairy', 3.89, 60);
INSERT INTO product values (87192001, 'Candy', 'Snack', 100, 72);

INSERT INTO pOrder values (1, '5/16/17', 13.25, 909090, 'HI', 'Big Island', 54210, '999 N. Wildcat Way');
INSERT INTO pOrder values (2, '5/16/17', 22.67, 821214, 'AZ', 'Tucson', 85719, '6121 E. Moo St.');
INSERT INTO pOrder values (3, '5/16/17', 10, 972111, 'NY', 'New York', 17191, '1717 N. Broadway Ave.');
INSERT INTO pOrder values (4, '5/17/17', 36.26, 273844, 'CA', 'San Francisco', 90212, '101 N. Stone' );
INSERT INTO pOrder values (5, '5/17/17', 200, 302934, 'CA', 'San Diego', 90210, '111 Wonder Way');
INSERT INTO pOrder values (6, '5/17/17', 7.8, 123456, 'NY', 'Newark', 17196, '3229 S. South St.');
INSERT INTO pOrder values (7, '5/18/17', 30, 909090, 'HI', 'Big Island', 54210, '999 N. Wildcat Way');
INSERT INTO pOrder values (8, '5/18/17', -14.7, 12345, 'AZ', 'Tucson', 85719, '1010 N. Headquarters Ave.');
INSERT INTO pOrder values (9, '5/18/17', 90.61, 550493, 'IL', 'Littleton', 60711, '4120 S. Suthers Dr.');
INSERT INTO pOrder values (10, '5/18/17', 10, 402312, 'MI', 'Whoseville', 78900, '8080 W. WootWoot');
INSERT INTO pOrder values (11, '5/19/17', 6.5, 273844, 'CA', 'San Francisco', 90212, '101 N. Stone' );
INSERT INTO pOrder values (12, '5/19/17', 20.58, 819239, 'AZ', 'Tucson', 85719, '6121 E. Moo St.');
INSERT INTO pOrder values (13, '6/11/17', 54.04, 819239, 'AZ', 'Tucson', 85719, '6121 E. Moo St.');
INSERT INTO pOrder values (14, '6/13/17', -1000, 27384, 'AZ', 'Tucson', 85719, '1010 N. Headquarters Ave.');
INSERT INTO pOrder values (15, '6/14/17', 867.5, 667788, 'WA', 'Seattle', 31121, '14 14th St.');
INSERT INTO pOrder values (16, '6/14/17', 0.49, 972111, 'NY', 'New York', 17191, '1717 N. Broadway Ave.');
INSERT INTO pOrder values (17, '7/23/17', 22.7, 123456, 'NY', 'Newark', 17196, '3229 S. South St.');
INSERT INTO pOrder values (18, '7/30/17', 186.25, 123456, 'NY', 'Newark', 17196, '3229 S. South St.');
INSERT INTO pOrder values (19, '8/3/17', 11.24, 302934, 'CA', 'San Diego', 90210, '111 Wonder Way');
INSERT INTO pOrder values (20, '9/7/17', 9.33, 550493, 'IL', 'Littleton', 60711, '4120 S. Suthers Dr.');
INSERT INTO pOrder values (21, '11/20/17', 200, 402312, 'MI', 'Whoseville', 78900, '8080 W. WootWoot');
INSERT INTO pOrder values (22, '1/16/18', 8.35, 667788, 'WA', 'Seattle', 31121, '14 14th St.');
INSERT INTO pOrder values (23, '1/18/18', -90, 12345, 'AZ', 'Tucson', 85719, '1010 N. Headquarters Ave.');


INSERT INTO orderHist values (1, 18237372, 1, 1.75);
INSERT INTO orderHist values (1, 22839411, 1, 2.5);
INSERT INTO orderHist values (1, 90284955, 3, 9);
INSERT INTO orderHist values (2, 63555461, 1, 5.67);
INSERT INTO orderHist values (2, 96758400, 4, 17);
INSERT INTO orderHist values (3, 66664738, 1, 1);
INSERT INTO orderHist values (3, 33625344, 3, 9);
INSERT INTO orderHist values (4, 63555461, 4, 22.68);
INSERT INTO orderHist values (4, 29876532, 12, 5.88);
INSERT INTO orderHist values (4, 10001110, 1, 7.7);
INSERT INTO orderHist values (5, 87192001, 2, 200);
INSERT INTO orderHist values (6, 10182741, 3, 1.05);
INSERT INTO orderHist values (6, 12948332, 1, 6.75);
INSERT INTO orderHist values (7, 45647587, 1, 30);
INSERT INTO orderHist values (8, 66664738, 1, -1);
INSERT INTO orderHist values (8, 10109283, 3, -6);
INSERT INTO orderHist values (8, 10001110, 1, -7.7);
INSERT INTO orderHist values (9, 78697013, 2, 26);
INSERT INTO orderHist values (9, 92837466, 7, 64.61);
INSERT INTO orderHist values (10, 10109283, 5, 10);
INSERT INTO orderHist values (11, 93827789, 3, 6.5);
INSERT INTO orderHist values (12, 65324410, 1, 3.75);
INSERT INTO orderHist values (12, 53410010, 2, 4.66);
INSERT INTO orderHist values (12, 90909091, 1, 4.67);
INSERT INTO orderHist values (12, 65324410, 1, 3.75);
INSERT INTO orderHist values (12, 58697786, 1, 3.75);
INSERT INTO orderHist values (13, 11122332, 9, 11.25);
INSERT INTO orderHist values (13, 98344570, 11, 42.79);
INSERT INTO orderHist values (14, 87192001, 10, -1000);
INSERT INTO orderHist values (15, 96758400, 14, 59.5);
INSERT INTO orderHist values (15, 33625344, 2, 6);
INSERT INTO orderHist values (15, 87192001, 8, 800);
INSERT INTO orderHist values (15, 16273699, 1, 2);
INSERT INTO orderHist values (16, 29876532, 1, 0.49);
INSERT INTO orderHist values (17, 22839411, 6, 15);
INSERT INTO orderHist values (17, 10001110, 1, 7.7);
INSERT INTO orderHist values (18, 86756993, 2, 16.7);
INSERT INTO orderHist values (18, 87192001, 1, 100);
INSERT INTO orderHist values (18, 96758400, 3, 12.75);
INSERT INTO orderHist values (18, 33625344, 5, 15);
INSERT INTO orderHist values (18, 98344570, 2, 7.78);
INSERT INTO orderHist values (18, 63555461, 6, 34.02);
INSERT INTO orderHist values (19, 53410010, 3, 6.99);
INSERT INTO orderHist values (19, 11122332, 1, 1.25);
INSERT INTO orderHist values (19, 33625344, 1, 3);
INSERT INTO orderHist values (20, 59687000, 1, 3.33);
INSERT INTO orderHist values (20, 33625344, 2, 6);
INSERT INTO orderHist values (21, 87192001, 2, 200);
INSERT INTO orderHist values (22, 86756993, 1, 8.35);
INSERT INTO orderHist values (23, 45647587, 3, -90);


/*INSERT IN TO THE EMPLOYEE TABLE */
INSERT INTO customer values (819239, 'moocow', 'cows', 'Moo', 'Cow', 'F', 'AZ', 'Tucson', 85719, '6121 E. Moo St.', 'mc@gmail.com');
INSERT INTO customer values (821214, 'binarwoyman', 'binary', 'Mott', 'Melinda', 'F', 'AZ', 'Tucson', 85719, '6121 E. Moo St.', 'binaryislife@gmail.com');
INSERT INTO customer values (972111, 'dontmessunk', 'unk', 'Song', 'Ryunki','M', 'NY', 'New York', 17191, '1717 N. Broadway Ave.', 'dontmesswithunk@gmail.com');
INSERT INTO customer values (667788, 'maxawesomeness', 'max', 'Faridian', 'Max', 'M', 'WA', 'Seattle', 31121, '14 14th St.', 'maxa@gmail.com');
INSERT INTO customer values (302934, 'aryanzaman', 'zaman', 'Agrawal', 'Aryan', 'M', 'CA', 'San Diego', 90210, '111 Wonder Way', 'aman@gmail.com');
INSERT INTO customer values (123456, 'mccannpeterpan', 'pantheman', 'McCann', 'Lester', 'M', 'NY', 'Newark', 17196, '3229 S. South St.', 'npan@hook.com');
INSERT INTO customer values (909090, 'jacobsdope', 'dopej', 'Benz', 'Jacob', 'M', 'HI', 'Big Island', 54210, '999 N. Wildcat Way', 'jb@icloud.com');
INSERT INTO customer values (550493, 'yawenhipcat', 'yawen', 'Chen', 'Yawen', 'M', 'IL', 'Littleton', 60711, '4120 S. Suthers Dr.', 'cen@yahoo.com');
INSERT INTO customer values (402312, 'btheman', 'bthe', 'Cohen', 'Brett', 'M', 'MI', 'Whoseville', 78900,'8080 W. WootWoot', 'theman@gmail.com');
INSERT INTO customer values (111111, 'peepzbedope', 'peepz', 'Lou', 'Samantha', 'F', 'CA', 'San Francisco', 90212, '101 N. Stone', 'pdope@gmail.com');


/*INSERT IN TO THE EMPLOYEE TABLE*/
INSERT INTO employee values (12345,	'mccannpeterpan', 'pantheman', 'McCann', 'Lester', 'M',	275000,	273844,	'manager');
INSERT INTO employee values (90909,	'jacobsdope', 'dopej', 'Benz', 'Jacob', 'M', 80000,	123456,	'stock');
INSERT INTO employee values (55049, 'yawenhipcat', 'yawen', 'Chen', 'Yawen', 'M', 80000, 123456, 'cashier');
INSERT INTO employee values (55555, 'peepzbedope', 'peepz', 'Lou', 'Samantha', 'F', 350000,NULL, 'manager');


commit;
