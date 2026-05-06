# 📘 Introduction

## 📑 Table of Contents

* [Data Management](#-data-management)
* [PostgreSQL Overview](#-postgresql-overview)
* [Structured Query Language (SQL)](#-structured-query-language-sql)
* [SQL Categories](#-sql-categories)
* [Data Types](#-data-types)
* [Table Basics](#-table-basics)
* [Constraints](#-constraints)
* [Data Definition (DDL)](#-data-definition-ddl)
* [Common Operations](#-common-operations)

---

## 📊 Data Management

* A **database** is an organized collection of related data
* Data is accessed through a **DBMS (Database Management System)**
* DBMS responsibilities:

    * Store and organize data
    * Process queries
    * Manage access and manipulation

### Key Idea

👉 Storage ≠ Management
Databases provide **structure, consistency, and query capabilities**.

---

## 🐘 PostgreSQL Overview

* **PostgreSQL** = Object-Relational Database Management System (ORDBMS)
* Open-source, cross-platform

### Key Features

* Multi-Version Concurrency Control (MVCC) → safe parallel reads/writes
* Extensible (custom functions, types, plugins)
* Strong community support

### Architecture

* Uses **Client–Server model**

```
Client → Query → DB Engine → Database
```

### Tools

* **pgAdmin** → GUI for managing PostgreSQL

---

## 💬 Structured Query Language (SQL)

* Standard language for relational databases
* Allows:

    * Data retrieval
    * Data manipulation
    * Database management

### Example

```sql
CREATE DATABASE "gamebar";
```

### SQL Elements

* Queries
* Clauses
* Expressions
* Predicates
* Statements

---

## 🧠 SQL vs NoSQL

| SQL              | NoSQL              |
| ---------------- | ------------------ |
| Relational       | Non-relational     |
| Fixed schema     | Dynamic schema     |
| Complex queries  | Hierarchical data  |
| Vertical scaling | Horizontal scaling |

---

## 🧩 SQL Categories

### 1. DDL (Data Definition Language)

```sql
CREATE
ALTER
DROP
TRUNCATE
```

### 2. DML (Data Manipulation Language)

```sql
SELECT
INSERT
UPDATE
DELETE
```

### 3. DCL (Data Control Language)

```sql
GRANT
REVOKE
```

### 4. TCL (Transaction Control Language)

```sql
BEGIN
COMMIT
ROLLBACK
```

---

## 🔢 Data Types

### Numeric Types

```sql
SMALLINT
INTEGER
BIGINT
DECIMAL / NUMERIC
REAL
DOUBLE PRECISION
SERIAL
```

✔ Use `INTEGER` for general numbers
✔ Use `NUMERIC/DECIMAL` for precise values (e.g. money)

---

### 📝 String Types

```sql
CHAR(n)       -- fixed length
VARCHAR(n)    -- variable length
TEXT          -- unlimited
```

✔ `CHAR` pads spaces
✔ `VARCHAR` is more flexible

---

### 📅 Date & Time Types

```sql
DATE
TIME
TIMESTAMP
TIMESTAMPTZ
```

---

## 🧱 Table Basics

* Tables are the **core building blocks**

### Structure

* **Row** → record
* **Column** → field
* **Cell** → value

---

## 🔐 Constraints

### Common Constraints

```sql
PRIMARY KEY      -- unique identifier
NOT NULL         -- required field
UNIQUE           -- no duplicate values
DEFAULT          -- fallback value
CHECK            -- validation rule
```

### Example

```sql
"id" SERIAL PRIMARY KEY,
"email" VARCHAR(50) UNIQUE,
"salary" DECIMAL(10,2) CHECK ("salary" > 0),
"name" VARCHAR(100) NOT NULL
```

---

## 🏗 Data Definition (DDL)

### Create Table

```sql
CREATE TABLE "employees" (
  "id" SERIAL PRIMARY KEY,
  "email" VARCHAR(50) NOT NULL,
  "first_name" VARCHAR(50),
  "last_name" VARCHAR(50)
);
```

---

### Alter Table

```sql
-- Add column
ALTER TABLE "employees"
ADD COLUMN "salary" DECIMAL;

-- Modify column
ALTER TABLE "employees"
ALTER COLUMN "last_name" TYPE VARCHAR(100);

-- Drop column
ALTER TABLE "employees"
DROP COLUMN "email";
```

---

## ⚙️ Common Operations

### Truncate vs Drop

```sql
TRUNCATE TABLE "employees";  -- delete data only
DROP TABLE "employees";      -- delete table
DROP DATABASE "gamebar";     -- delete database
```

---

## 🧪 Example Setup

```sql
CREATE DATABASE "gamebar";

CREATE TABLE "employees" (
  "id" SERIAL PRIMARY KEY NOT NULL,
  "first_name" VARCHAR(30),
  "last_name" VARCHAR(50),
  "hiring_date" DATE DEFAULT '2023-01-01',
  "salary" NUMERIC(10, 2),
  "devices_number" INT
);
```

---

## ✅ Summary

* Databases organize and manage data efficiently
* PostgreSQL is a powerful, extensible ORDBMS
* SQL is used to communicate with databases
* Tables, data types, and constraints define structure
* DDL commands create and modify database objects
