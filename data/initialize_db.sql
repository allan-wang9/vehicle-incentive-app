BEGIN TRANSACTION;

-- Drop table if exists
DROP TABLE IF EXISTS Manufacturer;
DROP TABLE IF EXISTS Classification;
DROP TABLE IF EXISTS Region;
DROP TABLE IF EXISTS Model;
DROP TABLE IF EXISTS Incentive;
DROP TABLE IF EXISTS TypeOf;
DROP TABLE IF EXISTS PurchasedIn;

-- Create tables, references and insert data

-- MANUFACTURER
CREATE TABLE Manufacturer(
    Brand TEXT NOT NULL,
    Country TEXT NOT NULL,
    PRIMARY KEY (Brand)
);

INSERT INTO Manufacturer VALUES ('Audi', 'Germany');
INSERT INTO Manufacturer VALUES ('BMW', 'Germany');
INSERT INTO Manufacturer VALUES ('Chevrolet', 'USA');
INSERT INTO Manufacturer VALUES ('Chrysler', 'USA');
INSERT INTO Manufacturer VALUES ('Ford', 'USA');
INSERT INTO Manufacturer VALUES ('Honda', 'Japan');
INSERT INTO Manufacturer VALUES ('Hyundai', 'South Korea');
INSERT INTO Manufacturer VALUES ('Kia', 'South Korea');
INSERT INTO Manufacturer VALUES ('Mitsubishi', 'Japan');
INSERT INTO Manufacturer VALUES ('Nissan', 'Japan');
INSERT INTO Manufacturer VALUES ('Toyota', 'Japan');
INSERT INTO Manufacturer VALUES ('Tesla', 'USA');
INSERT INTO Manufacturer VALUES ('Volkswagen', 'Germany');

-- CLASSIFICATION 
CREATE TABLE Classification(
    Type TEXT NOT NULL,
    TypeDescription TEXT NOT NULL,
    PRIMARY KEY (Type)
);

INSERT INTO CLASSIFICATION VALUES ('BEV', 'Battery electric vehicle');
INSERT INTO CLASSIFICATION VALUES ('PHEV', 'Plug-in hybrid electric vehicles');
INSERT INTO CLASSIFICATION VALUES ('H', 'Hydrogen vehicle');

-- REGION
CREATE TABLE Region(
    Province TEXT NOT NULL,
    Limitations TEXT NOT NULL,
    PRIMARY KEY (Province)
);

INSERT INTO Region VALUES ('Alberta', 'None');
INSERT INTO Region VALUES ('British Columbia', 'None');
INSERT INTO Region VALUES ('Manitoba', 'None');
INSERT INTO Region VALUES ('New Brunswick', 'None');
INSERT INTO Region VALUES ('Newfoundland and Labrador', 'None');
INSERT INTO Region VALUES ('Nova Scotia', 'None');
INSERT INTO Region VALUES ('Ontario', 'None');
INSERT INTO Region VALUES ('Prince Edward Island', 'None');
INSERT INTO Region VALUES ('Quebec', 'None');
INSERT INTO Region VALUES ('Saskatchewan', 'None');

-- MODEL
CREATE TABLE Model(
    Model_ID INTEGER NOT NULL,
    Brand TEXT NOT NULL,
    Model_Name TEXT NOT NULL,
    Range INTEGER NOT NULL,
    Acceleration REAL NOT NULL,
    Price REAL NOT NULL,
    Type TYPE NOT NULL,
    PRIMARY KEY (Model_ID),
    FOREIGN KEY (Brand) REFERENCES Manufacturer(Brand)
);

-- Ontario models 
INSERT INTO Model VALUES (1, 'Audi', 'A3 Sportback e-tron', 50, 7.1, 40475, 'PHEV');
INSERT INTO Model VALUES (2, 'Toyota', 'Prius Prime', 40, 7.3, 33750, 'PHEV');
INSERT INTO Model VALUES (3, 'Volkswagen', 'ID.4', 386, 7.6, 44995, 'BEV');
INSERT INTO Model VALUES (4, 'Tesla', 'Model 3', 430, 6.1, 61380, 'BEV');

-- British Columbia models
INSERT INTO Model VALUES (5, 'Audi', 'A3 Sportback e-tron', 50, 7.1, 40475, 'PHEV');
INSERT INTO Model VALUES (6, 'Toyota', 'Prius Prime', 40, 7.3, 33750, 'PHEV');
INSERT INTO Model VALUES (7, 'Volkswagen', 'ID.4', 386, 7.6, 44995, 'BEV');
INSERT INTO Model VALUES (8, 'Tesla', 'Model 3', 430, 6.1, 61380, 'BEV');

-- Quebec models 
INSERT INTO Model VALUES (9, 'Audi', 'A3 Sportback e-tron', 50, 7.1, 40475, 'PHEV');
INSERT INTO Model VALUES (10, 'Toyota', 'Prius Prime', 40, 7.3, 33750, 'PHEV');
INSERT INTO Model VALUES (11, 'Volkswagen', 'ID.4', 386, 7.6, 44995, 'BEV');
INSERT INTO Model VALUES (12, 'Tesla', 'Model 3', 430, 6.1, 61380, 'BEV');
INSERT INTO Model VALUES (41, 'BMW', 'X3 xDrive30e', 51, 5.4, 54990, 'PHEV');
INSERT INTO Model VALUES (42, 'BMW', '330e', 37, 5.0, 44990, 'PHEV');
INSERT INTO Model VALUES (43, 'Chevrolet', 'Bolt EV', 417, 6.2, 38198, 'BEV');
INSERT INTO Model VALUES (44, 'Ford', 'Mustang Mach-E', 340, 5.2, 51495, 'BEV');
INSERT INTO Model VALUES (45, 'Hyundai', 'IONIQ 5', 354, 5.1, 44990, 'BEV');
INSERT INTO Model VALUES (46, 'Nissan', 'Leaf', 243, 7.4, 37498, 'BEV');

-- Alberta models
INSERT INTO Model VALUES (13, 'Audi', 'A3 Sportback e-tron', 50, 7.1, 40475, 'PHEV');
INSERT INTO Model VALUES (14, 'Toyota', 'Prius Prime', 40, 7.3, 33750, 'PHEV');
INSERT INTO Model VALUES (15, 'Volkswagen', 'ID.4', 386, 7.6, 44995, 'BEV');
INSERT INTO Model VALUES (16, 'Tesla', 'Model 3', 430, 6.1, 61380, 'BEV');

-- Saskatchewan models 
INSERT INTO Model VALUES (17, 'Audi', 'A3 Sportback e-tron', 50, 7.1, 40475, 'PHEV');
INSERT INTO Model VALUES (18, 'Toyota', 'Prius Prime', 40, 7.3, 33750, 'PHEV');
INSERT INTO Model VALUES (19, 'Volkswagen', 'ID.4', 386, 7.6, 44995, 'BEV');
INSERT INTO Model VALUES (20, 'Tesla', 'Model 3', 430, 6.1, 61380, 'BEV');

-- Manitoba models 
INSERT INTO Model VALUES (21, 'Audi', 'A3 Sportback e-tron', 50, 7.1, 40475, 'PHEV');
INSERT INTO Model VALUES (22, 'Toyota', 'Prius Prime', 40, 7.3, 33750, 'PHEV');
INSERT INTO Model VALUES (23, 'Volkswagen', 'ID.4', 386, 7.6, 44995, 'BEV');
INSERT INTO Model VALUES (24, 'Tesla', 'Model 3', 430, 6.1, 61380, 'BEV');

-- New Brunswick models 
INSERT INTO Model VALUES (25, 'Audi', 'A3 Sportback e-tron', 50, 7.1, 40475, 'PHEV');
INSERT INTO Model VALUES (26, 'Toyota', 'Prius Prime', 40, 7.3, 33750, 'PHEV');
INSERT INTO Model VALUES (27, 'Volkswagen', 'ID.4', 386, 7.6, 44995, 'BEV');
INSERT INTO Model VALUES (28, 'Tesla', 'Model 3', 430, 6.1, 61380, 'BEV');

-- Nova Scotia models
INSERT INTO Model VALUES (29, 'Audi', 'A3 Sportback e-tron', 50, 7.1, 40475, 'PHEV');
INSERT INTO Model VALUES (30, 'Toyota', 'Prius Prime', 40, 7.3, 33750, 'PHEV');
INSERT INTO Model VALUES (31, 'Volkswagen', 'ID.4', 386, 7.6, 44995, 'BEV');
INSERT INTO Model VALUES (32, 'Tesla', 'Model 3', 430, 6.1, 61380, 'BEV');

-- Newfoundland and Labrador models 
INSERT INTO Model VALUES (33, 'Audi', 'A3 Sportback e-tron', 50, 7.1, 40475, 'PHEV');
INSERT INTO Model VALUES (34, 'Toyota', 'Prius Prime', 40, 7.3, 33750, 'PHEV');
INSERT INTO Model VALUES (35, 'Volkswagen', 'ID.4', 386, 7.6, 44995, 'BEV');
INSERT INTO Model VALUES (36, 'Tesla', 'Model 3', 430, 6.1, 61380, 'BEV');

-- Prince Edward Island models 
INSERT INTO Model VALUES (37, 'Audi', 'A3 Sportback e-tron', 50, 7.1, 40475, 'PHEV');
INSERT INTO Model VALUES (38, 'Toyota', 'Prius Prime', 40, 7.3, 33750, 'PHEV');
INSERT INTO Model VALUES (39, 'Volkswagen', 'ID.4', 386, 7.6, 44995, 'BEV');
INSERT INTO Model VALUES (40, 'Tesla', 'Model 3', 430, 6.1, 61380, 'BEV');

-- INCENTIVE
CREATE TABLE Incentive(
    Province TEXT NOT NULL,
    Incentive_Value REAL NOT NULL,
    Model_ID INTEGER NOT NULL,
    PRIMARY KEY (Model_ID, Province),
    FOREIGN KEY (Province) REFERENCES Region(Province),
    FOREIGN KEY (Model_ID) REFERENCES Model(Model_ID)
);

INSERT INTO Incentive VALUES ('Ontario', 2500, 1);
INSERT INTO Incentive VALUES ('Ontario', 2500, 2);
INSERT INTO Incentive VALUES ('Ontario', 5000, 3);
INSERT INTO Incentive VALUES ('Ontario', 0, 4);

INSERT INTO Incentive VALUES ('British Columbia', 4000, 5);
INSERT INTO Incentive VALUES ('British Columbia', 4000, 6);
INSERT INTO Incentive VALUES ('British Columbia', 8000, 7);
INSERT INTO Incentive VALUES ('British Columbia', 0, 8);

INSERT INTO Incentive VALUES ('Quebec', 6500, 9);
INSERT INTO Incentive VALUES ('Quebec', 6500, 10);
INSERT INTO Incentive VALUES ('Quebec', 13000, 11);
INSERT INTO Incentive VALUES ('Quebec', 7000, 12);
INSERT INTO Incentive VALUES ('Quebec', 2500, 41);
INSERT INTO Incentive VALUES ('Quebec', 5000, 42);
INSERT INTO Incentive VALUES ('Quebec', 13000, 43);
INSERT INTO Incentive VALUES ('Quebec', 7000, 44);
INSERT INTO Incentive VALUES ('Quebec', 13000, 45);
INSERT INTO Incentive VALUES ('Quebec', 13000, 46);

INSERT INTO Incentive VALUES ('Alberta', 2500, 13);
INSERT INTO Incentive VALUES ('Alberta', 2500, 14);
INSERT INTO Incentive VALUES ('Alberta', 5000, 15);
INSERT INTO Incentive VALUES ('Alberta', 0, 16);

INSERT INTO Incentive VALUES ('Saskatchewan', 2500, 17);
INSERT INTO Incentive VALUES ('Saskatchewan', 2500, 18);
INSERT INTO Incentive VALUES ('Saskatchewan', 5000, 19);
INSERT INTO Incentive VALUES ('Saskatchewan', 0, 20);

INSERT INTO Incentive VALUES ('Manitoba', 2500, 21);
INSERT INTO Incentive VALUES ('Manitoba', 2500, 22);
INSERT INTO Incentive VALUES ('Manitoba', 5000, 23);
INSERT INTO Incentive VALUES ('Manitoba', 0, 24);

INSERT INTO Incentive VALUES ('New Brunswick', 5000, 25);
INSERT INTO Incentive VALUES ('New Brunswick', 5000, 26);
INSERT INTO Incentive VALUES ('New Brunswick', 10000, 27);
INSERT INTO Incentive VALUES ('New Brunswick', 5000, 28);

INSERT INTO Incentive VALUES ('Nova Scotia', 5500, 29);
INSERT INTO Incentive VALUES ('Nova Scotia', 5500, 30);
INSERT INTO Incentive VALUES ('Nova Scotia', 8000, 31);
INSERT INTO Incentive VALUES ('Nova Scotia', 0, 32);

INSERT INTO Incentive VALUES ('Newfoundland and Labrador', 4000, 33);
INSERT INTO Incentive VALUES ('Newfoundland and Labrador', 4000, 34);
INSERT INTO Incentive VALUES ('Newfoundland and Labrador', 7500, 35);
INSERT INTO Incentive VALUES ('Newfoundland and Labrador', 2500, 36);

INSERT INTO Incentive VALUES ('Prince Edward Island', 5000, 37);
INSERT INTO Incentive VALUES ('Prince Edward Island', 5000, 38);
INSERT INTO Incentive VALUES ('Prince Edward Island', 10000, 39);
INSERT INTO Incentive VALUES ('Prince Edward Island', 0, 40);



-- TYPEOF
CREATE TABLE TypeOf(
    Model_ID INTEGER NOT NULL,
    Type TEXT NOT NULL,
    PRIMARY KEY (Model_ID, Type),
    FOREIGN KEY (Model_ID) REFERENCES Model(Model_ID),
    FOREIGN KEY (Type) REFERENCES Classification(Type)
);

INSERT INTO TypeOf VALUES (1, 'PHEV');
INSERT INTO TypeOf VALUES (2, 'PHEV');
INSERT INTO TypeOf VALUES (3, 'BEV');
INSERT INTO TypeOf VALUES (4, 'BEV');
INSERT INTO TypeOf VALUES (5, 'PHEV');
INSERT INTO TypeOf VALUES (6, 'PHEV');
INSERT INTO TypeOf VALUES (7, 'BEV');
INSERT INTO TypeOf VALUES (8, 'BEV');
INSERT INTO TypeOf VALUES (9, 'PHEV');
INSERT INTO TypeOf VALUES (10, 'PHEV');
INSERT INTO TypeOf VALUES (11, 'BEV');
INSERT INTO TypeOf VALUES (12, 'BEV');
INSERT INTO TypeOf VALUES (13, 'PHEV');
INSERT INTO TypeOf VALUES (14, 'PHEV');
INSERT INTO TypeOf VALUES (15, 'BEV');
INSERT INTO TypeOf VALUES (16, 'BEV');
INSERT INTO TypeOf VALUES (17, 'PHEV');
INSERT INTO TypeOf VALUES (18, 'PHEV');
INSERT INTO TypeOf VALUES (19, 'BEV');
INSERT INTO TypeOf VALUES (20, 'BEV');
INSERT INTO TypeOf VALUES (21, 'PHEV');
INSERT INTO TypeOf VALUES (22, 'PHEV');
INSERT INTO TypeOf VALUES (23, 'BEV');
INSERT INTO TypeOf VALUES (24, 'BEV');
INSERT INTO TypeOf VALUES (25, 'PHEV');
INSERT INTO TypeOf VALUES (26, 'PHEV');
INSERT INTO TypeOf VALUES (27, 'BEV');
INSERT INTO TypeOf VALUES (28, 'BEV');
INSERT INTO TypeOf VALUES (29, 'PHEV');
INSERT INTO TypeOf VALUES (30, 'PHEV');
INSERT INTO TypeOf VALUES (31, 'BEV');
INSERT INTO TypeOf VALUES (32, 'BEV');
INSERT INTO TypeOf VALUES (33, 'PHEV');
INSERT INTO TypeOf VALUES (34, 'PHEV');
INSERT INTO TypeOf VALUES (35, 'BEV');
INSERT INTO TypeOf VALUES (36, 'BEV');
INSERT INTO TypeOf VALUES (37, 'PHEV');
INSERT INTO TypeOf VALUES (38, 'PHEV');
INSERT INTO TypeOf VALUES (39, 'BEV');
INSERT INTO TypeOf VALUES (40, 'BEV');
INSERT INTO TypeOf VALUES (41, 'PHEV');
INSERT INTO TypeOf VALUES (42, 'PHEV');
INSERT INTO TypeOf VALUES (43, 'BEV');
INSERT INTO TypeOf VALUES (44, 'BEV');
INSERT INTO TypeOf VALUES (45, 'BEV');
INSERT INTO TypeOf VALUES (46, 'BEV');

-- PURCHASEDIN
CREATE TABLE PurchasedIn(
    Model_ID INTEGER NOT NULL,
    Province TEXT NOT NULL,
    PRIMARY KEY (Model_ID, Province),
    FOREIGN KEY (Model_ID) REFERENCES Model(Model_ID),
    FOREIGN KEY (Province) REFERENCES Region(Province)
);

INSERT INTO PurchasedIn VALUES (1, 'Ontario');
INSERT INTO PurchasedIn VALUES (2, 'Ontario');
INSERT INTO PurchasedIn VALUES (3, 'Ontario');
INSERT INTO PurchasedIn VALUES (4, 'Ontario');
INSERT INTO PurchasedIn VALUES (5, 'British Columbia');
INSERT INTO PurchasedIn VALUES (6, 'British Columbia');
INSERT INTO PurchasedIn VALUES (7, 'British Columbia');
INSERT INTO PurchasedIn VALUES (8, 'British Columbia');
INSERT INTO PurchasedIn VALUES (9, 'Quebec');
INSERT INTO PurchasedIn VALUES (10, 'Quebec');
INSERT INTO PurchasedIn VALUES (11, 'Quebec');
INSERT INTO PurchasedIn VALUES (12, 'Quebec');
INSERT INTO PurchasedIn VALUES (41, 'Quebec');
INSERT INTO PurchasedIn VALUES (42, 'Quebec');
INSERT INTO PurchasedIn VALUES (43, 'Quebec');
INSERT INTO PurchasedIn VALUES (44, 'Quebec');
INSERT INTO PurchasedIn VALUES (45, 'Quebec');
INSERT INTO PurchasedIn VALUES (46, 'Quebec');
INSERT INTO PurchasedIn VALUES (13, 'Alberta');
INSERT INTO PurchasedIn VALUES (14, 'Alberta');
INSERT INTO PurchasedIn VALUES (15, 'Alberta');
INSERT INTO PurchasedIn VALUES (16, 'Alberta');
INSERT INTO PurchasedIn VALUES (17, 'Saskatchewan');
INSERT INTO PurchasedIn VALUES (18, 'Saskatchewan');
INSERT INTO PurchasedIn VALUES (19, 'Saskatchewan');
INSERT INTO PurchasedIn VALUES (20, 'Saskatchewan');
INSERT INTO PurchasedIn VALUES (21, 'Manitoba');
INSERT INTO PurchasedIn VALUES (22, 'Manitoba');
INSERT INTO PurchasedIn VALUES (23, 'Manitoba');
INSERT INTO PurchasedIn VALUES (24, 'Manitoba');
INSERT INTO PurchasedIn VALUES (25, 'New Brunswick');
INSERT INTO PurchasedIn VALUES (26, 'New Brunswick');
INSERT INTO PurchasedIn VALUES (27, 'New Brunswick');
INSERT INTO PurchasedIn VALUES (28, 'New Brunswick');
INSERT INTO PurchasedIn VALUES (29, 'Nova Scotia');
INSERT INTO PurchasedIn VALUES (30, 'Nova Scotia');
INSERT INTO PurchasedIn VALUES (31, 'Nova Scotia');
INSERT INTO PurchasedIn VALUES (32, 'Nova Scotia');
INSERT INTO PurchasedIn VALUES (33, 'Newfoundland and Labrador');
INSERT INTO PurchasedIn VALUES (34, 'Newfoundland and Labrador');
INSERT INTO PurchasedIn VALUES (35, 'Newfoundland and Labrador');
INSERT INTO PurchasedIn VALUES (36, 'Newfoundland and Labrador');
INSERT INTO PurchasedIn VALUES (37, 'Prince Edward Island');
INSERT INTO PurchasedIn VALUES (38, 'Prince Edward Island');
INSERT INTO PurchasedIn VALUES (39, 'Prince Edward Island');
INSERT INTO PurchasedIn VALUES (40, 'Prince Edward Island');

COMMIT;