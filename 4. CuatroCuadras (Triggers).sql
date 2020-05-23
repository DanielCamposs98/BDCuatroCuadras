USE CuatroCuadras
-- ===========================================================================================
--  Descripción: Validar categorías como se hace con ciudades; que no contengan números.
-- ===========================================================================================
GO
CREATE TRIGGER triValidarEtiqueta ON ETIQUETA 
FOR INSERT AS DECLARE @nombreEtiqueta VARCHAR(30) 
SELECT @nombreEtiqueta = Nombre_eti FROM inserted 
IF(@nombreEtiqueta LIKE '[1234567890]%' OR @nombreEtiqueta LIKE '%[1234567890]%' OR @nombreEtiqueta LIKE '%[1234567890]')
    BEGIN        
        PRINT 'El nombre de la ciudad no debe contener números.'
        ROLLBACK TRAN
    END
    
-- ===========================================================================================
--  Descripción: Aceptar solicitud.
-- ===========================================================================================
GO


-- ===========================================================================================
--  Descripción: Borrar logro al borrar etiqueta.
-- ===========================================================================================
GO
CREATE TRIGGER triBorrarLogro ON ETIQUETA
FOR DELETE AS 
DECLARE @nombreEtiqueta VARCHAR(20)
SELECT @nombreEtiqueta = Nombre_eti FROM deleted
DELETE FROM LOGRO WHERE Descripcion LIKE @nombreEtiqueta
BEGIN
    BEGIN TRY
        DELETE FROM LOGRO WHERE Descripcion LIKE '%'+@nombreEtiqueta+'%'
    --ROLLBACK TRAN
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE() as ErrorMesage
    END CATCH
END


-- ===========================================================================================
--  Descripción: Validar ciudades para que no contengan números.
-- ===========================================================================================
GO
CREATE TRIGGER triValidarCiudad ON Ciudad 
FOR INSERT AS DECLARE @nombreCiudad VARCHAR(30) 
SELECT @nombreCiudad = Ciudad FROM inserted 
IF(@nombreCiudad LIKE '[1234567890]%' OR @nombreCiudad LIKE '%[1234567890]%' OR @nombreCiudad LIKE '%[1234567890]')
    BEGIN        
        PRINT 'El nombre de la ciudad no debe contener números.'
        ROLLBACK TRAN
    END



-- ===========================================================================================
--  Descripción: Ganarse logros.
-- ===========================================================================================
GO
    --5.1 Logro de Fotogenico
CREATE TRIGGER triLogroFotogenico ON VISITA FOR INSERT
AS
    DECLARE @Nickname NVARCHAR(35)
    DECLARE @ID_Etiqueta INT
    DECLARE @ID_Categoria int

    SELECT @Nickname=Nickname FROM inserted

    --Ganarse logro Fotogenico; Check-In en 3 lugares distintos con fotocabina (photoboot)
    IF(select ID_Etiqueta from inserted i
        inner join Lugar L on i.ID_Lugar=L.ID_Lugar)=@ID_Etiqueta
    IF NOT EXISTS (SELECT 1 FROM LOGRO_USUARIO WHERE Nickname=@Nickname and ID_Logro=1)
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
    SET @ID_Etiqueta=1030

    SELECT @Nickname=Nickname FROM inserted

 --Ganarse logro Navegante; Check-In en 3 lugares distintos con etiqueta "Navegante"
    IF(select ID_Etiqueta from inserted i
        inner join Lugar L on i.ID_Lugar=L.ID_Lugar)=@ID_Etiqueta
    IF NOT EXISTS (SELECT 1 FROM LOGRO_USUARIO WHERE Nickname=@Nickname and ID_Logro=8)
    IF(SELECT COUNT(*) FROM VISITA V 
       INNER JOIN Lugar L ON (L.Id_Lugar = V.Id_Lugar) 
       WHERE L.ID_Etiqueta = @ID_Etiqueta AND NICKNAME = @NickNAme)>=(SELECT Cantidad_Visitas FROM LOGRO WHERE Nombre='Navegante')
       INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 8, GETDATE())


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
    IF(select ID_Categoria from inserted i
        inner join Lugar L on i.ID_Lugar=L.ID_Lugar)=@ID_Categoria
    IF NOT EXISTS (SELECT 1 FROM LOGRO_USUARIO WHERE Nickname=@Nickname and ID_Logro=3)
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
    IF(select ID_Categoria from inserted i
        inner join Lugar L on i.ID_Lugar=L.ID_Lugar)=@ID_Categoria
    IF NOT EXISTS (SELECT 1 FROM LOGRO_USUARIO WHERE Nickname=@Nickname and ID_Logro=4)
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
        IF(select ID_Categoria from inserted i
        inner join Lugar L on i.ID_Lugar=L.ID_Lugar)=@ID_Categoria
    IF NOT EXISTS (SELECT 1 FROM LOGRO_USUARIO WHERE Nickname=@Nickname and ID_Logro=5)
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
        IF(select ID_Categoria from inserted i
        inner join Lugar L on i.ID_Lugar=L.ID_Lugar)=@ID_Categoria
    IF NOT EXISTS (SELECT 1 FROM LOGRO_USUARIO WHERE Nickname=@Nickname and ID_Logro=6)
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
        IF(select ID_Categoria from inserted i
        inner join Lugar L on i.ID_Lugar=L.ID_Lugar)=@ID_Categoria
    IF NOT EXISTS (SELECT 1 FROM LOGRO_USUARIO WHERE Nickname=@Nickname and ID_Logro=7)
    IF(SELECT COUNT(*) FROM VISITA V 
       INNER JOIN Lugar L ON (L.Id_Lugar = V.Id_Lugar) 
       WHERE L.ID_Categoria = @ID_Categoria AND NICKNAME = @NickNAme)>=(SELECT Cantidad_Visitas FROM LOGRO WHERE Nombre='Trabajador')
       INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 7, GETDATE())
GO
