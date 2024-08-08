USE [Proyecto]
GO
/****** Object:  Table [dbo].[asignacionPlanes]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[clases]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[clientes]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[ejercicios]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[empleados]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[gimnasios]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[inscripcionesClases]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[inventario]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[membresias]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[pagos]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[planes]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[planesEntrenamiento]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[promociones]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[provincias]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[rol]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[rutinasEjercicios]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[rutinasEntrenamiento]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 8/8/2024 17:38:14 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Correo] UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ventas]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  Table [dbo].[ventasProductos]    Script Date: 8/8/2024 17:38:14 ******/
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
ALTER TABLE [dbo].[ventasProductos]  WITH CHECK ADD FOREIGN KEY([Id_producto])
REFERENCES [dbo].[inventario] ([Id_producto])
GO
ALTER TABLE [dbo].[ventasProductos]  WITH CHECK ADD FOREIGN KEY([Id_venta])
REFERENCES [dbo].[ventas] ([Id_venta])
GO
/****** Object:  StoredProcedure [dbo].[CambiarEstadoUsuario]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CambiarEstadoUsuario]
	@Identificacion INT
AS
BEGIN

	UPDATE usuario
	   SET estado = CASE WHEN estado = 1 THEN 0 ELSE 1 END
	 WHERE Identificacion = @Identificacion

END
GO
/****** Object:  StoredProcedure [dbo].[CreateClase]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Crear clase
CREATE PROCEDURE [dbo].[CreateClase]
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
END
GO
/****** Object:  StoredProcedure [dbo].[CreateEjercicio]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  StoredProcedure [dbo].[CreatePlan]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateProducto]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Crear producto en inventario
CREATE PROCEDURE [dbo].[CreateProducto]
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
/****** Object:  StoredProcedure [dbo].[CreateRol]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateUsuario]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateVentasProducto]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Crear ventasProductos
CREATE PROCEDURE [dbo].[CreateVentasProducto]
    @Id_venta INT,
    @Id_producto INT,
    @Cantidad INT
AS
BEGIN
    INSERT INTO ventasProductos (Id_venta, Id_producto, Cantidad)
    VALUES (@Id_venta, @Id_producto, @Cantidad)
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteClase]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Eliminar clase
CREATE PROCEDURE [dbo].[DeleteClase]
    @Id_clase INT
AS
BEGIN
    UPDATE clases
    SET Estado = 0
    WHERE Id_clase = @Id_clase
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteEjercicio]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePlan]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteProducto]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Eliminar producto del inventario
CREATE PROCEDURE [dbo].[DeleteProducto]
    @Id_producto INT
AS
BEGIN
    UPDATE inventario
    SET estado = 0
    WHERE Id_producto = @Id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteRol]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteUsuario]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteVentasProducto]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Eliminar ventasProductos
CREATE PROCEDURE [dbo].[DeleteVentasProducto]
    @Id_venta INT,
    @Id_producto INT
AS
BEGIN
    UPDATE ventasProductos
    SET estado = 0
    WHERE Id_venta = @Id_venta AND Id_producto = @Id_producto
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductoById]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Leer un producto del inventario por ID
CREATE PROCEDURE [dbo].[GetProductoById]
    @Id_producto INT
AS
BEGIN
    SELECT * FROM inventario WHERE Id_producto = @Id_producto AND estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[GetRolById]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  StoredProcedure [dbo].[GetUsuarioById]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  StoredProcedure [dbo].[GetVentasProductoById]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Leer un registro de ventasProductos por ID de venta y producto
CREATE PROCEDURE [dbo].[GetVentasProductoById]
    @Id_venta INT,
    @Id_producto INT
AS
BEGIN
    SELECT * FROM ventasProductos WHERE Id_venta = @Id_venta AND Id_producto = @Id_producto AND estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesion]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  StoredProcedure [dbo].[ReadClase]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Ver las clases
CREATE PROCEDURE [dbo].[ReadClase]
AS
BEGIN
    SELECT * FROM clases WHERE Estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[ReadClaseById]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Ver clase especifica
CREATE PROCEDURE [dbo].[ReadClaseById]
	@Id_clase int
AS
BEGIN
    SELECT * FROM clases WHERE Id_clase = @Id_clase AND Estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[ReadEjercicio]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  StoredProcedure [dbo].[ReadPlan]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  StoredProcedure [dbo].[ReadProductos]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Leer todos los productos del inventario
CREATE PROCEDURE [dbo].[ReadProductos]
AS
BEGIN
    SELECT * FROM inventario WHERE estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[ReadRoles]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Leer todos los roles
CREATE PROCEDURE [dbo].[ReadRoles]
AS
BEGIN
    SELECT * FROM rol WHERE estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[ReadUsuarios]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Leer todos los usuarios
CREATE PROCEDURE [dbo].[ReadUsuarios]
AS
BEGIN
    SELECT * FROM dbo.usuario WHERE estado = 1
    SELECT identificacion, nombre, correo, U.Id_rol,
           CASE WHEN U.estado = 1 THEN 'Activo' ELSE 'Inactivo' END AS estado, 
           R.descripcion
    FROM dbo.usuario U
    INNER JOIN dbo.rol R ON U.Id_rol = R.Id_rol
    WHERE U.estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[ReadVentasProductos]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Leer todos los registros de ventasProductos
CREATE PROCEDURE [dbo].[ReadVentasProductos]
AS
BEGIN
    SELECT * FROM ventasProductos WHERE estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarInscripcionClase]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarInscripcionClase]
    @Id_cliente INT,
    @IdClase INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @FechaInscripcion DATETIME = GETDATE();

    INSERT INTO [Proyecto].[dbo].[inscripcionesClases] (Id_cliente, IdClase, FechaInscripcion)
    VALUES (@Id_cliente, @IdClase, @FechaInscripcion);
	RETURN @@ROWCOUNT;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateClase]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Actualizar clase
CREATE PROCEDURE [dbo].[UpdateClase]
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
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEjercicio]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePlan]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateProducto]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Actualizar producto en inventario
CREATE PROCEDURE [dbo].[UpdateProducto]
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
/****** Object:  StoredProcedure [dbo].[UpdateRol]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateUsuario]    Script Date: 8/8/2024 17:38:14 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateVentasProducto]    Script Date: 8/8/2024 17:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Actualizar ventasProductos
CREATE PROCEDURE [dbo].[UpdateVentasProducto]
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
