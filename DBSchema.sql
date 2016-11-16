USE MicroLoan
--DROP TABLE Entrepreneur
--DROP TABLE Lender
--DROP TABLE Loan
CREATE TABLE Entrepreneur
(
	EntrepreneurID			INT IDENTITY(1,1)
	,FirstName				VARCHAR(50) NOT NULL
	,LastName				VARCHAR(50) NOT NULL
	,JobTitle				VARCHAR(100)NOT NULL
	,ShortDescription		VARCHAR(200)NOT NULL
	,Gender					VARCHAR(10)NOT NULL
	,DateOfBirth			DATETIME NOT NULL
	,Street					VARCHAR(50)NOT NULL
	,City					VARCHAR(50)NOT NULL
	,Provice				VARCHAR(50)NOT NULL
	,Country				VARCHAR(50)NOT NULL
	,Email					VARCHAR(50)NOT NULL
	,Username				VARCHAR(20) NOT NULL
	,[Password]				VARCHAR(20) NOT NULL
	,MembershipDate			DATETIME DEFAULT GETDATE()			
	
	PRIMARY KEY(EntrepreneurID)
)

CREATE TABLE Lender
(
	LenderID				INT IDENTITY(1,1)
	,FirstName				VARCHAR(50) NOT NULL
	,LastName				VARCHAR(50) NOT NULL
	,JobTitle				VARCHAR(100)NOT NULL
	,ShortDescription		VARCHAR(200)NOT NULL
	,Gender					VARCHAR(10)NOT NULL
	,DateOfBirth			DATETIME NOT NULL
	,Street					VARCHAR(50)NOT NULL
	,City					VARCHAR(50)NOT NULL
	,Provice				VARCHAR(50)NOT NULL
	,Country				VARCHAR(50)NOT NULL
	,Email					VARCHAR(50)NOT NULL
	,Username				VARCHAR(20) NOT NULL
	,[Password]				VARCHAR(20) NOT NULL
	,MembershipDate			DATETIME DEFAULT GETDATE()
	
	PRIMARY KEY (LenderID)
)

CREATE TABLE Loan
(
	LoanID INT IDENTITY(1,1)
	,LenderID INT
	,EntrepreneurID INT NOT NULL
	,LoanAmount DECIMAL NOT NULL
	,LoanDescription VARCHAR (1000) NOT NULL
	,LoanAppliedDate DATETIME NOT NULL
	,LoanApprovedDate DATETIME
	,IsActive BIT DEFAULT 1
	
	PRIMARY KEY (LoanID)
	FOREIGN KEY(EntrepreneurID)	REFERENCES Entrepreneur(EntrepreneurID),
	FOREIGN KEY(LenderID) REFERENCES Lender(LenderID)
)