USE [18ip37]
GO
/****** Object:  Table [dbo].[Администратор]    Script Date: 29.11.2021 12:40:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Администратор](
	[Код администратора] [int] IDENTITY(1,1) NOT NULL,
	[Код должности] [nchar](50) NULL,
	[Адрес] [nchar](50) NULL,
	[Номер телефона] [nchar](15) NULL,
	[Серия и номер паспорта] [nchar](15) NULL,
	[Ставка] [nchar](10) NULL,
	[ФИО] [nchar](30) NULL,
 CONSTRAINT [PK_Администратор] PRIMARY KEY CLUSTERED 
(
	[Код администратора] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказчик]    Script Date: 29.11.2021 12:40:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказчик](
	[Код заказчика] [int] IDENTITY(1,1) NOT NULL,
	[Номер телефона] [nchar](15) NULL,
	[Почта] [nchar](30) NULL,
	[ФИО] [nchar](30) NULL,
 CONSTRAINT [PK_Заказчик] PRIMARY KEY CLUSTERED 
(
	[Код заказчика] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Накладная]    Script Date: 29.11.2021 12:40:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Накладная](
	[Код накладной] [int] IDENTITY(1,1) NOT NULL,
	[Код заказчика] [int] NULL,
	[Код администратора] [int] NULL,
	[Дата] [nchar](10) NULL,
	[Время] [nchar](10) NULL,
	[Статус] [nchar](10) NULL,
	[Код продукции] [int] NULL,
	[Код склада] [int] NULL,
	[Объём продукции] [nchar](10) NULL,
 CONSTRAINT [PK_Накладная] PRIMARY KEY CLUSTERED 
(
	[Код накладной] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Продукция]    Script Date: 29.11.2021 12:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Продукция](
	[Код продукции] [int] IDENTITY(1,1) NOT NULL,
	[Danogips GRUNT] [nchar](10) NULL,
	[SuperFinish] [nchar](10) NULL,
	[Fill&Finish Light] [nchar](10) NULL,
	[Гипсовые плиты] [nchar](10) NULL,
	[Danogips TOP] [nchar](10) NULL,
 CONSTRAINT [PK_Продукция] PRIMARY KEY CLUSTERED 
(
	[Код продукции] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Склад]    Script Date: 29.11.2021 12:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Склад](
	[Код склада] [int] IDENTITY(1,1) NOT NULL,
	[Количество товара на складе] [nchar](10) NULL,
 CONSTRAINT [PK_Склад] PRIMARY KEY CLUSTERED 
(
	[Код склада] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Список продукции]    Script Date: 29.11.2021 12:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Список продукции](
	[Код накладной] [int] NOT NULL,
	[Код продукции] [int] NOT NULL,
 CONSTRAINT [PK_Список продукции] PRIMARY KEY CLUSTERED 
(
	[Код накладной] ASC,
	[Код продукции] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Накладная]  WITH CHECK ADD  CONSTRAINT [FK_Накладная_Администратор1] FOREIGN KEY([Код администратора])
REFERENCES [dbo].[Администратор] ([Код администратора])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Накладная] CHECK CONSTRAINT [FK_Накладная_Администратор1]
GO
ALTER TABLE [dbo].[Накладная]  WITH CHECK ADD  CONSTRAINT [FK_Накладная_Заказчик1] FOREIGN KEY([Код заказчика])
REFERENCES [dbo].[Заказчик] ([Код заказчика])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Накладная] CHECK CONSTRAINT [FK_Накладная_Заказчик1]
GO
ALTER TABLE [dbo].[Накладная]  WITH CHECK ADD  CONSTRAINT [FK_Накладная_Склад1] FOREIGN KEY([Код склада])
REFERENCES [dbo].[Склад] ([Код склада])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Накладная] CHECK CONSTRAINT [FK_Накладная_Склад1]
GO
ALTER TABLE [dbo].[Список продукции]  WITH CHECK ADD  CONSTRAINT [FK_Список продукции_Накладная1] FOREIGN KEY([Код накладной])
REFERENCES [dbo].[Накладная] ([Код накладной])
GO
ALTER TABLE [dbo].[Список продукции] CHECK CONSTRAINT [FK_Список продукции_Накладная1]
GO
ALTER TABLE [dbo].[Список продукции]  WITH CHECK ADD  CONSTRAINT [FK_Список продукции_Продукция] FOREIGN KEY([Код продукции])
REFERENCES [dbo].[Продукция] ([Код продукции])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Список продукции] CHECK CONSTRAINT [FK_Список продукции_Продукция]
GO
