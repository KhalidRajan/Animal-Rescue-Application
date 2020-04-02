
create table organizations(
	organization_id varchar(20) not null primary key,
	name varchar(20) not null,
	street_name varchar(20) not null,
	street_number varchar(20) not null,
	city varchar(20) not null,
	state varchar(20) not null,
	zip varchar(20) not null);


create table animals(
	animal_id varchar(20) not null primary key,
	animal_type varchar(20) not null,
	entry_date date not null,
	organization_id varchar(20),
	city varchar(20) not null,
	state varchar(20) not null,
	zip varchar(20) not null,
	exit_date date,
	foreign key (organization_id) references organizations(organization_id) on delete set null
);


create table transportInfo(
	source varchar(20) not null,
	transport_id varchar(20) not null primary key,
	destination varchar(20) not null,
	amount_paid int,
	animal_id varchar(20) not null,
	driver_name varchar(20) not null,
	foreign key (animal_id) references animals(animal_id) on delete cascade);

create table employee (
	name varchar(20) not null primary key,
	street_name varchar(20) not null,
	street_number varchar(20) not null,
	city varchar(20) not null,
	state varchar(20) not null,
	zip varchar(20) not null,
	workplace varchar(20) not null,
	organization_id varchar(20),
	foreign key (organization_id) references organizations(organization_id) on delete set null);

create table donation (
	name varchar(20) not null primary key,
	donation_date date not null,
	amount int not null,
	donated_to varchar(20) not null,
	organization_id varchar(20),
	foreign key (organization_id) references organizations(organization_id) on delete set null);

create table vetvisits (
	name varchar(20) not null,
	illness varchar(80) not null,
	weight int not null,
	date date not null,
	animal_id varchar(20) not null,
	primary key (animal_id, name, illness, weight, date),
	foreign key (animal_id) references animals(animal_id) on delete cascade);


create table phoneNumbers (
	phone_number char(10) not null,
	name varchar(20),
	organization_id varchar(20),
	primary key (phone_number, name, organization_id),
	foreign key (name) references employee(name) on delete cascade,
	foreign key (organization_id) references organizations(organization_id) on delete cascade);


create table SPCA (
	organization_id varchar(20) not null,
	foreign key (organization_id) references organizations(organization_id) on delete cascade);



create table rescue (
	organization_id varchar(20) not null,
	foreign key (organization_id) references organizations(organization_id) on delete cascade,
	rescueReferenceNum varchar(20) not null primary key);

create table shelters (
	website_url varchar(20) not null primary key,
	animal_types enum('cat', 'dogs', 'rodents', 'rabits') not null,
	animal_capacity int not null,
	organization_id varchar(20),
	foreign key (organization_id) references organizations(organization_id) on delete cascade);


create table adopters (
	amount_paid int not null,
	organization_id varchar(20) not null,
	foreign key (organization_id) references organizations(organization_id) on delete cascade);


create table drivers (
	name varchar(20) not null primary key,
	license_plate varchar(20) not null,
	license_number int not null,
	rescueReferenceNum varchar(20),
	foreign key (rescueReferenceNum) references rescue(rescueReferenceNum) on delete set null);



create table emergencyPhoneNumbers (
	emergency_phone_number varchar(10) not null,
	name varchar(20) not null,
	primary key (emergency_phone_number, name),
	foreign key (name) references drivers(name) on delete cascade);






	insert into animals values
	('1274855843', 'cat', '2017-10-14', '5478345265', 'Houston', 'Texas', 'L2S 4A2', '2018-01-11'),
	('8492756632', 'dog', '2018-11-17', '5478345265', 'Houston', 'Texas', 'L2S 4A2', '2018-01-11'),
	('4848993932', 'rabbit', '2018-08-23', '5478345265', 'Houston', 'Texas', 'L2S 4A2', '2018-01-11'),
	('4895549032', 'rodent', '2019-10-14', '2333112212', 'Dallas', 'Texas', 'S6F 7Y7', '2018-08-11'),
	('2857483985', 'cat', '2017-09-16', '2333112212', 'Dallas', 'Texas', 'S6F 7Y7', '2018-01-13'),
	('4444488855', 'dog', '2018-11-12', '2333112212', 'Dallas', 'Texas', 'S6F 7Y7', '2019-02-02'),
	('2223233344', 'rabbit', '2018-05-25', '2333112212', 'Dallas', 'Texas', 'S6F 7Y7', '2018-09-27'),
	('1739484738', 'rodent', '2019-11-12', '5847398734', 'Dallas', 'Texas', 'G4E 5E3', '2020-02-23'),
	('2739484738', 'cat', '2019-11-12', '3923874839', 'Houston', 'Texas', 'F5R 6U7', '2020-02-23'),
	('3739484738', 'rabbit', '2019-11-12', '3982738573', 'Dallas', 'Texas', 'W5F 7J8', '2020-02-23'),
	('4739484738', 'tiger', '2019-11-12', '5984829290', 'Houston', 'Texas', 'N5W 1Q6', '2020-02-23');


	insert into organizations values
	('5478345265', 'Cat Helpers', 'ogilvie', '8212', 'Houston', 'Texas', 'L2S 4A2'),
	('2343598469', 'puppies for parents', 'orchardview', '4323', 'Dallas', 'Texas', 'S3L 2W3'),
	('9277439572', 'Rabbit Care', 'brown', '4565', 'Dallas', 'Texas', 'S3L 8Y6'),
	('2948574893', 'hamster shelter', 'johnson', '9375', 'Houston', 'Texas', 'L2S 3K6'),
	('6684744434', 'Andy', 'Barrie', '6748', 'Dallas', 'Texas', 'K6S 4F3'),
	('8843933844', 'Woody', 'Colonel', '9333', 'Houston', 'Texas', 'H6E 2A3'),
	('9390293899', 'Anne', 'Kennedy', '4433', 'Houston', 'Texas', 'O9O 3E4'),
	('2998987448', 'Trevor', 'Tunnel square', '7883', 'Dallas', 'Texas', 'Q1W 4G6'),
	('3923874839', 'SPCA 1', 'richardson', '4859', 'Houston', 'Texas', 'F5R 6U7'),
	('5847398734', 'SPCA 2', 'harris', '4392', 'Dallas', 'Texas', 'G4E 5E3'),
	('3982738573', 'SPCA 3', 'simmons', '0594', 'Dallas', 'Texas', 'W5F 7J8'),
	('5984829290', 'SPCA 4', 'kirkpatrick', '9553', 'Houston', 'Texas', 'N5W 1Q6'),
	('2222334443', 'Roger Rescue', 'vanvleet st', '6697', 'Houston', 'Texas', 'V5D 4E4'),
	('8777667887', 'Rescue heroes', 'powell', '0093', 'Dallas', 'Texas', 'G2G 5T5'),
	('2333112212', 'ready to rescue', 'spadina', '1121', 'Dallas', 'Texas', 'S6F 7Y7'),
	('6904948394', 'rescue pets', 'university', '3365', 'Houston', 'Texas', 'J3Q 4W2');


	insert into transportInfo values
	('SPCA 1', '3892094738', 'Rescue heroes', 450, '1274855843', 'Tom'),
	('SPCA 2', '8493847328', 'ready to rescue', 350, '8492756632', 'Andrew'),
	('rescue pets', '2457584932', 'Rabbit Care', 700, '4848993932', 'Lilly'),
	('Roger Rescue', '7859484738', 'hamster shelter', 900, '4895549032', 'Ralph');


	insert into employee values
	('Jennifer', 'Yonge', '3267', 'Houston', 'Texas', 'G4W 1L8', 'Cat helpers', '5478345265'),
	('Mark', 'Waller', '9465', 'Houston', 'Texas', 'K3Q 4F4', 'hamster shelter', '2948574893'),
	('Hussein', 'Queen', '2345', 'Dallas', 'Texas', 'J5R 7R3', 'puppies for parents', '2343598469'),
	('John', 'King', '7778', 'Dallas', 'Texas', 'L2D 5H6', 'Rabbit Care', '9277439572'),
	('Amanda', 'Innes', '1161', 'Houston', 'Texas', 'G4W 1L3', 'SPCA 1', '3923874839'),
	('Julio', 'Orleans', '2228', 'Houston', 'Texas', 'K3Q 4F2', 'SPCA 4', '5984829290'),
	('Lebron', 'steeles', '3133', 'Dallas', 'Texas', 'J5R 7R5', 'SPCA 2', '5847398734'),
	('Kobe', '10th st', '4224', 'Dallas', 'Texas', 'L2D 5H7', 'SPCA 3', '3982738573'),
	('Zion', '11th st', '5555', 'Houston', 'Texas', 'G4W 1L4', 'Roger Rescue', '2222334443'),
	('Luka', '12th st', '7788', 'Houston', 'Texas', 'K3Q 4F2', 'rescue pets', '6904948394'),
	('Candace', '13th st', '8877', 'Dallas', 'Texas', 'J5R 7R4', 'Rescue heroes', '8777667887'),
	('Liban', '14th st', '9933', 'Dallas', 'Texas', 'L2D 5H3', 'ready to rescue', '2333112212');


	insert into donation values
	('Emma', '2018-05-19', 30, 'Cat Helpers', '5478345265'),
	('Jessica', '2019-06-13', 50, 'puppies for parents', '2343598469'),
	('Mary', '2019-07-21', 100, 'Rabbit Care', '9277439572'),
	('David', '2018-01-19', 20, 'Cat Helpers', '5478345265'),
	('Mohammed', '2017-04-19', 30, 'Roger Rescue', '2222334443'),
	('Navid', '2018-08-11', 50, 'SPCA 3', '3982738573'),
	('Essam', '2019-04-28', 100, 'recue pets', '5984829290'),
	('Maryam', '2018-03-15', 20, 'SPCA 2', '5847398734');

	insert into vetvisits values
	('cat vet', 'broken foot', 5, '2019-12-12', '1274855843'),
	('dog vet', 'vomiting', 8, '2018-10-14', '8492756632'),
	('cat vet', 'fever', 5, '2018-02-03', '1274855843'),
	('rodent vet', 'vomiting', 3, '2019-11-21', '4895549032');


	insert into phoneNumbers values
	('6132249088', 'Rabbit Care', '9277439572'),
	('6135543243', 'puppies for parents', '2343598469'),
	('6139483948', 'Cat Helpers', '5478345265'),
	('4939045899', 'hamster shelter', '2948574893'),
	('3928485969', 'Jennifer', '5478345265'),
	('4958478493', 'Mark', '2948574893'),
	('2938479594', 'Hussein', '2343598469'),
	('3902948594', 'John', '9277439572'),
	('3874934988', 'Anne', '9390293899'),
	('9873896348', 'Woody', '8843933844'),
	('3875498587', 'Trevor', '2998987448'),
	('3847459843', 'Andy', '6684744434'),
	('7483784378', 'SPCA 1', '3923874839'),
	('9308377284', 'SPCA 2', '5847398734'),
	('3958393723', 'SPCA 3', '3982738573'),
	('9504383749', 'SPCA 4', '5984829290'),
	('2398749238', 'Roger Rescue', '2222334443'),
	('9938958399', 'Rescue heroes', '8777667887'),
	('3392839332', 'ready to rescue', '2333112212'),
	('3839822983', 'rescue pets', '6904948394'),
	('7738473882', 'Amanda', '3923874839'),
	('9873896123', 'Julio', '5984829290'),
	('3875498343', 'Lebron', '5847398734'),
	('3847459425', 'Kobe', '3982738573'),
	('7483784542', 'Zion', '2222334443'),
	('9308377432', 'Luka', '6904948394'),
	('3958393654', 'Candace', '8777667887'),
	('9504383876', 'Liban', '2333112212');


	insert into SPCA values
	('3923874839'),
	('5847398734'),
	('3982738573'),
	('5984829290');


	insert into rescue values
	('2222334443','3948'),
	('8777667887','3029'),
	('2333112212','5343'),
	('6904948394','8493');

	insert into shelters values
	('www.rabbitcare.com', 'rabits', 30, '9277439572'),
	('www.pforp.com', 'dogs', 20, '2343598469'),
	('www.cathelpers.com', 'cat', 25, '5478345265'),
	('www.hamshelter.com', 'rodents', 60, '2948574893');


	insert into adopters values
	(700, '6684744434'),
	(600, '6684744434'),
	(1000, '8843933844'),
	(1200, '9390293899'),
	(300, '2998987448');


	insert into drivers values
	('Tom','DSGG223', 129839, '3948'),
	('Andrew','FDEG233', 483726, '3029'),
	('Lilly','FGHE763', 393823, '5343'),
	('Ralph','GKIUY982', 948322, '8493');


	insert into emergencyPhoneNumbers values
	('3459884556', 'Tom'),
	('5839485632', 'Andrew'),
	('9384758493', 'Lilly'),
	('2239558879', 'Ralph');
