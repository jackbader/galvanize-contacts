alter table "user" add column is_human boolean;

update "user" set is_human = false where id IN(1, 2, 4);
update "user" set is_human = true where id = 3;

delete from "user" where is_human = true;

drop table contact;
