DELIMITER //
CREATE TRIGGER after_order_payment
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    -- 检查支付状态是否从未支付（0）更新为支付完成（1）
    IF NEW.payment_status = 1 AND OLD.payment_status = 0 THEN
        -- 更新对应的 item 表中 item_id 的状态为已售出（设定 status = 0 表示已售出）
        UPDATE item
        SET status = 0
        WHERE item_id = NEW.item_id;
    END IF;
END;
//
DELIMITER ;
