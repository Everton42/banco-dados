create database universidade
go

use universidade
go

create table aluno(
    id_aluno int identity(1,1) primary key,
    nome varchar(20) not null,
    endereco varchar(50) not null,
    cidade varchar(20) not null,
    estado char(2) not null,
    email varchar(50),
    ativo bit not null
)
go

insert into aluno
(nome, endereco, cidade, estado, email, ativo)
values
('Carlos Magno', 'Av das Graças, 60', 'Jundiaí', 'SP', 'carlos@mail.com', 1),
('Fernando Pery', 'Rua Julieta, 59', 'Jarinú', 'SP', 'fernando@mail.com', 0),
('Reginaldo Souza', 'Rua Romeu, 79', 'Valinhos', 'SP', 'rsouza@mail.com', 1)
go

update aluno
set cidade = 'Várzea Paulista'
where cidade = 'Jarinú'
go

alter table aluno
add profissao varchar(30),
    telefone char(15)
go

update aluno
set profissao = 'DBA'
where cidade = 'Jundiaí'
go

update aluno
set profissao = 'Estagiário'
where cidade = 'Várzea Paulista'
go

select nome, profissao from aluno
order by profissao desc
go

select nome from aluno
where ativo = 0 
order by nome desc
go


delete aluno
where cidade = 'Valinhos'
go

select distinct cidade from aluno
go

delete aluno
where id_aluno = 1
go

alter table aluno
drop column telefone
go

use master
go

drop database universidade
go


