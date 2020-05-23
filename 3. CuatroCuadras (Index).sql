USE CuatroCuadras

--1--
CREATE CLUSTERED INDEX [IX_Logro_Usuario_Logro]
ON [Logro_Usuario] (ID_Logro)
GO

CREATE NONCLUSTERED INDEX [IX_Logro_Usuario_Nickname]
ON [Logro_Usuario] (Nickname)
GO

--2--
CREATE CLUSTERED INDEX [IX_Interes_Usuario_Interes]
ON [Interes_Usuario] (ID_Interes)
GO

CREATE NONCLUSTERED INDEX [IX_Interes_Usuario_Nickname]
ON [Interes_Usuario] (Nickname)
GO

--3--
CREATE CLUSTERED INDEX [IX_Lugar_Visita_Lugar]
ON [Visita] (ID_Lugar)
GO

CREATE NONCLUSTERED INDEX [IX_Lugar_Visita_Nickname]
ON [Visita] (Nickname)
GO
--4--
CREATE NONCLUSTERED INDEX [IX_Categoria_Lugar_Categoria]
ON [Lugar] (ID_Categoria)
GO

CREATE NONCLUSTERED INDEX [IX_Etiqueta_Lugar_Etiqueta]
ON [Lugar] (ID_Etiqueta)
GO

--5--
CREATE NONCLUSTERED INDEX [IX_Ciudad_Usuario]
ON [Usuario] (ID_Ciudad)
GO

--6--
CREATE NONCLUSTERED INDEX [IX_Nicknames]
ON [AMIGO] (Nickname2)
GO