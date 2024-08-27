USE [master]
GO
/****** Object:  Database [Proyecto]    Script Date: 8/27/2024 3:13:05 PM ******/
CREATE DATABASE [Proyecto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proyecto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Proyecto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Proyecto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Proyecto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Proyecto] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proyecto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proyecto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proyecto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proyecto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proyecto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proyecto] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proyecto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proyecto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proyecto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proyecto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proyecto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proyecto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proyecto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proyecto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proyecto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proyecto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Proyecto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proyecto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proyecto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proyecto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proyecto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proyecto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proyecto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proyecto] SET RECOVERY FULL 
GO
ALTER DATABASE [Proyecto] SET  MULTI_USER 
GO
ALTER DATABASE [Proyecto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proyecto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proyecto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proyecto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Proyecto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Proyecto] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Proyecto', N'ON'
GO
ALTER DATABASE [Proyecto] SET QUERY_STORE = ON
GO
ALTER DATABASE [Proyecto] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Proyecto]
GO
/****** Object:  Table [dbo].[asignacionPlanes]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asignacionPlanes](
	[Id_asignacion] [int] IDENTITY(1,1) NOT NULL,
	[Id_cliente] [int] NULL,
	[Id_plan] [int] NULL,
	[FechaAsignacion] [date] NOT NULL,
	[Id_entrenador] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_asignacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clases]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clases](
	[Id_clase] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[IdInstructor] [int] NULL,
	[Horario] [varchar](50) NOT NULL,
	[Duracion] [int] NOT NULL,
	[CapacidadMaxima] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_clase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[Id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellidos] [varchar](100) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Plan] [int] NOT NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ejercicios]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ejercicios](
	[Id_ejercicio] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[GrupoMuscular] [varchar](50) NOT NULL,
	[EquipoNecesario] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_ejercicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[Id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Apellidos] [nvarchar](100) NULL,
	[FechaNacimiento] [date] NULL,
	[Genero] [nvarchar](10) NULL,
	[Direccion] [nvarchar](200) NULL,
	[Telefono] [nvarchar](20) NULL,
	[Correo] [nvarchar](100) NOT NULL,
	[Puesto] [nvarchar](50) NULL,
	[FechaContratacion] [datetime] NULL,
	[Salario] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gimnasios]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gimnasios](
	[Id_gimnasio] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Id_provincia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_gimnasio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inscripcionesClases]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inscripcionesClases](
	[Id_inscripcion] [int] IDENTITY(1,1) NOT NULL,
	[Id_cliente] [int] NULL,
	[IdClase] [int] NULL,
	[FechaInscripcion] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_inscripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventario]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventario](
	[Id_producto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[CantidadStock] [int] NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[membresias]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[membresias](
	[Id_membresia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [text] NULL,
	[Precio] [int] NOT NULL,
	[Plan_codigo] [int] NOT NULL,
	[Cliente_codigo] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_membresia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pagos]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagos](
	[Id_pago] [int] IDENTITY(1,1) NOT NULL,
	[Id_cliente] [int] NULL,
	[FechaPago] [date] NOT NULL,
	[Monto] [decimal](10, 2) NOT NULL,
	[TipoPago] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[planes]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[planes](
	[Id_plan] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Precio] [int] NOT NULL,
	[Descripcion] [text] NULL,
	[Gimnasio_codigo] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_plan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[planesEntrenamiento]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[planesEntrenamiento](
	[Id_plan] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[Duracion] [int] NOT NULL,
	[Nivel] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_plan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[PrecioUnitario] [decimal](18, 2) NOT NULL,
	[Inventario] [int] NOT NULL,
	[Imagen] [varchar](500) NOT NULL,
	[estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promociones]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promociones](
	[Id_promocion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [text] NULL,
	[Descuento] [int] NOT NULL,
	[Fecha_ini] [date] NOT NULL,
	[Fecha_fin] [date] NOT NULL,
	[Gimnasio_codigo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_promocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincias]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincias](
	[Id_provincia] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[Id_rol] [tinyint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[Id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rutinasEjercicios]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rutinasEjercicios](
	[Id_rutina] [int] NOT NULL,
	[Id_ejercicio] [int] NOT NULL,
	[Series] [int] NOT NULL,
	[Repeticiones] [int] NOT NULL,
	[Descanso] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_rutina] ASC,
	[Id_ejercicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rutinasEntrenamiento]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rutinasEntrenamiento](
	[Id_rutina] [int] IDENTITY(1,1) NOT NULL,
	[Id_plan] [int] NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[DiaSemana] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_rutina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[identificacion] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[correo] [varchar](100) NOT NULL,
	[contrasenna] [varchar](100) NOT NULL,
	[Id_rol] [tinyint] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tUsuario] PRIMARY KEY CLUSTERED 
(
	[identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ventas]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas](
	[Id_venta] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Id_cliente] [int] NULL,
	[Id_empleado] [int] NULL,
	[FechaVenta] [date] NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[provincias] ON 
GO
INSERT [dbo].[provincias] ([Id_provincia], [Nombre]) VALUES (1, N'San José')
GO
INSERT [dbo].[provincias] ([Id_provincia], [Nombre]) VALUES (2, N'Alajuela')
GO
INSERT [dbo].[provincias] ([Id_provincia], [Nombre]) VALUES (3, N'Cartago')
GO
INSERT [dbo].[provincias] ([Id_provincia], [Nombre]) VALUES (4, N'Heredia')
GO
INSERT [dbo].[provincias] ([Id_provincia], [Nombre]) VALUES (5, N'Guanacaste')
GO
INSERT [dbo].[provincias] ([Id_provincia], [Nombre]) VALUES (6, N'Puntarenas')
GO
INSERT [dbo].[provincias] ([Id_provincia], [Nombre]) VALUES (7, N'Limón')
GO
SET IDENTITY_INSERT [dbo].[provincias] OFF
GO
SET IDENTITY_INSERT [dbo].[rol] ON 
GO
INSERT [dbo].[rol] ([Id_rol], [descripcion], [estado]) VALUES (1, N'Administrador', 1)
GO
INSERT [dbo].[rol] ([Id_rol], [descripcion], [estado]) VALUES (2, N'Usuario', 1)
GO
SET IDENTITY_INSERT [dbo].[rol] OFF
GO
INSERT [dbo].[usuario] ([identificacion], [nombre], [correo], [contrasenna], [Id_rol], [estado]) VALUES (208220158, N'HERNANDEZ TORRES NICOLE', N'haydeehuertas51@gmail.com', N'Ie1qNZiOyC7jM30Bkvaf9cmhFfcGWUK/0JQh0qEYrkk=', 2, 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__clientes__60695A19E3329D75]    Script Date: 8/27/2024 3:13:06 PM ******/
ALTER TABLE [dbo].[clientes] ADD UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__clientes__60695A19FEE75B90]    Script Date: 8/27/2024 3:13:06 PM ******/
ALTER TABLE [dbo].[clientes] ADD UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__empleado__60695A19BB2880EF]    Script Date: 8/27/2024 3:13:06 PM ******/
ALTER TABLE [dbo].[empleados] ADD UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Correo]    Script Date: 8/27/2024 3:13:06 PM ******/
ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [UK_Correo] UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__usuario__C196DEC7F37C83FA]    Script Date: 8/27/2024 3:13:06 PM ******/
ALTER TABLE [dbo].[usuario] ADD UNIQUE NONCLUSTERED 
(
	[identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT ((2)) FOR [Id_rol]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[asignacionPlanes]  WITH CHECK ADD FOREIGN KEY([Id_cliente])
REFERENCES [dbo].[clientes] ([Id_cliente])
GO
ALTER TABLE [dbo].[asignacionPlanes]  WITH CHECK ADD FOREIGN KEY([Id_entrenador])
REFERENCES [dbo].[empleados] ([Id_empleado])
GO
ALTER TABLE [dbo].[asignacionPlanes]  WITH CHECK ADD FOREIGN KEY([Id_plan])
REFERENCES [dbo].[planesEntrenamiento] ([Id_plan])
GO
ALTER TABLE [dbo].[clases]  WITH CHECK ADD FOREIGN KEY([IdInstructor])
REFERENCES [dbo].[empleados] ([Id_empleado])
GO
ALTER TABLE [dbo].[gimnasios]  WITH CHECK ADD FOREIGN KEY([Id_provincia])
REFERENCES [dbo].[provincias] ([Id_provincia])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[inscripcionesClases]  WITH CHECK ADD FOREIGN KEY([Id_cliente])
REFERENCES [dbo].[clientes] ([Id_cliente])
GO
ALTER TABLE [dbo].[inscripcionesClases]  WITH CHECK ADD FOREIGN KEY([IdClase])
REFERENCES [dbo].[clases] ([Id_clase])
GO
ALTER TABLE [dbo].[membresias]  WITH CHECK ADD FOREIGN KEY([Cliente_codigo])
REFERENCES [dbo].[clientes] ([Id_cliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[membresias]  WITH CHECK ADD FOREIGN KEY([Plan_codigo])
REFERENCES [dbo].[planes] ([Id_plan])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[pagos]  WITH CHECK ADD FOREIGN KEY([Id_cliente])
REFERENCES [dbo].[clientes] ([Id_cliente])
GO
ALTER TABLE [dbo].[planes]  WITH CHECK ADD FOREIGN KEY([Gimnasio_codigo])
REFERENCES [dbo].[gimnasios] ([Id_gimnasio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[promociones]  WITH CHECK ADD FOREIGN KEY([Gimnasio_codigo])
REFERENCES [dbo].[gimnasios] ([Id_gimnasio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[rutinasEjercicios]  WITH CHECK ADD FOREIGN KEY([Id_ejercicio])
REFERENCES [dbo].[ejercicios] ([Id_ejercicio])
GO
ALTER TABLE [dbo].[rutinasEjercicios]  WITH CHECK ADD FOREIGN KEY([Id_rutina])
REFERENCES [dbo].[rutinasEntrenamiento] ([Id_rutina])
GO
ALTER TABLE [dbo].[rutinasEntrenamiento]  WITH CHECK ADD FOREIGN KEY([Id_plan])
REFERENCES [dbo].[planesEntrenamiento] ([Id_plan])
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_rol] FOREIGN KEY([Id_rol])
REFERENCES [dbo].[rol] ([Id_rol])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_rol]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD FOREIGN KEY([Id_cliente])
REFERENCES [dbo].[clientes] ([Id_cliente])
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD FOREIGN KEY([Id_empleado])
REFERENCES [dbo].[empleados] ([Id_empleado])
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[productos] ([IdProducto])
GO
/****** Object:  StoredProcedure [dbo].[CambiarEstadoUsuario]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Cambiar estado usuario
CREATE PROCEDURE [dbo].[CambiarEstadoUsuario]
	@identificacion INT
AS
BEGIN

	UPDATE usuario
	   SET estado = CASE WHEN estado = 1 THEN 0 ELSE 1 END
	 WHERE identificacion = @identificacion
END
GO
/****** Object:  StoredProcedure [dbo].[CreateClase]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Crear clase
CREATE   PROCEDURE [dbo].[CreateClase]
	@Nombre VARCHAR(50),
	@Descripcion VARCHAR(200),
	@IdInstructor int,
	@Horario VARCHAR(50),
	@Duracion int,
	@CapacidadMaxima int,
	@Estado bit

AS
BEGIN
    INSERT INTO clases (Nombre, Descripcion, IdInstructor, Horario, Duracion, CapacidadMaxima, Estado)
    VALUES (@Nombre, @Descripcion, @IdInstructor, @Horario, @Duracion, @CapacidadMaxima, @Estado)
END;

GO
/****** Object:  StoredProcedure [dbo].[CreateEjercicio]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Crear ejercicio
CREATE PROCEDURE [dbo].[CreateEjercicio]
	@Nombre VARCHAR(50),
	@Descripcion VARCHAR(200),
	@GrupoMuscular VARCHAR(50),
	@EquipoNecesario VARCHAR(100)

AS
BEGIN
    INSERT INTO ejercicios (Nombre, Descripcion, GrupoMuscular, EquipoNecesario)
    VALUES (@Nombre, @Descripcion, @GrupoMuscular, @EquipoNecesario)
END
GO
/****** Object:  StoredProcedure [dbo].[CreateMembresia]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateMembresia]
    @Nombre VARCHAR(100),
    @Descripcion TEXT = NULL, 
    @Precio INT,
    @Plan_codigo INT,
    @Cliente_codigo INT
AS
BEGIN
    DECLARE @Estado	BIT = 1
	BEGIN
    INSERT INTO [dbo].[membresias] (Nombre, Descripcion, Precio, Plan_codigo, Cliente_codigo, Estado)
    VALUES (@Nombre, @Descripcion, @Precio, @Plan_codigo, @Cliente_codigo, @Estado);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CreatePlan]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Crear un plan
CREATE PROCEDURE [dbo].[CreatePlan]
	@Nombre VARCHAR(50),
	@Precio int,
	@Descripcion text,
	@Gimnasio_codigo int
AS
BEGIN
    INSERT INTO planes (Nombre, Precio, Descripcion, Gimnasio_codigo)
    VALUES (@Nombre, @Precio, @Descripcion, @Gimnasio_codigo)
END
GO
/****** Object:  StoredProcedure [dbo].[CreateProducto]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Crear producto en inventario
CREATE PROCEDURE [dbo].[CreateProducto]
    @Nombre VARCHAR(50),
    @Descripcion VARCHAR(500),
    @Inventario INT,
    @PrecioUnitario DECIMAL(18, 2),
    @Imagen VARCHAR(500)
AS
BEGIN
    INSERT INTO productos (Nombre, Descripcion, Inventario, PrecioUnitario, Imagen, Estado)
    VALUES (@Nombre, @Descripcion, @Inventario, @PrecioUnitario, @Imagen, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[CreateRol]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Crear rol
CREATE PROCEDURE [dbo].[CreateRol]
    @descripcion VARCHAR(50)
AS
BEGIN
    INSERT INTO rol (descripcion)
    VALUES (@descripcion)
END
GO
/****** Object:  StoredProcedure [dbo].[CreateRutina]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------Rutina------------
CREATE   PROCEDURE [dbo].[CreateRutina]
    @Id_plan INT,
    @Nombre Varchar(50),
	@Descripcion Varchar(100),
	@DiaSemana Varchar(10)

AS
BEGIN
    INSERT INTO rutinasEntrenamiento(Id_plan, Nombre, Descripcion,DiaSemana)
    VALUES (@Id_plan, @Nombre, @Descripcion,@DiaSemana);
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateUsuario]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Crear usuario
CREATE PROCEDURE [dbo].[CreateUsuario]
    @identificacion VARCHAR(50),
    @nombre VARCHAR(100),
    @correo VARCHAR(100),
    @contrasenna VARCHAR(100)
AS
BEGIN
    INSERT INTO [dbo].[usuario] (identificacion, nombre, correo, contrasenna, estado, Id_rol)
    VALUES (@identificacion, @nombre, @correo, @contrasenna, 1, 2)
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteClase]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Eliminar clase
CREATE   PROCEDURE [dbo].[DeleteClase]
    @Id_clase INT
AS
BEGIN
    UPDATE clases
    SET Estado = 0
    WHERE Id_clase = @Id_clase
END;

GO
/****** Object:  StoredProcedure [dbo].[DeleteEjercicio]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Eliminar Ejercicio
CREATE PROCEDURE [dbo].[DeleteEjercicio]
    @Id_ejercicio INT
AS
BEGIN
    DELETE 
    FROM ejercicios
    WHERE Id_ejercicio = @Id_ejercicio
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteInscripcion]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteInscripcion]
    @Id_Inscripcion INT
AS
BEGIN
   
    DELETE 
    FROM inscripcionesClases
    WHERE Id_inscripcion = @Id_Inscripcion;
END;

GO
/****** Object:  StoredProcedure [dbo].[DeleteMembresia]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteMembresia]
    @Id_membresia INT
AS
BEGIN
    UPDATE [dbo].[membresias]
    SET Estado = 0
    WHERE Id_membresia = @Id_membresia;
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePlan]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Eliminar plan
CREATE PROCEDURE [dbo].[DeletePlan]
    @Id_plan INT
AS
BEGIN
    UPDATE planes
    SET Estado = 0
    WHERE Id_plan = @Id_plan
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProducto]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Eliminar producto del inventario
CREATE PROCEDURE [dbo].[DeleteProducto]
    @IdProducto INT
AS
BEGIN
    UPDATE productos
    SET Estado = 0
    WHERE IdProducto = @IdProducto
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteRol]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Eliminar rol
CREATE PROCEDURE [dbo].[DeleteRol]
    @Id_rol INT
AS
BEGIN
    UPDATE rol
    SET estado = 0
    WHERE Id_rol = @Id_rol
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteRutina]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[DeleteRutina]
    @Id_Rutina INT
AS
BEGIN
   
    DELETE 
    FROM rutinasEntrenamiento
    WHERE Id_rutina = @Id_Rutina;
END;
/****** Object:  StoredProcedure [dbo].[UpdateClase]    Script Date: 8/25/2024 11:32:09 PM ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[DeleteUsuario]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Eliminar usuario
CREATE PROCEDURE [dbo].[DeleteUsuario]
    @Identificacion VARCHAR(50)
AS
BEGIN
    UPDATE usuario
    SET estado = 0
    WHERE identificacion = @Identificacion
END
GO
/****** Object:  StoredProcedure [dbo].[GetInscripcionById]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetInscripcionById]
    @Id_Inscripcion INT
AS
BEGIN
    -- Selecciona los datos completos con nombres de cliente y clase
    SELECT 
        ic.Id_inscripcion,
        ic.Id_cliente,
        c.Nombre as SelectedNombreCliente,
        ic.IdClase,
        cl.Nombre as SelectedNombreClase,
        ic.FechaInscripcion
    FROM 
        inscripcionesClases ic
    INNER JOIN 
        Clientes c ON ic.Id_cliente = c.Id_cliente
    INNER JOIN 
        Clases cl ON ic.IdClase = cl.Id_clase
    WHERE 
        ic.Id_inscripcion = @Id_Inscripcion;
END;

GO
/****** Object:  StoredProcedure [dbo].[GetProductoById]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Leer un producto del inventario por ID
CREATE PROCEDURE [dbo].[GetProductoById]
    @IdProducto INT
AS
BEGIN
    SELECT * FROM productos WHERE IdProducto = @IdProducto AND Estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[GetRolById]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Leer un rol por ID
CREATE PROCEDURE [dbo].[GetRolById]
    @Id_rol INT
AS
BEGIN
    SELECT * FROM rol WHERE Id_rol = @Id_rol AND estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[GetRutinaById]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[GetRutinaById]
    @Id_Rutina INT
AS
BEGIN
    
    SELECT 
        ic.Id_rutina,
        ic.Id_plan,
        c.Nombre as NombrePlan,
        ic.Nombre,
		ic.Descripcion,
		ic.DiaSemana
    FROM 
        rutinasEntrenamiento ic
    INNER JOIN 
        planes c ON ic.Id_plan = c.Id_plan
    WHERE 
        ic.Id_rutina = @Id_Rutina;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetUsuarioById]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Leer un usuario por ID
CREATE PROCEDURE [dbo].[GetUsuarioById]
    @Identificacion VARCHAR(50)
AS
BEGIN
    SELECT * FROM dbo.usuario WHERE identificacion = @Identificacion AND estado = 1
    SELECT identificacion, nombre, correo, U.Id_rol,
           CASE WHEN U.estado = 1 THEN 'Activo' ELSE 'Inactivo' END AS estado, 
           R.descripcion
    FROM dbo.usuario U
    INNER JOIN dbo.rol R ON U.Id_rol = R.Id_rol
    WHERE U.identificacion = @Identificacion AND U.estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesion]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IniciarSesion]
    @Correo         VARCHAR(100),
    @Contrasenna    VARCHAR(100)
AS
BEGIN
    SELECT  identificacion, nombre, correo, U.Id_rol, U.estado, R.descripcion
    FROM    dbo.usuario U
    INNER JOIN dbo.rol R ON U.Id_rol = R.Id_rol
    WHERE   U.correo = @Correo
        AND U.contrasenna = @Contrasenna
        AND U.estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[ReadClase]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Ver las clases
CREATE   PROCEDURE [dbo].[ReadClase]
AS
BEGIN
    SELECT * FROM clases WHERE Estado = 1
END;

GO
/****** Object:  StoredProcedure [dbo].[ReadClaseById]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Ver clase especifica
CREATE   PROCEDURE [dbo].[ReadClaseById]
	@Id_clase int
AS
BEGIN
    SELECT * FROM clases WHERE Id_clase = @Id_clase AND Estado = 1
END;

GO
/****** Object:  StoredProcedure [dbo].[ReadEjercicio]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Ver todos los ejercicios
CREATE PROCEDURE [dbo].[ReadEjercicio]
AS
BEGIN
    SELECT * FROM ejercicios
END
GO
/****** Object:  StoredProcedure [dbo].[ReadInscripcion]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[ReadInscripcion]
AS
BEGIN
    SELECT TOP (1000) 
        ic.[Id_inscripcion],
        ic.[Id_cliente],
        c.[Nombre] AS SelectedNombreCliente,
        ic.[IdClase],
        cl.[Nombre] AS SelectedNombreClase,
        ic.[FechaInscripcion]
    FROM 
        [Proyecto].[dbo].[inscripcionesClases] ic
    JOIN 
        [Proyecto].[dbo].[Clientes] c 
    ON 
        ic.Id_cliente = c.Id_cliente
    JOIN 
        [Proyecto].[dbo].[Clases] cl 
    ON 
        ic.IdClase = cl.Id_clase;
END;

GO
/****** Object:  StoredProcedure [dbo].[ReadMembresia]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReadMembresia]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Id_membresia, Nombre, Descripcion, Precio, Plan_codigo, Cliente_codigo, Estado
    FROM [dbo].[membresias]
    WHERE Estado = 1; 
END
GO
/****** Object:  StoredProcedure [dbo].[ReadPlan]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Ver todos los planes
CREATE PROCEDURE [dbo].[ReadPlan]
AS
BEGIN
    SELECT * FROM planes WHERE Estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[ReadProductos]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Leer todos los productos del inventario
CREATE PROCEDURE [dbo].[ReadProductos]
AS
BEGIN
    SELECT * FROM productos WHERE Estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[ReadRoles]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Leer todos los roles
CREATE PROCEDURE [dbo].[ReadRoles]
AS
BEGIN
    SELECT Id_rol AS 'value', descripcion AS  'text'
	FROM rol WHERE estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[ReadRolesMant]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Leer todos los roles mant
CREATE PROCEDURE [dbo].[ReadRolesMant]
AS
BEGIN
    SELECT Id_rol, descripcion, estado
	FROM rol
END
GO
/****** Object:  StoredProcedure [dbo].[ReadRutina]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[ReadRutina]
AS
BEGIN
    SELECT TOP (1000) 
        ic.Id_rutina,
        ic.[Id_plan],
        c.[Nombre] AS NombrePlan,
        ic.Nombre,
		ic.Descripcion,
		ic.DiaSemana
    FROM 
        [Proyecto].[dbo].rutinasEntrenamiento ic
    JOIN 
        [Proyecto].[dbo].planes c 
    ON 
        ic.Id_plan = c.Id_plan;
END;

GO
/****** Object:  StoredProcedure [dbo].[ReadUsuarios]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Leer todos los usuarios
CREATE PROCEDURE [dbo].[ReadUsuarios]
AS
BEGIN
    SELECT identificacion, nombre, correo, U.Id_rol,
           CASE WHEN U.estado = 1 THEN 'Activo' ELSE 'Inactivo' END AS estado, 
           R.descripcion
    FROM dbo.usuario U
    INNER JOIN dbo.rol R ON U.Id_rol = R.Id_rol
    WHERE U.estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarInscripcionClase]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarInscripcionClase]    Script Date: 8/25/2024 11:32:09 PM ******/
CREATE PROCEDURE [dbo].[sp_InsertarInscripcionClase]
    @Id_cliente INT,
    @IdClase INT
AS
BEGIN
    DECLARE @FechaInscripcion DATETIME = GETDATE();

    INSERT INTO [dbo].[inscripcionesClases] (Id_cliente, IdClase, FechaInscripcion)
    VALUES (@Id_cliente, @IdClase, @FechaInscripcion);
END;

GO
/****** Object:  StoredProcedure [dbo].[UpdateClase]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Actualizar clase
CREATE   PROCEDURE [dbo].[UpdateClase]
	@Id_clase int,
	@Nombre VARCHAR(50),
	@Descripcion VARCHAR(50),
	@IdInstructor int,
	@Horario VARCHAR(50),
	@Duracion int,
	@CapacidadMaxima int
AS
BEGIN
    UPDATE clases
    SET Nombre = @Nombre,
	Descripcion = @Descripcion,
	IdInstructor = @IdInstructor,
	Horario = @Horario,
	Duracion = @Duracion, 
	CapacidadMaxima = @CapacidadMaxima
    WHERE Id_clase = @Id_clase
END;

GO
/****** Object:  StoredProcedure [dbo].[UpdateEjercicio]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Actualizar ejercicio
CREATE PROCEDURE [dbo].[UpdateEjercicio]
	@Id_ejercicio INT,
	@Nombre VARCHAR(50),
	@Descripcion VARCHAR(200),
	@GrupoMuscular VARCHAR(50),
	@EquipoNecesario VARCHAR(100)
AS
BEGIN
    UPDATE ejercicios
    SET Nombre = @Nombre, 
	Descripcion = @Descripcion,
	GrupoMuscular = @GrupoMuscular, 	
	EquipoNecesario = @EquipoNecesario
    WHERE Id_ejercicio = @Id_ejercicio
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateInscripcion]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateInscripcion]
    @Id_Inscripcion int,
    @Id_Cliente int,
    @IdClase int,
    @FechaInscripcion Date = NULL 
AS
BEGIN
    UPDATE inscripcionesClases
    SET 
        Id_cliente = @Id_Cliente,
        IdClase = @IdClase,
        FechaInscripcion = ISNULL(@FechaInscripcion, GETDATE()) 
    WHERE Id_inscripcion = @Id_Inscripcion
END

GO
/****** Object:  StoredProcedure [dbo].[UpdatePlan]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Actualizar plan
CREATE PROCEDURE [dbo].[UpdatePlan]
	@Id_plan INT,
	@Nombre VARCHAR(50),
	@Precio int,
	@Descripcion text,
	@Gimnasio_codigo int,
	@Estado bit
AS
BEGIN
    UPDATE planes
    SET Nombre = @Nombre,
	Precio = @Precio,
	Descripcion = @Descripcion,
	Gimnasio_codigo = @Gimnasio_codigo
    WHERE Id_plan = @Id_plan
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProducto]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Actualizar producto en inventario
CREATE PROCEDURE [dbo].[UpdateProducto]
    @IdProducto INT,
    @Nombre VARCHAR(50),
    @Descripcion VARCHAR(500),
    @Inventario INT,
    @PrecioUnitario DECIMAL(18, 2),
    @Imagen VARCHAR(500)
AS
BEGIN
    UPDATE productos
    SET Nombre = @Nombre,
        Descripcion = @Descripcion,
        Inventario = @Inventario,
        PrecioUnitario = @PrecioUnitario,
        Imagen = @Imagen
    WHERE IdProducto = @IdProducto AND Estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateRol]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Actualizar rol
CREATE PROCEDURE [dbo].[UpdateRol]
    @Id_rol INT,
    @descripcion VARCHAR(50)
AS
BEGIN
    UPDATE rol
    SET descripcion = @descripcion
    WHERE Id_rol = @Id_rol
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateRutina]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateRutina]
    @Id_Rutina int,
    @Id_plan int,
    @Nombre Varchar(50),
    @Descripcion Varchar(100),
	@DiaSemana Varchar(10)
AS
BEGIN
    UPDATE rutinasEntrenamiento
    SET 
        Id_plan = @Id_plan,
        Nombre = @Nombre,
        Descripcion = @Descripcion,
		DiaSemana = @DiaSemana
    WHERE Id_rutina = @Id_Rutina
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateUsuario]    Script Date: 8/27/2024 3:13:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Actualizar usuario
CREATE PROCEDURE [dbo].[UpdateUsuario]
    @Identificacion VARCHAR(50),
    @nombre VARCHAR(50),
    @correo VARCHAR(50),
    @contrasenna VARCHAR(100),
    @estado BIT,
    @Id_rol INT
AS
BEGIN
    UPDATE usuario
    SET nombre = @nombre,
        correo = @correo,
        contrasenna = @contrasenna,
        estado = @estado,
        Id_rol = @Id_rol
    WHERE identificacion = @Identificacion
END
GO
USE [master]
GO
ALTER DATABASE [Proyecto] SET  READ_WRITE 
GO
