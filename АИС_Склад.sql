USE [18ip37]
GO
/****** Object:  Table [dbo].[Авторизация]    Script Date: 03.12.2021 9:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Авторизация](
	[IDАвторизация] [int] NOT NULL,
	[Логин] [nvarchar](10) NOT NULL,
	[Пароль] [nvarchar](10) NOT NULL,
	[Имя] [nvarchar](15) NOT NULL,
	[Фамилия] [nvarchar](15) NOT NULL,
	[Фото] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Авторизация] PRIMARY KEY CLUSTERED 
(
	[IDАвторизация] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Администратор]    Script Date: 03.12.2021 9:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Администратор](
	[ID администратор] [int] NOT NULL,
	[Адрес] [nchar](10) NULL,
	[Номер телефона] [nchar](10) NULL,
	[Серия и номер паспорта] [nchar](10) NULL,
	[Фамилия] [nchar](10) NULL,
	[Имя] [nchar](10) NULL,
	[Отчество] [nchar](10) NULL,
 CONSTRAINT [PK_Администратор_1] PRIMARY KEY CLUSTERED 
(
	[ID администратор] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Вид_продукции]    Script Date: 03.12.2021 9:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Вид_продукции](
	[ID вид продукции] [int] NOT NULL,
	[Категория] [nvarchar](50) NULL,
 CONSTRAINT [PK_Вид_продукции] PRIMARY KEY CLUSTERED 
(
	[ID вид продукции] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказчик]    Script Date: 03.12.2021 9:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказчик](
	[ID заказчик] [int] NOT NULL,
	[Номер телефона] [nchar](10) NULL,
	[Почта] [nchar](10) NULL,
	[Фамилия] [nchar](10) NULL,
	[Имя] [nchar](10) NULL,
	[Отчество] [nchar](10) NULL,
 CONSTRAINT [PK_Заказчик_1] PRIMARY KEY CLUSTERED 
(
	[ID заказчик] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 03.12.2021 9:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[ID заказы] [int] NOT NULL,
	[Накладная №] [nchar](10) NULL,
	[ID администратор] [int] NULL,
	[Дата накаладной] [nchar](10) NULL,
	[Время накладной] [nchar](10) NULL,
	[ID заказчик] [int] NULL,
	[ID состав заказа] [int] NULL,
 CONSTRAINT [PK_Заказы] PRIMARY KEY CLUSTERED 
(
	[ID заказы] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Продукция]    Script Date: 03.12.2021 9:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Продукция](
	[ID продукция] [int] NOT NULL,
	[Наименование] [nchar](10) NULL,
	[Цена] [nchar](10) NULL,
	[Описание] [nchar](10) NULL,
	[ID вид продукции] [int] NULL,
 CONSTRAINT [PK_Продукция_1] PRIMARY KEY CLUSTERED 
(
	[ID продукция] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Состав_заказа]    Script Date: 03.12.2021 9:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Состав_заказа](
	[ID состав заказа] [int] NOT NULL,
	[ID заказы] [int] NULL,
	[ID продукция] [int] NULL,
	[Количество продукции]]] [nchar](10) NULL,
 CONSTRAINT [PK_Состав_заказа] PRIMARY KEY CLUSTERED 
(
	[ID состав заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Администратор] FOREIGN KEY([ID администратор])
REFERENCES [dbo].[Администратор] ([ID администратор])
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_Администратор]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Заказчик] FOREIGN KEY([ID заказчик])
REFERENCES [dbo].[Заказчик] ([ID заказчик])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_Заказчик]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Состав_заказа] FOREIGN KEY([ID состав заказа])
REFERENCES [dbo].[Состав_заказа] ([ID состав заказа])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_Состав_заказа]
GO
ALTER TABLE [dbo].[Продукция]  WITH CHECK ADD  CONSTRAINT [FK_Продукция_Вид_продукции] FOREIGN KEY([ID вид продукции])
REFERENCES [dbo].[Вид_продукции] ([ID вид продукции])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Продукция] CHECK CONSTRAINT [FK_Продукция_Вид_продукции]
GO
ALTER TABLE [dbo].[Состав_заказа]  WITH CHECK ADD  CONSTRAINT [FK_Состав_заказа_Продукция] FOREIGN KEY([ID продукция])
REFERENCES [dbo].[Продукция] ([ID продукция])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Состав_заказа] CHECK CONSTRAINT [FK_Состав_заказа_Продукция]
GO
