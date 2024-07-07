USE [master]
GO
/****** Object:  Database [Proyecto]    Script Date: 5/7/2024 19:59:59 ******/
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
/****** Object:  Table [dbo].[asignacionPlanes]    Script Date: 5/7/2024 19:59:59 ******/
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
/****** Object:  Table [dbo].[clases]    Script Date: 5/7/2024 19:59:59 ******/
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
PRIMARY KEY CLUSTERED 
(
	[Id_clase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 5/7/2024 19:59:59 ******/
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
PRIMARY KEY CLUSTERED 
(
	[Id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ejercicios]    Script Date: 5/7/2024 19:59:59 ******/
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
/****** Object:  Table [dbo].[empleados]    Script Date: 5/7/2024 19:59:59 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gimnasios]    Script Date: 5/7/2024 19:59:59 ******/
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
/****** Object:  Table [dbo].[inscripcionesClases]    Script Date: 5/7/2024 19:59:59 ******/
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
/****** Object:  Table [dbo].[inventario]    Script Date: 5/7/2024 19:59:59 ******/
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
PRIMARY KEY CLUSTERED 
(
	[Id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[membresias]    Script Date: 5/7/2024 19:59:59 ******/
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
PRIMARY KEY CLUSTERED 
(
	[Id_membresia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pagos]    Script Date: 5/7/2024 19:59:59 ******/
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
/****** Object:  Table [dbo].[planes]    Script Date: 5/7/2024 19:59:59 ******/
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
PRIMARY KEY CLUSTERED 
(
	[Id_plan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[planesEntrenamiento]    Script Date: 5/7/2024 19:59:59 ******/
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
/****** Object:  Table [dbo].[promociones]    Script Date: 5/7/2024 19:59:59 ******/
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
/****** Object:  Table [dbo].[provincias]    Script Date: 5/7/2024 19:59:59 ******/
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
/****** Object:  Table [dbo].[rol]    Script Date: 5/7/2024 19:59:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[Id_rol] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[Id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rutinasEjercicios]    Script Date: 5/7/2024 19:59:59 ******/
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
/****** Object:  Table [dbo].[rutinasEntrenamiento]    Script Date: 5/7/2024 19:59:59 ******/
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
/****** Object:  Table [dbo].[usuarios]    Script Date: 5/7/2024 19:59:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[Id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[contrasenna] [varchar](100) NOT NULL,
	[estado] [bit] NOT NULL,
	[Id_rol] [int] NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[Id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ventas]    Script Date: 5/7/2024 19:59:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventas](
	[Id_venta] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[ventasProductos]    Script Date: 5/7/2024 19:59:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventasProductos](
	[Id_venta] [int] NOT NULL,
	[Id_producto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_venta] ASC,
	[Id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_rol] FOREIGN KEY([Id_rol])
REFERENCES [dbo].[rol] ([Id_rol])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_rol]
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD FOREIGN KEY([Id_cliente])
REFERENCES [dbo].[clientes] ([Id_cliente])
GO
ALTER TABLE [dbo].[ventas]  WITH CHECK ADD FOREIGN KEY([Id_empleado])
REFERENCES [dbo].[empleados] ([Id_empleado])
GO
ALTER TABLE [dbo].[ventasProductos]  WITH CHECK ADD FOREIGN KEY([Id_producto])
REFERENCES [dbo].[inventario] ([Id_producto])
GO
ALTER TABLE [dbo].[ventasProductos]  WITH CHECK ADD FOREIGN KEY([Id_venta])
REFERENCES [dbo].[ventas] ([Id_venta])
GO
USE [master]
GO
ALTER DATABASE [Proyecto] SET  READ_WRITE 
GO
