USE CuatroCuadras
GO
-- TRIGGERS
-- 1. Validar categorías como se hace con ciudades; que no contengan números.
CREATE TRIGGER triValidarEtiqueta ON ETIQUETA 
FOR INSERT AS DECLARE @nombreEtiqueta VARCHAR(30) 
SELECT @nombreEtiqueta = Nombre_eti FROM inserted 
IF(@nombreEtiqueta LIKE '[1234567890]%' OR @nombreEtiqueta LIKE '%[1234567890]%' OR @nombreEtiqueta LIKE '%[1234567890]')
    BEGIN        
        PRINT 'El nombre de la ciudad no debe contener números.'
        ROLLBACK TRAN
    END
GO
-- 2. Aceptar solicitud.
-- 3. Borrar logro al borrar etiqueta.
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
GO

-- 4. Validar ciudades para que no contengan números.
CREATE TRIGGER triValidarCiudad ON Ciudad 
FOR INSERT AS DECLARE @nombreCiudad VARCHAR(30) 
SELECT @nombreCiudad = Ciudad FROM inserted 
IF(@nombreCiudad LIKE '[1234567890]%' OR @nombreCiudad LIKE '%[1234567890]%' OR @nombreCiudad LIKE '%[1234567890]')
    BEGIN        
        PRINT 'El nombre de la ciudad no debe contener números.'
        ROLLBACK TRAN
    END
GO

-- 5. Ganarse logros.
CREATE TRIGGER triLogroGanado ON Visita FOR INSERT
AS  
    DECLARE @ID_Lugar INT
    DECLARE @Nickname NVARCHAR(35)
    DECLARE @ID_Etiqueta INT
    DECLARE @ID_Categoria int
    DECLARE @ID_Logro INT
    SELECT @ID_Lugar=L.ID_Lugar, @Nickname=Nickname, @ID_Etiqueta=L.ID_Etiqueta, @ID_Categoria=L.ID_Categoria FROM inserted i
    INNER JOIN Lugar L ON i.ID_Lugar=L.ID_Lugar

    --Ganarse logro Fotogenico; Check-In en 3 lugares distintos con fotocabina (photoboot)
    IF NOT EXISTS (SELECT 1 FROM LOGRO_USUARIO WHERE ((Nickname=@Nickname and ID_Logro=1) and @ID_Etiqueta=2))
    IF(SELECT COUNT(*) FROM VISITA V 
       INNER JOIN Lugar L ON (L.Id_Lugar = V.Id_Lugar) 
       WHERE L.ID_Etiqueta = @ID_Etiqueta AND NICKNAME = @NickNAme)>=(SELECT Cantidad_Visitas FROM LOGRO WHERE Nombre='Fotogenico')
       INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 1, GETDATE())  

    --Ganarse logro Navegante; Check-In en 3 lugares distintos con etiqueta "canoa"
    ELSE IF NOT EXISTS(SELECT 1 FROM LOGRO_USUARIO, WHERE ((Nickname=@Nickname and ID_Logro=8) and @ID_Etiqueta=1030))
    IF(SELECT COUNT(*) FROM VISITA V 
       INNER JOIN Lugar L ON (L.Id_Lugar = V.Id_Lugar) 
       WHERE L.ID_Etiqueta = @ID_Etiqueta AND NICKNAME = @Nickname)>=(SELECT Cantidad_Visitas FROM LOGRO WHERE Nombre='Canoa')
        INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 8, GETDATE())

    --Ganarse logro La Voz; 3 Check-In en un mes desde lugares con la categoria "Karaoke Bar"
    ELSE IF NOT EXISTS(SELECT 1 FROM LOGRO_USUARIO WHERE ((Nickname=@Nickname and ID_Logro=3) and @ID_Categoria=1))
    IF(SELECT COUNT(*) FROM VISITA V 
       INNER JOIN Lugar L ON (L.Id_Lugar = V.Id_Lugar) 
       WHERE L.ID_Categoria = @ID_Categoria AND NICKNAME = @Nickname)>=(SELECT Cantidad_Visitas FROM LOGRO WHERE Nombre='Karaoke Bar')
        INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 3, GETDATE())

    --Ganarse logro Melómano; Hacer Check-In en 5 lugares de la categoría "Tienda de Musica"
   ELSE IF NOT EXISTS(SELECT 1 FROM LOGRO_USUARIO WHERE ((Nickname=@Nickname and ID_Logro=4) and @ID_Categoria=2))
    IF(SELECT COUNT(*) FROM VISITA V 
       INNER JOIN Lugar L ON (L.Id_Lugar = V.Id_Lugar) 
       WHERE L.ID_Categoria = @ID_Categoria AND NICKNAME = @Nickname)>=(SELECT Cantidad_Visitas FROM LOGRO WHERE Nombre='Tienda de Musica')
        INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 4, GETDATE())

    --Ganarse logro Cinéfilo; Hacer 15 Check-In en cines
    ELSE IF NOT EXISTS(SELECT 1 FROM LOGRO_USUARIO WHERE ((Nickname=@Nickname and ID_Logro=5) and @ID_Categoria=3))
    IF(SELECT COUNT(*) FROM VISITA V 
       INNER JOIN Lugar L ON (L.Id_Lugar = V.Id_Lugar) 
       WHERE L.ID_Categoria = @ID_Categoria AND NICKNAME = @Nickname)>=(SELECT Cantidad_Visitas FROM LOGRO WHERE Nombre='Cines')
        INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 5, GETDATE())

    --Ganarse logro Catador de Comida; Hacer Check-In en 10 diferentes restaurantes
    ELSE IF NOT EXISTS(SELECT 1 FROM LOGRO_USUARIO WHERE ((Nickname=@Nickname and ID_Logro=6) and @ID_Categoria=4))
    IF(SELECT COUNT(*) FROM VISITA V 
       INNER JOIN Lugar L ON (L.Id_Lugar = V.Id_Lugar) 
       WHERE L.ID_Categoria = @ID_Categoria AND NICKNAME = @Nickname)>=(SELECT Cantidad_Visitas FROM LOGRO WHERE Nombre='Restaurantes')
        INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 6, GETDATE())
            
    --Ganarse logro Trabajador; Hacer 200 Check-In en lugares de la categoría "Oficinas
    ELSE IF NOT EXISTS(SELECT 1 FROM LOGRO_USUARIO WHERE((Nickname=@Nickname and ID_Logro=7) and @ID_Categoria=5))
    IF(SELECT COUNT(*) FROM VISITA V 
       INNER JOIN Lugar L ON (L.Id_Lugar = V.Id_Lugar) 
       WHERE L.ID_Categoria = @ID_Categoria AND NICKNAME = @Nickname)>=(SELECT Cantidad_Visitas FROM LOGRO WHERE Nombre='Oficinas')
        INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 7, GETDATE())
                
        drop TRIGGER triLogroGanado