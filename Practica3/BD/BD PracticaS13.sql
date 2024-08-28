USE [master]
GO

CREATE DATABASE [PracticaS13]
GO

USE [PracticaS13]
GO

CREATE TABLE [dbo].[Abonos](
	[Id_Compra] [bigint] NOT NULL,
	[Id_Abono] [bigint] IDENTITY(1,1) NOT NULL,
	[Monto] [decimal](18, 2) NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Abonos] PRIMARY KEY CLUSTERED 
(
	[Id_Abono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Principal](
	[Id_Compra] [bigint] IDENTITY(1,1) NOT NULL,
	[Precio] [decimal](18, 5) NOT NULL,
	[Saldo] [decimal](18, 5) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Estado] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Principal] PRIMARY KEY CLUSTERED 
(
	[Id_Compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[Principal] ON 
GO
INSERT [dbo].[Principal] ([Id_Compra], [Precio], [Saldo], [Descripcion], [Estado]) VALUES (1, CAST(50000.00000 AS Decimal(18, 5)), CAST(50000.00000 AS Decimal(18, 5)), N'Producto 1', N'Pendiente')
GO
INSERT [dbo].[Principal] ([Id_Compra], [Precio], [Saldo], [Descripcion], [Estado]) VALUES (2, CAST(13500.00000 AS Decimal(18, 5)), CAST(13500.00000 AS Decimal(18, 5)), N'Producto 2', N'Pendiente')
GO
INSERT [dbo].[Principal] ([Id_Compra], [Precio], [Saldo], [Descripcion], [Estado]) VALUES (3, CAST(83600.00000 AS Decimal(18, 5)), CAST(83600.00000 AS Decimal(18, 5)), N'Producto 3', N'Pendiente')
GO
INSERT [dbo].[Principal] ([Id_Compra], [Precio], [Saldo], [Descripcion], [Estado]) VALUES (4, CAST(1220.00000 AS Decimal(18, 5)), CAST(1220.00000 AS Decimal(18, 5)), N'Producto 4', N'Pendiente')
GO
INSERT [dbo].[Principal] ([Id_Compra], [Precio], [Saldo], [Descripcion], [Estado]) VALUES (5, CAST(480.00000 AS Decimal(18, 5)), CAST(480.00000 AS Decimal(18, 5)), N'Producto 5', N'Pendiente')
GO
SET IDENTITY_INSERT [dbo].[Principal] OFF
GO

ALTER TABLE [dbo].[Abonos]  WITH CHECK ADD  CONSTRAINT [FK_Abonos_Principal] FOREIGN KEY([Id_Compra])
REFERENCES [dbo].[Principal] ([Id_Compra])
GO
ALTER TABLE [dbo].[Abonos] CHECK CONSTRAINT [FK_Abonos_Principal]
GO

--SP
--1
CREATE PROCEDURE [dbo].[ConsultarProductos]
AS
BEGIN
  
    SELECT
        Id_Compra,
        Precio,
        Saldo,
        Descripcion,
        Estado
    FROM
        dbo.Principal
END;
GO

--2
CREATE PROCEDURE [dbo].[ObtenerCompras]
AS
BEGIN
    SELECT Id_Compra, Descripcion
    FROM Principal
    WHERE Estado = 'Pendiente';
END;
GO

--3
CREATE PROCEDURE [dbo].[ConsultarSaldo]
    @Id_Compra BIGINT
AS
BEGIN
    SELECT Saldo
    FROM Principal
    WHERE Id_Compra = @Id_Compra;
END;
GO

--4
CREATE PROCEDURE [dbo].[RegistrarAbonoyActualizar]
    @Id_Compra BIGINT,
    @MontoAbono DECIMAL(18, 2)
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        INSERT INTO Abonos (Id_Compra, Monto, Fecha)
        VALUES (@Id_Compra, @MontoAbono, GETDATE());

        UPDATE Principal
        SET Saldo = Saldo - @MontoAbono,
            Estado = CASE 
                        WHEN Saldo - @MontoAbono <= 0 THEN 'Cancelado'
                        ELSE Estado
                     END
        WHERE Id_Compra = @Id_Compra;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;
GO

CREATE PROCEDURE [dbo].[RegistrarAbono]
    @Id_Compra BIGINT,
    @Monto DECIMAL(18, 2)
AS
BEGIN
    -- Variable para almacenar el saldo actual y estado
    DECLARE @SaldoActual DECIMAL(18, 5);
    DECLARE @EstadoActual VARCHAR(100);

    -- Obtener el saldo actual y estado de la tabla Principal para la compra especificada
    SELECT @SaldoActual = Saldo, @EstadoActual = Estado
    FROM dbo.Principal
    WHERE Id_Compra = @Id_Compra;

    -- Validar que el abono no sea mayor al saldo actual
    IF @Monto <= @SaldoActual
    BEGIN
        -- Registrar el abono en la tabla Abonos
        INSERT INTO dbo.Abonos (Id_Compra, Monto, Fecha)
        VALUES (@Id_Compra, @Monto, GETDATE());

        -- Actualizar el saldo en la tabla Principal
        UPDATE dbo.Principal
        SET Saldo = @SaldoActual - @Monto,
            -- Actualizar el estado a "Cancelado" si el saldo queda en cero
            Estado = CASE 
                        WHEN @SaldoActual - @Monto = 0 THEN 'Cancelado'
                        ELSE @EstadoActual
                     END
        WHERE Id_Compra = @Id_Compra;
    END

END
GO

CREATE PROCEDURE GetCompraById
    @Id_Compra VARCHAR(50)
AS
BEGIN
    SELECT * 
    FROM dbo.Principal 
    WHERE Id_Compra = @Id_Compra 
      AND Estado = 'Pendiente';
	  END
GO