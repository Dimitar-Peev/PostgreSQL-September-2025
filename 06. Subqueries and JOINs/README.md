# 📘 PostgreSQL Joins, Subqueries & Indices Cheat Sheet

## 📑 Table of Contents

* [JOINs](#-joins)
* [JOIN Types](#-join-types)
* [Subqueries](#-subqueries)
* [Indices](#-indices)
* [Common Patterns](#-common-patterns)

---

## 🔗 JOINs

* JOINs combine data from multiple tables
* Used when related information is stored separately

---

### Basic JOIN Syntax

```sql id="t5s5ln"
SELECT *
FROM table_a
       JOIN table_b
            ON table_a.id = table_b.id;
```

---

### Cartesian Product ⚠️

Occurs when no join condition exists.

```sql id="3yr9bz"
SELECT "last_name", "name"
FROM "employees",
     "departments";
```

✔ Every row from the first table combines with every row from the second table

---

## 🔄 JOIN Types

---

### INNER JOIN

Returns matching rows from both tables.

```sql id="f6odv4"
SELECT e."first_name",
       d."name"
FROM "employees" AS e
       INNER JOIN "departments" AS d
                  ON e."department_id" = d."department_id";
```

---

### LEFT JOIN

Returns all rows from the left table.

```sql id="cw08pi"
SELECT e."first_name",
       d."name"
FROM "employees" AS e
       LEFT JOIN "departments" AS d
                 ON e."department_id" = d."department_id";
```

✔ Non-matching rows return `NULL`

---

### RIGHT JOIN

Returns all rows from the right table.

```sql id="fh1gsv"
SELECT e."first_name",
       d."name"
FROM "employees" AS e
       RIGHT JOIN "departments" AS d
                  ON e."department_id" = d."department_id";
```

---

### FULL JOIN

Returns all rows from both tables.

```sql id="rt93vk"
SELECT e."first_name",
       d."name"
FROM "employees" AS e
       FULL JOIN "departments" AS d
                 ON e."department_id" = d."department_id";
```

---

### CROSS JOIN

Creates a Cartesian product.

```sql id="yj9vna"
SELECT d."department_id",
       d."name",
       e."employee_id",
       e."first_name"
FROM "departments" AS d
       CROSS JOIN "employees" AS e;
```

⚠️ Can generate huge result sets

---

## 🧠 Subqueries

* A query nested inside another query
* Often used in:

    * `WHERE`
    * `SELECT`
    * `INSERT`
    * `UPDATE`
    * `DELETE`

---

### Basic Example

```sql id="a4r2zv"
SELECT "employee_id",
       "first_name",
       "department_id"
FROM "employees"
WHERE "department_id" =
      (SELECT "department_id"
       FROM "departments"
       WHERE "name" = 'Engineering');
```

---

### Example: Higher Salary than Average

```sql id="vk7q0v"
SELECT COUNT(e."employee_id") AS "count"
FROM "employees" AS e
WHERE e."salary" > (SELECT AVG("salary")
                    FROM "employees");
```

---

## ⚡ Indices

* Indices speed up data retrieval
* Usually implemented as B-trees

---

### Benefits

✔ Faster `SELECT` queries
✔ Faster `WHERE` filtering

### Downsides

⚠️ Slower inserts/updates
⚠️ Extra storage usage

---

### Best Practices

* Use for large tables (~50k+ rows)
* Avoid columns with many `NULL` values

---

### Create Index

```sql id="j3vn18"
CREATE INDEX index_name_idx
  ON table_name (column_name);
```

---

### Multi-Column Index

```sql id="d86r9m"
CREATE INDEX employees_names_idx
    ON "employees" ("first_name", "last_name");
```

---

## ⚙️ Common Patterns

---

### Join Towns & Addresses

```sql id="yw8r2j"
SELECT t."town_id",
       t."name" AS "town_name",
       a."address_text"
FROM "towns" AS t
       JOIN "addresses" AS a
            ON a."town_id" = t."town_id"
WHERE t."name" IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY "town_id";
```

---

### Managers & Departments

```sql id="p2x8dc"
SELECT e."employee_id",
       CONCAT("first_name", ' ', "last_name") AS "full_name",
       d."department_id",
       d."name"                               AS "department_name"
FROM "employees" AS e
       RIGHT JOIN "departments" AS d
                  ON d."manager_id" = e."employee_id"
ORDER BY e."employee_id"
LIMIT 5;
```

---

### Employees Working on Projects

```sql id="76q6qf"
SELECT e."employee_id",
       CONCAT(e."first_name", ' ', e."last_name") AS "full_name",
       p."project_id",
       p."name"                                   AS "project_name"
FROM "employees" AS e
         JOIN "employees_projects" AS ep
              ON e."employee_id" = ep."employee_id"
         JOIN "projects" AS p
              ON p."project_id" = ep."project_id"
WHERE ep."project_id" = 1;
```

---

### Employees Above Average Salary

```sql id="0z8yqh"
SELECT "first_name",
       "salary"
FROM "employees"
WHERE "salary" > (SELECT AVG("salary")
                  FROM "employees");
```

---

### Index for Faster Searches

```sql id="6wtxe1"
CREATE INDEX employees_salary_idx
    ON "employees" ("salary");
```

---

## ✅ Summary

* JOINs combine related data from multiple tables
* Main JOIN types:

    * INNER
    * LEFT
    * RIGHT
    * FULL
    * CROSS
* Subqueries allow nested query logic
* Indices improve query performance on large datasets
* Proper indexing can significantly speed up searches
