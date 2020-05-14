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
    DECLARE @Fecha DATETIME2

    SELECT @ID_Lugar=ID_Lugar, @Nickname=Nickname, @Fecha=Fecha FROM inserted
    --Ganarse logro Fotogenico; Check-In en 3 lugares distintos con fotocabina (photoboot)
    IF(SELECT COUNT(V.ID_Lugar) FROM VISITA V
        INNER JOIN LUGAR L on V.ID_Lugar=L.ID_Lugar
        INNER JOIN ETIQUETA E on E.ID_Etiqueta=L.ID_Etiqueta
        WHERE E.Nombre_eti='Fotogenico')>=3
        INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 1, GETDATE())
        
    --Ganarse logro Navegante; Check-In en 3 lugares distintos con etiqueta "canoa"
    IF(SELECT COUNT(V.ID_Lugar) FROM VISITA V
        INNER JOIN LUGAR L on V.ID_Lugar=L.ID_Lugar
        INNER JOIN ETIQUETA E on E.ID_Etiqueta=L.ID_Etiqueta
        WHERE E.Nombre_eti='Canoa')>=3
        INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 2, GETDATE())

    --Ganarse logro La Voz; 3 Check-In en un mes desde lugares con la categoria "Karaoke Bar"
    IF(SELECT COUNT(V.ID_Lugar) FROM VISITA V
        INNER JOIN LUGAR L on V.ID_Lugar=L.ID_Lugar
        INNER JOIN Categoria C on C.ID_Categoria=L.ID_Categoria
        WHERE C.Descripcion='Karaoke Bar')>=3
        INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 3, GETDATE())

    --Ganarse logro Melómano; Hacer Check-In en 5 lugares de la categoría "Tienda de Musica"
    IF(SELECT COUNT(V.ID_Lugar) FROM VISITA V
        INNER JOIN LUGAR L on V.ID_Lugar=L.ID_Lugar
        INNER JOIN Categoria C on C.ID_Categoria=L.ID_Categoria
        WHERE C.Descripcion='Tienda de Musica')>=3
        INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 4, GETDATE())

    --Ganarse logro Cinéfilo; Hacer 15 Check-In en cines
    IF(SELECT COUNT(V.ID_Lugar) FROM VISITA V
        INNER JOIN LUGAR L on V.ID_Lugar=L.ID_Lugar
        INNER JOIN Categoria C on C.ID_Categoria=L.ID_Categoria
        WHERE C.Descripcion='Cine')>=15
        INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 5, GETDATE())

    --Ganarse logro Catador de Comida; Hacer Check-In en 10 diferentes restaurantes
    IF(SELECT COUNT(V.ID_Lugar) FROM VISITA V
        INNER JOIN LUGAR L on V.ID_Lugar=L.ID_Lugar
        INNER JOIN Categoria C on C.ID_Categoria=L.ID_Categoria
        WHERE C.Descripcion='Restaurantes')>=10
        INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 6, GETDATE())

    --Ganarse logro Trabajador; Hacer 200 Check-In en lugares de la categoría "Oficinas
    IF(SELECT COUNT(V.ID_Lugar) FROM VISITA V
        INNER JOIN LUGAR L on V.ID_Lugar=L.ID_Lugar
        INNER JOIN Categoria C on C.ID_Categoria=L.ID_Categoria
        WHERE C.Descripcion='Oficinas')>=200
        INSERT INTO LOGRO_USUARIO(Nickname, ID_Logro, Fecha) VALUES (@Nickname, 7, GETDATE())