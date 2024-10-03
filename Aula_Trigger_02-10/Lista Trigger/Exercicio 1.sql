/*1-Crie um trigger para atualizar o estoque de um produto quando ele for vendido*/

create trigger trg_atualiza_estoque
ON ITEMPEDIDO 
FOR INSERT AS 
BEGIN
	DECLARE
		@codProduto int,
		@quantidadeVendida int
	SELECT @codProduto = codProduto, @quantidadeVendida = quantidade
	FROM inserted

	UPDATE PRODUTO
	SET quantidade = quantidade - @quantidadeVendida
	where codproduto = @codProduto;
END
SELECT * FROM ITEMPEDIDO
select * from PRODUTO
INSERT ITEMPEDIDO values (1,1,500,1,2);