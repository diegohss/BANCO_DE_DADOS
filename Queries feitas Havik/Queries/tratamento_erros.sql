use havik

GO

-- Verify that the stored procedure does not exist.
IF OBJECT_ID ('mostra_erro', 'P') IS NOT NULL
    DROP PROCEDURE mostra_erro;
GO

-- Create a procedure to retrieve error information.
CREATE PROCEDURE mostra_erro
AS
    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() as ErrorState,
        ERROR_PROCEDURE() as ErrorProcedure,
        ERROR_LINE() as ErrorLine,
        ERROR_MESSAGE() as ErrorMessage;
GO

BEGIN TRY
    -- Generate divide-by-zero error.
    SELECT 1/0;
END TRY
BEGIN CATCH
    -- Execute the error retrieval routine.
    EXECUTE mostra_erro;
END CATCH;
GO