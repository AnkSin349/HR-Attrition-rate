--Job Involvement and attrition
SELECT
    JobInvolvement,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
    (CAST(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*)) * 100 AS AttritionPercentage
FROM
    attrition
GROUP BY
    JobInvolvement
ORDER BY
    AttritionPercentage DESC; 

-- Education Level
SELECT
    Education,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
    (CAST(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*)) * 100 AS AttritionPercentage
FROM
    attrition
GROUP BY
    Education
ORDER BY
    AttritionPercentage DESC;

--Gender
SELECT
    Gender,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
    (CAST(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*)) * 100 AS AttritionPercentage
FROM
    attrition
GROUP BY
    Gender
ORDER BY
    AttritionPercentage DESC; 

--Job Role 
SELECT
    JobRole,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
    (CAST(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*)) * 100 AS AttritionPercentage
FROM
    attrition
GROUP BY
    JobRole
ORDER BY
    AttritionPercentage DESC; 

--Department
SELECT
    Department,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS AttritionCount,
    (CAST(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*)) * 100 AS AttritionPercentage
FROM
    attrition
GROUP BY
    Department
ORDER BY
    AttritionPercentage DESC; 

--Age and salary
SELECT
    AVG(CASE WHEN Attrition = 'Yes' THEN MonthlyIncome END) AS AvgIncomeWithAttrition,
    AVG(CASE WHEN Attrition = 'No' THEN MonthlyIncome END) AS AvgIncomeWithoutAttrition,
    AVG(CASE WHEN Attrition = 'Yes' THEN Age END) AS AvgAgeWithAttrition,
    AVG(CASE WHEN Attrition = 'No' THEN Age END) AS AvgAgeWithoutAttrition
FROM
    attrition;


--Are older employees more likely to leave the company?
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS AgeCategory,
    AVG(MonthlyIncome) AS AvgMonthlyIncome,
    COUNT(*) AS AttritionCount,
    (COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()) AS AttritionPercentage
FROM
    attrition
WHERE
    Attrition = 'Yes'
GROUP BY
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END;

-- Are employees in certain departments or job roles more likely to experience attrition than others?
SELECT
    Department,
    JobRole,
    COUNT(*) AS AttritionCount
FROM
    attrition
WHERE
    Attrition = 'Yes'
GROUP BY
    Department, JobRole
ORDER BY
    Department, JobRole;


