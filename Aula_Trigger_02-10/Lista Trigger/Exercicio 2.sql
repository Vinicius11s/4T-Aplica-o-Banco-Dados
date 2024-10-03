/*2-Crie um trigger para criar um log dos Clientes modificados */

create table ocorrencias(
oco_id int identity (1,1) not null,
oco_tipo varchar(50),
oco_tabela varchar(50),
oco_info varchar(50),
oco_data date)


create trigger trg_clientes_modificados
ON Cliente
FOR UPDATE
AS
BEGIN
	DECLARE
		@info varchar(50),
		@data date
	SELECT @info = nome, @data = GETDATE() FROM deleted
	insert ocorrencias
	values('Alteração','clientes',@info,@data)
END

select * from CLIENTE
update CLIENTE set nome = 'Vinicius Santana'
where codcliente=1
select * from ocorrencias
