/*3-Crie um trigger para criar um log dos Produtos modificados */

create trigger trg_produtos_modificados
ON PRODUTO
FOR UPDATE
AS
BEGIN
	DECLARE
		@info varchar(50),
		@data date
	SELECT @info = descricao, @data = GETDATE() FROM deleted
	insert ocorrencias
	values('Alteração','produtos',@info,@data)
END

select * from PRODUTO
update PRODUTO set quantidade = 50
where codproduto=1
select * from ocorrencias;