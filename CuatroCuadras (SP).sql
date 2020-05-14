CREATE PROC actualizaDatosUsuario
    @Nick NVARCHAR(35),
    @NickNvo NVARCHAR(35),
    @Nom VARCHAR(40),
    @Ap VARCHAR(50),
    @Sex CHAR(1),
    @Fecha_Nac DATE,
    @Email VARCHAR(40),
    @Cont VARCHAR(20),
    @ID_Cd INT

AS
    BEGIN TRY
        BEGIN TRAN
UPDATE USUARIO SET
Nickname=@NickNvo,
Nombre=@Nom,
Apellidos=@Ap,
Sexo=@Sex,
Fecha_Nacimiento=@Fecha_Nac,
Email=@Email,
Contrasena=@Cont,
ID_Ciudad=@ID_Cd
WHERE Nickname= @Nick
        COMMIT TRAN
    END TRY
    
    BEGIN CATCH
        IF @@TRANCOUNT>0
        ROLLBACK TRANSACTION
    END CATCH

