## 1. What is PostgreSQL?

### ANS:

PostgreSQL একটি শক্তিশালী ওপেন-সোর্স relational database management system (RDBMS)। এটি structure করা ডেটা সংরক্ষণ ও পরিচালনা করতে পারে এবং SQL ভাষা ব্যবহার করে query execute করা হয়। এটি ACID-compliant, অর্থাৎ এটি ডেটার consistency এবং reliability নিশ্চিত করে।

## 2. What is the purpose of a database schema in PostgreSQL?

### ANS:

Schema হলো একটি logical structure যেখানে আমরা database-এর table, view, function ইত্যাদি সুন্দরভাবে সংরক্ষণ করি। Schema-এর মাধ্যমে আমরা একই database-এর মধ্যে একাধিক user বা application-এর জন্য আলাদা আলাদা structure তৈরি করতে পারি কোনো রকম conflict ছাড়াই।

## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

### ANS:

Primary Key হলো এমন একটি unique identifier যেটি একটি table-এর প্রতিটি row কে আলাদাভাবে চিহ্নিত করে। Primary key কখনোই duplicate রাখা যায় না এবং null ও থাকতে পারে না।
Foreign Key অন্য একটি table-এর Primary Key এর reference হিসেবে কাজ করে, যার মাধ্যমে relational database-এ table গুলোর মধ্যে সম্পর্ক তৈরি হয়।

## 4. What is the difference between the `VARCHAR` and `CHAR` data types?

### ANS:

`VARCHAR` একটি variable length string, মানে ইনপুটের length উপর ভিত্তি করে এটি storage নেয়।
`CHAR` একটি fixed length string, মানে এটি সবসময় নির্দিষ্ট একটি length বজায় রাখে, এমনকি ইনপুট ছোট হলেও।

## 5.Explain the purpose of the `WHERE` clause in a `SELECT` statement.

### ANS:

`WHERE` clause ব্যবহার করে আমরা নির্দিষ্ট condition অনুযায়ী ডেটা filter করতে পারি।
Example:

```sql
  SELECT * FROM student
  WHERE age > 18;
```

## 6. What are the `LIMIT` and `OFFSET` clauses used for?

### ANS:

`LIMIT` নির্ধারণ করে কতটি row query result-এ দেখা যাবে এবং `OFFSET` বলে দেয় কতটি row বাদ দিয়ে শুরু করতে হবে।
Example: Pagination করার জন্য ব্যবহার করা হয়।

## 7. How can you modify data using `UPDATE` statements?

### ANS:

`UPDATE` statement ব্যবহার করে আমরা existing table-এর ডেটা পরিবর্তন করতে পারি।
Example:

```sql
UPDATE employees
SET salary = salary + 5000
WHERE id = 2;
```

## 8.What is the significance of the `JOIN` operation, and how does it work in PostgreSQL?

### ANS:

`JOIN` ব্যবহার করে একাধিক table থেকে সম্পর্কযুক্ত ডেটা একত্রে করা হয়। যখন দুটি বা একাধিক টেবিলের মধ্যে সম্পর্ক থাকে, তখন `JOIN` operation এর মাধ্যমে combined result পাওয়া যায়।.
Example:

```sql
SELECT orders.id, customers.name
FROM orders
JOIN customers ON orders.customer_id = customers.id;
```

## 10.How can you calculate aggregate functions like `COUNT()`, `SUM()`, and `AVG()` in Postgres

### ANS:

এই function গুলোর মাধ্যমে আমরা নির্দিষ্ট একটি column-এর উপর মোট সংখ্যা (COUNT), মোট
যোগ (SUM), এবং Avg (AVG) নির্ণয় করতে পারি।
Example:

```sql
SELECT COUNT(*), SUM(salary), AVG(salary)
FROM employees;

```

tldr: all of my sql code initially written on datagrip
