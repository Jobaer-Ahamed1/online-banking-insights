1. Extract
Data Source: The data was extracted from a MySQL database containing online banking transaction records.
Tables: Key tables included:
Customer Table: Contains details about each customer (e.g., customer ID, region, area).
Transaction Table: Holds transaction data with attributes such as transaction ID, type (deposit or withdrawal), amount, date, and customer ID.
Area and Region Tables: Define area and region classifications to aid in geographical analysis.
Extraction Method: Used SQL queries to pull relevant data from the database.
2. Transform
The transformation process was essential for cleaning and structuring data to ensure consistency and facilitate analysis in Power BI.
Data Cleaning
Removing Duplicates: Checked and removed any duplicate records in the transaction and customer tables.
Null Handling: Replaced or removed any null values in critical columns, especially in transaction amounts, transaction type, and date fields.
Standardizing Data Types: Ensured that numerical data, dates, and strings were in the correct format (e.g., amount fields as numeric, dates in YYYY-MM-DD format).
Data Aggregation and Calculation
Weekly and Monthly Aggregation: Created new fields to aggregate transaction amounts by week and month for both deposits and withdrawals. This helped in calculating trends over different time periods.
Customer Segmentation: Categorized customers by ID and grouped them by area and region, enabling a detailed breakdown of transactions across these dimensions.
Week-over-Week Deposit Change: Calculated the weekly deposit changes to monitor growth or decline, using SQL window functions.
Data Enrichment
Region and Area Mapping: Joined the transaction data with area and region tables to add geographic context to each transaction.
Transaction Type Encoding: Standardized transaction types (e.g., "deposit" as 1, "withdrawal" as 0) to ensure consistent categorization.
3. Load
Load to Power BI: After transformation, the data was loaded into Power BI using MySQL connectors.
Table Relationships: Established relationships between the Customer, Transaction, Area, and Region tables in Power BI to enable drill-down and cross-filtering capabilities.
Data Refresh: Configured scheduled data refreshes in Power BI to keep the dashboard up to date with new transactions.
4. Data Validation and Testing
Consistency Checks: Validated aggregated amounts and transaction counts to ensure that the loaded data matched the original source.
Spot Checks: Conducted spot checks on weekly and monthly calculations for deposit trends and customer segmentation.
Visual Testing: Tested Power BI visuals to confirm accurate representation of data (e.g., verifying that bar chart totals aligned with aggregated totals in MySQL).

--------
This ETL process ensured that the data loaded into Power BI was reliable, consistent, and structured to support meaningful analysis and visualizations. The transformation steps helped in deriving weekly and monthly insights and enabled regional transaction analysis, providing valuable insights for understanding customer behavior in online banking.


