CREATE TABLE dbo.TaxParameters (
    Id INT PRIMARY KEY,
    BracketFrom DECIMAL(18,2),
    BracketTo   DECIMAL(18,2),
    TaxRate     DECIMAL(5,2)
);
