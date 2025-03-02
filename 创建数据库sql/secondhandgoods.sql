/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2024/10/22 9:29:06                           */
/*==============================================================*/


/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   admin_id             int not null  comment '',
   admin_no             char(10)  comment '',
   admin_password       char(20)  comment '',
   primary key (admin_id)
);

/*==============================================================*/
/* Table: cart                                                  */
/*==============================================================*/
create table cart
(
   cart_id              int not null  comment '',
   user_no              char(10) not null  comment '',
   user_id              int not null  comment '',
   item_id              int not null  comment '',
   added_time           date not null  comment '',
   primary key (cart_id)
);

/*==============================================================*/
/* Table: complaint                                             */
/*==============================================================*/
create table complaint
(
   complaint_id         int not null  comment '',
   order_id             int not null  comment '',
   user_id              int not null  comment '',
   complaint_type       char(50) not null  comment '',
   complaint_reason     text not null  comment '',
   complaint_time       date not null  comment '',
   primary key (complaint_id)
);

/*==============================================================*/
/* Table: complaintHandling                                     */
/*==============================================================*/
create table complaintHandling
(
   handling_id          int not null  comment '',
   complaint_id         int not null  comment '',
   admin_id             int not null  comment '',
   handling_option      text not null  comment '',
   handling_time        datetime not null  comment '',
   primary key (handling_id)
);

/*==============================================================*/
/* Table: item                                                  */
/*==============================================================*/
create table item
(
   item_id              int not null  comment '',
   user_no              char(10) not null  comment '',
   item_name            char(100) not null  comment '',
   category             char(50) not null  comment '',
   purchase_year        date not null  comment '',
   conditions           char(10) not null  comment '',
   price                decimal(10,2) not null  comment '',
   location             char(100) not null  comment '',
   status               numeric(1,0) not null  comment '',
   admin_id             int  comment '',
   primary key (item_id)
);

/*==============================================================*/
/* Table: orders                                                */
/*==============================================================*/
create table orders
(
   order_id             int not null  comment '',
   user_no              char(10) not null  comment '',
   user_id              int not null  comment '',
   item_id              int not null  comment '',
   amount               decimal(10,2) not null  comment '',
   order_time           datetime not null  comment '',
   payment_status       numeric(1,0) not null  comment '',
   primary key (order_id)
);

/*==============================================================*/
/* Table: userinfo                                              */
/*==============================================================*/
create table userinfo
(
   user_no              char(10) not null  comment '',
   user_state           numeric(1,0) not null  comment '',
   user_password        char(20) not null  comment '',
   user_id              int  comment '',
   admin_id             int  comment '',
   primary key (user_no)
);

/*==============================================================*/
/* Table: violation                                             */
/*==============================================================*/
create table violation
(
   violation_id         int not null  comment '',
   user_no              char(10) not null  comment '',
   user_id              int not null  comment '',
   violation_content    text not null  comment '',
   violation_time       datetime not null  comment '',
   primary key (violation_id)
);

/*==============================================================*/
/* Table: wishList                                              */
/*==============================================================*/
create table wishList
(
   wishlist_id          int not null  comment '',
   user_no              char(10) not null  comment '',
   user_id              int not null  comment '',
   item_id              int not null  comment '',
   added_time           datetime not null  comment '',
   primary key (wishlist_id)
);

alter table cart add constraint FK_CART_CART_USER_USERINFO foreign key (user_no)
      references userinfo (user_no) on delete restrict on update restrict;

alter table complaint add constraint FK_COMPLAIN_ORDER_COM_ORDERS foreign key (order_id)
      references orders (order_id) on delete restrict on update restrict;

alter table complaintHandling add constraint FK_COMPLAIN_ADMIN_COM_ADMIN foreign key (admin_id)
      references admin (admin_id) on delete restrict on update restrict;

alter table complaintHandling add constraint FK_COMPLAIN_COMPLAINT_COMPLAIN foreign key (complaint_id)
      references complaint (complaint_id) on delete restrict on update restrict;

alter table item add constraint FK_ITEM_ITEM_ADMI_ADMIN foreign key (admin_id)
      references admin (admin_id) on delete restrict on update restrict;

alter table item add constraint FK_ITEM_USER_ITEM_USERINFO foreign key (user_no)
      references userinfo (user_no) on delete restrict on update restrict;

alter table orders add constraint FK_ORDERS_ITEM_ORDE_ITEM foreign key (item_id)
      references item (item_id) on delete restrict on update restrict;

alter table orders add constraint FK_ORDERS_USER_ORDE_USERINFO foreign key (user_no)
      references userinfo (user_no) on delete restrict on update restrict;

alter table userinfo add constraint FK_USERINFO_USER_ADMI_ADMIN foreign key (admin_id)
      references admin (admin_id) on delete restrict on update restrict;

alter table violation add constraint FK_VIOLATIO_违规记录_用户_USERINFO foreign key (user_no)
      references userinfo (user_no) on delete restrict on update restrict;

alter table wishList add constraint FK_WISHLIST_WISHLIST__USERINFO foreign key (user_no)
      references userinfo (user_no) on delete restrict on update restrict;

