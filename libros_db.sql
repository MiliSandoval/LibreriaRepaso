CREATE DATABASE db_libros
GO
USE [db_libros]
GO
/****** Object:  Table [dbo].[Autores]    Script Date: 20-09-2024 14:39:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autores](
	[id_autor] [int] IDENTITY(1,1) NOT NULL,
	[nombre_completo] [varchar](100) NULL,
	[correo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_T_Autores] PRIMARY KEY CLUSTERED 
(
	[id_autor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 20-09-2024 14:39:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[id_libro] [int] IDENTITY(1,1) NOT NULL,
	[isbn] [varchar](50) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[fecha_publicacion] [varchar](50) NOT NULL,
	[genero] [varchar](50) NULL,
	[autor] [int] NOT NULL,
 CONSTRAINT [PK_T_Libros] PRIMARY KEY CLUSTERED 
(
	[id_libro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Autores] ON 

INSERT [dbo].[Autores] ([id_autor], [nombre_completo], [correo]) VALUES (1, N'Autor de Prueba', N'autor_prueba@gmail.com')
SET IDENTITY_INSERT [dbo].[Autores] OFF
GO
SET IDENTITY_INSERT [dbo].[Libros] ON 

INSERT [dbo].[Libros] ([id_libro], [isbn], [nombre], [fecha_publicacion], [genero], [autor]) VALUES (4, N'245234-88-3', N'LIBRO 01', N'2023-22-08', N'Comedia', 1)
INSERT [dbo].[Libros] ([id_libro], [isbn], [nombre], [fecha_publicacion], [genero], [autor]) VALUES (6, N'4352345-9', N'TEST', N'20-09-2024', N'COMEDIA', 1)
SET IDENTITY_INSERT [dbo].[Libros] OFF
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_T_Libros_T_Autores] FOREIGN KEY([autor])
REFERENCES [dbo].[Autores] ([id_autor])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_T_Libros_T_Autores]
GO