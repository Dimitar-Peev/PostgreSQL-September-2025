# 📘 Built-in Functions

## 📑 Table of Contents

* [Functions Overview](#-functions-overview)
* [String Functions](#-string-functions)
* [Math Functions](#-math-functions)
* [Date / Time Functions](#-date--time-functions)
* [Wildcards](#-wildcards)
* [Common Patterns](#-common-patterns)

---

## ⚙️ Functions Overview

* PostgreSQL provides many **built-in functions**
* Used for:

    * Data transformation
    * Calculations
    * Formatting

### Main Categories

* String functions
* Math functions
* Date/Time functions
* Others (extensible system)

---

## 🔤 String Functions

---

### CONCAT

```sql
SELECT CONCAT("first_name", ' ', "last_name") AS full_name
FROM "authors";
```

### CONCAT_WS (with separator)

```sql
SELECT CONCAT_WS(', ', "last_name", "born") AS summary
FROM "authors";
```

✔ Skips NULL values

---

### SUBSTRING

```sql
-- SUBSTRING(string, start_position, length)
SELECT SUBSTRING("description", 1, 50)
FROM "books";
```

Alternative syntax:

```sql
-- SUBSTRING(string FROM start_position FOR length)
SELECT SUBSTRING('SoftUni' FROM 5 FOR 3); -- 'Uni'
```

```sql
-- SUBSTRING(string, pattern)
SELECT * FROM "employees"
WHERE SUBSTRING("email" FROM '[.]com') IS NOT NULL; -- The query will return all employees whose email contains .com
```

---

### LEFT / RIGHT

```sql
-- LEFT(string, count)
-- RIGHT(string, count)
SELECT LEFT("title", 10) AS short_title
FROM "books";

-- Positive → takes N characters LEFT
SELECT LEFT('SoftUni', 4); -- 'Soft'

-- Negative → takes EVERYTHING except the last N characters
SELECT LEFT('SoftUni', -4); -- 'Sof' (7 characters - 4 = 3)
```

---

### REPLACE

```sql
-- REPLACE(string, pattern, replacement)
SELECT REPLACE("title", 'Murder', '******')
FROM "books";
```

✔ Case-sensitive

---

### TRIM - Remove spaces/chars from both sides of a string

```sql
-- TRIM(string)
-- TRIM(LEADING ' ' FROM ' Uni ') == SELECT LTRIM(' Uni ')
-- TRIM(TRAILING ' ' FROM ' Uni ') == SELECT RTRIM(' Uni ')
-- TRIM(BOTH ' ' FROM ' Uni ') == SELECT BTRIM(' Uni ')
SELECT TRIM('  text  '); -- TRIM(BOTH ...) is default
SELECT TRIM(BOTH ' ' FROM ' Uni ');
```

---

### Case & Utility Functions

```sql
LOWER(string)
UPPER(string)
REVERSE(string)
REPEAT(string, count)
```

---

### Length Functions

```sql
LENGTH(string)
CHAR_LENGTH(string)
BIT_LENGTH(string)
```

### Position Functions

```sql
-- POSITION(substring IN string)
SELECT POSITION('Uni' IN 'SoftUni'); -- Result: 5 ('Uni' starts at position 5)
SELECT POSITION('abc' IN 'SoftUni'); -- Result: 0 (not found)
```

---

### Translate Functions

```sql
-- TRANSLATE(string, from, to)
SELECT TRANSLATE('Ivan_Petrov-2024', '_-', '  '); -- Result: 'Ivan Petrov 2024'
SELECT TRANSLATE('+359 888 123 456', '+() -', ''); -- Result: '359888123456' (phone number cleaning)
```

---

More string functions in the [PostgreSQL documentation](https://www.postgresql.org/docs/17/functions-string.html)

---

## 🧮 Math Functions

---

### Basic Arithmetic

```sql
SELECT ("side" * "height") / 2 AS area
FROM "triangles";
```

---

### Operators

```sql
+  -  *  
DIV(a, b) -- OR a/b 
MOD(a, b) -- OR a%b
POWER(a, b) -- OR a^b
SQRT(a) -- OR |/a
ABS(a) -- OR @a
```

---

### Constants 

```sql
SELECT PI(); -- 3.141592653589793
```

---

### FLOOR / CEILING

```sql
SELECT FLOOR(33.68);   -- 33
SELECT CEILING(33.68); -- 34
```

---

### ROUND

```sql
SELECT ROUND(33.6888);     -- 34
SELECT ROUND(33.6888, 2);  -- 33.69
SELECT ROUND(33.6888, -1); -- 30
```

---

### TRUNC

```sql
-- TRUNC(value) 
SELECT TRUNC(12.588);    -- 12
-- TRUNC(value, precision)
SELECT TRUNC(12.588, 1); -- 12.5
```

--- 

### SIGN

```sql
-- SIGN(n) -> Check direction/sign: -1, 0 or 1 
SELECT SIGN(150);   --  1
SELECT SIGN(0);     --  0
SELECT SIGN(-45);   -- -1
```

---

### RANDOM

```sql
-- RANDOM() -> Random values: 0.0 ... 1.0 (exclusive)
SELECT RANDOM(); -- 0.57391820... (different on each call)

-- RANDOM() * (max - min) + min
SELECT RANDOM() * 100; -- between 0 and 100
SELECT RANDOM() * 50 + 50; -- between 50 and 100
```

---

## 📅 Date / Time Functions

---

### EXTRACT

```sql
-- EXTRACT(field FROM date) -> extract a segment from a date as an integer 
SELECT EXTRACT('year' FROM "born") AS "Year of Birth"
FROM "authors";
```

---

### AGE

```sql
-- AGE(first_date, second_date) -> find the difference between two dates
SELECT AGE("died", "born")
FROM "authors";
```

---

### Current Date & Time

```sql
SELECT NOW(); -- current date and time
SELECT CURRENT_DATE;
SELECT CURRENT_TIME;
```

---

### Formatting Dates

```sql
SELECT TO_CHAR(NOW(), 'DD Month YYYY'); -- 16 September 2025
```

---

### Example

```sql
SELECT "last_name",
       TO_CHAR("born", 'DD (Dy) Mon YYYY') AS "Date of Birth"
FROM "authors";
```

---

## 🔍 Wildcards

---

### Basics

* `%` → zero or more characters
* `_` → exactly one character

✔ Used with `LIKE`

---

### Examples

```sql
-- Starts with S
WHERE "last_name" LIKE 'S%';

-- Second letter is 'o'
WHERE "middle_name" LIKE '_o%';

-- Starts with A and ends with a
WHERE "first_name" LIKE 'A%a';
```

---

### ESCAPE Characters

```sql
SELECT "last_name"
FROM "authors"
WHERE "last_name" LIKE '%l!_%' ESCAPE '!';
```

---


## 🔍 REGEXP

---

### Basics

```sql
~   -- matches (case-sensitive)
~*  -- matches (case-insensitive)
!~  -- DOES NOT match (case-sensitive)
!~* -- DOES NOT match (case-insensitive)
```

---

### Examples

```sql
-- Starts with 'S'
SELECT 'SoftUni' ~ '^S'; -- true

-- Ends with 'i'
SELECT 'SoftUni' ~ 'i$'; -- true

-- Contains a digit
SELECT 'abc123' ~ '[0-9]'; -- true

-- Case-insensitive
SELECT 'SoftUni' ~* 'softuni'; -- true

-- Does not contain a digit
SELECT 'abcdef' !~ '[0-9]'; -- true
```

---

## ⚙️ Common Patterns

---

### Find Titles Starting with "The"

```sql
SELECT "title"
FROM "books"
WHERE SUBSTRING("title", 1, 3) = 'The'
ORDER BY "id";
```

---

### Replace Text with Condition

```sql
SELECT REPLACE("title", 'The', '***')
FROM "books"
WHERE SUBSTRING("title", 1, 3) = 'The';
```

---

### Format Numbers

```sql
SELECT "title",
       TRUNC("cost", 3) AS modified_price
FROM "books";
```

---

### Calculate Life Span

```sql
SELECT CONCAT("first_name", ' ', "last_name") AS full_name,
       AGE("died", "born") AS life_span
FROM "authors";
```

---

### Search with Wildcards

```sql
SELECT "title"
FROM "books"
WHERE "title" LIKE '%Harry Potter%';
```

---

## ✅ Summary

* PostgreSQL includes powerful built-in functions
* String functions manipulate text data
* Math functions perform calculations and rounding
* Date/Time functions extract and format temporal data
* Wildcards (`LIKE`) enable flexible pattern matching
