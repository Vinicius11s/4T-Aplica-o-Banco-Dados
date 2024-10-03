/*Crie um trigger para criar um log quando um item de pedido for removido */

create trigger trg_itemPedidoRemovido
ON ITEMPEDIDO
FOR DELETE AS
BEGIN
	DECLARE
		@info varchar(50),
		@data date
	SELECT @info = numeroitem, @data = GETDATE() FROM deleted
	insert ocorrencias
	values ('Exclusão','ItemPedido', @info, @data)
END

SELECT * FROM ITEMPEDIDO;
delete from ITEMPEDIDO where codpedido=1 and numeroitem =1;
select * from ocorrencias;



SELECT * FROM ITEMPEDIDO