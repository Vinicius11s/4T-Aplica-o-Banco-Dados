/*Crie um trigger para criar um log quando o valor total do pedido for maior que R$ 1200,00*/

CREATE TRIGGER trg_log_valor_pedido
ON PEDIDO
FOR INSERT 
AS
BEGIN
	DECLARE @codpedido INT,
			@valor_total DECIMAL(10, 2),
			@data_log DATE;

	SELECT @codpedido = codpedido, @valor_total = valortotal, @data_log = GETDATE()
	FROM inserted;

	IF @valor_total > 1200.00
	BEGIN
		INSERT INTO ocorrencias
		VALUES ('Inserção', 'Pedidos', 'Valor total do pedido maior que R$ 1200,00', @data_log);
	END
END

INSERT ITEMPEDIDO values (1,3,1300.00,1,2);

SELECT * FROM ITEMPEDIDO
SELECT * FROM PEDIDO
select * from ocorrencias;