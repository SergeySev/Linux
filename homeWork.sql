--Задача (1)
--- вывести ТОП-1 юзеров по сумме донатов 
--(КТО БОЛЬШЕ ПОЖЕРТВОВАЛ ДОНАТОВ)- поля
--- имя_юзера
--- сумма донатов


select users.fullname, sum(amount) as sum 
from donations 
left join users
on  donations.donator_id=users.user_id
group by users.fullname
order by sum desc 
limit 1

--ЗАДАЧА (2)
--- вывести ТОП-3 юзеров по сумме собранных донатов
--- поля
--- имя_юзера
--- сумма_собранных_донатов

select users.fullname, sum(amount) as sum 
from donations 
left join users
on  donations.stream_id=users.user_id
group by users.fullname
order by sum desc 
limit 3

--Задача (3) 
-- спроектировать и создать с помощью SQL БД для "онлайн чат"

-- Структурное описание онлайн чата https://drive.google.com/file/d/1xg_0Lc66XaTEeLkb_RkFpXB6XWUoH9_k/view?usp=sharing 

create table if not exists users (
id int auto_increment primary key,
name varchar(50) not null,
phone_number varchar(255) not null,
e_mail varchar(255) not null
);

create table if not exists contact (
contact_id int,
user_id int,
foreign key (contact_id) references users(id),
foreign key (user_id) references users(id));

create table if not exists chats (
id int auto_increment primary key,
user_id int not null,
foreign key (user_id) references users(id));

create table if not exists massages (
id int auto_increment primary key,
chat_id int not null,
test text not null,
sender_id int not null,
foreign key (chat_id) references chats(id),
foreign key (sender_id) references users(id)
);

create table if not exists photos_link (
massage_id int not null,
link text not null,
foreign key (massage_id) references massages(id));

create table if not exists documents_link (
massage_id int not null,
link text not null,
foreign key (massage_id) references massages(id));

create table if not exists video_link (
massage_id int not null,
link text not null,
foreign key (massage_id) references massages(id));

create table if not exists avatars_link (
user_id int not null,
link text not null,
foreign key (user_id) references users(id));
