CREATE VIEW vw_Hospital_Readmissions AS
SELECT
    g.Facility_Name,
    g.State,
    g.Hospital_overall_rating,
    CASE
        WHEN g.Hospital_overall_rating >= 4 THEN 'High Performer'
        WHEN g.Hospital_overall_rating = 3 THEN 'Average'
        WHEN g.Hospital_overall_rating <= 2 THEN 'Needs Improvement'
        ELSE 'Not Rated'
    END AS Performance_Tier,
    v.Measure_Name AS Readmission_Measure,
    v.Score AS Readmission_Score
FROM Hospital_General_Information g
LEFT JOIN [Unplanned_Hospital_Visits-Hospital] v
    ON RIGHT('000000' + g.Facility_ID, 6) = v.Facility_ID;