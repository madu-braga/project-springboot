drop schema if exists spring;

drop user if exists 'user'@'localhost';

create schema spring;

create user 'user'@'localhost' identified by 'pass123';

grant select, insert, delete, update on spring.* to user@'localhost';

use spring;

Create table usr_usuario(
    usr_id bigint unsigned not null auto_increment,
    usr_nome varchar(20) not null,
    usr_senha varchar(150) not null,
    primary key (usr_id),
    unique key uni_usuario_nome (usr_nome)
);

Create table aut_autorizacao(
    aut_id bigint unsigned not null,
    aut_nome varchar(20) not null,
    primary key (aut_id),
    unique key uni_aut_nome (aut_nome)
)

Create table uau_usuario_autorizacao(
    usr_id bigint unsigned not null,
    aut_id bigint unsigned not null,
    primary key (usr_id, aut_id),
    foreign key aut_usuario_fk (usr_id) referencer usr_usuario (usr_id) on delete restrict on update cascade,
    foreign key aut_autorizacao_fk (aut_id) references aut_autorizacao (aut_id) on delete restrict on update cascade
);

Create table ant_anotacao(
    ant_id bigint unsigned not null auto_increment,
    ant_texto varchar(256) not null,
    ant_data_hora datetime not null,
    ant_usr_id bigint unsined not null,
    primary key (ant_id),
    foreign key ant_usr_fk (ant_usr_id) references usr_usuario(usr_id)
);

insert into usr_usuario (usr_nome, usr_senha)
    values ('admin', '$2a$10$i3.Z8Yv1Fw10I5SNjdCGkOTRGQjGvHjh/gMZhdc3e7LIovAklqM6C');
insert into aut_autorizacao ()
    values ('ROLE_ADMIN')
insert into uau_usuario_autorizacao (usr_id, aut_id)
    values (1,1);
insert into ant_anotacao (ant_texto, ant_data_hora, ant_usr_id)
    values ('My new project', '2023-09-30   19:18', 1);