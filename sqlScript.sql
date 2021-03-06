USE [db_hotel]
GO
/****** Object:  Table [dbo].[T_constumer]    Script Date: 04/05/2019 22:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_constumer](
	[cor_id] [char](4) NOT NULL,
	[cor_IDtype] [nchar](10) NOT NULL,
	[cor_IDcard] [char](30) NOT NULL,
	[cor_name] [char](10) NOT NULL,
	[cor_telephone] [char](15) NULL,
	[cor_booktime] [datetime] NULL,
	[cor_outtime] [datetime] NULL,
 CONSTRAINT [PK__T_constu__55FA04BA07020F21] PRIMARY KEY CLUSTERED 
(
	[cor_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_user]    Script Date: 04/05/2019 22:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_user](
	[user_id] [char](3) NOT NULL,
	[user_name] [char](10) NULL,
	[user_password] [char](6) NOT NULL,
	[user_sex] [nchar](4) NULL,
	[user_telephone] [char](15) NULL,
	[user_isManager] [int] NULL,
 CONSTRAINT [PK__T_user__B9BE370F7F60ED59] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_roominfo]    Script Date: 04/05/2019 22:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_roominfo](
	[room_id] [char](3) NOT NULL,
	[room_type] [nchar](10) NOT NULL,
	[room_bed] [int] NOT NULL,
	[room_price] [float] NOT NULL,
	[romm_deposite] [float] NOT NULL,
	[room_resever] [varchar](50) NULL,
	[room_state] [int] NOT NULL,
	[room_booktime] [datetime] NULL,
	[room_outtime] [datetime] NULL,
 CONSTRAINT [PK__t_roomin__19675A8A03317E3D] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_order]    Script Date: 04/05/2019 22:29:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_order](
	[ord_id] [char](10) NOT NULL,
	[room_id] [char](3) NOT NULL,
	[cor_id] [char](4) NOT NULL,
	[user_id] [char](3) NOT NULL,
	[romm_deposite] [float] NULL,
	[stay_solt] [float] NULL,
	[collected_money] [float] NULL,
	[expenditure_money] [float] NULL,
	[discount] [float] NULL,
	[room_outtime] [datetime] NULL,
	[room_booktime] [datetime] NULL,
 CONSTRAINT [PK__T_order__DC39D7DF0AD2A005] PRIMARY KEY CLUSTERED 
(
	[ord_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Check [CK_T_user_user_isManager]    Script Date: 04/05/2019 22:29:57 ******/
ALTER TABLE [dbo].[T_user]  WITH CHECK ADD  CONSTRAINT [CK_T_user_user_isManager] CHECK  (([user_isManager]='1' OR [user_isManager]='0'))
GO
ALTER TABLE [dbo].[T_user] CHECK CONSTRAINT [CK_T_user_user_isManager]
GO
/****** Object:  Check [CK_T_user_user_sex]    Script Date: 04/05/2019 22:29:57 ******/
ALTER TABLE [dbo].[T_user]  WITH CHECK ADD  CONSTRAINT [CK_T_user_user_sex] CHECK  (([user_sex]='女' OR [user_sex]='男'))
GO
ALTER TABLE [dbo].[T_user] CHECK CONSTRAINT [CK_T_user_user_sex]
GO
/****** Object:  Check [CK_T_roominfo_room_state]    Script Date: 04/05/2019 22:29:57 ******/
ALTER TABLE [dbo].[T_roominfo]  WITH CHECK ADD  CONSTRAINT [CK_T_roominfo_room_state] CHECK  (([room_state]='1' OR [room_state]='0'))
GO
ALTER TABLE [dbo].[T_roominfo] CHECK CONSTRAINT [CK_T_roominfo_room_state]
GO
/****** Object:  ForeignKey [FK_T_order_T_constumer]    Script Date: 04/05/2019 22:29:57 ******/
ALTER TABLE [dbo].[T_order]  WITH CHECK ADD  CONSTRAINT [FK_T_order_T_constumer] FOREIGN KEY([cor_id])
REFERENCES [dbo].[T_constumer] ([cor_id])
GO
ALTER TABLE [dbo].[T_order] CHECK CONSTRAINT [FK_T_order_T_constumer]
GO
/****** Object:  ForeignKey [FK_T_order_T_roominfo]    Script Date: 04/05/2019 22:29:57 ******/
ALTER TABLE [dbo].[T_order]  WITH CHECK ADD  CONSTRAINT [FK_T_order_T_roominfo] FOREIGN KEY([room_id])
REFERENCES [dbo].[T_roominfo] ([room_id])
GO
ALTER TABLE [dbo].[T_order] CHECK CONSTRAINT [FK_T_order_T_roominfo]
GO
/****** Object:  ForeignKey [FK_T_order_T_user]    Script Date: 04/05/2019 22:29:57 ******/
ALTER TABLE [dbo].[T_order]  WITH CHECK ADD  CONSTRAINT [FK_T_order_T_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[T_user] ([user_id])
GO
ALTER TABLE [dbo].[T_order] CHECK CONSTRAINT [FK_T_order_T_user]
GO
