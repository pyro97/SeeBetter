
USE carrello;

DROP TABLE IF EXISTS orders;

CREATE TABLE orders(	
  username char(20) primary key,
  id char(20) not null,
  codiceProdotto char (20),
  quantita int default 0


);

INSERT INTO orders values ("obaoba9","1","GG0057SK002","1");

