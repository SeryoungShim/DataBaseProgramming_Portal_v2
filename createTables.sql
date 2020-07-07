CREATE TABLE UserInfo(
	isStudent INT(1),
	major VARCHAR(30),
	name VARCHAR(20),
	usrPW VARCHAR(30),
	usrID INT(10),
	PRIMARY KEY (usrID)
);

INSERT INTO UserInfo VALUES (0, '컴퓨터과학전공', '심세령', '0000', 1715437);

CREATE TABLE Course(
	category INT(1),
	major VARCHAR(30),
	credit INT(1),
	PF INT(1),
	cyber INT(1),
	courseName VARCHAR(30),
	year INT(4),
	semester INT(1),
	courseNo INT(20),
	classNo INT(2),
	PRIMARY KEY (year, semester, courseNo, classNo)
);

CREATE TABLE Teach(
	prof INT(10) REFERENCES UserInfo (usrID),
	room VARCHAR(30),
	day VARCHAR(10),
	startTime INT(4),
	endTime INT(4),
	year INT(4),
	semester INT(1),
	courseNo INT(20),
	classNo INT(2),
	PRIMARY KEY (year, semester, courseNo, classNo),
	FOREIGN KEY (year, semester, courseNo, classNo) REFERENCES Course (year, semester, courseNo, classNo) ON DELETE CASCADE ON UPDATE CASCADE
);
