USE [UCITMSDev]
GO
/****** Object:  StoredProcedure [dbo].[AddOrUpdateDelegates]    Script Date: 27-11-2024 20:08:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddOrUpdateDelegates]
@ManagerID INT,
@DelegateID INT,
@StartDate DATETIME,
@EndDate DATETIME,
@ModUser INT
AS 
BEGIN
	IF EXISTS ( SELECT 1 FROM [dbo].[ManagerDelegateMapping] WHERE ManagerID = @ManagerID )
		BEGIN
			UPDATE [dbo].[ManagerDelegateMapping] 
			SET DelegateID = @DelegateID
			,StartDate=@StartDate,
			EndDate=@EndDate
			, ModifiedOn = GETUTCDATE(), ModifiedBy = @ModUser WHERE ManagerID = @ManagerID;
		END
	ELSE 
		BEGIN
			INSERT INTO [dbo].[ManagerDelegateMapping]
	        (ManagerID,
			DelegateID,
			StartDate,
			EndDate,
			CreatedBy,
			CreatedOn,
			ModifiedBy,
			ModifiedOn) 
				VALUES
				(@ManagerID, 
				@DelegateID,
				@StartDate,
				@EndDate,
				@ModUser,
				GETUTCDATE(),
				@ModUser,
				GETUTCDATE());
			END
		END;
GO
