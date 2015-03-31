
    create table game_users (
        id int4 not null,
        email varchar(255) not null,
        password varchar(255) not null,
        username varchar(255) not null,
        primary key (id)
    );

    create table game_users_games (
        game_users_id int4 not null,
        games_game_id int4 not null
    );

    create table game_values (
        id int4 not null,
        value1 varchar(255),
        value2 varchar(255),
        value3 varchar(255),
        value4 varchar(255),
        value5 varchar(255),
        value6 varchar(255),
        value7 varchar(255),
        value8 varchar(255),
        value9 varchar(255),
        game_game_id int4,
        primary key (id)
    );

    create table games (
        game_id int4 not null,
        aiPlayer boolean not null,
        completed boolean not null,
        end_time timestamp,
        outcome varchar(255),
        save_time timestamp,
        start_time timestamp,
        p1_id int4,
        p2_id int4,
        primary key (game_id)
    );

    create table users (
        id int4 not null,
        enabled boolean not null,
        password varchar(255),
        username varchar(255),
        primary key (id)
    );

    alter table game_users_games 
        add constraint UK_o7g5x2nh26mfqhrbg4cjmjwau unique (games_game_id);

    alter table game_users_games 
        add constraint FK_o7g5x2nh26mfqhrbg4cjmjwau 
        foreign key (games_game_id) 
        references games;

    alter table game_users_games 
        add constraint FK_66kco3ww217acpnu3q41bi7oa 
        foreign key (game_users_id) 
        references game_users;

    alter table game_values 
        add constraint FK_cj2s28p011pdeyugggunnj1bi 
        foreign key (game_game_id) 
        references games;

    alter table games 
        add constraint FK_fskjhm8r7sfisv2l50osgdioq 
        foreign key (p1_id) 
        references game_users;

    alter table games 
        add constraint FK_3s7wjfmbco3snbgq8mcwadajb 
        foreign key (p2_id) 
        references game_users;

    create sequence hibernate_sequence;
