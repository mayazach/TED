DROP TABLE review;
DROP TABLE photo;
DROP TABLE rentdates;
DROP TABLE room;
DROP TABLE roomsowner;
DROP TABLE roomsuser;
DROP TABLE country;

CREATE TABLE country(
  id INT NOT NULL AUTO_INCREMENT,
  code VARCHAR(3) NOT NULL ,
  name VARCHAR(128) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE roomsuser(
  id INT NOT NULL AUTO_INCREMENT,
  firstName VARCHAR(128) NOT NULL ,
  lastName VARCHAR(128) NOT NULL ,
  email VARCHAR(256) NOT NULL ,
  phone VARCHAR(128),
  photoUrl VARCHAR(1024),
  role VARCHAR(128) NOT NULL ,
  PRIMARY KEY (id)
);

CREATE TABLE roomsowner(
  id INT NOT NULL AUTO_INCREMENT,
  userid INT NOT NULL ,
  url VARCHAR(1024) NOT NULL ,
  description VARCHAR(1024),
  location VARCHAR(1024),
  PRIMARY KEY (id)
  ,
  CONSTRAINT ownerid_userid_FK
  FOREIGN KEY (userid)
  REFERENCES roomsuser (id)
  ON DELETE CASCADE
);

CREATE TABLE room(
  id INT NOT NULL AUTO_INCREMENT,
  ownerid INT NOT NULL ,
  name VARCHAR(128) NOT NULL,
  url VARCHAR(1024) NOT NULL,
  description VARCHAR(1024),
  guests INT NOT NULL,
  maxguests INT,
  price DECIMAL(10,2),
  pricePerExtra DECIMAL(10,2),
  pricePerWeek DECIMAL(10,2),
  pricePerMonth DECIMAL(10,2),
  squareMetres INT,
  roomType VARCHAR(128),
  beds INT(2),
  bedrooms INT(2),
  bathrooms INT(2),
  thumbnail VARCHAR(1024),
  defaultPic VARCHAR(1024),
  floor VARCHAR(128),
  neighborhoodOverview VARCHAR(1024),
  address VARCHAR(1024),
  postalCode VARCHAR(128),
  city VARCHAR(128),
  state VARCHAR(128),
  country INT,
  transport VARCHAR(1024),
  amenities VARCHAR(1024),
  rules VARCHAR(1024),
  reviews INT,
  reviewAvg DECIMAL(10,2),
  PRIMARY KEY (id)
  ,
  CONSTRAINT roomid_ownerid_FK
  FOREIGN KEY (ownerid)
  REFERENCES roomsowner (id)
  ON DELETE CASCADE
  ,
  CONSTRAINT roomid_countryid_FK
  FOREIGN KEY (country)
  REFERENCES country (id)
  ON DELETE CASCADE
);

CREATE TABLE rentdates(
  id INT NOT NULL AUTO_INCREMENT,
  roomid INT NOT NULL ,
  startdate DATE NOT NULL ,
  enddate DATE,
  PRIMARY KEY (id)
  ,
  CONSTRAINT dateid_roomid_FK
  FOREIGN KEY (roomid)
  REFERENCES room (id)
  ON DELETE CASCADE
);

CREATE TABLE photo(
  id INT NOT NULL AUTO_INCREMENT,
  roomid INT NOT NULL ,
  source VARCHAR(1024),
  PRIMARY KEY (id)
  ,
  CONSTRAINT photoid_roomid_FK
  FOREIGN KEY (roomid)
  REFERENCES room (id)
  ON DELETE CASCADE
);

CREATE TABLE review (
  id INT NOT NULL AUTO_INCREMENT,
  roomid INT NOT NULL ,
  text TEXT(1500),
  score INT(3),
  PRIMARY KEY (id)
  ,
  CONSTRAINT reviewid_roomid_FK
  FOREIGN KEY (roomid)
  REFERENCES room (id)
  ON DELETE CASCADE
);

INSERT INTO roomsuser (id,firstName,lastName,email,role) VALUES (1,'User1','First','user1@gmail.com','user');
INSERT INTO roomsuser (id,firstName,lastName,email,role) VALUES (2,'User2','Second','user2@gmail.com','admin');
INSERT INTO roomsuser (id,firstName,lastName,email,role) VALUES (3,'Owner','One','owner@gmail.com','owner');
INSERT INTO roomsuser (id,firstName,lastName,email,role) VALUES (4,'John','Doe','jdoe@gmail.com','owner');
INSERT INTO roomsuser (id,firstName,lastName,email,role) VALUES (5,'Jane','Doe','djane@gmail.com','owner');

INSERT INTO roomsowner (id,userid,url,description,location) VALUES (1,3,'www.something.com/001','Rents apartments','Athens,Greece');
INSERT INTO roomsowner (id,userid,url,description,location) VALUES (2,4,'www.something.com/002','Traditional homes','Crete,Greece');

INSERT INTO country (id,code,name) VALUES (1,'FR','France''GR');
INSERT INTO country (id,code,name) VALUES (2,'GR','Greece');
INSERT INTO country (id,code,name) VALUES (3,'IT','Italy');
INSERT INTO country (id,code,name) VALUES (4,'ES','Spain');

INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (1,1,'A 2-bdrm house in Plaka of Athens','https://www.airbnb.com/rooms/5731498','Ideally located a unique house in a very peaceful neighborhood of Plaka',
	4,6,120,15,250,560,null,'Apartment',3,2,1,'https://a2.muscache.com/ac/pictures/71819787/97d77d9e_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a2.muscache.com/ac/pictures/71819787/97d77d9e_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st',null,'Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{TV,"Cable TV",Internet,"Wireless Internet","Air Conditioning",Kitchen,Heating,"Family/Kid Friendly",Washer,Essentials,Shampoo}',
	null,16,94);
	
INSERT INTO rentdates (id,roomid,startdate,enddate) VALUES (1,1,'2017-01-01','2017-12-31');

INSERT INTO photo (id,roomid,source) VALUES (1,1,'https://a0.muscache.com/im/pictures/3573a5d5-88e4-4562-9957-54d300f14191.jpg?aki_policy=xx_large');

INSERT INTO review (id,roomid,text,score) VALUES (1,1,'Great place!',95);

COMMIT;
