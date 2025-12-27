CREATE FUNCTION dbo.CalculateIncomeTax
(
    @TaxableIncome DECIMAL(18,2)
)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @CalculatedTax DECIMAL(18,2);

    SELECT 
        @CalculatedTax = SUM(
            CASE
                WHEN @TaxableIncome > BracketFrom THEN
                    (
                        CASE 
                            WHEN @TaxableIncome < BracketTo 
                            THEN @TaxableIncome 
                            ELSE BracketTo 
                        END
                        - BracketFrom
                    ) * TaxRate / 100
                ELSE 0
            END
        )
    FROM dbo.TaxParameters;

    RETURN ROUND(@CalculatedTax, 2);
END;
