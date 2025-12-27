CREATE TABLE TaxParameters (
    Id INT PRIMARY KEY,
    TaxExemptionAmount DECIMAL(18,2),

    BracketFrom DECIMAL(18,2),
    BracketTo   DECIMAL(18,2),
    TaxRate     DECIMAL(5,2)
);

