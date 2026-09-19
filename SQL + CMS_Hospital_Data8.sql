CREATE VIEW vw_Hospital_HCAHPS AS
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
    h.HCAHPS_Question,
    h.HCAHPS_Answer_Percent
FROM Hospital_General_Information g
LEFT JOIN [HCAHPS-Hospital] h
    ON RIGHT('000000' + g.Facility_ID, 6) = h.Facility_ID;