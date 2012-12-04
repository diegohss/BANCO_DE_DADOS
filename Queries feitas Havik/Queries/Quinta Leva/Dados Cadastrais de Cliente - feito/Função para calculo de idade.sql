use havik

go

CREATE FUNCTION [dbo].[calculaidade]
(
    -- Add the parameters for the function here
    @DataNascimento DateTime
)
RETURNS int
AS
BEGIN
    -- Declare the return variable here
    DECLARE @Result int;
    DECLARE @DataAtual datetime;
    SELECT @DataAtual = GETDATE();

    -- Add the T-SQL statements to compute the return value here
    SELECT @Result = datediff(yy, @DataNascimento, @DataAtual) -
        (case WHEN (datepart(m, @DataNascimento) > datepart(m, @DataAtual)) OR
            (datepart(m, @DataNascimento) = datepart(m, @DataAtual) AND
                datepart(d, @DataNascimento) > datepart(d, @DataAtual))
            THEN 1
            ELSE 0
        end)

    -- Return the result of the function
    RETURN @Result

END

GO 