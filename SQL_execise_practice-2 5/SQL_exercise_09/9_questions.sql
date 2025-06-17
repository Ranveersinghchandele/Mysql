SELECT * FROM sql9;

-- 9.1 give the total number of recordings in this table
SELECT COUNT(*) FROM sql9;

-- 9.2 the number of packages listed in this table?
SELECT COUNT(package) FROM sql9;

-- 9.3 How many times the package "Rcpp" was downloaded?
SELECT Count(package) AS Downloads
FROM sql9
WHERE package='Rcpp';

-- 9.4 How many recordings are from China ("CN")?
SELECT COUNT(*) Num_of_recordings
FROM sql9
WHERE country='CN';

-- 9.5 Give the package name and how many times they're downloaded. Order by the 2nd column descently.
SELECT DISTINCT package Package_Name,COUNT(package) Number_of_Downloads
FROM sql9
GROUP By package
ORDER BY Number_of_Downloads;

-- 9.6 Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM
SELECT package,
COUNT(package) AS Number_of_Downloads
FROM sql9
WHERE TIME(sql9.time) BETWEEN '09:00:00' AND '11:00:00'
GROUP BY package
ORDER BY Number_of_Downloads DESC;

-- 9.7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
SELECT COUNT(*) Num_of_recordings
FROM sql9
WHERE country IN ("CN","JP","SG");

-- 9.8 Print the countries whose downloaded are more than the downloads from China ("CN")
SELECT DISTINCT country ,COUNT(country) AS C
FROM sql9
GROUP BY country
HAVING COUNT(country)> (SELECT COUNT(*) FROM sql9
WHERE country='CN')
ORDER BY country;

-- 9.9 Print the average length of the package name of all the UNIQUE packages
SELECT AVG(char_length(package)) AS Total_char FROM sql9;


-- 9.10 Get the package whose downloading count ranks 2nd (print package name and it's download count).
SELECT package, COUNT(package) AS Download_count FROM sql9
GROUP BY package
ORDER BY Download_count DESC
LIMIT 1 OFFSET 1;


-- 9.11 Print the name of the package whose download count is bigger than 1000.
SELECT package FROM sql9
GROUP BY package
HAVING COUNT(package) >1000;
	
-- 9.12 The field "r_os" is the operating system of the users.
    -- 	Here we would like to know what main system we have (ignore version number), the relevant counts, and the proportion (in percentage
    SELECT DISTINCT r_os, COUNT(r_os) C,(r_os) DIV (SELECT (COUNT(r_os))) AS percentage FROM sql9
    GROUP BY r_os
    ORDER BY C DESC; -- percentage is wrong
