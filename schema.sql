CREATE TABLE TaxConfig (
    TaxExemptionAmount DECIMAL(18,2)
);

CREATE TABLE TaxBrackets (
    Id INT PRIMARY KEY,
    BracketFrom DECIMAL(18,2),
    BracketTo   DECIMAL(18,2),
    TaxRate     DECIMAL(5,2)
);
