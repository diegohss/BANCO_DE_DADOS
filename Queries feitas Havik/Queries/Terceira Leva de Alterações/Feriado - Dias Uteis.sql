USE havik
GO

CREATE TABLE dbo.Feriados
(
FeriadosDate smalldatetime NOT NULL primary key,
Descricao varchar(50)
)
GO

INSERT dbo.Feriados values('2011-01-01', 'Confraternização Universal')
INSERT dbo.Feriados values ('2011-03-08','Carnaval')
INSERT dbo.Feriados values ('2008-04-21','Tiradentes')
INSERT dbo.Feriados values ('2008-04-22','Sexta-feira Santa')
INSERT dbo.Feriados values ('2008-06-23','Corpus Christi')
INSERT dbo.Feriados values ('2008-09-07','Independ6encia do Brasil')
INSERT dbo.Feriados values ('2008-10-12','Nossa Senhora Aparecida')
INSERT dbo.Feriados values ('2008-11-02','Finados')
INSERT dbo.Feriados values ('2008-11-15','Proclamação da República')
INSERT dbo.Feriados values ('2008-12-25','Natal')

GO

-- Criando a function

CREATE FUNCTION fnDiasUteis ( @DataInicio datetime, @DataFim datetime)
RETURNS INT
AS
BEGIN
RETURN(SELECT
(DATEDIFF(dd, @DataInicio, @DataFim) + 1)
-(DATEDIFF(wk, @DataInicio, @DataFim) * 2)
-(CASE WHEN DATENAME(dw, @DataFim) = 'Saturday' THEN 1 ELSE 0 END)
-(CASE WHEN DATENAME(dw, @DataInicio) = 'Sunday' THEN 1 ELSE 0 END)
- COUNT(*) FROM dbo.Feriados WHERE FeriadosDate BETWEEN @DataInicio AND @DataFim)
END
GO