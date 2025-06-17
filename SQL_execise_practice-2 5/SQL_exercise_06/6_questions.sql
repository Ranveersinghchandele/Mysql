-- https://en.wikibooks.org/wiki/SQL_Exercises/Scientists
-- 6.1 List all the scientists' names, their projects' names, 
    -- and the hours worked by that scientist on each project, 
    -- in alphabetical order of project name, then scientist name.
    SELECT Projects.Name ProjectName,Scientists.Name ScientiestName,Projects.Hours
    FROM Projects
    INNER JOIN AssignedTo
    ON Projects.Code=AssignedTo.Project
    INNER JOIN Scientists
    ON AssignedTo.Scientist=Scientists.SSN
    ORDER BY Projects.Name, Scientists.Name;
    
-- 6.2 Select the project names which are not assigned yet
SELECT DISTINCT Projects.Name 
FROM Projects
LEFT JOIN AssignedTo
ON Projects.Code=AssignedTo.Project
WHERE AssignedTo.Project IS NULL;

-- ----DONE--