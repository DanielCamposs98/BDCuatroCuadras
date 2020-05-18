USE CuatroCuadras

--1--
CREATE CLUSTERED INDEX [IX_Logro_Usuario_Logro]
ON [Logro_Usuario] (ID_Logro)
CREATE NONCLUSTERED INDEX [IX_Logro_Usuario_Nickname]
ON [Logro_Usuario] (Nickname)
--2--
CREATE CLUSTERED INDEX [IX_Interes_Usuario_Interes]
ON [Interes_Usuario] (ID_Interes)
CREATE NONCLUSTERED INDEX [IX_Interes_Usuario_Nickname]
ON [Interes_Usuario] (Nickname)
--3--
CREATE CLUSTERED INDEX [IX_Lugar_Visita_Lugar]
ON [Visita] (ID_Lugar)
CREATE NONCLUSTERED INDEX [IX_Lugar_Visita_Nickname]
ON [Visita] (Nickname)
--4--
CREATE NONCLUSTERED INDEX [IX_Categoria_Lugar_Categoria]
ON [Lugar] (ID_Categoria)
CREATE NONCLUSTERED INDEX [IX_Etiqueta_Lugar_Etiqueta]
ON [Lugar] (ID_Etiqueta)
--5--
CREATE NONCLUSTERED INDEX [IX_Ciudad_Usuario]
ON [Usuario] (ID_Ciudad)
--6--
CREATE NONCLUSTERED INDEX [IX_Nicknames]
ON [AMIGO] (Nickname2)