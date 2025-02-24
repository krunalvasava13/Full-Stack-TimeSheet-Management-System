USE [UCITMSDev]
GO
/****** Object:  StoredProcedure [dbo].[GetConfigurations]    Script Date: 26-11-2024 19:13:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Kunal Mali>
-- Create date: <Create Date,,>
-- Description:	<SP to get all the configurations data from the table>
-- =============================================
ALTER PROCEDURE [dbo].[GetConfigurations] 
AS
BEGIN
	SELECT C.ID, C.Name, C.Description, C.Value, C.ModifiedBy ,C.ModifiedOn,ModUser.DisplayName as ModifiedByName
    FROM dbo.Configuration C with (NoLock)
	left  join [dbo].[users] ModUser with (NoLock)
   on ModUser.userid=C.ModifiedBy
   Order by C.Id
END
