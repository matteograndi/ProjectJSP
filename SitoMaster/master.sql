DROP TABLE IF EXISTS utenti;

CREATE TABLE utenti (
  id_utente integer not null,
  usr varchar not null,
  pwd varchar not null,
  nome varchar not null,
  cognome varchar not null,
  luonasc varchar ,
  datanasc date ,
  country varchar ,
  address varchar ,
  city varchar ,
  cap double ,
  prov varchar ,
  doc char ,
  numdoc varchar , 
  phone double ,
  mail varchar not null,
  compl boolean ,
  adm boolean ,
  PRIMARY KEY  (id_utente) ,
  UNIQUE (id_utente)
) ;