SET NAMES 'utf8';

SET CHARACTER SET utf8;

CREATE DATABASE IF NOT EXISTS {{ idp_rdbms_dbname }} CHARACTER SET=utf8;

GRANT ALL PRIVILEGES ON {{ idp_rdbms_dbname }}.* TO {{ idp_rdbms_user }}@localhost IDENTIFIED BY '{{ idp_rdbms_pw }}';

FLUSH PRIVILEGES;

USE {{ idp_rdbms_dbname }};

CREATE TABLE IF NOT EXISTS shibpid
(
pk INT NOT NULL AUTO_INCREMENT,
localEntity VARCHAR(255) NOT NULL,
peerEntity VARCHAR(255) NOT NULL,
persistentId VARCHAR(50) NOT NULL,
principalName VARCHAR(50) NOT NULL,
localId VARCHAR(50) NOT NULL,
peerProvidedId VARCHAR(50) NULL,
creationDate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
deactivationDate TIMESTAMP NULL default NULL,
PRIMARY KEY (pk)
);

CREATE TABLE IF NOT EXISTS StorageRecords
(
pk INT NOT NULL AUTO_INCREMENT,
context VARCHAR(255) NOT NULL,
id VARCHAR(255) NOT NULL,
expires BIGINT(20) DEFAULT NULL,
value LONGTEXT NOT NULL,
version BIGINT(20) NOT NULL,
PRIMARY KEY (pk)
);

CREATE TABLE IF NOT EXISTS RuoliOrganizzativi
(
pk INT NOT NULL AUTO_INCREMENT,
uid VARCHAR(255) NOT NULL,
ruolo VARCHAR(255) NOT NULL,
PRIMARY KEY (pk)
);

create table user_orcid (
pk INT NOT NULL AUTO_INCREMENT,
uid varchar(128) not null,
orcid varchar(128) not null,
start_date date,
end_date  date,
PRIMARY KEY (pk)
);
