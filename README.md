## 1. What is PostgreSQL?

### ANS:

PostgreSQL ekta powerful open-source relational database management system
(RDBMS). Eta structure data manage korte pare, ar SQL language use kore query
execute kora hoy. Eta ACID-compliant, mane data consistency, reliability ensure
kore.

## 2. What is the purpose of a database schema in PostgreSQL?

### ANS:

Schema holo ekta logical structure jeikhane amra database-er table, view, function
etc organize kore rakhi. Schemar maddhome amra ekoi database er modde multiple
users ba application er jonno separate structure create korte pari jekono conflict
chara.

## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

### ANS:

Primary Key holo ekta unique identifier je kono table er prottyek row ke identify
kore. Eta duplicate thkkte pare na, null o thakte pare na.
Foreign Key onno ekta table er Primary Key er upor reference kore, ja raletional
database e table gulor moddhe ralation toiri kore.

## 4. What is the difference between the `VARCHAR` and `CHAR` data types?

### ANS:

`VARCHAR` holo variable length string, mane input er length onujayi storage hoy.
`CHAR` holo fixed length string, mane always specified length maintain kore, even
jodi input choto hoy.

## 5.Explain the purpose of the `WHERE` clause in a `SELECT` statement.

### ANS:

`WHERE` clause use kore amra specific condition er upor based kore data filtering
korte pari.
Example:

```sql
  SELECT * FROM student
  WHERE age > 18;
```

## 6. What are the `LIMIT` and `OFFSET` clauses used for?

### ANS:

`LIMIT` bole dey koto gulo row fetch korte hobe, ar `OFFSET` bole dey kotogulo row
skip kore tarpor result dite hobe.
Example: Pagination er jonno use kora hoy.

## 7. How can you modify data using `UPDATE` statements?

### ANS:

`UPDATE` use kore existing table er data modify kora jay.
Example:

```sql
UPDATE employees
SET salary = salary + 5000
WHERE id = 2;
```

## 8.What is the significance of the `JOIN` operation, and how does it work in PostgreSQL?

### ANS:

`JOIN` use kore multiple table theke data combine kora hoy, jekhaney tader moddhe relation thake.
Example:

```sql
SELECT orders.id, customers.name
FROM orders
JOIN customers ON orders.customer_id = customers.id;
```

## 10.How can you calculate aggregate functions like `COUNT()`, `SUM()`, and `AVG()` in Postgres

### ANS:

function gulo use kore amra specific column er upor total count, sum, average calculate korte pari.
Example:

```sql
SELECT COUNT(*), SUM(salary), AVG(salary)
FROM employees;

```
