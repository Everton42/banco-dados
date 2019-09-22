create database concessionaria
go

use concessionaria
go

create table veiculo(
    chassi char(17) primary key,
    marca varchar(10),
    modelo varchar(20),
    ano_fabricacao int,
    ano_modelo int,
    combustivel char(1)
)
go

alter table veiculo
add valor money,
    motor varchar(20)
go

alter table veiculo
drop column motor
go

create index marca_modelo_asc
on veiculo(marca asc, modelo asc)
go

create index consulta_marca_modelo
on veiculo(ano_fabricacao desc)
go

drop index marca_modelo_asc
on veiculo
go

drop table veiculo
go

use master
go

drop database concessionaria
go