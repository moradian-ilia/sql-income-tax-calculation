## Problem
Companies need a reliable and configurable way to calculate progressive income tax directly inside the database.

## Solution
This project implements a table-driven SQL tax calculation engine using a reusable scalar function.

## Key Features
- Progressive tax brackets
- Configurable tax rules
- Set-based SQL logic
- Suitable for payroll and financial systems

## Example
```sql
SELECT dbo.CalculateIncomeTax(45000);

