USE [UCITMSDev]
GO
/****** Object:  UserDefinedFunction [dbo].[fnValidateApprovers]    Script Date: 20-12-2024 19:47:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [dbo].[fnValidateApprovers]
(
	@UserID INT,
    @PrimaryApproverID INT,
	@SecondaryApproverID INT
)
RETURNS TINYINT
AS
BEGIN
	DECLARE @isValid TINYINT = 0;
    
	IF (@UserID = @PrimaryApproverID)
	BEGIN 
	SET @isValid = 1;
	END

	ELSE IF(@PrimaryApproverID = @SecondaryApproverID)
	BEGIN
	SET @isValid = 2;
	END

	ELSE IF(@UserID = @SecondaryApproverID)
	BEGIN
	SET @isValid = 3;
	END

	ELSE IF EXISTS (
	SELECT 1 FROM dbo.UserRolesMapping
	WHERE UserID = @PrimaryApproverID AND RoleID = 2
	)
    BEGIN 
	SET @isValid = 4;
	END

	RETURN @isValid;
END;
