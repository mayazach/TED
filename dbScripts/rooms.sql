DROP TABLE review;
DROP TABLE photo;
DROP TABLE rentdates;
DROP TABLE room;
DROP TABLE roomsowner;
DROP TABLE roomsuser;
DROP TABLE country;

CREATE TABLE country(
  id INT(10) NOT NULL AUTO_INCREMENT,
  code VARCHAR(3) NOT NULL ,
  name VARCHAR(128) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE roomsuser(
  id INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(128) NOT NULL ,
  role VARCHAR(128) NOT NULL ,
  PRIMARY KEY (id)
);

CREATE TABLE roomsowner(
  id INT(10) NOT NULL AUTO_INCREMENT,
  userid INT(10) NOT NULL ,
  url VARCHAR(1024) NOT NULL ,
  description VARCHAR(1024),
  PRIMARY KEY (id)
  ,
  CONSTRAINT ownerid_userid_FK
  FOREIGN KEY (userid)
  REFERENCES roomsuser (id)
  ON DELETE CASCADE
);

CREATE TABLE room(
  id INT(10) NOT NULL AUTO_INCREMENT,
  ownerid INT(10) NOT NULL ,
  name VARCHAR(128) ,
  PRIMARY KEY (id)
  ,
  CONSTRAINT roomid_ownerid_FK
  FOREIGN KEY (ownerid)
  REFERENCES roomsowner (id)
  ON DELETE CASCADE
);

CREATE TABLE rentdates(
  id INT(10) NOT NULL AUTO_INCREMENT,
  roomid INT(10) NOT NULL ,
  startdate DATE NOT NULL ,
  enddate DATE,
  pricePerDay  DECIMAL(10,2),
  PRIMARY KEY (id)
  ,
  CONSTRAINT dateid_roomid_FK
  FOREIGN KEY (roomid)
  REFERENCES room (id)
  ON DELETE CASCADE
);

CREATE TABLE photo(
  id INT(10) NOT NULL AUTO_INCREMENT,
  roomid INT(10) NOT NULL ,
  source VARCHAR(1024),
  PRIMARY KEY (id)
  ,
  CONSTRAINT photoid_roomid_FK
  FOREIGN KEY (roomid)
  REFERENCES room (id)
  ON DELETE CASCADE
);

CREATE TABLE review (
  id INT(10) NOT NULL AUTO_INCREMENT,
  roomid INT(10) NOT NULL ,
  text TEXT(1500),
  score INT(1),
  PRIMARY KEY (id)
  ,
  CONSTRAINT reviewid_roomid_FK
  FOREIGN KEY (roomid)
  REFERENCES room (id)
  ON DELETE CASCADE
);

COMMIT;
