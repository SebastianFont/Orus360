USE [master]
GO
/****** Object:  Database [ORUS369]    Script Date: 08/11/2020 01:25:06 a.m. ******/
CREATE DATABASE [ORUS369]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ORUS369', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ORUS369.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ORUS369_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ORUS369_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ORUS369] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ORUS369].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ORUS369] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ORUS369] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ORUS369] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ORUS369] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ORUS369] SET ARITHABORT OFF 
GO
ALTER DATABASE [ORUS369] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ORUS369] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ORUS369] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ORUS369] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ORUS369] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ORUS369] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ORUS369] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ORUS369] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ORUS369] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ORUS369] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ORUS369] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ORUS369] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ORUS369] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ORUS369] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ORUS369] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ORUS369] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ORUS369] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ORUS369] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ORUS369] SET  MULTI_USER 
GO
ALTER DATABASE [ORUS369] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ORUS369] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ORUS369] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ORUS369] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ORUS369] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ORUS369] SET QUERY_STORE = OFF
GO
USE [ORUS369]
GO
/****** Object:  User [orus]    Script Date: 08/11/2020 01:25:06 a.m. ******/
CREATE USER [orus] FOR LOGIN [orus] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [orus]
GO
/****** Object:  Table [dbo].[ASISTENCIAS]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASISTENCIAS](
	[Id_asistencia] [int] IDENTITY(1,1) NOT NULL,
	[Id_personal] [int] NULL,
	[Fecha_entrada] [datetime] NULL,
	[Fecha_salida] [datetime] NULL,
	[Estado] [varchar](50) NULL,
	[Horas] [numeric](18, 2) NULL,
	[Observacion] [varchar](max) NULL,
 CONSTRAINT [PK_ASISTENCIAS] PRIMARY KEY CLUSTERED 
(
	[Id_asistencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[Id_cargo] [int] IDENTITY(1,1) NOT NULL,
	[Cargo] [varchar](max) NULL,
	[SueldoPorHora] [numeric](18, 2) NULL,
 CONSTRAINT [PK_Cargo] PRIMARY KEY CLUSTERED 
(
	[Id_cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CopiasBd]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CopiasBd](
	[IdCopias] [int] IDENTITY(1,1) NOT NULL,
	[Ruta] [varchar](max) NULL,
 CONSTRAINT [PK_CopiasBd] PRIMARY KEY CLUSTERED 
(
	[IdCopias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modulos]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modulos](
	[IdModulo] [int] IDENTITY(1,1) NOT NULL,
	[Modulo] [varchar](max) NULL,
 CONSTRAINT [PK_Modulos] PRIMARY KEY CLUSTERED 
(
	[IdModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[IdPermiso] [int] IDENTITY(1,1) NOT NULL,
	[IdModulo] [int] NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED 
(
	[IdPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal](
	[Id_personal] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](max) NULL,
	[Identificacion] [varchar](max) NULL,
	[Pais] [varchar](max) NULL,
	[Id_cargo] [int] NULL,
	[SueldoPorHora] [numeric](18, 2) NULL,
	[Estado] [varchar](max) NULL,
	[codigo] [varchar](max) NULL,
 CONSTRAINT [PK_Personal] PRIMARY KEY CLUSTERED 
(
	[Id_personal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombresApellidos] [varchar](50) NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Icono] [image] NULL,
	[Estado] [varchar](50) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ASISTENCIAS]  WITH CHECK ADD  CONSTRAINT [FK_ASISTENCIAS_Personal] FOREIGN KEY([Id_personal])
REFERENCES [dbo].[Personal] ([Id_personal])
GO
ALTER TABLE [dbo].[ASISTENCIAS] CHECK CONSTRAINT [FK_ASISTENCIAS_Personal]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Modulos] FOREIGN KEY([IdModulo])
REFERENCES [dbo].[Modulos] ([IdModulo])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Modulos]
GO
ALTER TABLE [dbo].[Permisos]  WITH CHECK ADD  CONSTRAINT [FK_Permisos_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Permisos] CHECK CONSTRAINT [FK_Permisos_Usuarios]
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD  CONSTRAINT [FK_Personal_Cargo] FOREIGN KEY([Id_cargo])
REFERENCES [dbo].[Cargo] ([Id_cargo])
GO
ALTER TABLE [dbo].[Personal] CHECK CONSTRAINT [FK_Personal_Cargo]
GO
/****** Object:  StoredProcedure [dbo].[buscar_usuarios]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[buscar_usuarios]
@buscador varchar(50)
as
select * from Usuarios 
where Login+NombresApellidos Like '%' + @buscador +'%'

GO
/****** Object:  StoredProcedure [dbo].[buscarAsistenciasId]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[buscarAsistenciasId]
@Idpersonal int
as
select * from ASISTENCIAS
where Id_personal=@Idpersonal and ASISTENCIAS.Estado='ENTRADA'

GO
/****** Object:  StoredProcedure [dbo].[buscarCargos]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[buscarCargos]
@buscador varchar(50)
as
select Id_cargo,Cargo,SueldoPorHora as Sueldo  from Cargo
where Cargo lIKE '%' + @buscador +'%'

GO
/****** Object:  StoredProcedure [dbo].[BuscarPersonal]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[BuscarPersonal]
@Desde int,
@Hasta int,
@Buscador varchar(50)
as
Set Nocount On;
Select 
Id_personal,Nombres,Identificacion,SueldoPorHora,Cargo,Id_cargo,Estado,codigo,Pais
from
(Select Id_personal ,Nombres,Identificacion,Personal.SueldoPorHora,Cargo.Cargo,Personal.Id_cargo,Estado,codigo,Pais,
Row_Number() Over(Order by Id_personal) 'Numero_de_fila'
from Personal
inner join Cargo on Cargo.Id_cargo=Personal.Id_cargo ) as Paginado
Where (Paginado.Numero_de_fila >=@Desde) and (Paginado.Numero_de_fila<=@Hasta)
and (Nombres + Identificacion Like '%' + @Buscador + '%')

GO
/****** Object:  StoredProcedure [dbo].[BuscarPersonalIdentidad]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[BuscarPersonalIdentidad]
@Buscador varchar(50)
as
select * from Personal 
where Identificacion=@Buscador

GO
/****** Object:  StoredProcedure [dbo].[ConfirmarSalida]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ConfirmarSalida]
@Id_personal as int,
@Fecha_salida DATETIME,
@Horas NUMERIC(18,2)
as
Update ASISTENCIAS set
Fecha_salida =@Fecha_salida ,
Horas =@Horas ,
Estado='SALIDA'
where Id_personal   =@Id_personal and Estado='ENTRADA'

GO
/****** Object:  StoredProcedure [dbo].[editar_Cargo]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[editar_Cargo]
@id int,
@Cargo varchar(max)
,@Sueldo as numeric(18,2)
as
if EXISTS (SELECT Cargo FROM Cargo  where Cargo = @Cargo and Id_cargo<>@id  )
RAISERROR ('YA EXISTE UN CARGO CON ESTE NOMBRE, Ingrese de nuevo', 16,1)
else
update  Cargo set Cargo=@Cargo, SueldoPorHora=@Sueldo
where Id_cargo=@id

GO
/****** Object:  StoredProcedure [dbo].[editar_usuarios]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editar_usuarios]
@idusuario int,
@nombres varchar(50),
@Password varchar(50)
,@Icono IMAGE,
@Login as varchar(50)
as
if EXISTS (SELECT Login,idUsuario FROM Usuarios where Login  = @login  AND idUsuario<>@idUsuario  )
RAISERROR ('Usuario en Uso, usa otro nombre de Usuario por favor', 16,1)
else 

update Usuarios set NombresApellidos= @nombres,Password =@Password , Icono=@Icono
 ,Login =@Login 
 where idUsuario = @idusuario 

GO
/****** Object:  StoredProcedure [dbo].[EditarCopiasBd]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EditarCopiasBd]
@Ruta varchar(max)
as
update CopiasBd set Ruta=@Ruta 
GO
/****** Object:  StoredProcedure [dbo].[editarPersonal]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editarPersonal]
@Id_personal int,
@Nombres as varchar(max),
@Identificacion varchar(max),
@Pais varchar(max),
@Id_cargo int,
@Sueldo_por_hora numeric(18,2)
as
if Exists(Select Identificacion from Personal where Identificacion=@Identificacion and Id_personal <>@Id_personal)
Raiserror('Ya existe un registro con esta Identificacion',16,1)
else
Update Personal set
Nombres=@Nombres ,Identificacion=@Identificacion,Pais=@Pais,Id_cargo =@Id_cargo ,SueldoPorHora =@Sueldo_por_hora 
where Id_personal=@Id_personal

GO
/****** Object:  StoredProcedure [dbo].[eliminar_Permisos]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[eliminar_Permisos]
@IdUsuario As int

As
DELETE FROM Permisos
WHERE IdUsuario=@IdUsuario

GO
/****** Object:  StoredProcedure [dbo].[eliminar_usuarios]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_usuarios]
@idusuario int,
@login varchar(50)
as
if Exists(Select Login  from Usuarios where @login = 'admin' )
Raiserror('El Usuario *Admin* es Inborrable, si se borraria Eliminarias el Acceso al Sistema de por vida, Accion Denegada',16,1)
else
update Usuarios set Estado ='ELIMINADO'
where idUsuario=@idusuario and Login <> 'admin'

GO
/****** Object:  StoredProcedure [dbo].[eliminarPersonal]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminarPersonal]
@Idpersonal int
as
Update Personal set Estado ='ELIMINADO'
where Id_personal = @Idpersonal 

GO
/****** Object:  StoredProcedure [dbo].[Insertar_ASISTENCIAS]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Insertar_ASISTENCIAS]
   @Id_personal INT,
   @Fecha_entrada DATETIME,
   @Fecha_salida DATETIME,
   @Estado VARCHAR(50),
    @Horas numeric(18,2),
	@Observacion varchar(max)
	as
	insert into ASISTENCIAS
	Values(@Id_personal,
	@Fecha_entrada,
	@Fecha_salida,
	@Estado,
	@Horas,
	@Observacion)

GO
/****** Object:  StoredProcedure [dbo].[insertar_Cargo]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertar_Cargo]
@Cargo varchar(max),
@SueldoPorHora numeric(18,2)
as
if EXISTS (SELECT Cargo FROM Cargo  where Cargo = @Cargo  )
RAISERROR ('YA EXISTE UN CARGO CON ESTE NOMBRE, Ingrese de nuevo', 16,1)
else
insert into Cargo  values (@Cargo, @SueldoPorHora)

GO
/****** Object:  StoredProcedure [dbo].[insertar_Modulos]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[insertar_Modulos]
@Modulo As varchar(MAX)
As
INSERT INTO Modulos
Values (
@Modulo)

GO
/****** Object:  StoredProcedure [dbo].[insertar_Permisos]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[insertar_Permisos]
@IdModulo As int,
@IdUsuario As int
As
INSERT INTO Permisos
Values (
@IdModulo,
@IdUsuario)

GO
/****** Object:  StoredProcedure [dbo].[insertar_usuario]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_usuario]
@nombres varchar(50),
@Login varchar(50),
@Password varchar(50)
,@Icono image,
@Estado varchar(50)
as 
if EXISTS(SELECT Login FROM Usuarios where Login  = @login  )
RAISERROR ('YA EXISTE UN REGISTRO CON ESE USUARIO, POR FAVOR INGRESE DE NUEVO', 16,1)
else
insert into Usuarios 
values (@nombres, @Login, @Password ,@Icono ,@Estado)

GO
/****** Object:  StoredProcedure [dbo].[InsertarCopiasBd]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertarCopiasBd]
as
declare @Ruta varchar(max)
set @Ruta='-'
insert into CopiasBd
values(@Ruta)
GO
/****** Object:  StoredProcedure [dbo].[InsertarPersonal]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertarPersonal]
@Nombres varchar(max),
@Identificacion varchar(max),
@Pais varchar(max),
@Id_cargo int,
@SueldoPorHora numeric(18,2)
as
declare @Estado varchar(max)
declare @codigo varchar(max)
declare @Id_personal int
set @Estado='ACTIVO'
set @codigo='-'
if Exists(select Identificacion from Personal where Identificacion=@Identificacion)
Raiserror('Ya existe un registro con esta Identificacion',16,1)
else
Insert into Personal 
values(@Nombres ,
@Identificacion,
@Pais ,
@Id_cargo ,
@SueldoPorHora ,
@Estado ,
@codigo )
Select @Id_personal=scope_identity()
Update Personal set codigo = @Id_personal where Id_personal=@Id_personal

GO
/****** Object:  StoredProcedure [dbo].[mostrar_asistencias_diarias]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrar_asistencias_diarias]
@desde as date,
@hasta as date,
@semana as int
as
select Personal.Nombres ,Personal.Identificacion ,convert(date, Fecha_salida) as fecha,sum(Horas) as Horas,
@desde as desde , @hasta as hasta, Datename(WEEKDAY,Fecha_salida) as dia,@semana as Semana,Personal.SueldoPorHora ,DATENAME ( DAY , Fecha_salida ) 
from ASISTENCIAS inner join Personal on Personal.Id_personal =ASISTENCIAS.Id_personal 
where Fecha_salida >=@desde and Fecha_salida <=@hasta 
group by Personal.Nombres,Personal.Identificacion, Fecha_salida,Personal.SueldoPorHora ,convert(date, Fecha_salida)
order by convert(date, Fecha_salida) asc
GO
/****** Object:  StoredProcedure [dbo].[mostrar_Permisos]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrar_Permisos]
@idusuario int
as
select Permisos.IdModulo , Modulos.Modulo  from Permisos inner join Modulos on Modulos.IdModulo=Permisos.IdModulo 
where IdUsuario=@idusuario
GO
/****** Object:  StoredProcedure [dbo].[mostrarPersonal]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrarPersonal]
@Desde int,
@Hasta int
as
Set Nocount On;
Select 
Id_personal,Nombres,Identificacion,SueldoPorHora,Cargo,Id_cargo,Estado,codigo,Pais
from
(Select Id_personal ,Nombres,Identificacion,Personal.SueldoPorHora,Cargo.Cargo,Personal.Id_cargo,Estado,codigo,Pais,
Row_Number() Over(Order by Id_personal) 'Numero_de_fila'
from Personal
inner join Cargo on Cargo.Id_cargo=Personal.Id_cargo ) as Paginado
Where (Paginado.Numero_de_fila >=@Desde) and (Paginado.Numero_de_fila<=@Hasta)

GO
/****** Object:  StoredProcedure [dbo].[ObtenerIdUsuario]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ObtenerIdUsuario]
@Login varchar(50)
as
select idUsuario from Usuarios 
where Login=@Login 

GO
/****** Object:  StoredProcedure [dbo].[restaurar_personal]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[restaurar_personal]
@Idpersonal int
as
update Personal set Estado = 'ACTIVO'
where Id_personal=@Idpersonal

GO
/****** Object:  StoredProcedure [dbo].[restaurar_usuario]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[restaurar_usuario]
@idusuario int
as
Update Usuarios set Estado ='ACTIVO'
where idUsuario =@idusuario and Login<>'admin'

GO
/****** Object:  StoredProcedure [dbo].[validar_usuario]    Script Date: 08/11/2020 01:25:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[validar_usuario]
@password varchar(50),
@login varchar(50)
as
select * from Usuarios 
where Password = @password and Login =@login and Estado ='ACTIVO'

GO
USE [master]
GO
ALTER DATABASE [ORUS369] SET  READ_WRITE 
GO
