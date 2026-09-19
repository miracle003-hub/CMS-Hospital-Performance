CMS Hospital Performance Dashboard

Analysis of 5,419 US hospitals using real, public CMS (Centers for Medicare & Medicaid Services) data — covering hospital readmission rates, complication rates, and patient experience scores across all 50 states.

Tools Used
SQL Server (SSMS) — data cleaning, 4-table joins, reusable Views
Excel — Power Query connection, Pivot Tables, dark-themed multi-chart dashboard
Power BI — interactive dashboard with map, gauge, scatter plot, and state filter
Python (pandas, seaborn, scikit-learn) — statistical analysis and custom visualizations, documented in a Jupyter Notebook
Data Source

Public data from CMS Provider Data Catalog — Hospital General Information, Unplanned Hospital Visits, Complications and Deaths, and HCAHPS Patient Survey datasets.

Key Findings
Found a 0.66 correlation between average hospital complication rates and average readmission rates across all US states — suggesting complication management is a meaningful driver of readmission risk.
Hospitals CMS rated "Needs Improvement" had a 15.1 average readmission score, compared to 8.6 for High Performer hospitals — nearly double.
When isolating a single measure (AMI 30-day readmission rate), the gap narrows considerably, showing the importance of not over-generalizing across mixed measures.
Dashboards


Files in This Repository
sql_views.sql — all SQL View definitions used across the project
CMS_Hospital_Dashboard.xlsx — Excel workbook with live SQL connection and dashboard
CMS_Hospital_Dashboard.pbix — Power BI report file
CMD_Hospital.ipynb — Jupyter Notebook with statistical analysis and visualizations
Skills Demonstrated

SQL JOINs, Views, TRY_CAST data cleaning, Power Query, Pivot Tables, DAX-free Power BI visuals, pandas data wrangling, correlation analysis, group comparisons, matplotlib/seaborn visualization, and heatmap color scaling.
