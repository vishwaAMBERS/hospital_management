📁 Hospital Management Database Project -

This project contains the complete database model, schema, data, and resources for a Hospital Management System, designed and implemented using MySQL Workbench.

──────────────────────────────────────────────
🛠 Requirements:
- MySQL Server (8.x preferred)
- MySQL Workbench
──────────────────────────────────────────────

📂 Folder Contents:
1. hospital_management.mwb  
   → MySQL Workbench model (ER Diagram and schema design)

2. hospital management ER Diagram.pdf  
   → ER Diagram (exported from MySQL Workbench)

3. hospital_management_ddl.sql  
   → SQL script for creating all required tables (schema)

4. hospital_management_dml.sql  
   → SQL script for inserting sample data into tables

5. hospital management backup/ hospital_management_backup.sql  
   → Full backup including schema + data

6. screenshots/  
   → Screenshots of executed queries and sample outputs

──────────────────────────────────────────────

📦 How to Import and Run:

1. Open MySQL Workbench and connect to your MySQL Server.

2. To create the database and tables:
   - Open `hospital_management_ddl.sql`
   - Execute all commands (Ctrl + Shift + Enter)

3. To insert the data:
   - Open `hospital_management_dml.sql`
   - Execute all commands (Ctrl + Shift + Enter)

   OR, to restore everything at once:
   - Open `hospital_management_backup.sql` and run it directly.

4. To view the ER diagram:
   - Open `hospital_management.mwb` in MySQL Workbench
   - Use the EER Diagram tab

5. Run Queries:
   - Example:
     ```sql
     SHOW DATABASES;
     USE hospital_management;
     SHOW TABLES;
     SELECT * FROM patients;
     ```

──────────────────────────────────────────────

💡 Tip:
Make sure the database name in all `.sql` files matches the name you're using in MySQL Workbench.

──────────────────────────────────────────────

👨‍💻 Created by: sanchit
📅 Date: April 4, 2025

