create view UserCartView as
select
	u.user_id, u.user_no, i.item_id, i.item_name, i.category, i.price, i.status, c.added_time
from userinfo u
join cart c on u.user_id = c.user_id
join item i on c.item_id = i.item_id
