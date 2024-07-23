--********************* CREACI�N DE BD *************************

USE [master]
GO
CREATE DATABASE [Proyecto]
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--********************* CREACI�N DE TABLAS *************************

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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[usuario](
	[identificacion] [varchar](50) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[correo] [varchar](100) NOT NULL,
	[contrasenna] [varchar](100) NOT NULL,
	[Id_rol] [tinyint] NOT NULL DEFAULT 2,
    [estado] [bit] NOT NULL DEFAULT 1,
 CONSTRAINT [PK_tUsuario] PRIMARY KEY CLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Correo] UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventasProductos](
	[Id_venta] [int] NOT NULL,
	[Id_producto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[estado] [bit] NOT NULL,
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


--******************************* CREACI�N DE SP *******************************
USE [Proyecto]
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

-- Crear usuario
CREATE PROCEDURE CreateUsuario
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

-- Leer todos los usuarios
CREATE PROCEDURE ReadUsuarios
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


-- Leer un usuario por ID
CREATE PROCEDURE GetUsuarioById
    @Identificacion VARCHAR(50)
AS
BEGIN
    SELECT identificacion, nombre, correo, U.Id_rol,
           CASE WHEN U.estado = 1 THEN 'Activo' ELSE 'Inactivo' END AS estado, 
           R.descripcion
    FROM dbo.usuario U
    INNER JOIN dbo.rol R ON U.Id_rol = R.Id_rol
    WHERE U.identificacion = @Identificacion AND U.estado = 1
END
GO

-- Actualizar usuario
CREATE PROCEDURE UpdateUsuario
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

-- Eliminar usuario
CREATE PROCEDURE DeleteUsuario
    @Identificacion VARCHAR(50)
AS
BEGIN
    UPDATE usuario
    SET estado = 0
    WHERE identificacion = @Identificacion
END
GO


-- Crear rol
CREATE PROCEDURE CreateRol
    @descripcion VARCHAR(50)
AS
BEGIN
    INSERT INTO rol (descripcion)
    VALUES (@descripcion)
END
GO

-- Leer todos los roles
CREATE PROCEDURE ReadRoles
AS
BEGIN
    SELECT * FROM rol WHERE estado = 1
END
GO

-- Leer un rol por ID
CREATE PROCEDURE GetRolById
    @Id_rol INT
AS
BEGIN
    SELECT * FROM rol WHERE Id_rol = @Id_rol AND estado = 1
END
GO

-- Actualizar rol
CREATE PROCEDURE UpdateRol
    @Id_rol INT,
    @descripcion VARCHAR(50)
AS
BEGIN
    UPDATE rol
    SET descripcion = @descripcion
    WHERE Id_rol = @Id_rol
END
GO

-- Eliminar rol
CREATE PROCEDURE DeleteRol
    @Id_rol INT
AS
BEGIN
    UPDATE rol
    SET estado = 0
    WHERE Id_rol = @Id_rol
END
GO

-- Crear producto en inventario
CREATE PROCEDURE CreateProducto
    @Nombre VARCHAR(50),
    @Descripcion VARCHAR(200),
    @CantidadStock INT,
    @Precio DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO inventario (Nombre, Descripcion, CantidadStock, Precio)
    VALUES (@Nombre, @Descripcion, @CantidadStock, @Precio)
END
GO

-- Leer todos los productos del inventario
CREATE PROCEDURE ReadProductos
AS
BEGIN
    SELECT * FROM inventario WHERE estado = 1
END
GO

-- Leer un producto del inventario por ID
CREATE PROCEDURE GetProductoById
    @Id_producto INT
AS
BEGIN
    SELECT * FROM inventario WHERE Id_producto = @Id_producto AND estado = 1
END
GO

-- Actualizar producto en inventario
CREATE PROCEDURE UpdateProducto
    @Id_producto INT,
    @Nombre VARCHAR(50),
    @Descripcion VARCHAR(200),
    @CantidadStock INT,
    @Precio DECIMAL(10, 2)
AS
BEGIN
    UPDATE inventario
    SET Nombre = @Nombre,
        Descripcion = @Descripcion,
        CantidadStock = @CantidadStock,
        Precio = @Precio
    WHERE Id_producto = @Id_producto
END
GO

-- Eliminar producto del inventario
CREATE PROCEDURE DeleteProducto
    @Id_producto INT
AS
BEGIN
    UPDATE inventario
    SET estado = 0
    WHERE Id_producto = @Id_producto
END
GO
-- Crear ventasProductos
CREATE PROCEDURE CreateVentasProducto
    @Id_venta INT,
    @Id_producto INT,
    @Cantidad INT
AS
BEGIN
    INSERT INTO ventasProductos (Id_venta, Id_producto, Cantidad)
    VALUES (@Id_venta, @Id_producto, @Cantidad)
END
GO

-- Leer todos los registros de ventasProductos
CREATE PROCEDURE ReadVentasProductos
AS
BEGIN
    SELECT * FROM ventasProductos WHERE estado = 1
END
GO

-- Leer un registro de ventasProductos por ID de venta y producto
CREATE PROCEDURE GetVentasProductoById
    @Id_venta INT,
    @Id_producto INT
AS
BEGIN
    SELECT * FROM ventasProductos WHERE Id_venta = @Id_venta AND Id_producto = @Id_producto AND estado = 1
END
GO

-- Actualizar ventasProductos
CREATE PROCEDURE UpdateVentasProducto
    @Id_venta INT,
    @Id_producto INT,
    @Cantidad INT
AS
BEGIN
    UPDATE ventasProductos
    SET Cantidad = @Cantidad
    WHERE Id_venta = @Id_venta AND Id_producto = @Id_producto
END
GO

-- Eliminar ventasProductos
CREATE PROCEDURE DeleteVentasProducto
    @Id_venta INT,
    @Id_producto INT
AS
BEGIN
    UPDATE ventasProductos
    SET estado = 0
    WHERE Id_venta = @Id_venta AND Id_producto = @Id_producto
END
GO

-- Datos Necesarios
SET IDENTITY_INSERT [dbo].[rol] ON 
GO
INSERT [dbo].[rol] ([Id_rol], [descripcion], [estado]) VALUES (1, N'Administrador',1)
GO
INSERT [dbo].[rol] ([Id_rol], [descripcion], [estado]) VALUES (2, N'Usuario',1)
GO
SET IDENTITY_INSERT [dbo].[rol] OFF
GO
