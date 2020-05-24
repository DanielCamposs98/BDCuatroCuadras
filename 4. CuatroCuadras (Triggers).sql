USE CuatroCuadras
GO
-- ===========================================================================================
--  TRIGGER PENDIENTE
-- ===========================================================================================

-- ===========================================================================================
--  Descripción: Aceptar solicitud.
-- ===========================================================================================
CREATE TRIGGER triSolicitudes ON AMIGO AFTER UPDATE
AS
    Declare @Estado CHAR(1)
    DECLARE @N1 NVARCHAR(35)
    DECLARE @N2 NVARCHAR(35)

    SELECT @N1=Nickname1, @N2=Nickname2, @Estado=Estado from inserted
    IF(@Estado)='R'
        DELETE FROM AMIGO WHERE Nickname1=@N1 and Nickname2=@N2

GO
-- ===========================================================================================
--  Descripción: Dar de baja logro al borrar etiqueta
-- ===========================================================================================
CREATE TRIGGER triBajaLogro ON ETIQUETA
FOR DELETE AS 
DECLARE @nombreEtiqueta VARCHAR(20)
SELECT @nombreEtiqueta = Nombre_eti FROM deleted
DELETE FROM LOGRO WHERE Descripcion LIKE @nombreEtiqueta
BEGIN
    BEGIN TRY
        UPDATE LOGRO SET Disponibilidad=0 WHERE Descripcion LIKE '%'+@nombreEtiqueta+'%'
    --ROLLBACK TRAN
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() as ErrorMesage
    END CATCH
END
GO

-- ===========================================================================================
--  Trigger pendiente
-- ===========================================================================================


-- ===========================================================================================
--  Descripción: Ganarse logros.
-- ===========================================================================================
    --5.1 Logro de Fotogenico
CREATE TRIGGER triLogroFotogenico ON VISITA FOR INSERT
AS
    DECLARE @Nickname NVARCHAR(35)
    DECLARE @ID_Etiqueta INT
    DECLARE @ID_Categoria int
    SET @ID_Etiqueta=2
    SELECT @Nickname=Nickname FROM inserted

    --Ganarse logro Fotogenico; Check-In en 3 lugares distintos con fotocabina (photoboot)
    IF(select ID_Etiqueta from inserted i inner join Lugar L on i.Id_Lugar=L.ID_Lugar)=@ID_Etiqueta
        IF NOT EXISTS (SELECT 1 FROM LOGRO_USUARIO WHERE Nickname=@Nickname and ID_Logro=1)
            IF(SELECT Disponibilidad FROM LOGRO WHERE ID_Logro=1)=1
                IF(SELECT COUNT(*) FROM VISITA V 
                    INNER JOIN Lugar L ON (L.Id_Lugar = V.Id_Lugar) 
                    WHERE L.ID_Etiqueta = @ID_Etiqueta AND NICKNAME = @NickNAme)>=(SELECT Cantidad_Visitas FROM LOGRO WHERE Nombre='Fotogenico')
                        INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 1, GETDATE())
GO
    --5.2 Logro de Navegante
CREATE TRIGGER triLogroNavegante ON VISITA FOR INSERT
AS
    DECLARE @Nickname NVARCHAR(35)
    DECLARE @ID_Etiqueta INT
    DECLARE @ID_Categoria int
    SET @ID_Etiqueta=1

    SELECT @Nickname=Nickname FROM inserted
 --Ganarse logro Navegante; Check-In en 3 lugares distintos con etiqueta "Navegante"
    IF(select ID_Etiqueta from inserted i inner join Lugar L on i.ID_Lugar=L.ID_Lugar)=@ID_Etiqueta
        IF NOT EXISTS (SELECT 1 FROM LOGRO_USUARIO WHERE Nickname=@Nickname and ID_Logro=2)
            IF(SELECT Disponibilidad FROM LOGRO WHERE ID_Logro=2)=1
                IF(SELECT COUNT(*) FROM VISITA V 
                INNER JOIN Lugar L ON (L.Id_Lugar = V.Id_Lugar) 
                WHERE L.ID_Etiqueta = @ID_Etiqueta AND NICKNAME = @NickNAme)>=(SELECT Cantidad_Visitas FROM LOGRO WHERE Nombre='Navegante')
                    INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 2, GETDATE())
GO

    --5.3 Logro de La Voz
CREATE TRIGGER triLogroLaVoz ON VISITA FOR INSERT
AS
    DECLARE @Nickname NVARCHAR(35)
    DECLARE @ID_Etiqueta INT
    DECLARE @ID_Categoria int
    SET @ID_Categoria=1

    SELECT @Nickname=Nickname FROM inserted
    --Ganarse logro La Voz; 3 Check-In en un mes desde lugares con la categoria "Karaoke Bar"
    IF(select ID_Categoria from inserted i inner join Lugar L on i.ID_Lugar=L.ID_Lugar)=@ID_Categoria
        IF NOT EXISTS (SELECT 1 FROM LOGRO_USUARIO WHERE Nickname=@Nickname and ID_Logro=3)
            IF(SELECT Disponibilidad FROM LOGRO WHERE ID_Logro=3)=1
                IF(SELECT COUNT(*) FROM VISITA V 
                INNER JOIN Lugar L ON (L.Id_Lugar = V.Id_Lugar) 
                WHERE L.ID_Categoria = @ID_Categoria AND NICKNAME = @NickNAme)>=(SELECT Cantidad_Visitas FROM LOGRO WHERE Nombre='La Voz')
                    INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 3, GETDATE())
GO
    --5.4 Logro de Melómano
CREATE TRIGGER triLogroMelomano ON VISITA FOR INSERT
AS
    DECLARE @Nickname NVARCHAR(35)
    DECLARE @ID_Etiqueta INT
    DECLARE @ID_Categoria int
    SET @ID_Categoria=2

    SELECT @Nickname=Nickname FROM inserted

    --Ganarse logro Melómano; Hacer Check-In en 5 lugares de la categoría "Tienda de Musica"
    IF(select ID_Categoria from inserted i inner join Lugar L on i.ID_Lugar=L.ID_Lugar)=@ID_Categoria
        IF NOT EXISTS (SELECT 1 FROM LOGRO_USUARIO WHERE Nickname=@Nickname and ID_Logro=4)
            IF(SELECT Disponibilidad FROM LOGRO WHERE ID_Logro=4)=1
                IF(SELECT COUNT(*) FROM VISITA V 
                INNER JOIN Lugar L ON (L.Id_Lugar = V.Id_Lugar) 
                WHERE L.ID_Categoria = @ID_Categoria AND NICKNAME = @NickNAme)>=(SELECT Cantidad_Visitas FROM LOGRO WHERE Nombre='Melómano')
                    INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 4, GETDATE())
GO
    --5.5 Logro de Cinéfilo
CREATE TRIGGER triLogroCinefilo ON VISITA FOR INSERT
AS
    DECLARE @Nickname NVARCHAR(35)
    DECLARE @ID_Etiqueta INT
    DECLARE @ID_Categoria int
    SET @ID_Categoria=3

    SELECT @Nickname=Nickname FROM inserted

    --Ganarse logro Cinéfilo; Hacer 15 Check-In en cines
    IF(select ID_Categoria from inserted i inner join Lugar L on i.ID_Lugar=L.ID_Lugar)=@ID_Categoria
        IF NOT EXISTS (SELECT 1 FROM LOGRO_USUARIO WHERE Nickname=@Nickname and ID_Logro=5)
            IF(SELECT Disponibilidad FROM LOGRO WHERE ID_Logro=5)=1
                IF(SELECT COUNT(*) FROM VISITA V 
                INNER JOIN Lugar L ON (L.Id_Lugar = V.Id_Lugar) 
                WHERE L.ID_Categoria = @ID_Categoria AND NICKNAME = @NickNAme)>=(SELECT Cantidad_Visitas FROM LOGRO WHERE Nombre='Cinéfilo')
                    INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 5, GETDATE())
GO
  --5.6 Logro de Catador de Comida
CREATE TRIGGER triLogroCatadorDeComida ON VISITA FOR INSERT
AS
    DECLARE @Nickname NVARCHAR(35)
    DECLARE @ID_Etiqueta INT
    DECLARE @ID_Categoria int
    SET @ID_Categoria=4

    SELECT @Nickname=Nickname FROM inserted

    --Ganarse logro Cinéfilo; Hacer 15 Check-In en cines
    IF(select ID_Categoria from inserted i inner join Lugar L on i.ID_Lugar=L.ID_Lugar)=@ID_Categoria
        IF NOT EXISTS (SELECT 1 FROM LOGRO_USUARIO WHERE Nickname=@Nickname and ID_Logro=6)
            IF(SELECT Disponibilidad FROM LOGRO WHERE ID_Logro=6)=1
                IF(SELECT COUNT(*) FROM VISITA V 
                INNER JOIN Lugar L ON (L.Id_Lugar = V.Id_Lugar) 
                WHERE L.ID_Categoria = @ID_Categoria AND NICKNAME = @NickNAme)>=(SELECT Cantidad_Visitas FROM LOGRO WHERE Nombre='Catador de Comida')
                    INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 6, GETDATE())
GO
--5.7 Logro de Trabajador
CREATE TRIGGER triLogroTrabajador ON VISITA FOR INSERT
AS
    DECLARE @Nickname NVARCHAR(35)
    DECLARE @ID_Etiqueta INT
    DECLARE @ID_Categoria int
    SET @ID_Categoria=5

    SELECT @Nickname=Nickname FROM inserted

    --Ganarse logro Cinéfilo; Hacer 15 Check-In en cines
    IF(select ID_Categoria from inserted i inner join Lugar L on i.ID_Lugar=L.ID_Lugar)=@ID_Categoria
        IF NOT EXISTS (SELECT 1 FROM LOGRO_USUARIO WHERE Nickname=@Nickname and ID_Logro=7)
            IF(SELECT Disponibilidad FROM LOGRO WHERE ID_Logro=7)=1
                IF(SELECT COUNT(*) FROM VISITA V 
                INNER JOIN Lugar L ON (L.Id_Lugar = V.Id_Lugar) 
                WHERE L.ID_Categoria = @ID_Categoria AND NICKNAME = @NickNAme)>=(SELECT Cantidad_Visitas FROM LOGRO WHERE Nombre='Trabajador')
                    INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 7, GETDATE())
GO

-- ===========================================================================================
--  Descripción: Encriptar contraseña de usuarios
-- ===========================================================================================
create trigger triEncriptarContrasena ON Usuario INSTEAD OF INSERT
AS
    INSERT INTO USUARIO
    SELECT Nickname, Nombre, Apellidos, Sexo, Fecha_Nacimiento, Email,ENCRYPTBYPASSPHRASE('Contraseña',Contrasena), ID_Ciudad FROM inserted
GO