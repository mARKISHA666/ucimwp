use master;
go
drop database if exists radimopetprvo;
go
create database radimopetprvo;
go
use radimopetprvo;


create table smjerovi (
sifra int not null primary key identity(1,1),
naziv varchar(50)not null,
trajanje int null, -- null se ne piše. ako ne piše not null onda se podrazumjeva null
cijena decimal (18,2),
vaucer bit
);

create table grupe(
sifra int not null primary key identity(1,1),
naziv varchar(5)not null,
smjer int not null,
datumpocetka datetime,
maxpolaznika int not null,
predavac int,
);

create table polaznici (
sifra int not null primary key identity(1,1),
ime varchar (50) not null,
prezime varchar (50) not null,
email varchar (100),
oib char (11),
brojugovora varchar (10),
);

create table predavaci (
sifra int not null primary key identity(1,1),
ime varchar (50) not null,
prezime varchar (50) not null,
email varchar (100) not null,
oib char (11),
iban varchar (50),
);

create table clanovi (
grupa int not null,
polaznik int not null,
);

--kreiranje vanjskih klju+čeva 

alter table grupe add foreign key(smjer) references smjerovi(sifra);
alter table grupe add foreign key (predavac) references predavaci(sifra);

alter table clanovi add foreign key (grupa) references grupe(sifra);
alter table clanovi add foreign key (polaznik) references polaznici (sifra);

use radimopetprvo;

select * from smjerovi;
--1
insert into smjerovi (naziv, trajanje, cijena, vaucer)
values ('web programiranje', 225, 1859.45, 1);


select * from predavaci;

insert into predavaci (ime, prezime, email) values 
--1
('Pasko', 'Patak','ppatak@gmail.com'),
--2
('Shaquille','o''Neal','shakinamailu@gmail.com');

select * from polaznici;

-- 1 do 3
insert into polaznici (ime, prezime, email) values
('Ana', 'Anic', 'anjuska@gmail.com'),
('Anaa', 'Aniccc', 'anjuska@gmail.com'),
('Anaaaa', 'Anicccc', 'aanjuska@gmail.com'),
('Anaaaaa', 'Anicccccc', 'aaaanjuska@gmail.com');



select * from grupe;
insert into grupe (naziv, predavac, datumpocetka, smjer, maxpolaznika) values
--1
('WP3',1,'2023-11-29 19:00:00', 1, 25),
--2
('WP2',null,'2023-11-07 17:00:00',1,25);

select * from clanovi;

insert into clanovi (grupa, polaznik) values
(1,1),(1,2),(1,3);