CREATE DATABASE HOSPITAL 
USE HOSPITAL
GO
CREATE TABLE PHYSICIAN1
(
EMPLOYEEID INT NOT NULL,
NAME VARCHAR(50) NOT NULL,
POSITION VARCHAR(50) NOT NULL,
SSN INT NOT NULL,
CONSTRAINT PK_PHYSICIAN_EMPLOYEE_ID PRIMARY KEY (EMPLOYEEID),
)

INSERT INTO PHYSICIAN1(EMPLOYEEID,NAME,POSITION,SSN)
VALUES (55,'YOGESH','SURGICAL ATTENDING PHYSICIAN',111000111)

select * from PHYSICIAN1
INSERT INTO PHYSICIAN1(EMPLOYEEID,NAME,POSITION,SSN)
VALUES (69,'Mila','PHYSICIAN ',111002112) 

select * from physician1

CREATE TABLE DEPARTMENT1
(
DEPARTMENTID INT NOT NULL,
EMPLOYEEID INT NOT NULL,
NAME VARCHAR(50) NOT NULL,
HEAD INT NOT NULL,
CONSTRAINT PK_DEPARTMENT1_DEPARTMENTID PRIMARY KEY (DEPARTMENTID),
CONSTRAINT FK_EMPLOYEE_ID_DEPARTMENT1_PHYSICIAN FOREIGN KEY (EMPLOYEEID) REFERENCES PHYSICIAN1 (EMPLOYEEID),
)
Insert into DEPARTMENT1(DEPARTMENTID,EMPLOYEEID,NAME,HEAD)
VALUES (100,55,'SURGERY',2)

Insert into DEPARTMENT1(DEPARTMENTID,EMPLOYEEID,NAME,HEAD)
VALUES (101,56,'General Medicine',2)


select * from department1
select * from affiliated1_with


Create table affiliated1_with
(
Physician varchar(50) NOT NULL,-----pk
DEPARTMENTID INT Not null, 
PRIMARY_affiliation int not null,
CONSTRAINT PK_AFFILIATED_WITH_PHYSICIAN PRIMARY KEY (PHYSICIAN),
CONSTRAINT FK_DepartmentID_affiliated_with_Department_ foreign key(DepartmentID) References Department1(DepartmentID),
)

select departmentid from department1
except
select departmentid from affiliated1_with

INSERT INTO affiliated1_with (PHYSICIAN,DEPARTMENTID,PRIMARY_affiliation)
VALUES ('Yogesh','100',1)


SELECT * FROM affiliated1_with

CREATE TABLE PROCEDURE1_
(
PROCEDURE_CODE INT NOT NULL, ---pk
Procedure_name  varchar(100) not null,
COST INT NOT NULL,
CONSTRAINT PK_PROCEDURE_Procedure_code Primary key (procedure_code),
)


INSERT INTO PROCEDURE1_(PROCEDURE_CODE,Procedure_name,COST)
values(6,' Follicular Demiectomy',3500)   

INSERT INTO PROCEDURE1_(PROCEDURE_CODE,Procedure_name,COST)
values(5,'Obfuscated Dermogastrotomy',40000)   
 SELECT * FROM PROCEDURE1_

CREATE TABLE TRAINED_IN
(
EmployeeID INT NOT NULL,
TREATMENT INT NOT NULL, -----pk
Procedure_Code INT NOT NULL,   ---fk
CERT_DATE   DATETIME,
CERT_EXPIRES  DATETIME,
constraint pk_trained_in_treatment primary key (treatment),
constraint fk_procedure_code_trained_in_PROCEDURE1_ foreign key(procedure_code) References PROCEDURE1_ (Procedure_code),
constraint fk_EMPLOYEEID_TRAINED_IN_PHYSICIAN1_ foreign key(EMPLOYEEID) References Physician1 (employeeid)
)


DROP TABLE TRAINED_IN


INSERT INTO Trained_In VALUES(56,12,2,'2008-01-01','2008-12-31');
INSERT INTO Trained_In VALUES(57,3,3,'2008-01-01','2008-12-31');
INSERT INTO Trained_In VALUES(58,4,4,'2008-01-01','2008-12-31');
INSERT INTO Trained_In VALUES(61,5,5,'2007-01-01','2008-12-31');
INSERT INTO Trained_In VALUES(69,6,6,'2008-01-01','2008-12-31');

select * FROM TRAINED_IN

Create table Patient  
(
Patient_SSN INT Not null, ----pk
Patient_Name varchar(50) not null,
Address varchar(50) not null,
phone varchar (15) not null,
Insurance_ID int not null,
EmployeeID int NOT NULL, -----foreign key)
constraint PK_Patient_Patient_SSN Primary Key (Patient_SSN),
Constraint FK_EmployeeID_Patient_Physician1 Foreign key (EmployeeID) References Physician1 (EmployeeID),
)


INSERT INTO Patient (Patient_SSN,Patient_Name,Address,phone,Insurance_ID,EmployeeID)
values(100000001,'John Smith','42 Foobar Lane','555-0256',68476213,55)
INSERT INTO Patient VALUES(100000002,'Grace Ritchie','37 Snafu Drive','555-0512',36546321,56)
INSERT INTO Patient VALUES(100000003,'Random J. Patient','101 Omgbbq Street','555-1204',65465421,57)
INSERT INTO Patient VALUES(100000004,'Dennis Doe','1)00 Foobaz Avenue','555-2048',68421879,58)
select *from Patient

drop table Patient1
 
 Create table Nurse 
 (
 Employee_ID int not null,-----pk
 NAME varchar(50) not null,
 POSITION varchar(50) not null,
 REGISTERED bit,
 SSN int not null,
 constraint PK_Nurse_Employee_ID Primary Key (Employee_ID),
 )
 
Insert into Nurse(Employee_ID,NAME,POSITION,REGISTERED,SSN)
values (25,'Paul','Head nurse',1,5102020)
INSERT INTO Nurse VALUES(101,'Carla Espinosa','Head Nurse',1,111111110);
INSERT INTO Nurse VALUES(102,'Laverne Roberts','Nurse',1,222222220);
INSERT INTO Nurse VALUES(103,'Paul Flowers','Nurse',0,333333330);


DROP TABLE Nurse
 create table appointment
 (
 appointment_ID Int not null,-----pk
 Patient_SSN int not null,  --------fk  it's a ssn no.OF patient
 Employee_ID integer, -------fk  ---- NURSE
 EmployeeID Int not null, ------fk ---- PHYSICIAN
 Start date ,
 End_ date,
 Examination_room Varchar(50) not null,
 constraint PK_appointment_AppointmentID Primary Key (Appointment_id),
 Constraint FK_Patient_SSN_Appointment_Patient Foreign Key (Patient_SSN) References Patient (Patient_SSN),
 )
 
  Insert into appointment(appointment_ID,Patient_SSN,Employee_ID,EmployeeID,Start,End_,Examination_room)
  Values (75559,100000001,25,55,'5-25-2019','5-26-2019',3)
 Insert into appointment values (7050,100000002,101,56,'5-26-2019','6-26-2019',2);
 Insert into appointment values (7052,100000003,102,57,'6-26-2019','7-26-2019',2);
  Insert into appointment values (7053,100000004,103,58,'5-26-2019','6-26-2019',2);
  select * from nurse

 select *from appointment

 ---DROP TABLE appointment
 
 CREATE TABLE MEDICATION
 (appointment
 CODE INT NOT NULL, -----pk
 NAME  VARCHAR(50) NOT NULL,
 BRAND VARCHAR(50) NOT NULL,
 DESCRIPTION_ CHAR(1000),
 Constraint PK_MEDICATION_CODE PRIMARY KEY (CODE),
 )
 insert into MEDICATION(code,NAME,BRAND,DESCRIPTION_)
 VALUES (2,'altretamine','Hexalen capsules','this is used to treat the symptoms of Recurrent Ovarian Cancer')
  insert into MEDICATION(code,NAME,BRAND,DESCRIPTION_)
 VALUES (3,'altretamine','Hexalen capsules','this is used to treat the symptoms of Recurrent Ovarian Cancer')
  insert into MEDICATION(code,NAME,BRAND,DESCRIPTION_)
 VALUES (5,'altretamine','Hexalen capsules','this is used to treat the symptoms of Recurrent Ovarian Cancer')


 CREATE TABLE PRESCRIBES
 (
 EmployeeID int not null, ---- PK,FK ---- as a physician
 Patient_SSN int,     --- PK,FK AS A PATIENT SSN
 Code int,------ PK,FK as a medication
 Date date,  ---PK --- appointment date
 Appointment_ID Int,---FK  
 Dose Varchar(50),
 CONSTRAINT PK_PRESCRIBES_DATE PRIMARY KEY (DATE),
 CONSTRAINT FK_PATIENT_SSN_PRESCRIBES_PATIENT FOREIGN KEY (PATIENT_SSN) REFERENCES PATIENT (PATIENT_SSN),
 CONSTRAINT FK_EMPLOYEEID_Prescribes_Physician Foreign Key (EmployeeID) REFERENCES Physician1 (Employeeid),
 Constraint FK_CODE_PRESCRIBES_MEDICATION FOREIGN KEY (CODE) REFERENCES MEDICATION (CODE),
 Constraint FK_APPOINTMENT_ID_PRESCRIBES_appointment FOREIGN KEY (APPOINTMENT_ID) references appointment (APPOINTMENT_ID),
 )

 INSERT INTO PRESCRIBES(EmployeeID,Patient_SSN,Code,Date,Appointment_ID,Dose)
 VALUES (55,100000001,2,'5-26-2019',75559,2)
INSERT INTO Prescribes VALUES(56,100000002,3,'2008-04-24 10:47',7050,'5');
INSERT INTO Prescribes VALUES(57,100000003,4,'2008-04-27 10:53',7052,'10');
INSERT INTO Prescribes VALUES(58,100000004,5,'2008-05-19 16:53',7053,'5');

select *from PRESCRIBES

 CREATE TABLE BLOCK
 (
    BLOCK_FLOOR INT ,
    BLOCK_CODE INT,
    CONSTRAINT PK_BLOCK_FLOOR_BLOCK PRIMARY KEY (BLOCK_FLOOR),
)

INSERT INTO BLOCK (BLOCK_CODE,BLOCK_FLOOR)
VALUES (4,1)
INSERT INTO Block VALUES(5,1);
INSERT INTO Block VALUES(2,2);
INSERT INTO Block VALUES(3,3);

select *from BLOCK

 Create table room
 (
 ROOM_NO Int not null, ----PK
 ROOM_TYPE VARCHAR(50) NOT NULL,
 BLOCK_FLOOR INT,  -------FK
 BLOCK_CODE INT,  ------FK
 UNAVAILABLE BIT,
 CONSTRAINT PK_ROOM_ROOM_NO PRIMARY KEY (ROOM_NO),
 CONSTRAINT FK_BLOCK_FLOOR_ROOM_BLOCK FOREIGN KEY(BLOCK_FLOOR) REFERENCES BLOCK (BLOCK_FLOOR),
 )
 
INSERT INTO room(ROOM_NO,ROOM_TYPE,BLOCK_FLOOR,BLOCK_CODE,UNAVAILABLE)
VALUES (108,'SINGLE',1,2,0)
INSERT INTO Room VALUES(123,'Single',1,3,0);
INSERT INTO Room VALUES(201,'Single',2,1,1);
INSERT INTO Room VALUES(202,'Single',2,1,0);
INSERT INTO Room VALUES(203,'Single',2,1,0);
INSERT INTO Room VALUES(211,'Single',2,2,0);
INSERT INTO Room VALUES(212,'Single',2,2,0);
INSERT INTO Room VALUES(213,'Single',2,2,1);
INSERT INTO Room VALUES(221,'Single',2,3,0);
INSERT INTO Room VALUES(222,'Single',2,3,0);
INSERT INTO Room VALUES(223,'Single',2,3,0);
INSERT INTO Room VALUES(301,'Single',3,1,0);
INSERT INTO Room VALUES(302,'Single',3,1,1);


 select *from room

 CREATE TABLE STAY
 (
 STAY_ID  INT NOT NULL,---- PK
 PATIENT_SSN INT NOT NULL, ----FK
 ROOM_NO INT NOT NULL, ---FK
 START DATE NOT NULL,
 End_ date not null,
 CONSTRAINT PK_STAY_STAY_ID PRIMARY KEY (STAY_ID),
 CONSTRAINT FK_PATIENT_SSN_STAY_PATIENT FOREIGN KEY (PATIENT_SSN) REFERENCES PATIENT (PATIENT_SSN),
 CONSTRAINT fk_room_no_stay_room foreign key(Room_No) References room (Room_No),
)

Insert into STAY(STAY_ID,PATIENT_SSN,ROOM_NO,START,End_)
values(3020,100000001,101,'5-20-2018','5-24-2018')
INSERT INTO Stay VALUES(3215,100000002,102,'2008-05-01','2008-05-04');
INSERT INTO Stay VALUES(3216,100000003,103,'2008-05-03','2008-05-14');
INSERT INTO Stay VALUES(3217,100000004,104,'2008-05-02','2008-05-03');
 select *from Patient


 CREATE TABLE ON_CALL
 (
 employee_id int not null,   ---- as a nurse id
 BLOCK_FLOOR INT NOT NULL, -----PK,FK
 BLOCK_CODE INT NOT NULL, -----PK,FK
 Start_ date ,
 END_ DATE -----
 constraint pk_on_call_block_code primary key (block_code),
 constraint fk_block__floor_on_call_block foreign key(block_floor) references block (block_floor),
 )

insert into ON_CALL(employee_id,BLOCK_CODE,BLOCK_FLOOR,Start_,END_)
values(101,2,1,'5-20-2019','6-21-2019')
INSERT INTO On_Call VALUES(102,1,2,'2008-11-04 11:00','2008-11-04 19:00');
INSERT INTO On_Call VALUES(103,1,3,'2008-11-04 11:00','2008-11-04 19:00');
INSERT INTO On_Call VALUES(102,1,5,'2008-11-04 11:00','2008-11-04 19:00');

select*from ON_CALL

 CREATE TABLE UNDERGOES 
 (
 PATIENT_SSN INT NOT NULL,       --------FK
 PROCEDURE_CODE INT NOT NULL,   ---- PK,FK
 STAY_ID INT NOT NULL, ------ PK,FK
 DATE DATE NOT NULL,    -----PK
 EmployeeID INT NOT NULL, 
 EMPLOYEE_ID INT,------- FK---- NURSE
 constraint pk_undergoes_date primary key (date),
 constraint FK_patient_SSN_UNDERGOES_PATIENT FOREIGN KEY (PATIENT_SSN) REFERENCES PATIENT (PATIENT_SSN),
 constraint FK_PROCEDURE_CODE_UNDERGOES_PROCEDURE_ FOREIGN KEY (PROCEDURE_CODE) REFERENCES PROCEDURE1_ (PROCEDURE_CODE),
 constraint FK_EMPLOYEEID_UNDERGOES_PHYSICIAN FOREIGN KEY(EMPLOYEEID) REFERENCES PHYSICIAN1(EMPLOYEEID),
 CONSTRAINT FK_EMPLOYEE_ID_UNDERGOES_NURSE FOREIGN KEY (EMPLOYEE_ID) REFERENCES NURSE (EMPLOYEE_ID),
  )

INSERT INTO UNDERGOES(PATIENT_SSN,PROCEDURE_CODE,STAY_ID,DATE,EmployeeID,EMPLOYEE_ID)
VALUES(100000001,2,3215,'2008-05-03',55,101);
INSERT INTO Undergoes VALUES(100000002,3,3217,'2008-05-07',56,102);
INSERT INTO Undergoes VALUES(100000003,4,3216,'2008-05-09',57,102);
INSERT INTO Undergoes VALUES(100000004,5,3020,'2008-05-10',58,103);


 select count(*) from PHYSICIAN1 where POSITION= ' Attending physician'
 select * from PHYSICIAN1

 select max(employeeid) from PHYSICIAN1
 select min(employeeid) from PHYSICIAN1

 -----group by

 Select position,count(*)  employeeid from PHYSICIAN1 Group By [POSITION]

 Select count(*) from PHYSICIAN1 where POSITION  = 'SURGICAL ATTENDING PHYSICIAN'
 select * from PHYSICIAN1

 Select position,ssn, count(*)  employeecount from PHYSICIAN1 Group By [position] ,SSN

 Select ssn,position, count(*)  employeecount from PHYSICIAN1 Group By [SSN] ,POSITION

 Select position, count(*)  employeecount from PHYSICIAN1 Group By [POSITION]  Order by POSITION


Select position,SSN, count (*)  employeeCount from PHYSICIAN1
Group By [POSITION],SSN  Having POSITION <> 'PHYSICIAN'


 SELECT * FROM PROCEDURE1_

					select  Avg(COST) from PROCEDURE1_ where Procedure_name = 'Follicular Demiectomy'

					select  Avg(COST) from PROCEDURE1_ where Procedure_name = 'Demiectomy'

					select  sum(BLOCK_FLOOR) from ROOM
  
  SELECT * FROM ROOM

select sum (BLOCK_FLOOR) from ROOM where BLOCK_FLOOR =1
select  PROCEDURE_CODE, Avg(COST) AvgPrice from PROCEDURE1_
Group By PROCEDURE_CODE

select  PROCEDURE_CODE, max(COST) maxPrice,Min(COST) MinPrice from PROCEDURE1_
Group By PROCEDURE_CODE

	
Select procedure_code, 
		MAX(cost) MaxPrice ,
		Min(cost) MinPrice,
		Avg(cost) AvgPrice
From procedure1_ Group By procedure_code

Select count(*) 

alter table 
 
 ----- Assignment . 
 --1) Write a query in SQL to find all the information of the nurses who are yet to be registered.  

 
 select * from nurse where registered = 0

 --2) Write a query in SQL to find the name of the nurse who are the head of their department.  

  select * from nurse where position = 'head nurse'

--3) Write a query in SQL to obtain the name of the physicians who are the head of each department. 
  select * from PHYSICIAN1
  select * from DEPARTMENT1
  

	SELECT d.departmentid, p.physician_name FROM department d
	WHERE d.head=p.employeeid;

--4) Write a query in SQL to count the number of patients who taken appointment with at least one physician.  

SELECT count(DISTINCT 'Patient' ) AS "No. of patients taken at least one appointment"
FROM appointment

--5)-----Write a query in SQL to find the floor and block where the room number 212 belongs to.  


select block_floor, block_code from room
where ROOM_NO =212

--6 Write a query in SQL to count the number available rooms.   

SELECT * FROM ROOM WHERE UNAVAILABLE = 0

--7) Write a query in SQL to count the number of unavailable rooms.  
 
SELECT * FROM room WHERE UNAVAILABLE=1

--8) Write a query in SQL to obtain the name of the physician and the departments they are affiliated with.  

Sample table: physician
Sample table: department

SELECT p. AS "Physician",
       d. AS "Department"
FROM physician p,
     department d,
     affiliated_with a
WHERE p.employeeid=a.physician
 AND a.department=d.departmentid;

--9) Write a query in SQL to find the name of the patients and the number of physicians they have taken appointment.  
Sample table: appointment

select *from appointment

SELECT P.Patient_SSN 
count ('patient p') "Appointment for No. of Physicians"
FROM appointment t
JOIN patient p ON t.patient=p.patient_ssn
GROUP BY p.name
HAVING count(t.patient_ssn)>=1;


--10) Write a query in SQL to count number of unique patients who got an appointment for examination room 3.  
Sample table: appointment

SELECT COUNT (PATIENT_SSN) AS 'NO.OF PATIENT GOT AN APPOINTMENT'
FROM appointment WHERE Examination_room = 3

--11) Write a query in SQL to find the name of the patients and the number of the room where they have
  --to go for their treatment.  
Sample table: patient
Sample table: appointment


SELECT p.Patient_SSN,
       a.Examination_room AS "Room No.",
       a.Start AS "Date and Time of appointment"
FROM patient p
JOIN appointment a ON p.Patient_SSN=a.Patient_SSN;

SELECT P.Patient_Name,  
       a.Examination_room AS "Room No.",
       a.Start AS "Date and Time of appointment"
FROM patient p
JOIN appointment a ON p.Patient_SSN=a.Patient_SSN


--12) Write a query in SQL to find the name of the nurses and the room scheduled, where they will assist the physicians.  
Sample table: nurse
Sample table: appointment

Create table Nurse 
 (
 Employee_ID int not null,-----pk
 NAME varchar(50) not null,
 POSITION varchar(50) not null,
 REGISTERED bit,
 SSN int not null,
 constraint PK_Nurse_Employee_ID Primary Key (Employee_ID),
 )
 select*from Nurse
 select * from appointment

SELECT n.NAME,
       a.Examination_room AS "Room No."
FROM nurse n
JOIN appointment a ON a.Employee_ID= n.Employee_ID


--13). Write a query in SQL to find the name of the patients who taken the appointment on the 26th of May , and also display their physician, assisting nurses and room no.  
Sample table: patient
Sample table: appointment
Sample table: nurse
Sample table: physician

	SELECT* FROM PHYSICIAN1
	SELECT* FROM appointment

	SELECT P.Patient_Name,
       n.NAME AS "Name of the Nurse assisting the physician",
       N.NAME AS "Name of the physician",
       a.examination_room AS "Room No.",
       A.start 
FROM patient p
JOIN appointment a ON a.Patient_SSN= P.Patient_SSN
JOIN nurse n ON a.Employee_ID=n.Employee_ID
WHERE start ='2019-05-26'


--14). Write a query in SQL to find the name of patients and their physicians who does not require any assistance of a nurse.  
Sample table: patient
Sample table: appointment
Sample table: physician

SELECT * FROM Patient
select * from appointment
SELECT t.name AS "Name of the patient",
       p.name AS "Name of the physician",
       a.examinationroom AS "Room No."
FROM patient t
JOIN appointment a ON a.patient=t.ssn
JOIN physician p ON a.physician=p.employeeid
WHERE a.prepnurse IS NULL;

	SELECT  Patient_Name AS "Patient",----- not done
	       P.NAME AS "Name of the physician",
		   A.EXAMINATION_ROOM AS "ROOM NO."
		   FROM Patient 
		   JOIN appointment A ON A.Patient_SSN = A.patient_ssn
		   JOIN PHYSICIAN1 P ON a.EmployeeID = p.EMPLOYEEID
		   where Employee_ID is null;

		   ------ invalid column name


--15) Write a query in SQL to find the name of the patients, their treating physicians and medication.  
Sample table: patient
Sample table: prescribes
Sample table: physician


SELECT t.Patient_Name AS "Patient",
       p.name AS "Physician",
       m.name AS "Medication"
FROM patient t
JOIN prescribes s ON s.Patient_SSN=t.Patient_SSN
JOIN physician1 p ON s.EmployeeID=p.employeeid
JOIN medication m ON s.Code=m.code;


--16)Write a query in SQL to find the name of the patients who taken an advanced appointment, and also display their physicians and medication.  


select t.Patient_Name AS "Patient",
       p.name AS "Physician",
       m.name AS "Medication"
FROM patient t
JOIN prescribes s ON s.Patient_SSN=t.Patient_SSN
JOIN PHYSICIAN1 p ON s.EmployeeID=p.employeeid
JOIN medication m ON s.Code=m.code
WHERE s.Appointment_ID IS NOT NULL;



--17) Write a query in SQL to find the name and medication for those patients who did not take any appointment.  
--Sample table: patient
--Sample table: prescribes
--Sample table: physician
--Sample table: medication


select t.Patient_Name AS "Patient",
 m.name AS "Medication"
 from patient t
 join prescribes s ON s.Patient_SSN=t.Patient_SSN
 JOIN medication m ON s.Code=m.code
 where s.Appointment_ID is null;


--18) Write a query in SQL to count the number of available rooms in each block.  

SELECT BLOCK_CODE AS "Block",
count(*) "Number of available rooms"
FROM room
WHERE unavailable='false'
GROUP BY BLOCK_CODE
ORDER BY BLOCK_CODE;

select * from BLOCK

--19)Write a query in SQL to count the number of available rooms in each floor.  
--Sample table: room

select block_floor as "block",
count(*) "number of avilable rooms"
from room
where UNAVAILABLE ='false'
group by BLOCK_FLOOR
order by BLOCK_FLOOR;

--20) Write a query in SQL to count the number of available rooms for each block in each floor. ,,

select block_floor as "floor",
       block_code as "block",
count(*)"number of available rooms"
from room
where UNAVAILABLE ='false'
group by BLOCK_CODE,
         block_floor
order by block_code,
         block_floor;

--21) Write a query in SQL to count the number of unavailable rooms for each block in each floor.  

select block_floor as "floor",
Block_code as "block",
count(*)"number of available rooms"
from room
where UNAVAILABLE ='true'
group by BLOCK_CODE,
         block_floor
order by block_code,
         block_floor;

--22). Write a query in SQL to find out the floor where the maximum no of rooms are available.  

SELECT BLOCK_FLOOR as "Floor",
count(*) AS  "Number of available rooms"
FROM room
WHERE unavailable='false'
GROUP BY BLOCK_FLOOR
HAVING count(*) =
  (SELECT max(ROOM_NO) AS highest_total
   FROM
( SELECT block_floor ,
count(*) AS room_no
      FROM room
      WHERE unavailable='false'
      GROUP BY BLOCK_FLOOR ) AS t );

--23) Write a query in SQL to find out the floor where the minimum no of rooms are available.  
  -- Sample table: room
   
 SELECT BLOCK_FLOOR as "Floor",
count(*) AS  "Number of available rooms"
FROM room
WHERE unavailable='false'
GROUP BY BLOCK_FLOOR
HAVING count(*) =
  (SELECT min(ROOM_NO) AS highest_total
   FROM
( SELECT block_floor ,
count(*) AS room_no
      FROM room
      WHERE unavailable='false'
      GROUP BY BLOCK_FLOOR ) AS t );
	  ---

--24). Write a query in SQL to obtain the name of the patients, their block, floor, and room number where they are admitted.  
--Sample table: stay


SELECT p.Patient_Name AS "Patient",
       s.ROOM_NO AS "Room",
       r.BLOCK_FLOOR AS "Floor",
       r.BLOCK_CODE AS "Block"
FROM stay s
JOIN patient p ON s.PATIENT_SSN=p.Patient_SSN
JOIN room r ON s.ROOM_NO=r.ROOM_NO;


--25). Write a query in SQL to obtain the nurses and the block where they are booked for attending the patients on call.  
Sample table: nurse
Sample table: on_call


SELECT n.name AS "Nurse",
       o.BLOCK_CODE AS "Block"
FROM nurse n
JOIN on_call o ON o.employee_id=n.Employee_ID;

--26) Write a query in SQL to make a report which will show -

--a) name of the patient,
--b) name of the physician who is treating him or her,
--c) name of the nurse who is attending him or her,
--d) which treatement is going on to the patient,
--e) the date of release,
--f) in which room the patient has admitted and which floor and block the room belongs to respectively.  
--Sample table: undergoes------

select*from physician1


SELECT p.patient_name AS "Patient",
       y.name AS "Physician1",
       n.Name AS "Nurse",
       pr.procedure_name AS "Treatement going on",
       r.room_no AS "Room",
       r.block_floor AS "Floor",
       r.block_code AS "Block"
FROM undergoes u
JOIN patient p ON u.patient_ssn=p.patient_ssn
JOIN physician1 y ON u.employeeid=y.employeeid
LEFT JOIN nurse n ON u.employee_id=n.employee_id
JOIN stay s ON u.patient_ssn=s.patient_ssn
JOIN room r ON s.room_no=r.room_no
JOIN procedure1_ pr on u.procedure_code=pr.procedure_code;

--27) Write a SQL query to obtain the names of all the physicians performed a medical procedure but they are not ceritifed to perform.  

SELECT name AS "Physician1" ----- not solved
FROM physician1
WHERE employeeid IN
    ( SELECT undergoes.physician
     FROM undergoes
     LEFT JOIN trained_In ON undergoes.physician1=trained_in.physician1
     AND undergoes.procedure1_=trained_in.treatment
     WHERE treatment IS NULL );

--28) Write a query in SQL to obtain the names of all the physicians, their procedure, date when the procedure was carried out and name of the patient on which procedure have been carried out but those physicians are not cetified for that procedure.  


select * from trained_in
SELECT p. name AS "Physician1",
       pr.procedure_name AS "Procedure1_",
       u.date,
       pt.patient_name AS "Patient"
FROM physician1 p,
     undergoes u,
     patient pt,
     PROCEDURE1_ pr
WHERE u.patient_ssn = pt.patient_SSN
  AND u.procedure_code = pr.procedure_Code
  AND u.employeeid = p.EmployeeID
 AND NOT EXISTS
    ( SELECT *
     FROM trained_in t
     WHERE t.procedure_code = u.procedure_code
       AND t.employeeid = u.employeeid );

--29) Write a query in SQL to obtain the name and position of all physicians who completed a medical procedure with certification after the date of expiration of their certificate.  
Sample table: physician
Sample table: undergoes
Sample table: trained_in---

select*from trained_in


SELECT p.name AS "Physician1",
       p.name AS "Position",
       pr.procedure_name AS "Procedure1_",
       u.date AS "Date of Procedure",
       pt.patient_name AS "Patient",
       t.cert_expires AS "Expiry Date of Certificate"
FROM physician1 p,
     undergoes u,
     patient pt,
     PROCEDURE1_ pr,
     trained_in t
WHERE u.patient_ssn = pt.patient_ssn
  AND u.procedure_code = pr.procedure_code
  AND u.employeeid = p.employeeid
  AND Pr.procedure_code = t.procedure_code
  AND P.employeeid = t.employeeid
  AND u.Date > t.cert_expires;


--30) Write a query in SQL to obtain the name of all those physicians who 
---completed a medical procedure with certification after the date of expiration of their certificate, 
---their position, procedure they have done, date of procedure, name of the patient on which the procedure had been 
--applied and the date when the certification expired.   
--Sample table: physician
--Sample table: undergoes
--Sample table: patient
--Sample table: procedure
---Sample table: trained_in

select * from procedure1_
select * from trained_in
select*from undergoes

SELECT p.name AS "Physician1",
       p.name AS "Position",
       pr.procedure_name AS "Procedure1_",
       u.date AS "Date of Procedure",
       pt.patient_name AS "Patient",
       t.cert_expires AS "Expiry Date of Certificate"
FROM physician1 p,
     undergoes u,
     patient pt,
     PROCEDURE1_ pr,
     trained_in t
WHERE u.patient_ssn = pt.patient_ssn
  AND u.procedure_code = pr.procedure_code
  AND u.employeeid = p.employeeid
  AND Pr.procedure_code = t.procedure_code
  AND P.employeeid = t.employeeid
  AND u.Date > t.cert_expires;


--31) Write a query in SQL to obtain the names of all the nurses who have ever been on call for room 108.   
--Sample table: nurse
--Sample table: on_call
--Sample table: room

SELECT n.name AS "Nurse",
       o.BLOCK_CODE AS "Block"
FROM nurse n
JOIN on_call o ON o.employee_id=n.Employee_ID;

select * from room
select * from nurse
select * from on_call


select n.name as "nurse"
select oc.employee_id as "on_call"
select r.room_no as "room"
from nurse n
	 on_call oc  
	 r room_no				---id available in on_call and nurse
   WHERE oc.blockfloor = r.blockfloor
       AND oc.blockcode = r.blockcode
       AND r.roomnumber = 108 );

--32) Write a query in SQL to Obtain the names of all patients who has been prescribed some medication by his/her physician who has carried out primary care and the name of that physician.   

--Sample table: patient
--Sample table: prescribes	
--Sample table: physician

select * from patient

SELECT pt.patient_name AS "Patient",
         p.name AS "Physician1"
from patient pt
	 JOIN prescribes pr ON pr.patient_ssn=pt.patient_ssn
JOIN physician1 p ON pt.employeeid=p.employeeid
	 where pt.employeeid= p.employeeid
	 and   pt.patient_ssn = pr.patient_ssn

	 
	--  below one is solved

	 SELECT pt.patient_name AS "Patient",
         p.name AS "Physician1"
FROM patient pt
JOIN prescribes pr ON pr.patient_ssn=pt.patient_ssn
JOIN physician1 p ON pt.employeeid=p.employeeid
WHERE pt.employeeid=pr.employeeid
  AND pt.employeeid=p.employeeid;
	 

  
 --33) Write a query in SQL to obtain the names of all patients who has been undergone a procedure 
  ---costing more than $5,000 and the name of that physician who has carried out primary care.   
--Sample table: patient
--Sample table: undergoes
--Sample table: physician
--Sample table: procedure



  select pt.patient_name AS "patient",
		 p.name AS "physician",
		 pr.cost AS "procedure_cost"
		 from patient pt
		 join undergoes u on pt.patient_ssn = u.patient_ssn
		 join procedure1_ pr on u.procedure_code= pr.procedure_code
		 JOIN physician1 p ON pt.employeeid=p.employeeid
         where pr.cost >5000
		  
--34). Write a query in SQL to Obtain the names of all patients who had at least two appointment
--where the nurse who prepped the appointment was a registered nurse and the physician who has carried out primary care.   
--Sample table: appointment
--Sample table: patient
--Sample table: nurse
--Sample table: physician	

select * from appointment

select pt.patient_name AS "patient",
       a.employeeid as "primary_physician"
from  patient pt
JOIN patient pt ON a.patient_ssn=pt.patient_ssn
JOIN nurse n ON a.employee_id=n.employee_id
JOIN physician1 p ON pt.employeeid=p.employeeid
WHERE a.patient IN
    (SELECT patient
     FROM appointment a
     GROUP BY a.patient
     HAVING count(*)>=2)
  AND n.registered='true'
ORDER BY pt.name; 


