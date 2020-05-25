USE CuatroCuadras
GO
   INSERT INTO ETIQUETA VALUES 
        ('Canoa'),
        ('Photoboot'),
        ('Playa'),
        ('Comida'),
        ('Fitness'),
        ('Música'),
        ('Familia'),
        ('Hogar'),
        ('Vuelos'),
        ('Aire Libre'),
        ('Rock'),
        ('Canto'),
        ('Dinero'),
        ('Electronicos'),
        ('Beisbol'),
        ('Futbol'),
        ('Gobierno'),
        ('Peliculas'),
        ('Guitarra'),
        ('Playeras'),
        ('Influenza'), 
        ('Flat-Top'),
        ('Vestidos'),
        ('Turistas'),
        ('Nuggets'),
        ('Paracetamol'),
        ('Plantas'),
        ('Jardin Botanico');
GO
     INSERT INTO CATEGORIA VALUES    
        ('Karaoke Bar'),
        ('Tienda de Musica'),
        ('Cines'),
        ('Restaurantes'),
        ('Oficinas'),
        ('Farmacias'),
        ('Supermercados'),
        ('Hospitales'),
        ('Parques'),
        ('Aeropuertos'),
        ('Tienda de Ropa'),
        ('Bancos'),
        ('Tienda Departamental'),
        ('Peluquerias'),
        ('Gasolinerias'),
        ('Estadios');

GO
    INSERT INTO Ciudad VALUES 
    ('Culiacán'),
    ('Navolato'),
    ('Mazatlán'),
    ('Los Mochis'),
    ('Guasave'),
    ('Guadalajara'),
    ('Tijuana');
GO
    INSERT INTO LOGRO(Nombre,Descripcion,Cantidad_Visitas,Tipo_Categoria,Tipo_Etiqueta,Disponibilidad) VALUES   
    ('Fotogenico','Check-In en 3 lugares distintos con fotocabina (photoboot)',3,NULL,2,1)
    INSERT INTO LOGRO(Nombre,Descripcion,Cantidad_Visitas,Tipo_Categoria,Tipo_Etiqueta,Disponibilidad) VALUES
    ('Navegante','Check-In en 3 lugares distinton con etiqueta "canoa"',3,NULL,1,1)
    INSERT INTO LOGRO(Nombre,Descripcion,Cantidad_Visitas,Tipo_Categoria,Tipo_Etiqueta,Disponibilidad) VALUES
    ('La Voz','3 Check-In en un mes desde lugares con la categoria "Karaoke Bar"',3,1,NULL,1)
    INSERT INTO LOGRO(Nombre,Descripcion,Cantidad_Visitas,Tipo_Categoria,Tipo_Etiqueta,Disponibilidad) VALUES
    ('Melómano','Hacer Check-In en 5 lugares de la categoría "Tienda de Musica',5,2,NULL,1)
    INSERT INTO LOGRO(Nombre,Descripcion,Cantidad_Visitas,Tipo_Categoria,Tipo_Etiqueta,Disponibilidad) VALUES
    ('Cinéfilo','Hacer 15 Check-In en cines',3,NULL,15,1)
    INSERT INTO LOGRO(Nombre,Descripcion,Cantidad_Visitas,Tipo_Categoria,Tipo_Etiqueta,Disponibilidad) VALUES
    ('Catador de Comida','Hacer Check-In en 10 diferentes restaurantes',15,4,NULL,1)
    INSERT INTO LOGRO(Nombre, Descripcion,Cantidad_Visitas,Tipo_Categoria,Tipo_Etiqueta,Disponibilidad) VALUES
    ('Trabajador','Hacer 200 Check-In en lugares de la categoría "Oficinas',200,5,NULL,1)
    INSERT INTO LOGRO(Nombre,Descripcion,Cantidad_Visitas,Tipo_Categoria,Tipo_Etiqueta,Disponibilidad) VALUES
    ('Primeros Pasos','Te has registrado en Cuatro Cuadras. ¡Comienza a explorar con nosotros!',0,NULL,NULL,1)
GO
INSERT INTO LUGAR VALUES
    ('Estadio Tomateros','24.7777','-107.389457','Estadio de Beisbol',1,16,15),
    ('Sams Club 3 Rios','24.1373','-107.412717','Tienda de Mayoreo',1,7,4),
    ('Fühler','24.802018','-107.397176','Centro de Ocio',1,1,6),
    ('Taipak MonteCarlo','24.817548','-107.423411','Restaurante de Comida Asiatica',1,4,4),
    ('Estadio Teodoro Mariscal','23.236318','-106.430799','Estadio de Beisbol',3,16,15),
    ('Soriana Hiper','23.237284','-106.419963','Supermercado',3,7,13),
    ('KFC Insurgentes','23.234386','-106.419963','Restaurante de Pollo Frito',3,4,25),
    ('Panamá Insurgentes','23.216738','-106.416530','Restaurante Regional',3,4,4),
    ('Pemex','23.207074','-106.411401','Gasolineria',3,15,23),
    ('Farmacia Guadalajara','25.821725','-109.001043','Super-Farmacia',4,6,26),
    ('Parque Sinaloa','25.788361','-109.002049','Parque Familiar',4,9,28),
    ('Ley Primavera','24.763375','-107.699523','Supermercado Regional',2,7,8),
    ('USE Navolato','24.7577050','-107.694008','Oficinas de Gobierno',2,5,17),
    ('Cinemex Navolato','25.569533','-108.46567','Sucursal de Cine',2,3,2),
    ('Banbajío','25.571111','-108.464483','Sucursal Bancaria',5,12,13),
    ('MUSIK','20.669706','-103.346863','Tienda de Musica',6,2,19),
    ('Zona de Vestir Medrano','20.670730','-103.341363','Tienda de Ropa',6,11,20),
    ('Aeropuerto Internacional de Tijuana','32.541651','-116.974962','Aeropuerto Internacional',7,10,9),
    ('Hospital Ángeles','32.518155','-117.007258','Hospital Privado',7,8,5),
    ('Sears Plaza Rio','32.527653','-117.021206','Tienda Departamental',7,13,18),
    ('The Barber Shop','32.521646','-117.026613','Barberia Profesional',7,14,22),
    ('Fotocabina', 24.214312, -107.234212, 'Tómate fotos', 2, 2, 1)
GO
    INSERT INTO INTERES VALUES 
    ('Lectura'),
    ('Viajar'),
    ('Escritura'),
    ('Coleccionismo'),
    ('Voluntariado'),
    ('Cocinar'),
    ('Deportes'),
    ('Música'),
    ('Animales'),
    ('Tecnología'),
    ('Medicina'),
    ('Economía'),
    ('Educación'),
    ('Familia'),
    ('Sociedad');
GO
    EXEC USP_InsertUsuarioLogro 'XxXGokuXxX','Juan','Perez Perez','M','1996-03-05','XxXGokuSSJXxX@hotmail.com','ContraseñaDeLaCIA',4
    GO
    EXEC USP_InsertUsuarioLogro 'Diana129','Diana','Aispuro Angulo','F','1992-12-09','DianaAisAng@hotmail.com','DianAisPAnG',2
    GO
    EXEC USP_InsertUsuarioLogro 'CuentaFeik','Jose Luis','Sanchez Rodriguez','M','1988-01-03 ','CuentaFakeParaApps@outlook.com','NoSoyFeik123',3
    GO
    EXEC USP_InsertUsuarioLogro 'Luiz','Luis','Lopez Lopez','M','1998-09-12','LuisLopezAlCuadrado@hotmail.com','LopezAlCuadrado',1
    GO
    EXEC USP_InsertUsuarioLogro 'Emilian99','Emiliano','Paez Lopez','M','1997-01-08','PaezLopEmiliano@outlook.com','LopezPaezEmil9912',2
    GO
    EXEC USP_InsertUsuarioLogro 'JoseCarl','Jose Carlos','Ventura Gararte','M','1965-12-24','JoseCarlos123@hotmail.com','JoseCarlGararVen',1
    GO
    EXEC USP_InsertUsuarioLogro 'Mari','Maria Elena','Perez Sarrion','F','1982-12-14','MariElen@hotmail.com','12Mari34Elen56aa78',7
    GO
    EXEC USP_InsertUsuarioLogro 'AnaALV','Ana Maria','Alvarez Castelo','F','1992-05-23','MarianaALV@hotmail.com','MariAnaLV1582',6
    GO
    EXEC USP_InsertUsuarioLogro 'SandCast','Sandra','Flores Castilla','F','1974-10-25','SandraCast@hotmail.com','Sandra1235',4
    GO
    EXEC USP_InsertUsuarioLogro 'Coronavirus','Angel','Gomez Bravo','M','1978-07-05','CoronaPandamiaVirus@hotmail.com','AntiVacunas2020',6
    GO
    EXEC USP_InsertUsuarioLogro 'Angel224','Angel','Torres Gomez','M','1994-09-23','AngelTG24@gmail.com','OsiContraseña',5
    GO
    EXEC USP_InsertUsuarioLogro 'MenitaXD98','Ximena','Castro Yepez','F','1999-12-22','menaCY@hotmail.com','menittha98',5
    GO
    EXEC USP_InsertUsuarioLogro 'Panchogo94','Francisco','Moreno Lopez','M','1997-05-05','PanchoGpi45@live.com.mx','panchito99',1
    GO
    EXEC USP_InsertUsuarioLogro 'MigueMF', 'Miguel', 'Mendoza Fernandez', 'M', '1996-11-07', 'miguemf@gmail.com', 'migmenfer97', 3
    GO
    EXEC USP_InsertUsuarioLogro 'RamLop99', 'Ramon', 'Lopez Perez', 'M', '1971-08-09', 'ramonlopez99@yahoo.com.mx', 'rammaster99', 7
    GO
    EXEC USP_InsertUsuarioLogro 'GabiLuna', 'Gabriela', 'Luna Sanchez', 'F', '1998-02-21', 'gabilusanxyz15@outlook.com', 'gabimoon15', 1
    GO
    EXEC USP_InsertUsuarioLogro 'AlizV5', 'Alicia', 'Valenzuela Navarro', 'F', '1977-12-16', 'alizzv12@outlook.com','navaliz91', 6
    GO
GO
    INSERT INTO AMIGO VALUES
    ('Diana129','Mari','A')
    GO
    INSERT INTO AMIGO VALUES
    ('Coronavirus','Angel224','A')
    GO
    INSERT INTO AMIGO VALUES
    ('AnaALV','Mari','A')
    GO
    INSERT INTO AMIGO VALUES
    ('SandCast','CuentaFeik','A')
    GO
    INSERT INTO AMIGO VALUES
    ('JoseCarl','XxXGokuXxX','A')
    GO
    INSERT INTO AMIGO VALUES
    ('Luiz','Mari','A')
    GO
    INSERT INTO AMIGO VALUES
    ('Luiz','Coronavirus','A')
    GO
    INSERT INTO AMIGO VALUES
    ('Panchogo94','MenitaXD98','A')
    GO
    INSERT INTO AMIGO VALUES
    ('Emilian99','AnaALV','A')
    GO
    INSERT INTO AMIGO VALUES
    ('Angel224','Diana129','A')
    GO
    INSERT INTO AMIGO VALUES
    ('JoseCarl','MenitaXD98','A')
    GO
    INSERT INTO AMIGO VALUES
    ('SandCast','Panchogo94','A')
    GO
    INSERT INTO AMIGO VALUES
    ('Panchogo94','CuentaFeik','A')
    GO
    INSERT INTO AMIGO VALUES
	('MigueMF', 'AlizV5','A')
    GO
    INSERT INTO AMIGO VALUES
	('GabiLuna', 'RamLop99','A')
    GO
    INSERT INTO AMIGO VALUES
	('RamLop99', 'AnaALV','A')
    
    INSERT INTO AMIGO VALUES
    ('AnaALV','GabiLuna','A');
    
GO
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (9,'JoseCarl','Excelente',10,'Mar 20 2018 3:12 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (2,'XxXGokuXxX','Bueno',6,'Dec 28 2019 4:28 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (17,'Luiz','Regular',7,'Jan 20 2020 7:30 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (9,'AnaALV','Muy Bueno',10,'Apr 11 2019 8:40 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (13,'MenitaXD98','Malo',5,'Jan 31 2019 11:50 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (18,'Angel224','Muy Malo',3,'Jun 01 2018 11:30 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (18,'SandCast','Bueno',8,'Mar 13 2019 3:58 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (4,'CuentaFeik','Regular',7,'Jul 03 2018 11:18 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (16,'Angel224','Bueno',8,'Apr 10 2019 4:24 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (10,'Mari','Excelente',10,'Sep 08 2019 08:30 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (1,'Mari','Malo',4,'Oct 08 2019 3:11 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (19,'CuentaFeik','Bueno',8,'Nov 15 2018 9:08 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (14,'Luiz','Regular',7,'Apr 16 2019 2:03 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (10,'Diana129','Regular',6,'Oct 18 2018 9:13 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (5,'AnaALV','Excelente',10,'Apr 10 2018 08:29 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (16,'SandCast','Bueno',8,'May 24 2019 10:00 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (11,'Panchogo94','Muy Bueno',9,'Nov 21 2018 7:02 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (17,'SandCast','Excelente',10,'Mar 03 2018 8:17 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (21,'Panchogo94','Bueno',9,'Mar 03 2019 5:20 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (12,'Luiz','Muy Malo',2,'Oct 30 2019 3:51 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (9,'Coronavirus','Regular',7,'Feb 28 2020 4:48 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (2,'Coronavirus','Bueno',8,'Mar 28 2018 12:30 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (11,'SandCast','Malo',4,'Jan 15 2019 01:23 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (20,'Coronavirus','Regular',6,'Apr 01 2019 03:40 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (13,'Luiz','Malo',4,'Feb 13 2020 01:34 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (19,'Diana129','Excelente',10,'Mar 08 2020 12:40 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (14,'Mari','Bueno',8,'Feb 15 2019 11:43 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (5,'Diana129','Regular',6,'Mar 20 2019 05:34 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (8,'SandCast','Bueno',8,'Jul 18 2019 11:20 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (19,'Coronavirus','Muy Malo',2,'Apr 20 2018 03:20 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (20,'AnaALV','Muy Bueno',9,'Mar 10 2020 05:28 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (13,'Emilian99','regular',10,'Oct 29 2019 03:45 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (9,'Diana129','Bueno',8,'Nov 01 2018 03:59 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (8,'SandCast','Malo',4,'Feb 20 2020 12:30 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (12,'Mari','Excelente',10,'Jul 15 2018 04:20 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (11,'Coronavirus','Regular',6,'Mar 01 2018 07:23 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (1,'Coronavirus','Excelente',10,'Apr 24 2018 04:56 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (4,'Luiz','Muy Bueno',9,'Feb 15 2018 03:29 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (9,'CuentaFeik','Bueno',8,'Mar 10 08:29 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (15,'Diana129','Regular',6,'Sep 20 2019 04:25 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (3,'AnaALV','Bueno',8,'Nov 20 2019 11:28 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (4,'SandCast','Bueno',8,'Jul 23 2018 10:28 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (16,'SandCast','Muy Malo',1,'Jan 25 2020 09:29 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (18,'Coronavirus','Excelente',10,'Aug 28 2019 06:34 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (20,'Emilian99','Malo',3,'Oct 11 2019 04:26 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (21,'XxXGokuXxX','Excelente',10,'Sep 30 2019 05:17 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (12,'Emilian99','Muy Bueno',9,'May 23 2018 01:45 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (5,'CuentaFeik','Excelente',10,'May 12 2019 12:20 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (6,'Diana129','Regular',6,'Sep 20 2019 06:45 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
    (2,'XxXGokuXxX','Muy Malo',1,'Mar 12 2020 01:26 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
	(3, 'GabiLuna', NULL, 5, 'Feb 20 2018 03:25 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
	(10, 'AlizV5', 'Excelente', 10, 'Sep 13 2019 11:55 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
	(2, 'AlizV5', NULL, 8, 'May 10 2019 05:30 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
	(11, 'MigueMF', 'Malo', 4, 'Feb 22 2020 04:55 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
	(13, 'Coronavirus', NULL, 7, 'Oct 14 2019 08:44 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES  
	(12, 'SandCast', 'Muy bueno', 8, 'Nov 23 2019 05:23 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
	(4, 'AnaALV', 'Regular', 7, 'Nov 23 2019 04:54 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
	(7, 'Diana129', NULL, 2, 'Sep 23 2018 08:38 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
	(10, 'MigueMF', NULL, 8, 'Sep 13 2019 11:55 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
	(10, 'Emilian99', 'Bueno', 8, 'Jan 23 2020 10:20 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
	(5, 'Emilian99', NULL, 1, 'Jan 23 2019 12:43 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
	(2, 'Mari', 'Regular', 5, 'Dec 23 2019 05:33 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
	(11, 'MigueMF', 'Bueno', 8, 'Mar 01 2018 07:23 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
	(9, 'Luiz', 'Bueno', 8, 'Dec 05 2019 01:50 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
	(16, 'Diana129', NULL, 5, 'Sep 25 2018 03:49 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
	(20, 'CuentaFeik', NULL, 9, 'Mar 03 2020 12:04 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
	(5, 'Mari', 'Muy bueno', 9, 'Apr 10 2018 08:29 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
	(4, 'MigueMF', NULL, 6, 'Apr 23 2019 07:55 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
	(6, 'GabiLuna', 'Bueno', 7, 'May 23 2019 05:44 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
	(16, 'XxXGokuXxX', NULL, 10, 'Nov 14 2019 06:04 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (22, 'RamLop99', 'Buen lugar para visitar', 8, 'May 20 2020 05:44 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (10, 'Mari', 'Atienden muy lento', 4, 'Nov 10 2019 04:44 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (22, 'Luiz', 'Es un lugar agradable', 8, 'Jan 05 07:32 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (4, 'AnaALV', 'Atienden bien, buena comida', 9, 'Feb 4 2020 06:54 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (5, 'AnaALV', 'Bonito estadio', 8, 'Mar 05 2020 09:23 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (6, 'MigueMF', 'Tienen productos buenos y a buen precio', 9, 'Apr 23 2019 11:43 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (7, 'GabiLuna', 'Regular', 6, 'Dec 23 2018 01:33 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (8, 'Emilian99', 'Excelente', 10, 'Jan 10 2019 05:32 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (9, 'AlizV5', NULL, 7, 'Nov 29 2019 10:28 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (10, 'SandCast', 'Tenían lo que necesitaba', 9, 'Oct 14 2019 05:59 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (11, 'Panchogo94', 'Buen lugar para relajarse y estar en familia', 10, 'Mar 03 2020 05:43 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (12, 'Panchogo94', NULL, 6, 'Sep 14 2019 12:22 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (13, 'Diana129', NULL, 7, 'Mar 03 2019 05:55 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (14, 'Diana129', 'Buena atención al cliente', 8, 'Sep 14 2019 12:33 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (15, 'AlizV5', NULL, 5, 'Nov 14 2019 12:32 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (16, 'AlizV5', 'Muy bueno', 9, 'Nov 24 2019 01:32 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (17, 'SandCast', NULL, 8, 'Nov 25 2019 03:33 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (18, 'SandCast', NULL, 9, 'Oct 13 2019 05:44 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (19, 'Diana129', 'Buena atención', 8, 'Sep 24 2019 11:33 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (20, 'GabiLuna', NULL, 7, 'Aug 13 2019 11:55 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (21, 'RamLop99', 'Excelente servicio', 10, 'Feb 22 2020 04:33 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (22, 'RamLop99', NULL, 8, 'Mar 05 2020 06:43 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (1, 'RamLop99', NULL, 9, 'Feb 03 2020 04:44 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (2, 'RamLop99', 'Buen lugar jeje', 9, 'Dec 18 2019 10:42 AM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (3, 'AlizV5', NULL, 8, 'May 14 2019 12:28 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (4, 'AlizV5', 'Sin palabras', 3, 'May 24 2019 04:38 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (1, 'Panchogo94', 'El mejor estadio!', 10, 'Oct 17 2019 08:54 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (6, 'Panchogo94', NULL, 8, 'Oct 17 2019 03:43 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (7, 'RamLop99', NULL, 7, 'Oct 17 2019 01:29 PM')
    INSERT INTO VISITA (ID_Lugar, Nickname, Comentario, Valoracion, Fecha) VALUES
    (8, 'SandCast', NULL, 8, 'Jan 18 2019 05:44 PM')
GO
    INSERT INTO LOGRO_USUARIO VALUES
    ('Coronavirus',5,'Jan 31 2020 08:15 PM'),
    ('Luiz',4,'Dec 28 2019 01:19 PM'),
    ('SandCast',6,'Oct 11 2019 03:40 PM'),
    ('AnaALV',1,'Mar 10 2020 08:19 AM'),
    ('Luiz',5,'Nov 05 2019 11:52 AM'),
    ('XxXGokuXxX',2,'Sep 15 2019 08:15 PM');
GO
    INSERT INTO INTERES_USUARIO VALUES
    ('AnaALV',1),
    ('AnaALV',3),
    ('AnaALV',5),
    ('Angel224',8),
    ('Coronavirus',11),
    ('Coronavirus',12),
    ('Panchogo94',15), 
    ('Panchogo94',8),
    ('Luiz',5),
    ('Luiz',6),
    ('MenitaXD98',7),
    ('MenitaXD98',4),
    ('Mari',3),
    ('Mari',10),
    ('SandCast',11),
    ('SandCast',13),
    ('JoseCarl',4),
    ('JoseCarl',2);
GO