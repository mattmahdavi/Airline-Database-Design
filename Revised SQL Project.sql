create database ProjectSQLRevise;
Use ProjectSQLRevise;

/*1- Airline*/ 
CREATE TABLE Airline (

AirlineID VARCHAR(3) NOT NULL,

AirlineName VARCHAR(30) NOT NULL,

CONSTRAINT AirlinePK PRIMARY KEY (AirlineID));

INSERT INTO Airline (AirlineID, AirlineName) VALUES

('001', 'American Airlines'),

('002', 'United Airlines'),

('003', 'Delta Air Lines'),

('004', 'Southwest Airlines'),

('005', 'Alaska Airlines'),

('006', 'JetBlue Airways'),

('007', 'Hawaiian Airlines'),

('008', 'Frontier Airlines'),

('009', 'Spirit Airlines'),

('010', 'Allegiant Air'); 

/*2- Airport*/ 
CREATE TABLE Airport (

AirportID VARCHAR(4) NOT NULL,

AirportName VARCHAR(70) NOT NULL,

AirportCity VARCHAR(30) NOT NULL,

AirportCountry VARCHAR(3) NOT NULL,

CONSTRAINT AirportPK PRIMARY KEY(AirportID));

INSERT INTO Airport(AirportID, AirportName, AirportCity, AirportCountry) VALUES

('LAX', 'Los Angeles International Airport', 'Los Angeles', 'USA'),

('JFK', 'John F. Kennedy International Airport', 'New York City', 'USA'),

('ORD', 'O\Hare International Airport', 'Chicago', 'USA'),

('DFW', 'Dallas/Fort Worth International Airport', 'Dallas/Fort Worth', 'USA'),

('DEN', 'Denver International Airport', 'Denver', 'USA'),

('LAS', 'McCarran International Airport', 'Las Vegas', 'USA'),

('ATL', 'Hartsfield-Jackson Atlanta International Airport', 'Atlanta', 'USA'),

('SEA', 'Seattle-Tacoma International Airport', 'Seattle', 'USA'),

('MIA', 'Miami International Airport', 'Miami', 'USA'),

('SFO', 'San Francisco International Airport', 'San Francisco', 'USA'),

('BOS', 'Logan International Airport', 'Boston', 'USA'),

('IAH', 'George Bush Intercontinental Airport', 'Houston', 'USA'),

('DCA', 'Ronald Reagan Washington National Airport', 'Washington D.C.', 'USA'),

('PHX', 'Phoenix Sky Harbor International Airport', 'Phoenix', 'USA'),

('MCO', 'Orlando International Airport', 'Orlando', 'USA'),

('EWR', 'Newark Liberty International Airport', 'Newark', 'USA'),

('SLC', 'Salt Lake City International Airport', 'Salt Lake City', 'USA'),

('BWI', 'Baltimore/Washington International Thurgood Marshall Airport', 'Baltimore', 'USA'),

('TPA', 'Tampa International Airport', 'Tampa', 'USA'),

('LGA', 'LaGuardia Airport', 'New York City', 'USA'); 

/*3- Flight*/

CREATE TABLE Flight (

FlightID VARCHAR(12) NOT NULL,

FlightNumber VARCHAR(8) NOT NULL,

AirlineID VARCHAR(3) NOT NULL,

DepartureAirportID VARCHAR(4) NOT NULL,

DepartureDateTime DATETIME NOT NULL,

ArrivalAirportID VARCHAR(4) NOT NULL,

ArrivalDateTime DATETIME NOT NULL,

FlightDuration VARCHAR(6) NOT NULL,

MaxCapacity INT NOT NULL,

BasePrice DECIMAL(5,2) NOT NULL,

CONSTRAINT FlightPK PRIMARY KEY (FlightID),

CONSTRAINT FlightAirlineFK FOREIGN KEY (AirlineID) REFERENCES Airline(AirlineID),

CONSTRAINT FlightDepAirportFK FOREIGN KEY (DepartureAirportID) REFERENCES Airport(AirportID),

CONSTRAINT FlightArrAirportFK FOREIGN KEY (ArrivalAirportID) REFERENCES Airport(AirportID)

);

INSERT INTO Flight (FlightID, FlightNumber, AirlineID, DepartureAirportID, DepartureDateTime, ArrivalAirportID, ArrivalDateTime, FlightDuration, MaxCapacity, BasePrice)

VALUES

('F001', 'AA001', '001', 'LAX', '2023-04-20 10:00:00', 'JFK', '2023-04-20 18:00:00', '08:00', 200, 250.00),

('F002', 'AA002', '001', 'JFK', '2023-04-21 08:00:00', 'LAX', '2023-04-21 16:00:00', '08:00', 200, 225.00),

('F003', 'UA001', '002', 'ORD', '2023-04-22 12:00:00', 'DFW', '2023-04-22 15:00:00', '03:00', 150, 125.00),

('F004', 'UA002', '002', 'DFW', '2023-04-23 07:00:00', 'ORD', '2023-04-23 10:00:00', '03:00', 150, 135.00),

('F005', 'DL001', '003', 'DEN', '2023-04-24 16:00:00', 'LAS', '2023-04-24 19:00:00', '05:00', 175, 175.00),

('F006', 'DL002', '003', 'LAS', '2023-04-25 11:00:00', 'DEN', '2023-04-25 17:00:00', '06:00', 200, 300.00),

('F007', 'WN001', '004', 'ATL', '2023-04-26 09:00:00', 'SEA', '2023-04-26 12:00:00', '03:00', 150, 95.00),

('F008', 'WN002', '004', 'SEA', '2023-04-27 14:00:00', 'ATL', '2023-04-27 17:00:00', '03:00', 150, 85.00),

('F009', 'AS001', '005', 'MIA', '2023-04-28 10:00:00', 'SFO', '2023-04-28 16:00:00', '06:00', 175, 250.00),

('F010', 'AS002', '005', 'BOS', '2023-04-29 12:00:00', 'IAH', '2023-04-29 18:00:00', '06:00', 175, 225.00),

('F011', 'B6H001', '006', 'IAH', '2023-04-30 08:00:00', 'BOS', '2023-04-30 10:00:00', '02:00', 100, 75.00),

('F012', 'DL003', '003', 'DCA', '2023-04-22 09:00:00', 'PHX', '2023-04-22 17:00:00', '08:00', 180, 215.00),

('F013', 'DL004', '003', 'PHX', '2023-04-23 07:00:00', 'DCA', '2023-04-23 15:00:00', '08:00', 180, 199.00),

('F014', 'UA005', '005', 'ORD', '2023-04-24 11:00:00', 'LAX', '2023-04-24 14:00:00', '03:00', 250, 300.00),

('F015', 'UA006', '005', 'LAX', '2023-04-25 12:00:00', 'ORD', '2023-04-25 15:00:00', '03:00', 250, 275.00),

('F016', 'WN007', '007', 'LGA', '2023-04-26 08:00:00', 'TPA', '2023-04-26 09:00:00', '01:00', 150, 150.00),

('F017', 'WN008', '007', 'TPA', '2023-04-27 09:00:00', 'LGA', '2023-04-27 10:00:00', '01:00', 150, 140.00),

('F018', 'AS009', '009', 'SEA', '2023-04-28 13:00:00', 'LAX', '2023-04-28 15:00:00', '02:00', 200, 225.00),

('F019', 'AS010', '009', 'LAX', '2023-04-29 14:00:00', 'SEA', '2023-04-29 16:00:00', '02:00', 200, 235.00),

('F020', 'B6B011', '010', 'BOS', '2023-04-30 09:00:00', 'JFK', '2023-04-30 10:00:00', '01:00', 100, 95.00)

;

/*4- Customer*/

CREATE TABLE Customer (

CustID VARCHAR(20) NOT NULL,

CustFirstName VARCHAR(45) NOT NULL,

CustLastName VARCHAR(45) NOT NULL,

PhoneNo1 VARCHAR(30) NOT NULL,

PhoneNo2 VARCHAR(30) NULL,

Email VARCHAR(100) NOT NULL,

IDType VARCHAR(20) NOT NULL,

IDNumber VARCHAR(20) NOT NULL,

DOB DATE NOT NULL,

Gender VARCHAR(10) NOT NULL,

Nationality VARCHAR(30) NOT NULL,

--AddressID VARCHAR(20) NOT NULL,

--PaymentID VARCHAR(20) NULL,

RelationCustID VARCHAR(20) NOT NULL,

CONSTRAINT CustomerPk PRIMARY KEY(CustID),

CONSTRAINT RelCustFK FOREIGN KEY (RelationCustID) REFERENCES Customer(CustID)

);

INSERT INTO Customer (CustID, CustFirstName, CustLastName, PhoneNo1, PhoneNo2, Email, IDType, IDNumber, DOB, Gender, Nationality, RelationCustID) VALUES

('C001', 'John', 'Doe', '555-1234', NULL, 'john.doe@example.com', 'Passport', '123456789', '1990-05-20', 'Male', 'American', 'C002'),

('C002', 'Jane', 'Smith', '555-5678', NULL, 'jane.smith@example.com', 'National ID', '987654321', '1995-07-15', 'Female', 'British','C002'),

('C003', 'Bob', 'Johnson', '555-9876', NULL, 'bob.johnson@example.com', 'Driver License', '456789123', '1985-02-28', 'Male', 'Canadian',  'C004'),

('C004', 'Sarah', 'Lee', '555-2345', '555-6789', 'sarah.lee@example.com', 'Passport', '789123456', '2000-09-10', 'Female', 'Korean',  'C001'),

('C005', 'David', 'Kim', '555-8765', NULL, 'david.kim@example.com', 'National ID', '654123789', '1998-11-30', 'Male', 'Korean',  'C005'),

('C006', 'Mary', 'Jones', '555-3456', NULL, 'mary.jones@example.com', 'Driver License', '321987654', '1975-06-03', 'Female', 'American',  'C006'),

('C007', 'Tom', 'Brown', '555-6543', NULL, 'tom.brown@example.com', 'Passport', '369852147', '1993-04-12', 'Male', 'British',  'C008'),

('C008', 'Kate', 'Wong', '555-7890', '555-4567', 'kate.wong@example.com', 'National ID', '258741369', '1988-08-08', 'Female', 'Chinese',  'C008'),

('C009', 'Michael', 'Chen', '555-4321', NULL, 'michael.chen@example.com', 'Driver License', '741852963', '1996-01-25', 'Male', 'Chinese',  'C001'),

('C010', 'Samantha', 'Garcia', '555-8901', NULL, 'samantha.garcia@example.com', 'Passport', '159357246', '1992-12-20', 'Female', 'Mexican',  'C006'),

('C011', 'Daniel', 'Rodriguez', '555-6789', NULL, 'daniel.rodriguez@example.com', 'National ID', '357159864', '1980-09-08', 'Male', 'Mexican',  'C012'),

('C012', 'Emily', 'Nguyen', '555-2345', NULL, 'emily.nguyen@example.com', 'National ID', '123789456', '1997-03-15', 'Female', 'Vietnamese', 'C012'),

('C013', 'Aiden', 'Wilson', '555-8765', NULL, 'aiden.wilson@example.com', 'Driver License', '258963147', '1983-08-20', 'Male', 'American',  'C013'),

('C014', 'Olivia', 'Garcia', '555-3456', NULL, 'olivia.garcia@example.com', 'Passport', '753951486', '2001-05-03', 'Female', 'Mexican',  'C014'),

('C015', 'James', 'Kwok', '555-6543', NULL, 'james.kwok@example.com', 'National ID', '951753864', '1994-11-18', 'Male', 'Hong Kong',  'C019'),

('C016', 'Isabella', 'Cheung', '555-7890', NULL, 'isabella.cheung@example.com', 'Driver License', '369874125', '1992-01-01', 'Female', 'Hong Kong',  'C016'),

('C017', 'Ethan', 'Singh', '555-4321', '555-5678', 'ethan.singh@example.com', 'Passport', '852963741', '1999-07-10', 'Male', 'Indian',  'C021'),

('C018', 'Aria', 'Patel', '555-6789', NULL, 'aria.patel@example.com', 'National ID', '456321789', '1989-12-25', 'Female', 'Indian', 'C018'),

('C019', 'Lucas', 'Lee', '555-2345', '555-6789', 'lucas.lee@example.com', 'Driver License', '654789321', '1986-04-05', 'Male', 'Korean',  'C019'),

('C020', 'Mia', 'Kim', '555-9876', NULL, 'mia.kim@example.com', 'Passport', '987654321', '1998-02-12', 'Female', 'Korean',  'C020'),

('C021', 'Daniel', 'Nguyen', '555-3456', NULL, 'daniel.nguyen@example.com', 'National ID', '456123789', '1980-09-08', 'Male', 'Vietnamese',  'C019'),

('C022', 'Sophia', 'Tran', '555-6543', '555-7890', 'sophia.tran@example.com', 'Driver License', '123456789', '1995-06-28', 'Female', 'Vietnamese',  'C022'); 

/*5- Ticket*/

CREATE TABLE Ticket (

TicketID VARCHAR(20) NOT NULL,

CustID VARCHAR(20) NOT NULL,

DateOfPurchase DATE NOT NULL,

CONSTRAINT TicketPK PRIMARY KEY (TicketID),

CONSTRAINT TicketCustFK FOREIGN KEY (CustID) REFERENCES Customer(CustID)

);

INSERT INTO Ticket (TicketID, CustID, DateOfPurchase) VALUES

('T001', 'C001', '2023-04-01'),

('T002', 'C002', '2023-04-01'),

('T003', 'C003', '2023-04-02'),

('T004', 'C004', '2023-04-02'),

('T005', 'C005', '2023-04-03'),

('T006', 'C006', '2023-04-03'),

('T007', 'C007', '2023-04-04'),

('T008', 'C008', '2023-04-04'),

('T009', 'C009', '2023-04-05'),

('T010', 'C010', '2023-04-05'),

('T011', 'C011', '2023-04-06'),

('T012', 'C012', '2023-04-06'),

('T013', 'C013', '2023-04-07'),

('T014', 'C014', '2023-04-07'),

('T015', 'C015', '2023-04-08'),

('T016', 'C016', '2023-04-08'),

('T017', 'C017', '2023-04-09'),

('T018', 'C018', '2023-04-09'),

('T019', 'C019', '2023-04-10'),

('T020', 'C020', '2023-04-10'),

('T021', 'C021', '2023-04-11'),

('T022', 'C022', '2023-04-11')

; 

drop table Ticket

/*6- TripDetails*/

CREATE TABLE TripDetails (

FlightID VARCHAR(12) NOT NULL,

TicketID VARCHAR(20) NOT NULL,

CONSTRAINT TripFlightTicketPK PRIMARY KEY (FlightID, TicketID),
/*CONSTRAINT FlightFK FOREIGN KEY (FlightID) REFERENCES Flight
                      ON DELETE CASCADE
                      ON UPDATE CASCADE,

CONSTRAINT TicketFK FOREIGN KEY (TicketID) REFERENCES Ticket
                      ON DELETE CASCADE
                      ON UPDATE CASCADE 
*/
);

INSERT INTO TripDetails (FlightID, TicketID)

VALUES

('F001', 'T001'),

('F001', 'T002'),

('F002', 'T003'),

('F002', 'T004'),

('F003', 'T005'),

('F003', 'T006'),

('F004', 'T007'),

('F004', 'T008'),

('F005', 'T009'),

('F005', 'T010'),

('F006', 'T011'),

('F006', 'T012'),

('F007', 'T013'),

('F007', 'T014'),

('F008', 'T015'),

('F008', 'T016'),

('F009', 'T017'),

('F009', 'T018'),

('F010', 'T019'); 

/*7- Catering*/

CREATE TABLE Catering (

MealID VARCHAR(20) NOT NULL,

FlightID VARCHAR(12) NOT NULL,

TicketID VARCHAR(20) NOT NULL,

MealType VARCHAR(30) NOT NULL,

Price DECIMAL(5,2) NULL,

CONSTRAINT CateringPK PRIMARY KEY (MealID),

CONSTRAINT CateringTicketFlightFK FOREIGN KEY (FlightID, TicketID) REFERENCES TripDetails(FlightID, TicketID)

);

INSERT INTO Catering (MealID, FlightID, TicketID, MealType, Price) VALUES

('M001', 'F001', 'T001', 'Vegetarian', 10.50),

('M002', 'F001', 'T002', 'Gluten-Free', 12.00),

('M003', 'F002', 'T003', 'Kosher', 13.75),

('M004', 'F002', 'T004', 'Halal', 15.25),

('M005', 'F003', 'T005', 'Vegetarian', 10.50),

('M006', 'F003', 'T006', 'Gluten-Free', 12.00),

('M007', 'F004', 'T007', 'Kosher', 13.75),

('M008', 'F004', 'T008', 'Halal', 15.25),

('M009', 'F005', 'T009', 'Vegetarian', 10.50),

('M010', 'F005', 'T010', 'Gluten-Free', 12.00),

('M011', 'F006', 'T011', 'Kosher', 13.75),

('M012', 'F006', 'T012', 'Halal', 15.25),

('M013', 'F007', 'T013', 'Vegetarian', 10.50),

('M014', 'F007', 'T014', 'Gluten-Free', 12.00),

('M015', 'F008', 'T015', 'Kosher', 13.75),

('M016', 'F008', 'T016', 'Halal', 15.25),

('M017', 'F009', 'T017', 'Vegetarian', 10.50),

('M018', 'F009', 'T018', 'Gluten-Free', 12.00),

('M019', 'F010', 'T019', 'Kosher', 13.75)

;


/*8- Baggage*/

CREATE TABLE Baggage (

BaggageID VARCHAR(20) NOT NULL,

FlightID VARCHAR(12) NOT NULL,

TicketID VARCHAR(20) NOT NULL,

BaggageWeight DECIMAL(7,2) NOT NULL,

BaggageFees DECIMAL(7,2) NOT NULL,

CONSTRAINT BaggagePK PRIMARY KEY (BaggageID),

CONSTRAINT Baggage_TicketFlightFK FOREIGN KEY (FlightID, TicketID) REFERENCES TripDetails(FlightID, TicketID)

);

INSERT INTO Baggage (BaggageID, FlightID, TicketID, BaggageWeight, BaggageFees)

VALUES

('B001', 'F001', 'T001', 23.5, 50.00),

('B002', 'F001', 'T002', 18.0, 50.0),

('B003', 'F002', 'T003', 22.0, 40.0),

('B004', 'F002', 'T004', 21.0, 40.0),

('B005', 'F003', 'T005', 20.0, 50.0),

('B006', 'F003', 'T006', 19.0, 50.0),

('B007', 'F004', 'T007', 5.0, 10.0),

('B008', 'F004', 'T008', 0.0, 0.0),

('B009', 'F005', 'T009', 0.0, 0.0),

('B010', 'F005', 'T010', 0.0, 0.0),

('B011', 'F006', 'T011', 0.0, 0.0),

('B012', 'F006', 'T012', 0.0, 0.0),

('B013', 'F007', 'T013', 0.0, 0.0),

('B014', 'F007', 'T014', 0.0, 0.0),

('B015', 'F008', 'T015', 0.0, 0.0),

('B016', 'F008', 'T016', 0.0, 0.0),

('B017', 'F009', 'T017', 0.0, 0.0),

('B018', 'F009', 'T018', 18.0, 50.0),

('B019', 'F010', 'T019', 17.0, 40.0); 


/*9- Insurance*/

CREATE TABLE Insurance (

InsuranceID VARCHAR(10) NOT NULL,

FlightID VARCHAR(12) NOT NULL,

TicketID VARCHAR(20) NOT NULL,

Coverage VARCHAR(10) NULL,

Premium DECIMAL(5,2) NOT NULL,

CONSTRAINT InsurancePK PRIMARY KEY (InsuranceID),

CONSTRAINT InsuranceTicketFlightFK FOREIGN KEY (FlightID, TicketID) REFERENCES TripDetails (FlightID, TicketID)

);

INSERT INTO Insurance (InsuranceID, FlightID, TicketID, Coverage, Premium)

VALUES

('INS-001', 'F001', 'T001', 'Basic', 50.00),

('INS-002', 'F001', 'T002', 'Premium', 100.00),

('INS-003', 'F002', 'T003', 'Basic', 50.00),

('INS-004', 'F002', 'T004', 'Premium', 100.00),

('INS-005', 'F003', 'T005', 'Basic', 50.00),

('INS-006', 'F003', 'T006', 'Premium', 100.00),

('INS-007', 'F004', 'T007', 'Basic', 50.00),

('INS-008', 'F004', 'T008', 'Premium', 100.00),

('INS-009', 'F005', 'T009', 'Basic', 50.00),

('INS-010', 'F005', 'T010', 'Premium', 100.00),

('INS-011', 'F006', 'T011', 'Basic', 50.00),

('INS-012', 'F006', 'T012', 'Premium', 100.00),

('INS-013', 'F007', 'T013', 'Basic', 50.00),

('INS-014', 'F007', 'T014', 'Premium', 100.00),

('INS-016', 'F008', 'T015', 'Basic', 50.00),

('INS-017', 'F008', 'T016', 'Basic', 50.00),

('INS-018', 'F009', 'T017', 'Basic', 50.00),

('INS-019', 'F009', 'T018', 'Basic', 50.00)

;


/*10- Address*/

CREATE TABLE Address (

AddressID VARCHAR(20) NOT NULL,

CustID VARCHAR(20) NOT NULL,

AddressType VARCHAR(10) NOT NULL,

AddressLine1 VARCHAR(75) NOT NULL,

AddressLine2 VARCHAR(75) NULL,

City VARCHAR(18) NOT NULL,

State VARCHAR(10) NOT NULL,

ZipCode VARCHAR(10) NOT NULL,

Country VARCHAR(3) NOT NULL,

CONSTRAINT AddressPK PRIMARY KEY (AddressID),

CONSTRAINT AddressCustFK FOREIGN KEY (CustID) REFERENCES Customer);

INSERT INTO Address (AddressID, CustID, AddressType, AddressLine1, AddressLine2, City, State, ZipCode, Country)

VALUES

('ADD-001', 'C001', 'Home', '123 Main St', NULL, 'New York', 'NY', '10001', 'USA'),

('ADD-002', 'C002', 'Home', '456 Park Ave', NULL, 'Los Angeles', 'CA', '90001', 'USA'),

('ADD-003', 'C003', 'Office', '789 Broadway', NULL, 'Chicago', 'IL', '60601', 'USA'),

('ADD-004', 'C004', 'Office', '1011 State St', NULL, 'Houston', 'TX', '77001', 'USA'),

('ADD-005', 'C005', 'Home', '1213 Ocean Dr', 'apt132', 'Miami', 'FL', '33101', 'USA'),

('ADD-006', 'C006', 'Home', '1415 Sunset Blvd', NULL, 'San Francisco', 'CA', '94101', 'USA'),

('ADD-007', 'C007', 'Office', '1617 Market St', NULL, 'Boston', 'MA', '02101', 'USA'),

('ADD-008', 'C008', 'Office', '1819 Main St', NULL, 'Seattle', 'WA', '98101', 'USA'),

('ADD-009', 'C009', 'Home', '2021 Highland Ave', NULL, 'Denver', 'CO', '80201', 'USA'),

('ADD-010', 'C010', 'Home', '2223 Lake Shore Dr', NULL, 'Orlando', 'FL', '32801', 'USA'),

('ADD-011', 'C011', 'Office', '2425 Vine St', NULL, 'Atlanta', 'GA', '30301', 'USA'),

('ADD-012', 'C012', 'Office', '2627 Madison Ave', NULL, 'Dallas', 'TX', '75201', 'USA'),

('ADD-013', 'C013', 'Home', '2829 Elm St', 'apt503', 'Philadelphia', 'PA', '19101', 'USA'),

('ADD-014', 'C014', 'Home', '3031 Michigan Ave', NULL, 'Phoenix', 'AZ', '85001', 'USA'),

('ADD-015', 'C015', 'Office', '3233 Broadway', NULL, 'San Diego', 'CA', '92101', 'USA'),

('ADD-016', 'C016', 'Office', '3435 Washington St', NULL, 'Portland', 'OR', '97201', 'USA'),

('ADD-017', 'C017', 'Home', '3637 Chestnut St', NULL, 'Las Vegas', 'NV', '89101', 'USA'),

('ADD-018', 'C018', 'Home', '3839 Peachtree Rd', 'unit 45', 'Charlotte', 'NC', '28201', 'USA'),

('ADD-019', 'C019', 'Office', '4041 Wilshire Blvd', NULL, 'Austin', 'TX', '78701', 'USA'),

('ADD-020', 'C020', 'Office', '4243 Michigan Ave', NULL, 'Washington', 'DC', '20001', 'USA'); 



/*11- Payment*/

CREATE TABLE Payment (

PaymentID VARCHAR(20) NOT NULL,

CustID VARCHAR(20) NOT NULL,

AddressID VARCHAR(20) NOT NULL,

CardFirstName VARCHAR(45) NOT NULL,

CardLastName VARCHAR(45) NOT NULL,

CardType VARCHAR(20) NOT NULL,

CardNumber VARCHAR(20) NOT NULL,

CVV INT NOT NULL,

ExpirationDate DATE NOT NULL,

BillingZipCode VARCHAR(10) NOT NULL,

CONSTRAINT PaymentPK PRIMARY KEY (PaymentID),

CONSTRAINT PaymentCustFK FOREIGN KEY (CustID) REFERENCES Customer,

CONSTRAINT PaymentAddressFK FOREIGN KEY(AddressID) REFERENCES Address)

;

INSERT INTO Payment (PaymentID, CustID, AddressID, CardFirstName, CardLastName, CardType, CardNumber, CVV, ExpirationDate, BillingZipCode)

VALUES

('PAY-001', 'C001', 'ADD-001', 'John', 'Doe', 'Visa', '1234567890123456', '123', '2025-01-01', '10001'),

('PAY-002', 'C002', 'ADD-002', 'Jane', 'Smith', 'Mastercard', '2345678901234567', '234', '2024-05-01', '90001'),

('PAY-003', 'C003', 'ADD-003', 'Bob', 'Johnson', 'Discover', '3456789012345678', '345', '2023-12-01', '60601'),

('PAY-004', 'C004', 'ADD-004', 'Sarah', 'Lee', 'American Express', '4567890123456789', '456', '2025-06-01', '77001'),

('PAY-005', 'C005', 'ADD-005', 'David', 'Kim', 'Visa', '5678901234567890', '567', '2026-03-01', '33101'),

('PAY-006', 'C006', 'ADD-006', 'Mary', 'Johns', 'Mastercard', '6789012345678901', '678', '2024-02-01', '94101'),

('PAY-007', 'C007', 'ADD-007', 'Tom', 'Brown', 'Discover', '7890123456789012', '789', '2023-11-01', '02101'),

('PAY-008', 'C008', 'ADD-008', 'Kate', 'Wong', 'American Express', '8901234567890123', '890', '2025-07-01', '98101'),

('PAY-009', 'C009', 'ADD-009', 'Michael', 'Chain', 'Visa', '9012345678901234', '901', '2026-04-01', '80201'),

('PAY-010', 'C010', 'ADD-010', 'Samantha', 'Garcia', 'Mastercard', '0123456789012345', '012', '2024-03-01', '32801'),

('PAY-011', 'C011', 'ADD-011', 'Daniel', 'Rodriguez', 'Discover', '1234567890123456', '123', '2023-12-01', '30301'),

('PAY-012', 'C012', 'ADD-012', 'Emily', 'Nguyen', 'American Express', '2345678901234567', '234', '2025-08-01', '75201'),

('PAY-013', 'C013', 'ADD-013', 'Aiden', 'Wilson', 'Visa', '3456789012345678', '345', '2026-05-01', '19101'),

('PAY-014', 'C014', 'ADD-014', 'Olivia', 'Garcia', 'Mastercard', '4567890123456789', '456', '2024-04-01', '85001'),

('PAY-015', 'C015', 'ADD-015', 'James', 'Kwork', 'Discover', '5678901234567890', '567', '2023-11-01', '92101'); 


