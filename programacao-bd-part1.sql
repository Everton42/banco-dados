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
('Fernando Pery', 'Rua Julieta, 59', 'Jarinu', 'SP', 'fernando@mail.com', 0),
('Reginaldo Souza', 'Rua Romeu, 79', 'Valinhos', 'SP', 'rsouza@mail.com', 1)
go

begin
    declare @my_int int
    set @my_int = 10
    print @my_int
end
go

begin 
    declare @my_string varchar(20)
    set @my_string = 'Isso é um teste'
    print @my_string
end
go

begin
    declare @max_id int, @min_id int
    select @max_id = max(id_aluno), @min_id = min(id_aluno) from aluno
    select @max_id, @min_id
end
go

begin
    declare @id int = 1
    select * from aluno where id_aluno > @id
end
go

begin
    declare @endereco varchar(50), @cidade varchar(20), @estado char(2)
    select @endereco = endereco, @cidade = cidade, @estado = estado from aluno where id_aluno = 1
    print @endereco + ' - ' + @cidade + '/' + @estado
end
go

begin
    declare @count int
    select @count = count(*) from aluno
    if @count > 100
        begin
            print 'Superior a 100 alunos'
        end
    else
        begin
            print 'Inferior a 100 alunos'
        end
end
go

begin
    declare @nm_ativo int, @nm_inativo int
    select @nm_ativo = count(*) from aluno where ativo = 1
    select @nm_inativo = count(*) from aluno where ativo = 0
    if @nm_ativo > @nm_inativo
        begin
            print 'O maior número é de ativos = ' + cast(@nm_ativo as char(5))
        end
    else
        begin
            print 'O maior número é de ativos = ' + cast(@nm_inativo as char(5))
        end
end
go

begin
    if exists (select id_aluno from aluno where cidade = 'Jarinu')
        begin
            update aluno set cidade = 'Valinhos' where cidade = 'Jarinu'
        end
end
go

begin
    declare @abc int = 65
    while @abc <= 90 begin
        print char(@abc)
        set @abc+= 1
    end
end
go

begin
    declare @numero int = 0
    while @numero <= 1000 begin
        if @numero % 10 = 0
        print @numero
        set @numero+= 1
    end
end
go

begin
    declare @loop_interno int = 1, @loop_externo int = 1
    while @loop_externo <= 100 begin
        while @loop_interno <= 5 begin
            print @loop_interno * @loop_externo
            set @loop_interno+=1
        end
        
        print @loop_externo
        set @loop_externo+= 1
		set @loop_interno = 1
    end
end
go

begin
    select
        nome,
        case ativo
            when 0 then 'Inativa'
        else
            'Ativa'
        end as matricula
    from aluno
end
go

use master
go

drop database universidade
go
