-- Project - online game

create table items (
    id int auto_increment primary key,
    cost int,
    description varchar(150),
    add_date date
);

create table tranzaktion (
    id int auto_increment primary key,
    id_player int,
    sum int,
    id_item int,
    buy_date date,
    quantity int,
    FOREIGN KEY (id_item) REFERENCES items(id)
);

create table players (
    user_id int auto_increment primary key,
    email varchar(250),
    name varchar(250),
    password varchar(16),
    number_of_points int,
    free_game_cash int,
    donate_game_cash int,
    isBanned boolean,
    id_tranzaktion int,
    FOREIGN KEY (id_tranzaktion) REFERENCES tranzaktion(id)
);

