--Tables

--Customer Table
create table customer_m(
	Customer_id	SERIAL primary key not null,
	First_name VARCHAR(100),
	Last_name VARCHAR(100),
	Phone VARCHAR (12),
	Address VARCHAR(200),
	City VARCHAR(50)
);
-- Sale Person Table
create table sale_person_m(
	Employees_id SERIAL primary key not null,
	First_name VARCHAR(100),
	Last_name VARCHAR (100)
);
--Mechanic Table
create table mechanic_m(
	Mechanic_id SERIAL primary key not null,
	First_name VARCHAR(100),
	Last_name VARCHAR(100)
);
--Car Inventory Table
create table car_info_m(
	Car_Serial_Number SERIAL primary key not null,
	Make VARCHAR(100),
	Model VARCHAR(100),
	Car_year VARCHAR(4),
	Mileage	INT,
	Vehicle_Price NUMERIC(8,2) not null
);
-- Ticket Service Table
create table ticket_service_m(
	Ticket_id SERIAL primary key,
	Date_Service DATE not null,
	Car_Serial_Number INTEGER,--FK
	Mechanic_id INTEGER, -- FK
	Customer_id INTEGER, -- FK
	Total_Cost  NUMERIC(8,2) not null,
	Note VARCHAR(200),
	foreign key (Car_Serial_Number) references car_info_m ,
	foreign key (Mechanic_id) references mechanic_m ,
	foreign key (Customer_id) references customer_m 
);
-- Mechanic Services Table
create table mechanic_service_m(
	Service_id SERIAL primary key not null,
	Mechanic_id INTEGER, -- FK 
	Car_Serial_Number INTEGER, -- FK 
	Ticket_id INTEGER, -- FK 
	Customer_id INTEGER, --FK 
	Service_Date DATE not null,
	Mechanic_Notes VARCHAR(100),
	foreign key(Mechanic_id) references mechanic_m,
	foreign key (Car_Serial_Number) references car_info_m,
	foreign key (Ticket_id) references ticket_service_m,
	foreign key (Customer_id) references customer_m 
);
--Invoice Table
create table invoice_m(
	Invoice_id SERIAL primary key not null, 
	Sale_Date DATE not null,
	Car_Serial_Number INTEGER, -- FK
	Customer_id INTEGER, -- FK
	Employee_id INTEGER, -- FK
	Service_id INTEGER, -- FK
	Total_Sale NUMERIC(8,2) not null,
	foreign key(Car_Serial_Number) references car_info_m,
	foreign key (Customer_id) references customer_m,
	foreign key (Employee_id) references sale_person_m,
	foreign key (Service_id) references mechanic_service_m 
);


--Information Insert

--Insert Customer

insert into customer_m(Customer_id,First_name,Last_name,Phone,Address,City
)values(1,'Michael','Woods','801-234-3456','4312 Lakewood Drive','Newark,NJ');
insert into customer_m(Customer_id,First_name,Last_name,Phone,Address,City
)values(2,'Laura','Torres','787-435-0980','2093 Lakewood Drive','Sayreville,NJ');
insert into customer_m(Customer_id,First_name,Last_name,Phone,Address,City
)values(3,'Walter','Melendez','901-432-2345','4119 Mahlon Street','West Osbornsville,NJ');

--Insert Sales Person

insert into sale_person_m(Employees_id,First_name,Last_name
)VALUES(1,'Amanda','Rivera');
insert into sale_person_m(Employees_id,First_name,Last_name
)VALUES(2,'Robert','Flick');
insert into sale_person_m(Employees_id,First_name,Last_name
)VALUES(3,'Mark','Smith')
select *
from sale_person_m ;
--Insert Mechanic

insert into mechanic_m(Mechanic_id,First_name,Last_name
)VALUES(23,'Matthew','Garret');
insert into mechanic_m(Mechanic_id,First_name,Last_name
)VALUES(12,'Mike','Bowman');
insert into mechanic_m(Mechanic_id,First_name,Last_name
)VALUES(45,'Mia','Shepherd');

--Insert Car Info

insert into car_info_m(Car_Serial_Number,Make,Model,Car_year,Mileage,Vehicle_Price
)Values(69,'Toyota','Rav4',2020,'12235',25300.00);
insert into car_info_m(Car_Serial_Number,Make,Model,Car_year,Mileage,Vehicle_Price
)VALUES(127,'Honda','Civic',2023,'0',27000.00);
insert into car_info_m(Car_Serial_Number,Make,Model,Car_year,Mileage,Vehicle_Price
)VALUES(189,'Ford','Fusion',2021,'10000',22200.00);

--Insert Ticket Service

insert into ticket_service_m(Ticket_id,Date_Service,Car_Serial_Number,Mechanic_id,Customer_id,Total_Cost,Note
)VALUES(1,'2023-01-04',69,45,3,300.54,'Customer Said that the brake are making a sound');
insert into ticket_service_m(Ticket_id,Date_Service,Car_Serial_Number,Mechanic_id,Customer_id,Total_Cost,Note
)VALUES(2,'2023-01-23',189,12,2,75.00,'Client wants a Check up');

--Insert Mechanic Services

insert into mechanic_service_m(Service_id,Mechanic_id,Car_Serial_Number,Ticket_id,Customer_id,Service_Date,Mechanic_notes
)VALUES(12,45,69,1,3,'2023-01-04','New brake pads added,recommend a change of disk brake in the next visit');
insert into mechanic_service_m(Service_id,Mechanic_id,Car_Serial_Number,Ticket_id,Customer_id,Service_Date,Mechanic_notes
)VALUES(34,12,189,2,2,'2023-01-23','Nothing wrong with the Vehicle, recommended change of tires');

--Insert Invoice

insert into invoice_m(Invoice_id,Sale_Date,Car_Serial_Number,Customer_id,Employee_id,Service_id,Total_Sale
)VALUES(20,'2023-01-04',69,3,3,12,300.54);
insert into invoice_m(Invoice_id,Sale_Date,Car_Serial_Number,Customer_id,Employee_id,Service_id,Total_Sale
)VALUES(40,'2023-01-23',189,2,2,34,75.00);

