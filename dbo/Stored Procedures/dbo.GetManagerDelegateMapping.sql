USE [UCITMSDev]
GO
/****** Object:  StoredProcedure [dbo].[GetManagerDelegateMapping]    Script Date: 27-11-2024 20:08:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetManagerDelegateMapping]
AS
BEGIN
	SELECT M.managerID as 'ManagerID',
	M.DelegateID as 'DelegateID',
	M.StartDate as 'StartDate',
	M.EndDate as 'EndDate',
	um.displayname as 'ManagerName',
	ud.displayname as 'DelegateName',
	M.ModifiedBy as 'ModifiedBy',
	ModUser.DisplayName as [ModifiedByName],
	M.ModifiedOn as 'ModifiedOn'
		FROM [dbo].[ManagerDelegateMapping] m
		inner join [dbo].[users] um
		on m.managerid = um.userid 
		inner join [dbo].[users] ud
		on m.delegateid = ud.userid
		left  join [dbo].[users] ModUser
		on ModUser.userid=m.ModifiedBy
END
GO
