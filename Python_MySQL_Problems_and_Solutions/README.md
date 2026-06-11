### What is included in this README:
* **Technical Focus & Core Concepts:** Clearly categorizes what parts of SQL are tested (Correlated Subqueries, Window Functions, Time-Series/Date Arithmetic, Hierarchical Self-Joins).
* **Database Setup & Schema Isolation:** Explains how the script manages different database states and tables (`employees1`, `employees11`, `Sales`, etc.) so users don't get confused by the switching schemas.
* **Code Highlight Highlights:** Isolates 3 core interview paradigms directly from your code snippets (The $N^{th}$ Highest Salary CTE, Correlated Subqueries, and Self-Joins) to show potential employers or readers the complexity level of the script.
* **Platform Compatibility Notes:** Highlights that the queries are written specifically for **MySQL** while explaining why certain methods were used (like using an `INNER JOIN` logic pattern since MySQL lacks a native `INTERSECT` operator, and commenting out the SQL Server specific `FOR XML AUTO` line).
