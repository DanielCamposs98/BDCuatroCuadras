-- ===========================================================================================
-- Descripción: SP para actualizar los datos del Usuario a nivel global
-- ===========================================================================================


GO
-- ===========================================================================================
-- Descripción:	Procedimiento almacenado que realiza diferentes backups de la base de datos.
-- ===========================================================================================
CREATE PROCEDURE [dbo].[RESPALDO]
AS
BEGIN
	DECLARE @NOMBRE VARCHAR(70);
		
	SET @NOMBRE = 'C:\Backup CuatroCuadras (' 
				  + CAST((SELECT SYSDATETIME()) AS VARCHAR(10))
				  + ') - ('
				  + REPLACE(CAST(SUBSTRING(CONVERT( VARCHAR, (SELECT SYSDATETIME()), 100 ),13,19) AS VARCHAR), ':', ';')
				  + ').BAK'
	BACKUP DATABASE [CuatroCuadras]
	TO DISK = @NOMBRE
    WITH FORMAT;
END

-- CÓDIGO DE PRUEBA
EXEC RESPALDO;

RESTORE DATABASE [CuatroCuadras] FROM  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\Backup CuatroCuadras (2020-05-18) - ( 1;27AM).BAK' WITH  FILE = 1,  MOVE N'CuatroCuadras' TO N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CuatroCuadras.mdf',  MOVE N'CuatroCuadras_log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CuatroCuadras_log.ldf',  NOUNLOAD,  STATS = 5




-- ===========================================================================================
-- Descripción: Insertar ciudades si no existe alguna
-- ===========================================================================================

GO
CREATE PROCEDURE SP_InsertCiudadUsuario
    @Nickname NVARCHAR(35),
    @Nombre VARCHAR(40),
    @Apellidos VARCHAR(50),
    @Sexo CHAR(1),
    @Fecha_Nacimiento DATE,
    @Email VARCHAR(40),
    @Contrasena VARCHAR(20),
    @ID_Ciudad INT,
    @Ciudad VARCHAR(30)

AS
        SELECT @ID_Ciudad=ID_Ciudad from CIUDAD WHERE Ciudad=@Ciudad
BEGIN
if @ID_Ciudad in (Select ID_Ciudad from Ciudad where ID_Ciudad=@ID_Ciudad)
    BEGIN
    INSERT INTO USUARIO ( Nickname, Nombre, Apellidos, Sexo, Fecha_Nacimiento, Email, Contrasena, ID_Ciudad ) VALUES ( @Nickname, @Nombre, @Apellidos, @Sexo, @Fecha_Nacimiento, @Email, @Contrasena, @ID_Ciudad )
    END
ELSE
    BEGIN
    begin tran
    --IF NOT EXISTS(Select 1 FROM CIUDAD where CIUDAD=@Ciudad)
        INSERT INTO CIUDAD ( Ciudad ) VALUES (@Ciudad)
    commit tran
    INSERT INTO USUARIO ( Nickname, Nombre, Apellidos, Sexo, Fecha_Nacimiento, Email, Contrasena, ID_Ciudad ) VALUES ( @Nickname, @Nombre, @Apellidos, @Sexo, @Fecha_Nacimiento, @Email, @Contrasena, (Select MAX(ID_Ciudad) FROM CIUDAD) )
    END
END



-- ===========================================================================================
-- Descripción: Borrar de la tabla de amigos
-- ===========================================================================================
GO
CREATE PROCEDURE SP_BorrarAmigos
    @Nickname1 NVARCHAR(35),
    @Nickname2 NVARCHAR(35)
AS
BEGIN
begin TRAN
    DELETE FROM AMIGO Where AMIGO.Nickname1=@Nickname1 and AMIGO.Nickname2=@Nickname2
    DELETE FROM AMIGO Where AMIGO.Nickname1=@Nickname2 and AMIGO.Nickname2=@Nickname1
commit TRAN
END

-- ===========================================================================================
-- Descripción: Mostrar el porcentaje que lleva realizado un usuario en cada logro
-- ===========================================================================================
GO
CREATE PROCEDURE SP_AvanceLogros
    @Nickname varchar(30)
AS
BEGIN
    Select U.Nickname, L1.Nombre,L1.Cantidad_Visitas,COUNT(*) as [Visitas Realizadas], ((100/L1.Cantidad_Visitas)*COUNT(*)) as Porcentaje from VISITA V 
	INNER JOIN USUARIO U 
	ON V.Nickname=U.Nickname 
	INNER JOIN LUGAR L 
	ON V.ID_Lugar=L.ID_Lugar
	INNER JOIN LOGRO L1
	ON L.ID_Categoria=L1.Tipo_Categoria
	WHERE U.Nickname=@Nickname
	GROUP BY U.Nickname,L1.Nombre,L1.Cantidad_Visitas
	UNION
	Select U.Nickname, L1.Nombre,L1.Cantidad_Visitas,COUNT(*) as [Visitas Realizadas], ((100/L1.Cantidad_Visitas)*COUNT(*)) as Porcentaje from VISITA V 
	INNER JOIN USUARIO U 
	ON V.Nickname=U.Nickname 
	INNER JOIN LUGAR L 
	ON V.ID_Lugar=L.ID_Lugar
	INNER JOIN LOGRO L1
	ON L.ID_Etiqueta=L1.Tipo_Etiqueta
	WHERE U.Nickname=@Nickname
	GROUP BY U.Nickname,L1.Nombre,L1.Cantidad_Visitas
	ORDER BY Porcentaje DESC
END
