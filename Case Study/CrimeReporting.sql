CREATE DATABASE CrimeReport;
USE CrimeReport;

-- 1. INCIDENTS TABLE 
CREATE TABLE Incidents (
    IncidentID INT PRIMARY KEY,
    IncidentType VARCHAR(50),
    IncidentDate DATE,
    Location VARCHAR(50),
    Description TEXT,
    Status VARCHAR(20),
    VictimID INT,
    SuspectID INT,
    FOREIGN KEY (VictimID) REFERENCES Victims(VictimID),
    FOREIGN KEY (SuspectID) REFERENCES Suspects(SuspectID)
);

-- 2. VICTIMS TABLE 
CREATE TABLE Victims (
    VictimID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Address TEXT,
    PhoneNumber VARCHAR(15)
);

-- 3. SUSPECTS TABLE 
CREATE TABLE Suspects (
    SuspectID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Address TEXT,
    PhoneNumber VARCHAR(15)
);

-- 4. LAW ENFORCEMENT AGENCIES TABLE 
CREATE TABLE LawEnforcementAgencies (
    AgencyID INT PRIMARY KEY,
    AgencyName VARCHAR(50),
    Jurisdiction VARCHAR(50),
    Address TEXT,
    PhoneNumber VARCHAR(15)
);

-- 5. OFFICERS TABLE
CREATE TABLE Officers (
    OfficerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BadgeNumber INT,
    Ranks VARCHAR(20),
    Address TEXT,
    PhoneNumber VARCHAR(15),
    AgencyID INT,
    FOREIGN KEY (AgencyID) REFERENCES LawEnforcementAgencies(AgencyID)
);

-- 6. EVIDENCE TABLE 
CREATE TABLE Evidence (
    EvidenceID INT PRIMARY KEY,
    Description TEXT,
    LocationFound TEXT,
    IncidentID INT,
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID)
);

-- 7. REPORTS TABLE
CREATE TABLE Reports (
    ReportID INT PRIMARY KEY,
    IncidentID INT,
    ReportingOfficer INT,
    ReportDate DATE,
    ReportDetails TEXT,
    Status VARCHAR(20),
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID),
    FOREIGN KEY (ReportingOfficer) REFERENCES Officers(OfficerID)
);



 -- /////////////////// SAMPLE RECORDS FOR THE TABLES ////////////////////

-- 1. SAMPLE RECORDS OF INCIDENTS TABLE 
		INSERT INTO Incidents 
        (IncidentID, IncidentType, IncidentDate, Location, Description, Status, VictimID, SuspectID)
		VALUES
		(1, 'Robbery', '2024-01-15', 'City A', 'Armed robbery at a convenience store', 'Under Investigation', 1, 1),
		(2, 'Assault', '2024-02-20', 'City B', 'Physical altercation between two individuals', 'Closed', 2, 2),
		(3, 'Burglary', '2024-03-05', 'City C', 'Break-in at a residential property', 'Under Investigation', 3, 3),
		(4, 'Kidnapping', '2024-04-12', 'City D', 'Child abduction reported', 'Open', 4, 4),
		(5, 'Fraud', '2024-05-22', 'City E', 'Financial scam involving multiple victims', 'Open', 5, 5),
		(6, 'Homicide', '2024-06-10', 'City F', 'Fatal shooting incident', 'Under Investigation', 6, 6),
		(7, 'Cybercrime', '2024-07-18', 'City G', 'Identity theft and online fraud', 'Closed', 7, 7),
		(8, 'Domestic Violence', '2024-08-25', 'City H', 'Spousal abuse case', 'Open', 8, 8),
		(9, 'Human Trafficking', '2024-09-30', 'City I', 'Illegal trafficking operation uncovered', 'Under Investigation', 9, 9),
		(10, 'Drug Trafficking', '2024-10-15', 'City J', 'Large-scale drug trafficking network dismantled', 'Closed', 10, 10);


-- 2. SAMPLE RECORDS OF VICTIMS TABLE 
		INSERT INTO Victims 
        (VictimID, FirstName, LastName, DateOfBirth, Gender, Address, PhoneNumber)
		VALUES
		(1, 'Aarav', 'Patel', '1990-05-15', 'Male', '123 Main St, City', '9876543210'),
		(2, 'Diya', 'Sharma', '1985-08-22', 'Female', '456 Oak St, Town', '8765432109'),
		(3, 'Rahul', 'Gupta', '1992-11-10', 'Male', '789 Pine St, Village', '7654321098'),
		(4, 'Priya', 'Singh', '1988-03-28', 'Female', '234 Cedar St, City', '6543210987'),
		(5, 'Vikram', 'Kumar', '1995-09-12', 'Male', '567 Elm St, Town', '5432109876'),
		(6, 'Ananya', 'Verma', '1993-06-18', 'Female', '890 Birch St, City', '4321098765'),
		(7, 'Arjun', 'Shah', '1980-04-30', 'Male', '901 Pine St, Village', '3210987654'),
		(8, 'Neha', 'Mishra', '1987-12-05', 'Female', '234 Maple St, Town', '2109876543'),
		(9, 'Rajat', 'Chopra', '1994-02-15', 'Male', '345 Cedar St, City', '1098765432'),
		(10, 'Kavita', 'Reddy', '1983-07-20', 'Female', '678 Oak St, Village', '9876543210');


-- 3. SAMPLE RECORDS OF SUSPECTS TABLE
		INSERT INTO Suspects 
        (SuspectID, FirstName, LastName, DateOfBirth, Gender, Address, PhoneNumber)
		VALUES
		(1, 'Karan', 'Singh', '1982-03-10', 'Male', '789 Pine St, Village', '7654321098'),
		(2, 'Neha', 'Verma', '1995-11-28', 'Female', '234 Cedar St, City', '6543210987'),
		(3, 'Rahul', 'Sharma', '1990-06-15', 'Male', '567 Main St, Town', '5432109876'),
		(4, 'Anita', 'Patil', '1988-09-22', 'Female', '901 Oak St, City', '4321098765'),
		(5, 'Vikram', 'Verma', '1992-04-12', 'Male', '123 Elm St, Village', '3210987654'),
		(6, 'Sneha', 'Mishra', '1985-08-18', 'Female', '456 Cedar St, Town', '2109876543'),
		(7, 'Rajat', 'Kumar', '1983-12-30', 'Male', '789 Birch St, City', '1098765432'),
		(8, 'Pooja', 'Shah', '1994-02-05', 'Female', '234 Pine St, Village', '9876543210'),
		(9, 'Arjun', 'Chopra', '1987-07-15', 'Male', '567 Oak St, Town', '8765432109'),
		(10, 'Aaradhya', 'Reddy', '1993-01-20', 'Female', '890 Main St, City', '7654321098');
 
 
 -- 4. SAMPLE RECORDS OF LAW ENFORCEMENT AGENCIES TABLE 
		INSERT INTO LawEnforcementAgencies 
        (AgencyID, AgencyName, Jurisdiction, Address, PhoneNumber)
		VALUES
		(1, 'City Police Department', 'City', '567 Maple St, City', '1234567890'),
		(2, 'County Sheriff Office', 'County', '789 Birch St, County', '2345678901'),
		(3, 'State Crime Investigation Bureau', 'State', '901 Cedar St, State', '3456789012'),
		(4, 'National Investigation Agency', 'National', '123 Pine St, National Capital', '4567890123'),
		(5, 'Railway Protection Force', 'Railway', '456 Elm St, Railway Division', '5678901234'),
		(6, 'Central Bureau of Investigation', 'Central', '789 Oak St, Central Region', '6789012345'),
		(7, 'Border Security Force', 'Border', '234 Main St, Border Region', '7890123456'),
		(8, 'Anti-Terrorism Squad', 'Anti-Terrorism', '567 Birch St, ATS Headquarters', '8901234567'),
		(9, 'Traffic Police Department', 'Traffic', '890 Pine St, City', '9012345678'),
		(10, 'Cyber Crime Investigation Unit', 'Cyber Crime', '123 Cedar St, Cyber City', '9876543210');


-- 5. SAMPLE RECORDS OF OFFICERS TABLE
		INSERT INTO Officers 
        (OfficerID, FirstName, LastName, BadgeNumber, Ranks, Address, PhoneNumber, AgencyID)
		VALUES
		(1, 'Rajesh', 'Kumar', 1234, 'Sergeant', '901 Pine St, Town', '3456789012', 1),
		(2, 'Preeti', 'Shah', 5678, 'Detective', '456 Elm St, Village', '4567890123', 2),
		(3, 'Amit', 'Verma', 9876, 'Inspector', '789 Cedar St, City', '5678901234', 3),
		(4, 'Neha', 'Mishra', 3456, 'Sub-Inspector', '234 Birch St, Town', '6789012345', 4),
		(5, 'Rahul', 'Singh', 7890, 'Constable', '567 Main St, Village', '7890123456', 5),
		(6, 'Anjali', 'Patel', 2345, 'Sergeant', '901 Oak St, City', '8901234567', 6),
		(7, 'Arjun', 'Gupta', 6789, 'Detective', '123 Elm St, Town', '9012345678', 7),
		(8, 'Kavita', 'Sharma', 1235, 'Inspector', '456 Cedar St, Village', '7890123456', 8),
		(9, 'Vikram', 'Kumar', 5671, 'Sub-Inspector', '789 Birch St, City', '8901234567', 9),
		(10, 'Sneha', 'Chopra', 8901, 'Constable', '234 Pine St, Town', '9012345678', 10);


-- 6. SAMPLE RECORDS OF EVIDENCE TABLE 
		INSERT INTO Evidence 
        (EvidenceID, Description, LocationFound, IncidentID)
		VALUES
		(1, 'Security camera footage', 'Store premises', 1),
		(2, 'Bloodstained shirt', 'Assault location', 2),
		(3, 'Broken window glass', 'Burglary scene', 3),
		(4, 'Kidnapper ransom note', 'Abduction site', 4),
		(5, 'Financial transaction records', 'Fraud investigation', 5),
		(6, 'Ballistic report', 'Homicide scene', 6),
		(7, 'Digital forensics report', 'Cybercrime investigation', 7),
		(8, 'Photographs of injuries', 'Domestic violence case', 8),
		(9, 'Witness statements', 'Human trafficking investigation', 9),
		(10, 'Seized narcotics', 'Drug trafficking operation', 10);
        
        
-- 7. SAMPLE RECORDS OF REPORTS TABLE
		INSERT INTO Reports 
        (ReportID, IncidentID, ReportingOfficer, ReportDate, ReportDetails, Status)
		VALUES
		(1, 1, 1, '2024-01-18', 'Detailed report on the robbery incident', 'Closed'),
		(2, 2, 2, '2024-02-25', 'Investigation report on the assault case', 'Approved'),
		(3, 3, 3, '2024-03-15', 'Burglary incident report', 'Pending Approval'),
		(4, 4, 4, '2024-04-16', '2024-04-20', 'Kidnapping case report', 'Under Review'),
		(5, 5, 5, '2024-05-05', 'Fraud investigation report', 'Closed'),
		(6, 6, 6, '2024-06-17', 'Homicide investigation report', 'Pending Approval'),
		(7, 7, 7, '2024-07-23', 'Cybercrime case report', 'Closed'),
		(8, 8, 8, '2024-08-01', 'Domestic violence case report', 'Approved'),
		(9, 9, 9, '2024-09-11', 'Human trafficking investigation report', 'Under Review'),
		(10, 10, 10, '2024-10-29', 'Drug trafficking case report', 'Closed');
