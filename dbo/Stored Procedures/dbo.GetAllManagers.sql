USE [UCITMSDev]
GO
/****** Object:  StoredProcedure [dbo].[GetAllManagers]    Script Date: 29-11-2024 09:55:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GetAllManagers]
AS
BEGIN
	SELECT Distinct UM.ManagerId, U.DisplayName 
	FROM [dbo].[UserManagerMapping] UM
	INNER JOIN [dbo].[Users] U
	ON UM.ManagerId = U.UserId
	Where UM.isPrimary=1
END
GO
