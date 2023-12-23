CREATE DATABASE ProjectManagement;

USE ProjectManagement;

CREATE TABLE Project (
  Pid INT PRIMARY KEY,
  Pname VARCHAR(50) NOT NULL,
  startDate DATE,
  endDate DATE,
  Pdeadline DATE
);

CREATE TABLE Team (
  TMid INT PRIMARY KEY,
  TMname VARCHAR(50) NOT NULL,
  TMmanager INT
);

CREATE TABLE Task (
  TKid INT PRIMARY KEY,
  TKname VARCHAR(50) NOT NULL,
  TKdeadline DATE,
  projectID INT FOREIGN KEY REFERENCES Project(Pid) ON DELETE CASCADE,
  TKteamID INT FOREIGN KEY REFERENCES Team(TMid) ON DELETE CASCADE
);


CREATE TABLE Employee (
  Eid INT PRIMARY KEY,
  Ename VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  EteamID INT FOREIGN KEY REFERENCES Team(TMid) ON DELETE CASCADE
);

-- Sample data for Project table
INSERT INTO Project (Pid, Pname, startDate, endDate, Pdeadline)
VALUES
  (1, 'Software Upgrade Project', '2023-01-01', Null, '2023-06-01'),
  (2, 'Agile Transformation Initiative', '2023-02-15', Null, '2023-08-31'),
  (3, 'Continuous Integration Implementation', '2023-04-01', '2023-08-31', '2023-10-15'),
  (4, 'Code Refactoring Sprint', '2023-05-15', '2023-10-15', '2023-11-30'),
  (5, 'Automated Testing Framework Development', '2023-07-01', '2023-11-30', '2024-01-15'),
  (6, 'DevOps Workflow Optimization', '2023-08-15', '2024-01-15', '2024-02-28'),
  (7, 'Cloud Migration Project', '2023-10-01', '2024-02-28', '2024-04-15'),
  (8, 'User Authentication System Upgrade', '2023-11-15', Null, '2024-05-31'),
  (9, 'Mobile App Performance Optimization', '2024-01-01', '2024-05-31', '2024-07-15'),
  (10, 'Data Encryption Implementation', '2024-02-15', '2024-07-15', '2024-08-31'),
  (11, 'Scalability Assessment and Enhancement', '2024-04-01', '2024-08-31', '2024-10-15'),
  (12, 'Bug Tracking System Overhaul', '2024-05-15', Null, '2024-11-30'),
  (13, 'Microservices Architecture Implementation', '2024-07-01', '2024-11-30', '2025-01-15'),
  (14, 'AI Integration for Predictive Analysis', '2024-08-15', '2025-01-15', '2025-02-28'),
  (15, 'Code Review Process Optimization', '2024-10-01', '2025-02-28', '2025-04-15'),
  (16, 'Containerization for Deployment', '2024-11-15', Null, '2025-05-31'),
  (17, 'Cross-Platform Compatibility Testing', '2025-01-01', '2025-05-31', '2025-07-15'),
  (18, 'Knowledge Transfer Workshops', '2025-02-15', '2025-07-15', '2025-08-31'),
  (19, 'API Documentation Standardization', '2025-04-01', '2025-08-31', '2025-10-15'),
  (20, 'Security Vulnerability Assessment', '2025-05-15', '2025-10-15', '2025-11-30'),
  (21, 'Agile Scrum Training Program', '2025-07-01', '2025-11-30', '2026-01-15'),
  (22, 'UI/UX Redesign Initiative', '2025-08-15', '2026-01-15', '2026-02-28'),
  (23, 'Database Performance Tuning', '2026-01-01', Null, '2026-04-15'),
  (24, 'Git Workflow Optimization', '2026-02-15', '2026-04-15', '2026-05-31'),
  (25, 'Automated Deployment Pipeline Setup', '2026-04-01', '2026-05-31', '2026-07-15'),
  (26, 'AI-driven Chatbot Implementation', '2026-05-15', Null, '2026-08-31'),
  (27, 'Code Quality Metrics Implementation', '2026-07-01', '2026-08-31', '2026-10-15'),
  (28, 'IT Security Awareness Program', '2026-08-15', Null, '2026-11-30'),
  (29, 'Container Orchestration Setup', '2026-10-01', '2026-11-30', '2027-01-15'),
  (30, 'Blockchain Integration Strategy', '2026-11-15', '2027-01-15', '2027-02-28');

-- Sample data for Team table
INSERT INTO Team (TMid, TMname, TMmanager)
VALUES
  (1, 'Development Team A', 1),
  (2, 'Development Team B', 2),
  (3, 'DevOps Team', 3),
  (4, 'QA Team', 4),
  (5, 'Security Team', 5),
  (6, 'Scrum Master Team', 6),
  (7, 'Cloud Team', 7),
  (8, 'Authentication Team', 8),
  (9, 'Mobile Team', 9),
  (10, 'Security Team 2', 10),
  (11, 'Scrum Master Team 2', 11),
  (12, 'Bug Tracking Team', 12),
  (13, 'Microservices Team', 13),
  (14, 'AI Team', 14),
  (15, 'Code Review Team', 15),
  (16, 'Containerization Team', 16),
  (17, 'Compatibility Testing Team', 17),
  (18, 'Knowledge Transfer Team', 18),
  (19, 'API Documentation Team', 19),
  (20, 'Security Assessment Team', 20),
  (21, 'Scrum Master Team 3', 21),
  (22, 'UI/UX Redesign Team', 22),
  (23, 'Database Team', 23),
  (24, 'Git Team', 24),
  (25, 'Deployment Team', 25),
  (26, 'Chatbot Team', 26),
  (27, 'Code Metrics Team', 27),
  (28, 'Security Awareness Team', 28),
  (29, 'Container Orchestration Team', 29),
  (30, 'Blockchain Integration Team', 30);

INSERT INTO Employee (Eid, Ename, email, password, EteamID)
VALUES
  (1, 'John Doe', 'john.doe@example.com', 'password123', 1),
  (2, 'Jane Smith', 'jane.smith@example.com', 'securepass', 2),
  (3, 'Bob Johnson', 'bob.johnson@example.com', 'pass123', 3),
  (4, 'Alice Williams', 'alice.williams@example.com', 'password456', 4),
  (5, 'Charlie Brown', 'charlie.brown@example.com', 'securepass789', 3),
  (6, 'Eva Martinez', 'eva.martinez@example.com', 'pass789', 6),
  (7, 'David Lee', 'david.lee@example.com', 'password789', 3),
  (8, 'Sophie Clark', 'sophie.clark@example.com', 'securepass123', 8),
  (9, 'Michael White', 'michael.white@example.com', 'pass456', 2),
  (10, 'Olivia Green', 'olivia.green@example.com', 'password890', 1),
  (11, 'Andrew Davis', 'andrew.davis@example.com', 'securepass890', 6),
  (12, 'Emma Taylor', 'emma.taylor@example.com', 'pass890', 6),
  (13, 'William Brown', 'william.brown@example.com', 'password789', 5),
  (14, 'Sophia Harris', 'sophia.harris@example.com', 'securepass456', 2),
  (15, 'Daniel Robinson', 'daniel.robinson@example.com', 'pass123', 1),
  (16, 'Ava Wilson', 'ava.wilson@example.com', 'password890', 4),
  (17, 'Liam Evans', 'liam.evans@example.com', 'securepass123', 5),
  (18, 'Mia Turner', 'mia.turner@example.com', 'pass456', 2),
  (19, 'Noah Brooks', 'noah.brooks@example.com', 'password789', 3),
  (20, 'Isabella Reed', 'isabella.reed@example.com', 'securepass456', 1),
  (21, 'James Allen', 'james.allen@example.com', 'pass123', 7),
  (22, 'Sophie Carter', 'sophie.carter@example.com', 'password890', 8),
  (23, 'Benjamin Turner', 'benjamin.turner@example.com', 'securepass890', 8),
  (24, 'Chloe White', 'chloe.white@example.com', 'pass123', 9),
  (25, 'Ethan Martinez', 'ethan.martinez@example.com', 'password789', 7),
  (26, 'Ava Perez', 'ava.perez@example.com', 'securepass890', 3),
  (27, 'Mia Nelson', 'mia.nelson@example.com', 'pass890', 4),
  (28, 'Oliver Garcia', 'oliver.garcia@example.com', 'password890', 9),
  (29, 'Amelia Clark', 'amelia.clark@example.com', 'securepass890', 4),
  (30, 'Lucas Perez', 'lucas.perez@example.com', 'pass456', 3);


-- Sample data for Task table
INSERT INTO Task (TKid, TKname, TKdeadline, projectID, TKteamID)
VALUES
  (1, 'Backend Upgrade', '2023-03-01', 1, 1),
  (2, 'Agile Tool Integration', '2023-05-15', 2, 2),
  (3, 'CI Pipeline Optimization', '2023-06-30', 3, 3),
  (4, 'Code Refactoring Sprint 1', '2023-07-31', 4, 4),
  (5, 'Testing Framework Development', '2023-09-15', 5, 5),
  (6, 'DevOps Workflow Improvement', '2023-10-15', 6, 6),
  (7, 'Cloud Migration Planning', '2023-11-30', 7, 7),
  (8, 'Authentication System Upgrade', '2023-12-31', 8, 8),
  (9, 'Mobile Performance Optimization', '2024-01-31', 9, 9),
  (10, 'Data Encryption Implementation', '2024-02-28', 10, 1),
  (11, 'Scalability Assessment', '2024-03-01', 11, 1),
  (12, 'Bug Tracking System Overhaul', '2024-04-15', 12, 1),
  (13, 'Microservices Architecture Implementation', '2024-05-30', 13, 3),
  (14, 'AI Predictive Analysis Integration', '2024-06-30', 14, 4),
  (15, 'Code Review Process Optimization', '2024-08-15', 15, 5),
  (16, 'Containerization Deployment Planning', '2024-09-30', 16, 6),
  (17, 'Compatibility Testing Sprint', '2024-10-31', 17, 7),
  (18, 'Knowledge Transfer Workshop 1', '2024-12-15', 18, 8),
  (19, 'API Documentation Standardization', '2025-01-15', 19, 9),
  (20, 'Security Vulnerability Assessment', '2025-02-28', 20, 2),
  (21, 'Agile Scrum Training Workshop', '2025-03-31', 21, 2),
  (22, 'UI/UX Redesign Initiative', '2025-04-30', 22, 2),
  (23, 'Database Performance Tuning', '2025-05-31', 23, 3),
  (24, 'Git Workflow Optimization', '2025-07-15', 24, 4),
  (25, 'Automated Deployment Pipeline Setup', '2025-08-15', 25, 5),
  (26, 'AI Chatbot Implementation', '2025-09-30', 26, 6),
  (27, 'Code Quality Metrics Implementation', '2025-10-31', 27, 7),
  (28, 'IT Security Awareness Program', '2025-12-15', 28, 8),
  (29, 'Container Orchestration Setup', '2026-01-31', 29, 9),
  (30, 'Blockchain Integration Strategy', '2026-02-28', 30, 3);

-- Function to get unfinished projects
CREATE FUNCTION UnFinishedProjects()
RETURNS @resultTable TABLE(
    PID INT,
    PName VARCHAR(50),
    PDeadline DATE
  )
AS
BEGIN
  INSERT INTO @resultTable
  SELECT Pid, Pname, Pdeadline
  FROM Project
  WHERE endDate is Null;

  RETURN;
END

-- Function to Project the Projects have been finished
CREATE FUNCTION FinishedProjects()
RETURNS TABLE
AS
RETURN
(
  SELECT Pid, Pname, Pdeadline
  FROM Project
  WHERE endDate IS NOT NULL
);


SELECT * FROM UnFinishedProjects();
SELECT * FROM FinishedProjects();

DROP FUNCTION UnFinishedProjects;

-- Stored procedure that selects the names of the employees working on a specific project
CREATE PROCEDURE GetEmployeesForProject
  @ProjectID INT
AS
BEGIN
  SELECT DISTINCT E.Ename
  FROM Employee E
  JOIN Team ON E.EteamID = Team.TMid
  JOIN Task T ON Team.TMid = T.TKteamID
  WHERE T.projectID = @ProjectID;
END;

-- Example: Get employees' names working on the project with ID = 2
EXEC GetEmployeesForProject @ProjectID = 2;


-- Project the project's id and name with the number of employees work on
SELECT projectID, Project.Pname , COUNT(*) as NumberofEmp
FROM
Employee JOIN Team ON EteamID = Tmid
JOIN Task ON TKteamID = TMid
JOIN Project ON Pid = Task.projectID
GROUP BY projectID, Project.Pname;

-- Trigger to Update Project Deadline
CREATE TRIGGER UpdateProjectDeadline
ON Project
AFTER UPDATE
AS
BEGIN
  IF UPDATE(endDate)
  BEGIN
    UPDATE p
    SET p.Pdeadline = i.endDate
    FROM Project p
    INNER JOIN inserted i ON p.Pid = i.Pid;
  END
END;

-- Updating the endDate of a project will automatically trigger the UpdateProjectDeadline trigger
UPDATE Project
SET endDate = '2023-07-15'
WHERE Pid = 1;
