DROP DATABASE IF EXISTS carrello;
CREATE DATABASE carrello;
USE carrello;

DROP TABLE IF EXISTS product;

CREATE TABLE product(	
  codice char(20) primary key,
  marca char(20) not null,
  coloreMontatura char (20),
  genere char(20),
  tipo char(20),
  prezzo decimal(10,2) default 0,
  sconto int default 0,
  quantita int default 0,
  immagine char(100),
  immagineC char(100),
  immagineInfo char(100)

);

INSERT INTO product values ("GG0057SK002","Gucci","nero-verde","uomo","da sole",87.50,0,20
,"./img/ImmaginiCatalogo/img1.jpg","./img/ImmaginiCarrello/imgC1.jpg","./img/ImmaginiInfo/imgInfo1.jpg");
INSERT INTO product values ("ML001601A","Moncler","nero","uomo","da sole",140.99,0,10
,"./img/ImmaginiCatalogo/img1.jpg","./img/ImmaginiCarrello/imgC1.jpg","./img/ImmaginiInfo/imgInfo1.jpg");
INSERT INTO product values ("PLD4014S","Polaroid","nero","uomo","da sole",32.50,0,10
,"./img/ImmaginiCatalogo/img1.jpg","./img/ImmaginiCarrello/imgC1.jpg","./img/ImmaginiInfo/imgInfo1.jpg");
INSERT INTO product values ("PLD6012N ","Polaroid","grigio-azzurro","uomo","da sole",38.50,0,20
,"./img/ImmaginiCatalogo/img1.jpg","./img/ImmaginiCarrello/imgC1.jpg","./img/ImmaginiInfo/imgInfo1.jpg");


