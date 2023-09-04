use master
if db_id('empresa') is not null
	drop database empresa
go
create database empresa
go
use empresa
go

create table alunos (
	raAluno smallint identity(100,1) primary key clustered,
	idGestor smallint null foreign key references alunos(RAaluno),
	nome varchar(100) unique not null,
	senha varchar(20) unique not null,
	Periodo char(1) unique not null,
	foto varbinary(max)

constraint ch_periodo check (periodo in('manha','tarde','noite'))
);

insert into alunos(nome,periodo,foto)
select 'thainara','manha',BulkColumn
from openrowset (bulk 'c:\users\prof.junior\pictures\SOs\tux.png', single_blob) AS foto --Exemplo do local da foto
 
 select * from alunos

create table logins (
	idUsuario  int identity(1,1) primary key,
	loginUsuario nvarchar(30),
	senhaUsuario nvarchar(30)
)


DECLARE @novasenha NVARCHAR(256) = 'minhanovasenha' --troque aqui pelo valor da nova senha

UPDATE logins
SET senhaUsuario = (CONVERT(VARBINARY(256),PWDENCRYPT(@novasenha)))
WHERE loginUsuario = 'leandro' --nao esqueça do where


 ALTER TABLE [dbo].[logins] 
WITH CHECK ADD 
CONSTRAINT [ValidarEmail] 
CHECK
(
CHARINDEX(' ',LTRIM(RTRIM([loginUsuario]))) = 0 -- (1)
AND LEFT(LTRIM([loginUsuario]),1) <> '@'  -- (2)
AND RIGHT(RTRIM([loginUsuario]),1) <> '.' -- (3)
AND CHARINDEX('.',[loginUsuario],CHARINDEX('@',[loginUsuario])) - CHARINDEX('@',[loginUsuario]) > 1 -- (4)
AND LEN(LTRIM(RTRIM([loginUsuario]))) - LEN(REPLACE(LTRIM(RTRIM([loginUsuario])),'@','')) = 1 -- (5)
AND CHARINDEX('.',REVERSE(LTRIM(RTRIM([loginUsuario])))) >= 3 -- (6)
AND (CHARINDEX('.@',[loginUsuario]) = 0 AND CHARINDEX('..',[loginUsuario]) = 0) -- (7)
)
GO
