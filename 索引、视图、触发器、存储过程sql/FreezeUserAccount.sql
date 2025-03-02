DELIMITER //

CREATE PROCEDURE FreezeUserAccount(
    IN p_user_no CHAR(10),        -- 输入参数，用户编号
    IN p_admin_id INT             -- 输入参数，管理员 ID
)
BEGIN
    -- 检查该用户是否存在
    DECLARE user_exists INT;
    SELECT COUNT(*) INTO user_exists
    FROM userinfo
    WHERE user_no = p_user_no;

    IF user_exists = 0 THEN
        -- 如果用户不存在，抛出错误信息
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '用户不存在';
    ELSE
        -- 更新用户状态为 0（冻结状态）
        UPDATE userinfo
        SET user_state = 0, admin_id = p_admin_id
        WHERE user_no = p_user_no;

        -- 记录操作日志或显示成功消息
        SELECT CONCAT('用户 ', p_user_no, ' 已被冻结。') AS Result;
    END IF;
END;

//
DELIMITER ;
