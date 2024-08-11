show databases;
create schema FarmManagerAndAnalyzer;
use FarmManagerAndAnalyzer;
      /*FOR ORGANIZATION*/
CREATE TABLE Organization(
    OrganizationID INT NOT NULL AUTO_INCREMENT,
    Names VARCHAR(45),
    Locations varchar(45),
    Contact VARCHAR(45),
    City varchar(45),
    PRIMARY KEY(OrganizationID)
);
         /*FOR ADDRESS*/
CREATE TABLE Address(
    AddressID INT AUTO_INCREMENT,
    PhoneNo varchar(45),
    Email varchar(45),
    Zipcode varchar(5),
    Locations varchar(45),
    PRIMARY KEY(AddressID)
    
);
           /*FOR SUPPLIER*/
CREATE TABLE Supplier(
    SupplierID INT NOT NULL AUTO_INCREMENT,
    Types varchar(45),
    Names varchar(45),
    AddressID INT,    
    OrganizationID INT,
	PRIMARY KEY(SupplierID),
    CONSTRAINT Supplier_FK1 FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
    CONSTRAINT Supplier_FK2 FOREIGN KEY (OrganizationID) REFERENCES Organization(OrganizationID)
);
         /*FOR SHIFT*/
CREATE TABLE Shift(
    ShiftID int,
    StartTime TIME,
    EndTime TIME,
    BreakTime TIME,
    PRIMARY KEY(ShiftID)
);
      /*FOR FARMER*/
CREATE TABLE Farmer(
    FarmerID INT NOT NULL AUTO_INCREMENT,
    Names varchar(45),
    AddressID int,
    Salary int, 
    ShiftID int,
    OrganizationID int,
	PRIMARY KEY(FarmerID),  
    CONSTRAINT Farmer_FK FOREIGN KEY (AddressID) REFERENCES Address(AddressID), 
    CONSTRAINT Farmer_FK2 FOREIGN KEY (ShiftID) REFERENCES Shift(ShiftID),
    CONSTRAINT Farmer_FK1 FOREIGN KEY (OrganizationID) REFERENCES Organization(OrganizationID)
);
        /*FOR ANIMAL*/
CREATE TABLE Animal(
    AnimalID int,
    MonthlyFeed int,
    Cost int,
    Health VARCHAR(45),
    FarmerID int,
	PRIMARY KEY(AnimalID),  
    CONSTRAINT Animal_FK FOREIGN KEY(FarmerID) REFERENCES Farmer(FarmerID)
    );
       /*FOR DAIRY PRODUCT*/
CREATE TABLE DairyProduct(
    DairyProductID int,
    Names varchar(45),
	Price int,
    Types VARCHAR(45),
    OrganizationID int,
    PRIMARY KEY(DairyProductID),
    CONSTRAINT DairyProduct_FK FOREIGN KEY(OrganizationID) REFERENCES Organization(OrganizationID)
);
               /*FOR ANIMAL TRANSACTION*/
CREATE TABLE AnimalTransaction(
    AnimalTransactionID int,
    Quantity int,
    Price int,
    Time datetime,
    SupplierID int,
    AnimalID int,
    FarmerID int,
    PRIMARY KEY(AnimalTransactionID),
    CONSTRAINT AnimalTransaction_FK FOREIGN KEY (FarmerID) REFERENCES Farmer(FarmerID),
	CONSTRAINT AnimalTransaction_FK1 FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
	CONSTRAINT AnimalTransaction_FK2 FOREIGN KEY (AnimalID) REFERENCES Animal(AnimalID)
);
            /*NOW INSERT THE DATA*/
         /*INSERT INTO ORGANIZATION*/
Select *from Organization;   
INSERT INTO Organization(Names, Locations, Contact, City) 
VALUES('Alhamad Dairy Farm','Sumandari, Faisalabad',0301-01010,'FAISLABAD'),
	  ('Hamad Dairy Farm','Sumandari, Punjab',0301-01010,'FAISLABAD'),
	  ('Cattle Farm','KPK',0323-024540,'PESHAWAR'),
	  ('Cargill','15407 McGinty Rd W Wayzata 55391 Minnesota US',9232-009232,'LAHORE'),
	  ('Optasia','JLT Dubai AE',0323-024540,'ISLAMABAD');   
           /*INSERT INTO ADDRESSES*/
Select *from Address;
INSERT INTO Address(PhoneNo,Email,Zipcode,Locations ) 
VALUES(021893223,'apply.farmer@gmail.com',923,'ISLAMABAD'),           /*For supplier*/
	  (092303923,'farmer.work@gmail.com',503,'FAISLABAD'),            /*For supplier*/
      (238929382,'dairy.farm@gmail.com',382,'LAHORE'),                /*For supplier*/
      (021893223,'dairy.cattle@gmail.com',223,'FAISLABAD'),           /*For Farmer*/
      (092303923,'farmer.manager@gmail.com',789,'ISLAMABAD'),         /*For Farmer*/
	  (8938929382,'baig.farm@gmail.com',512,'LAHORE');                /*For Farmer*/
      /*INSERT INTO SUPPLIER*/
Select *from Supplier;
INSERT INTO  Supplier(Types,Names,AddressID,OrganizationID) 
VALUES('Goats','Amjad',1,1),
	  ('Chicken','Ali',2,1),
	  ('Buffalos','Fasial',3,2);
        /*INSERT INTO SHIFT*/
Select *from Shift;
INSERT INTO  Shift (ShiftID, StartTime, EndTIme,BreakTime)
 VALUES (1,'07:00:00','15:00:00','13:30:00'),
        (2,'15:00:00','23:00:00','17:00:00'),
        (3,'22:00:00','7:00:00','2:30:00');
        /*INSERT INTO FAEMER*/
Select *from Farmer;
INSERT INTO Farmer(Names,AddressID,Salary, ShiftID, OrganizationID) 
VALUES('Amjad',4,3040,1,1),
      ('Sarim',5,3010,2,2),
      ('Hammad',6,3200,3,2);   
         /*INSERT INTO ANIMAL*/
Select *from Animal;
Select * from Farmer;
INSERT INTO Animal(AnimalID,MonthlyFeed,Cost,Health,FarmerID) 
VALUES(1,4000,3040,'Fine',4),
      (2,500,3010,'Fever',4),
      (3,600,3200,'Fine',5);
        /*INSERT INTO DAIRY PRODUCT*/
Select *from DairyProduct;
INSERT INTO DairyProduct(DairyProductID,Names,Price,Types,OrganizationID)
VALUES(1,'Milk',120,'dairy',1),
      (2,'Dhai',10,'dairy',2),
	  (3,'Lasi',20,'dairy',3);
	     /*INSERT INTO ANIMAL TRANSACTION*/
Select *from AnimalTransaction;
INSERT INTO  AnimalTransaction(AnimalTransactionID,Quantity,Price,SupplierID,AnimalID) 
    VALUES (01,25,12220,1,1),
           (02,16,6103,2,2),
		   (03,2,2313,3,3); 

select * From Organization;
select * From Address;
select * From Supplier;
select * From Shift;
select * From Farmer;
select * From Animal;
select * From DairyProduct;
select * From AnimalTransaction;