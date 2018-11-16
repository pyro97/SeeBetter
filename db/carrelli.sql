
USE carrello;

DROP TABLE IF EXISTS carrelli;

CREATE TABLE carrelli(	
  username char(20) ,
  id char(20) primary key,
  prodotto char (20),
  quantita int default 0


);

INSERT INTO carrelli values ("obaoba9","id3","GG0057SK002","1");

