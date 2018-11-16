USE carrello;


DROP TABLE IF EXISTS users;

CREATE TABLE users(	
  username char(20) primary key,
  pass char(20) not null,
  codice char (20),
  nome char(20),
  cognome char(20)


);

INSERT INTO users values ("obaoba9","oba","asa12","Simone","Pirozzi");

