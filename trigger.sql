USE [Citizen]
GO

/****** Object:  Trigger [dbo].[tr_CountryCnt]    Script Date: 2021-09-25 8:55:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tr_CountryCnt]
ON [dbo].[Citizen]
AFTER INSERT
AS
BEGIN
	DECLARE @Cnt INT
	DECLARE @CountryID SMALLINT

	SELECT @CountryID = CountryID FROM inserted

	SELECT @Cnt = CounterValue 
	FROM CntRecord
	WHERE CountryID=@CountryID

	UPDATE CntRecord
	SET CounterValue = @Cnt+1
	WHERE CountryID = @CountryID

	PRINT('Updated value of counter is ' + CAST((@Cnt+1) AS VARCHAR))
END
GO

ALTER TABLE [dbo].[Citizen] ENABLE TRIGGER [tr_CountryCnt]
GO

