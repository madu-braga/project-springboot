-- Drop the schema and user if they exist
DROP SCHEMA IF EXISTS spring;
DROP USER IF EXISTS 'user'@'localhost';

-- Create the schema and user
CREATE SCHEMA spring;
CREATE USER 'user'@'localhost' IDENTIFIED BY 'pass123';

-- Grant privileges to the user
GRANT SELECT, INSERT, DELETE, UPDATE ON spring.* TO 'user'@'localhost';

-- Use the 'spring' schema
USE spring;

-- Create the 'usr_usuario' table
CREATE TABLE usr_usuario (
    usr_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    usr_nome VARCHAR(20) NOT NULL,
    usr_senha VARCHAR(150) NOT NULL,
    PRIMARY KEY (usr_id),
    UNIQUE KEY uni_usuario_nome (usr_nome)
);

-- Create the 'aut_autorizacao' table
CREATE TABLE aut_autorizacao (
    aut_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    aut_nome VARCHAR(20) NOT NULL,
    PRIMARY KEY (aut_id),
    UNIQUE KEY uni_aut_nome (aut_nome)
);

-- Create the 'uau_usuario_autorizacao' table
CREATE TABLE uau_usuario_autorizacao (
    usr_id BIGINT UNSIGNED NOT NULL,
    aut_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (usr_id, aut_id),
    FOREIGN KEY aut_usuario_fk (usr_id) REFERENCES usr_usuario (usr_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY aut_autorizacao_fk (aut_id) REFERENCES aut_autorizacao (aut_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Create the 'ant_anotacao' table
CREATE TABLE ant_anotacao (
    ant_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    ant_texto VARCHAR(256) NOT NULL,
    ant_data_hora DATETIME NOT NULL,
    ant_usr_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (ant_id),
    FOREIGN KEY ant_usr_fk (ant_usr_id) REFERENCES usr_usuario(usr_id)
);

-- Insert data into 'usr_usuario' table
INSERT INTO usr_usuario (usr_nome, usr_senha)
VALUES ('admin', '$2a$10$i3.Z8Yv1Fw10I5SNjdCGkOTRGQjGvHjh/gMZhdc3e7LIovAklqM6C');

-- Insert data into 'aut_autorizacao' table
INSERT INTO aut_autorizacao (aut_nome)
VALUES ('ROLE_ADMIN');

-- Insert data into 'uau_usuario_autorizacao' table
INSERT INTO uau_usuario_autorizacao (usr_id, aut_id)
VALUES (1, 1);

-- Insert data into 'ant_anotacao' table
INSERT INTO ant_anotacao (ant_texto, ant_data_hora, ant_usr_id)
VALUES ('My new project', '2023-09-30 19:18', 1);
