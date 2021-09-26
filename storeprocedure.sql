USE [Citizen]
GO

/****** Object:  StoredProcedure [dbo].[pr_cntry]    Script Date: 2021-09-25 8:55:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[pr_cntry] 
(
	@Country VARCHAR(MAX) 
)
AS

BEGIN
	DECLARE @CountryID SMALLINT

	SELECT *
	FROM Citizen p
	INNER JOIN Country c
	ON p.countryID = c.CountryID
	WHERE c.CountryName = @Country

	SELECT @CountryID=CountryID
	FROM Country
	WHERE CountryName=@Country

	UPDATE CntRecord
	SET CounterValue = 0
	WHERE CountryID=@CountryID
END
GO

