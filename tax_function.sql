CREATE FUNCTION dbo.CalculateIncomeTax
(
    @TaxableIncome DECIMAL(18,2)
)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE 
        @CalculatedTax DECIMAL(18,2) = 0,
        @TaxExemptionAmount DECIMAL(18,2);

    -- Load tax exemption amount
    SELECT 
        @TaxExemptionAmount = TaxExemptionAmount
    FROM params;

    -- No tax if income is below exemption
    IF (@TaxableIncome <= @TaxExemptionAmount)
        RETURN 0;

    -- Progressive tax calculation (cumulative)
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
    FROM params;

    RETURN ROUND(@CalculatedTax, 2);
END;
