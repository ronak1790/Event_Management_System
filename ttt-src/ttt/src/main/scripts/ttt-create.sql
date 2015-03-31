 create sequence hibernate_sequence minvalue 100;

 create table game_users 
    (
        id integer primary key not null,
        email varchar(255) not null,
        password varchar(255) not null,
        username varchar(255) unique not null
        
    );

    create table games (
        game_id integer primary key not null,
        aiPlayer boolean not null,
        completed boolean not null,
        end_time timestamp,
        outcome varchar(255),
        save_time timestamp,
        start_time timestamp,
        p1_id integer references game_users(id) ,
        p2_id integer references game_users(id)
    );

   
    
    
    create table game_users_games (
        game_users_id integer references game_users(id),
        games_game_id integer references games(game_id)
    );

    create table game_values (
        id integer primary key not null,
        value1 varchar(255),
        value2 varchar(255),
        value3 varchar(255),
        value4 varchar(255),
        value5 varchar(255),
        value6 varchar(255),
        value7 varchar(255),
        value8 varchar(255),
        value9 varchar(255),
        game_game_id integer references games(game_id)
        
    );


   	create table authorities (
    username    varchar(255) not null references game_users(username),
    authority   varchar(255) default 'ROLE_USER'
	);

 
 
insert into game_users values(1,'cysun@localhost.localdomain','abcd','cysun');
insert into authorities values('cysun','ROLE_USER');

insert into games values(1,true,true,NOW(),'Win',null,NOW(),1,null);

insert into games values(2,true,false,NOW(),'Loose',null,NOW(),1,null);

insert into games values(3,true,false,null,null,'2014-05-21 18:21:28.733',NOW(),1,null);

insert into game_values values(1,'X','X','X','O','O','X','O','X','O',1);
insert into game_values values(2,'X','O','X','O','O','X','X','O','O',2);
insert into game_values values(3,'X','O','X','O','O',Null,'X',Null,Null,3);

insert into game_users_games values(1,1);
insert into game_users_games values(1,2);
insert into game_users_games values(1,3);


CREATE FUNCTION insertdata() returns trigger as $testref$
    BEGIN
    IF (TG_OP='INSERT') THEN
      INSERT INTO authorities (username) values (NEW.username);
      return NEW;
    END IF;
    END;
    $testref$ LANGUAGE plpgsql;
    CREATE TRIGGER testref AFTER INSERT ON game_users
  	FOR EACH ROW 
  	EXECUTE PROCEDURE insertdata();