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
  name VARCHAR(128) NOT NULL ,
  role VARCHAR(128) NOT NULL ,
  PRIMARY KEY (id)
);

CREATE TABLE roomsowner(
  id INT NOT NULL AUTO_INCREMENT,
  userid INT NOT NULL ,
  realname VARCHAR(1024) ,
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
  score INT(1),
  PRIMARY KEY (id)
  ,
  CONSTRAINT reviewid_roomid_FK
  FOREIGN KEY (roomid)
  REFERENCES room (id)
  ON DELETE CASCADE
);

INSERT INTO roomsuser (id,name,role) VALUES (1,'User1','user');
INSERT INTO roomsuser (id,name,role) VALUES (2,'User2','admin');
INSERT INTO roomsuser (id,name,role) VALUES (3,'Owner','owner');
INSERT INTO roomsuser (id,name,role) VALUES (4,'Owner2','owner2');
INSERT INTO roomsuser (id,name,role) VALUES (5,'Owner3','owner3');

INSERT INTO roomsowner (id,userid,realname,url,description,location) VALUES (1,3,'John Doe','www.something.com/001','Rents apartments','Athens,Greece');
INSERT INTO roomsowner (id,userid,realname,url,description,location) VALUES (2,4,'Jane Doe','www.something.com/002','Traditional homes','Crete,Greece');

INSERT INTO country (id,code,name) VALUES (1,'FR','France''GR');
INSERT INTO country (id,code,name) VALUES (2,'GR','Greece');
INSERT INTO country (id,code,name) VALUES (3,'IT','Italy');
INSERT INTO country (id,code,name) VALUES (4,'ES','Spain');

COMMIT;
