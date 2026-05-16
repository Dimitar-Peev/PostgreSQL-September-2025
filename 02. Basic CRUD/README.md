# 📘 Basic CRUD

## 📑 Table of Contents

* [Lexical Structure](#-lexical-structure)
* [Retrieving Data (SELECT)](#-retrieving-data-select)
* [Filtering Data (WHERE)](#-filtering-data-where)
* [Data Manipulation (CRUD)](#-data-manipulation-crud)
* [Views](#-views)
* [Common Patterns](#-common-patterns)

---

## 🔤 Lexical Structure

### Case Sensitivity

* SQL keywords are **case-insensitive**
* Convention:

    * Keywords → `UPPERCASE`
    * Table/column names → `lowercase`

```sql
CREATE TABLE customer;
create table customer;
CrEaTe TaBlE customer;
```

---

### Strings & Identifiers

* Strings → `'single quotes'`
* Identifiers with special chars → `"double quotes"` (case-sensitive)

```sql
-- SELECT with some mathematical function gives us a result -> works like PRINT
SELECT 2 * 6;
SELECT 'Hello'; -- works like PRINT
SELECT "Full Name";
```

---

### Comments

```sql
-- Single line

/* Multi-line */
```

---

## 🔍 Retrieving Data (SELECT)

### Basic Query

```sql
SELECT * FROM "clients";
```

### Select Specific Columns

```sql
SELECT "first_name", "last_name" FROM "clients";
```

---

### Aliases

```sql
SELECT "first_name" AS "First Name"
FROM "clients";
```

---

### Concatenation

```sql
SELECT "first_name" || ' ' || "last_name" AS "Full Name"
FROM "clients";
```

---

### LIMIT (Top N Rows)

```sql
SELECT "id", "first_name"
FROM "clients"
LIMIT 2;
```

---

### ORDER BY

```sql
SELECT "last_name", "salary"
FROM "employees"
ORDER BY "salary" DESC;
```

---

## 🧮 Filtering Data (WHERE)

### Basic Filtering

```sql
SELECT *
FROM "employees"
WHERE "id" <= 2;
```

---

### Comparison Operators

```sql
=   !=   <>   >   >=   <   <=
```

---

### DISTINCT

```sql
SELECT DISTINCT "first_name" FROM "employees";
```

---

### Logical Operators

```sql
-- AND
WHERE "salary" = 900 AND "first_name" = 'John';

-- OR
WHERE "salary" = 900 OR "salary" = 1100;

-- NOT
WHERE NOT "salary" = 900;
```

---

### BETWEEN

```sql
WHERE "salary" BETWEEN 900 AND 2100;
```

---

### IN / NOT IN

```sql
WHERE "salary" IN (900, 1100, 2100);

WHERE "salary" NOT IN (900, 1100, 2100);
```

---

### NULL Handling ⚠️

```sql
-- Correct
WHERE "last_name" IS NULL;
WHERE "last_name" IS NOT NULL;

-- Wrong (always false)
WHERE "last_name" = NULL;
```

---

## ✏️ Data Manipulation (CRUD)

---

### ➕ INSERT

```sql
INSERT INTO "towns" 
VALUES (33, 'Paris');

INSERT INTO "towns"("name")
VALUES ('Sofia');

-- Multiple rows
INSERT INTO "towns"("name")
VALUES ('London'), ('Rome');
```

---

### INSERT from SELECT

```sql
INSERT INTO "projects"("name", "start_date")
SELECT "name" || ' Restructuring', '2023-01-01'
FROM "departments";
```

---

### 🔄 UPDATE

```sql
UPDATE "employees"
SET "salary" = "salary" * 1.10
WHERE "department_id" = 3;
```

⚠️ Without `WHERE` → updates ALL rows

---

### Example

```sql
UPDATE "employees"
SET "salary" = "salary" + 100
WHERE "job_title" = 'Manager';
```

---

### 🗑 DELETE

```sql
DELETE FROM "employees"
WHERE "id" = 1;
```

⚠️ Without `WHERE` → deletes ALL rows

---

### TRUNCATE (Faster)

```sql
TRUNCATE TABLE "employees";
```

---

## 👁 Views

### What is a View?

* Virtual table based on a query
* Does NOT store data physically
* Simplifies complex queries

---

### Create View

```sql
CREATE VIEW hr_result_set AS
SELECT
  "first_name" || ' ' || "last_name" AS "Full Name",
  "salary"
FROM "employees";
```

---

### Use View

```sql
SELECT * FROM hr_result_set;
```

---

### Example: Top Paid Employee

```sql
CREATE VIEW top_paid_employee AS
SELECT *
FROM "employees"
ORDER BY "salary" DESC
LIMIT 1;
```

---

## ⚙️ Common Patterns

### Filter + Sort

```sql
SELECT "id",
       "first_name" || ' ' || "last_name" AS full_name,
       "salary"
FROM "employees"
WHERE "salary" > 1000
ORDER BY "id";
```

---

### Multiple Conditions

```sql
SELECT *
FROM "employees"
WHERE "salary" >= 1000
AND "department_id" = 4
ORDER BY "id";
```

---

### Update NULL Values

```sql
UPDATE "clients"
SET "last_name" = 'Unknown'
WHERE "last_name" IS NULL;
```

---

## ✅ Summary

* SQL syntax is flexible but follows conventions
* `SELECT` retrieves data with filtering and sorting
* `WHERE` enables precise control over results
* CRUD operations:

    * `INSERT` → create
    * `SELECT` → read
    * `UPDATE` → modify
    * `DELETE` → remove
* Views simplify and reuse complex queries
