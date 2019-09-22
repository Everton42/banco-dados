create table #Produtos
(
    idProd int primary key,
    descProd varchar(50),
    valProd money
)
go

declare @contador int;
set @contador = 1;
while (@contador <=1000)
begin  
    insert into #Produtos(idProd, descProd, valProd)
    values(@contador, 'Produto ' + cast(@contador as varchar(20)), 10000*rand());
    set @contador+=1
end
go

select * from #Produtos
go

declare @nmErro int;
        insert into #Produtos(idProd, descProd, valProd)
        values(2, 'Produto2', 566);
set @nmErro = @@ERROR;
if @nmErro > 0
	begin
		print 'Registro duplicado'
	end
go

begin try
        insert into #Produtos(idProd, descProd, valProd)
        values(2, 'Produto2', 566);
end try
begin catch
        print ERROR_NUMBER();
		print ERROR_MESSAGE();
        print ERROR_SEVERITY();
end catch

begin try
        insert into #Produtos(idProd, descProd, valProd)
        values(2, 'Produto2', 566);
end try
begin catch
        throw 50001, 'Já existe esse Produto na Tabela!', 1;
end catch

create table ##CopiaProdutos
(
    idProd int primary key,
    descProd varchar(50),
    valProd money
)
go

insert into ##CopiaProdutos(idProd, descProd, valProd)
select idProd, descProd, valProd from #Produtos
go

drop table #Produtos;  
go

declare @nome