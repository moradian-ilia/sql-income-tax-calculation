## Problem
Companies need a reliable and transparent way to calculate progressive income tax directly inside the database.

## Solution
This project implements a table-driven income tax calculation engine in SQL Server using a reusable scalar function.

## Key Features
- Progressive tax brackets
- Set-based SQL logic
- Configurable tax rates
- Suitable for payroll and financial systems

## Example
```sql
SELECT dbo.CalculateIncomeTax(45000);
