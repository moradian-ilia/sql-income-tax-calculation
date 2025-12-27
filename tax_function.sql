CREATE FUNCTION dbo.CalculateIncomeTax (
    @TaxableIncome DECIMAL(18,2)
)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @Tax DECIMAL(18,2) = 0;

    SELECT @Tax = SUM(
        CASE
            WHEN @TaxableIncome > BracketFrom
            THEN
                (LEAST(@TaxableIncome, BracketTo) - BracketFrom) * TaxRate / 100
            ELSE 0
        END
    )
    FROM TaxParameters;

    RETURN ROUND(@Tax, 2);
END;

