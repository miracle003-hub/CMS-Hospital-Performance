SELECT TOP 10
    g.Facility_Name,
    g.Facility_ID,
    v.Facility_ID AS visits_id
FROM Hospital_General_Information g
LEFT JOIN [Unplanned_Hospital_Visits-Hospital] v
    ON g.Facility_ID = v.Facility_ID;

    SELECT TOP 5 Facility_ID FROM [Unplanned_Hospital_Visits-Hospital];

    SELECT TOP 10
    g.Facility_Name,
    g.Facility_ID,
    v.Facility_ID AS visits_id
FROM Hospital_General_Information g
LEFT JOIN [Unplanned_Hospital_Visits-Hospital] v
    ON RIGHT('000000' + g.Facility_ID, 6) = v.Facility_ID;

    SELECT TOP 10
    Facility_ID,
    Measure_ID,
    Measure_Name
FROM [Unplanned_Hospital_Visits-Hospital]
WHERE Facility_ID = '010001';


SELECT top 100
    g.Facility_Name,
    g.Facility_ID,
    v.Measure_Name,
    v.Score
FROM Hospital_General_Information g
LEFT JOIN [Unplanned_Hospital_Visits-Hospital] v
    ON RIGHT('000000' + g.Facility_ID, 6) = v.Facility_ID
WHERE v.Measure_ID = 'READM_30_AMI';

SELECT TOP 5 Facility_ID FROM [Complications_and_Deaths-Hospital];

SELECT TOP 10
    g.Facility_Name,
    g.Facility_ID,
    v.Score AS AMI_Readmission_Score,
    c.Measure_Name AS Complication_Measure,
    c.Score AS Complication_Score
FROM Hospital_General_Information g
LEFT JOIN [Unplanned_Hospital_Visits-Hospital] v
    ON RIGHT('000000' + g.Facility_ID, 6) = v.Facility_ID
    AND v.Measure_ID = 'READM_30_AMI'
LEFT JOIN [Complications_and_Deaths-Hospital] c
    ON RIGHT('000000' + g.Facility_ID, 6) = c.Facility_ID;

    SELECT TOP 5 Facility_ID FROM [HCAHPS-Hospital];

    SELECT TOP 10
    g.Facility_Name,
    g.Facility_ID,
    v.Score AS AMI_Readmission_Score,
    c.Measure_Name AS Complication_Measure,
    c.Score AS Complication_Score,
    h.HCAHPS_Question,
    h.HCAHPS_Answer_Percent
FROM Hospital_General_Information g
LEFT JOIN [Unplanned_Hospital_Visits-Hospital] v
    ON RIGHT('000000' + g.Facility_ID, 6) = v.Facility_ID
    AND v.Measure_ID = 'READM_30_AMI'
LEFT JOIN [Complications_and_Deaths-Hospital] c
    ON RIGHT('000000' + g.Facility_ID, 6) = c.Facility_ID
LEFT JOIN [HCAHPS-Hospital] h
    ON RIGHT('000000' + g.Facility_ID, 6) = h.Facility_ID;

    SELECT
    g.Facility_Name,
    g.State,
    g.Facility_ID
FROM Hospital_General_Information g
WHERE g.State = 'AL';

SELECT
    g.Facility_Name,
    g.State,
    g.Hospital_overall_rating
FROM Hospital_General_Information g
WHERE g.State = 'AL'
ORDER BY g.Hospital_overall_rating ASC;


SELECT
    g.State,
    AVG(CAST(g.Hospital_overall_rating AS FLOAT)) AS Avg_Rating,
    COUNT(*) AS Hospital_Count
FROM Hospital_General_Information g
WHERE g.Hospital_overall_rating IS NOT NULL
GROUP BY g.State
ORDER BY Avg_Rating DESC;


SELECT
    g.State,
    ROUND(AVG(CAST(g.Hospital_overall_rating AS FLOAT)), 2) AS Avg_Rating,
    COUNT(*) AS Hospital_Count
FROM Hospital_General_Information g
WHERE g.Hospital_overall_rating IS NOT NULL
GROUP BY g.State
ORDER BY Avg_Rating DESC;


SELECT
    g.Facility_Name,
    g.State,
    g.Hospital_overall_rating,
    CASE
        WHEN g.Hospital_overall_rating >= 4 THEN 'High Performer'
        WHEN g.Hospital_overall_rating = 3 THEN 'Average'
        WHEN g.Hospital_overall_rating <= 2 THEN 'Needs Improvement'
        ELSE 'Not Rated'
    END AS Performance_Tier
FROM Hospital_General_Information g
WHERE g.State = 'AL'
ORDER BY g.Hospital_overall_rating DESC;

SELECT TOP 10 * FROM vw_Hospital_Performance;