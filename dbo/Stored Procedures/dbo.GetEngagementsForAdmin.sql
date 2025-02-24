USE [UCITMSDev]
GO
/****** Object:  StoredProcedure [dbo].[GetEngagementsForAdmin]    Script Date: 05-12-2024 14:45:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Kunal Mali>
-- Create date: <Create Date,,>
-- Description:	<This sp is used to get all the default engagements present in the engagements table,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEngagementsForAdmin]
AS
BEGIN
    SELECT 
	E.*,
	U.DisplayName
	FROM [dbo].[Engagements] E WITH (NoLock)
	LEFT JOIN [dbo].[Users] U
	ON E.ModifiedBy = U.UserID
    ORDER BY E.StartDate DESC
END

EXEC [dbo].[GetEngagementsForAdmin]

