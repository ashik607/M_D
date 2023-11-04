use Store

select *from Transactions

use Store
CREATE TRIGGER UpdateItemQuantity
ON Transactions
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @item_id CHAR(6), @tran_quantity INT, @tran_type CHAR(3);

    SELECT @item_id = i.item_id, @tran_quantity = i.tran_quantity, @tran_type = i.tran_type
    FROM INSERTED i;

    IF @tran_type = 'SLD'
    BEGIN
        UPDATE Items
        SET item_quantity = item_quantity - @tran_quantity
        WHERE item_id = @item_id;
    END
    ELSE IF @tran_type = 'ORD'
    BEGIN
        UPDATE Items
        SET item_quantity = item_quantity + @tran_quantity
        WHERE item_id = @item_id;
    END
END;

SELECT * FROM Items;


SELECT * FROM Transactions;
