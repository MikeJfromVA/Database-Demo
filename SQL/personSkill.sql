DROP TABLE IF EXISTS Person CASCADE;
DROP TABLE IF EXISTS Skill;

CREATE TABLE Person (
  FirstName text,
  LastName text,
  Age int CHECK (Age > 0),
  CONSTRAINT Person_PK PRIMARY KEY (FirstName, LastName)
);

CREATE TABLE Skill (
    FirstName text,
    LastName text,
    SkillName text,
    CONSTRAINT Skill_PK PRIMARY KEY (FirstName, LastName, SkillName),
    CONSTRAINT Skill_FK FOREIGN KEY (FirstName,LastName) REFERENCES Person(FirstName, LastName)
);
    
 INSERT INTO Person (FirstName, LastName, Age)
 VALUES 
   ('Mike','Johnson',45),
   ('Angela','Johnson',45),
   ('Ellissa','Johnson',17),
   ('Eira','Johnson',99)
;
 
 INSERT INTO Skill (FirstName, LastName, SkillName)
 VALUES 
   ('Mike','Johnson','Java'),
   ('Angela','Johnson','Excel'),
   ('Ellissa','Johnson','Minecraft'),
   ('Eira','Johnson','Karate')
;
SELECT * FROM Person;   

SELECT * FROM Skill;
