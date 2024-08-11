# Superstore-Sales-Analysis-
To analyse Superstore Sales data using SQL to uncover trends, patterns, and correlations that can provide valuable insights and actionable information to improve business performance and decision-making.

# Step-by-Step Project Approach:
# 1. Build a Database
•	Database Creation: Establish a database structure for storing sales data.
•	Table Creation: Define a table schema with fields like invoice_id, branch, product_line, etc.
•	Data Insertion: Insert the data. Null values are not present in our database because, in creating the tables, NOT NULL was specified for each field, effectively filtering out any null values.
# 2. Feature Engineering
•	Time of Day Analysis:
o	New Column: Create time_of_day to categorize sales into Morning, Afternoon, Evening.
o	Purpose: Understand peak sales periods during different times of the day.
•	Day of Week Analysis:
o	New Column: Introduce day_name to identify days (Mon, Tue, etc.) of transactions.
o	Purpose: Analyse which days see the highest transaction volumes per branch.
•	Month of Year Analysis:
o	New Column: Add month_name to capture transaction months (Jan, Feb, etc.).
o	Purpose: Determine which months contribute most to sales and profit.
# 3. Exploratory Data Analysis (EDA)
•	Conducting exploratory data analysis is essential to address the project's  objectives.
