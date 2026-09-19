CREATE VIEW vw_Hospital_Performance AS
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