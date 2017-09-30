DROP TABLE message;
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
  username VARCHAR(128) NOT NULL ,
  password VARCHAR(128) NOT NULL ,
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

CREATE TABLE message (
  id INT NOT NULL AUTO_INCREMENT,
  senderid INT NOT NULL ,
  recipientid INT NOT NULL ,
  subject VARCHAR(256) ,
  text TEXT(1500) ,
  dateSent DATE,
  PRIMARY KEY (id)
  ,
  CONSTRAINT messageid_senderid_FK
  FOREIGN KEY (senderid)
  REFERENCES roomsuser (id)
  ON DELETE CASCADE
  ,
  CONSTRAINT messageid_recipientid_FK
  FOREIGN KEY (recipientid)
  REFERENCES roomsuser (id)
  ON DELETE CASCADE
);

INSERT INTO roomsuser (id,username,password,firstName,lastName,email,role) VALUES (1,'user','user','User1','First','user1@gmail.com','user');
INSERT INTO roomsuser (id,username,password,firstName,lastName,email,role) VALUES (2,'admin','admin','User2','Second','user2@gmail.com','admin');
INSERT INTO roomsuser (id,username,password,firstName,lastName,email,role) VALUES (3,'owner','owner','Owner','One','owner@gmail.com','owner');
INSERT INTO roomsuser (id,username,password,firstName,lastName,email,role) VALUES (4,'jdoe','jdoe','John','Doe','jdoe@gmail.com','owner');
INSERT INTO roomsuser (id,username,password,firstName,lastName,email,role) VALUES (5,'jane','jane','Jane','Doe','djane@gmail.com','owner');

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
	4,6,120,15,null,null,null,'Apartment',3,2,1,'https://a2.muscache.com/ac/pictures/71819787/97d77d9e_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a2.muscache.com/ac/pictures/71819787/97d77d9e_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st','Plaka','Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{TV,"Cable TV",Internet,"Wireless Internet","Air Conditioning",Kitchen,Heating,"Family/Kid Friendly",Washer,Essentials,Shampoo}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (2,1,'Just 200m from Acropolis, Athens','https://www.airbnb.com/rooms/5731498','Sunny & Quiet apartment  at the first floor in a beauty full building. Just 100 meters from Acropolis & 30 meters from the Acropolis Musuem. Bedroom with double futon bed, a kitchen, wireless internet, landline and a confortable bathroom.  The flat is able to host up to 3 accommodates. Alll this just around the corner of the new Acropolis musuem.that leads to Plaka Area,Irodeion theatre and Thision. Plaka is the area under the stone hill of Acropolis full with restaurants which serve delicious traditional food. Erodeion is an ancient greek theatre where concerts and theater performances taking place. Thision area is also very close to the apartment.Thision is well known for its bars and restaurants.What is more, the area is very well connected not only with the center of the town but also with the sea. Metro Acropolis is only ! 50 meters from the flat.Buses and tram are also very close. If you have any questions,do not hesitate to contact me. ',
	1,2,42,17,null,null,null,'Apartment',1,1,1,'https://a0.muscache.com/ac/pictures/19034905/6982ee6c_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a0.muscache.com/ac/pictures/19034905/6982ee6c_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st',null,'Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{Internet,"Wireless Internet","Air Conditioning",Kitchen,"Elevator in Building",Heating,"Family/Kid Friendly",Essentials,Shampoo}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (3,1,'Zen space near center of Athens','https://www.airbnb.com/rooms/1108690','JUST REFURBISHED - BRAND NEW APARTMENT. Very earthly energy. It is situated on the ground floor of a building. So...a zen apartment near the center of Athens. It is situated only fourty minutes from Athens airport by metro (no change is required). Once you get off at the metro stop Ambelokipi, you walk  minutes and voila!!! Three metro stops more and you will find yourselves in the center of Athens.  Back to zen.....it is a one bedroom apartment with a small dinning room and a living room.  The main glass wall provides a unique lighting throughout the day. At night the street light gives an overall warm glow to the space. A kitchen door leads to a small courtyard. At night the courtyard lights give a depth to the entire space. There is a mini market open from 10am to 12 midnight which can accommodate all your needs. There is also an excellent restaurant nearby where one can enjoy a fine lunch or a relaxing dinner. A less pricy restaurant is situated just across the street.',
	1,1,48,0,250,560,null,'Apartment',1,1,1,'https://a1.muscache.com/ac/pictures/19389554/a2ff7ebf_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a1.muscache.com/ac/pictures/19389554/a2ff7ebf_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st',null,'Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{TV,"Cable TV",Internet,"Wireless Internet",Kitchen,"Pets Allowed",Heating,"Family/Kid Friendly",Washer}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (4,1,'Athens Soul Apartments Plaka','https://www.airbnb.com/rooms/1286210','This 30m2 flat on Frinihou str. is located in Plaka, the old part of the city, at the foot of the Acropolis in the heart of Athens. Frinihou str. is a quiet street very close to a main street which leads to the New Acropolis Museum. The flat is only 100m away from the β€Acropolisβ€ Metro station as well as the New Acropolis Museum. Very close -less than 50m away- the Dionisiou Aeropagitou pedestrian street starts which is considered one of the most beautiful pedestrian streets in Athens. It takes straight to the Herodou Attikou ancient theatre. The flat is in the semi-basement of a stately building with its own court aglaise. It overlooks the street and its really sunny and bright. The flat is fully furnished, beautifully decorated and equipped with a kitchen , air-conditioning , central heating, a telephone line and free Internet. It is a two person flat but there is plenty of room for a third person. Super offer Two bicycles at your disposal, to ride the historical part of Athens free ',
	1,1,40,0,null,null,null,'Apartment',1,1,1,'https://a1.muscache.com/ac/pictures/13462809/26642ff7_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a1.muscache.com/ac/pictures/13462809/26642ff7_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st',null,'Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{TV,"Cable TV",Internet,"Wireless Internet","Air Conditioning",Kitchen,"Smoking Allowed","Pets Allowed","Pets live on this property",Cat(s),"Elevator in Building","Buzzer/Wireless ',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (5,1,'ATHENS DESIGNER''S LOFT DOWNTOWN','https://www.airbnb.com/rooms/918812','Designer''s down town loft, constructed by an architect, more than once published in architectural magazines (like ''House & Garden'', ''Maison & Decoration'', etc.). Fully equipped with high tech devices - 2 flat screen 40'' and 60'' TV, home cinema Wi-Fi, fully air condition. Central Psyri Square view, sunset view, extremely luminous place. A down town loft in the most convenient area of Psyri which has archaeological as well as cosmopolitan and urban value.  "monastiraki" metro station with direct itinerary to/from the airport is in Walking distance (approx. 2 min.)  from the Acropolis and historic area of Thisseion and Plaka. Walking distance (approx. 12 min)  from Gazi area, famous for it''s alternative night-life and clubbing. Walking distance (approx. 15 min) from Kolonaki area, the best market and shopping centre. One big bedroom with a 2.00x2.00m bed And a very big sofa for 2-3 persons. Full equipped bathroom with 2 access from the living room and from the bedroom',
	2,4,70,10,450,1300,null,'Apartment',1,1,1,'https://a2.muscache.com/ac/pictures/2261709/e6e849e7_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a2.muscache.com/ac/pictures/2261709/e6e849e7_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st','Psyri','Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{TV,Internet,"Wireless Internet","Air Conditioning",Kitchen,"Elevator in Building",Heating,Washer}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (6,1,'Breath Away National Garden wifi','https://www.airbnb.com/rooms/240960','A breath away from  Zappeion and the National Royal Garden  just a few seconds away . There are supermarkets, stores, restaurants, caffes, banks and pharmacies within a 2min. walking . Fully Furnished Studio on the 1st  floor  ,28.00 square meters including:1 spacious area, full bath with shower and fully equipped small kitchen. Studio amenities include: Hot water, Flat LCD  TV, Hair dryer,Iron, Cooking facilities,  air-conditioning , Washing Machine, Coffee maker, Toaster, Kettler,Refrigerator, Micro Wave, Oven. kitchen accessories (plates, dishes, pots, ventilation, etc). It also includes: 1 double bed with all necessary accessories (linens, pillows, etc) High speed internet is provided free For the benefit of all guests: No pets and No Smoking',
	1,1,40,0,260,550,null,'Apartment',1,1,1,'https://a0.muscache.com/ac/pictures/57865371/e2003c3f_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a0.muscache.com/ac/pictures/57865371/e2003c3f_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st','Plaka','Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{TV,"Cable TV",Internet,"Wireless Internet","Air Conditioning",Kitchen,Heating,"Family/Kid Friendly",Washer,Essentials,Shampoo}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (7,1,'Central Location','https://www.airbnb.com/rooms/587782','Spacious first floor 2 bedroom apartment perfectly located for sightseeing, transport and shopping. Fully self contained with an eat in kitchen. The apartment is large with 2 separate bedrooms to the living area. The second bedroom is the ''meditation room and library'' photo where we have 2 collapsible single beds separate to the library area. The apartment is on the first floor with no lift. Central to all that Athens has to offer with easy access to transport, including Monastiraki station, buses and taxis. Convenient to cafes and restaurants with a cafe/bar opposite serving home made local food and authentic Greek coffee and wine, among many other things... or just grab a takeaway and sit on your balcony and watch the Athens activity go by. The apartment block is a modernized Art Deco four storey apartment block central to the Plakka, the markets, museums and Evripidou Street, the designers'' shopping strip. You''ll just love being totally in the thick of it all!',
	2,4,70,10,400,1800,null,'Apartment',1,2,1,'https://a1.muscache.com/ac/pictures/16886510/26f68bb3_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a1.muscache.com/ac/pictures/16886510/26f68bb3_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st',null,'Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{Kitchen,"Buzzer/Wireless Intercom",Heating,"Family/Kid Friendly",Washer}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (8,1,'Renovated old house','https://www.airbnb.com/rooms/1116076','Old neoclassic architecture two level store. One floor (level) is for rent. Pedestrian area !',
	1,1,30,0,220,850,null,'House',1,2,1,'https://a2.muscache.com/ac/pictures/852527/60a0e428_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a2.muscache.com/ac/pictures/852527/60a0e428_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st',null,'Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (9,1,'Your room in the perfect area ','https://www.airbnb.com/rooms/134273','The house is located in one of the oldest and picturesque neighbourghoods of the center of Athens, called Ano Petralona. It is situated at the feet of filopappou hill right across the Acropolis. The house was built in the late 1950''s and has remained since with its high ceilings and the traditional mosaique floors and a roof garden under the Attica sky.The living room is surrounded by 5 rooms, one fully equipped kitchen, a bathroom with a bath tub and a toilet, and a small w.c.  I share the house with my flatmate Panos and we both enjoy hosting and meeting new people from all over the world.  You will have at your disposal a large bedroom with a double bed and a private sitting room with eastern orientation and great shinning mornings! The kitchen is fully equipped and functional as is the bathroom.  Behind the kitchen a spiral ladder leads you to the roof garden that you can enjoy day and night and is the perfect place to relax.  The Ano Petralona is a lively neighbourhood, very close',
	2,4,45,15,null,null,null,'House',3,1,1,'https://a0.muscache.com/ac/pictures/26186478/ce86821d_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a0.muscache.com/ac/pictures/26186478/ce86821d_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st',null,'Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{Internet,"Wireless Internet",Kitchen,"Smoking Allowed","Pets Allowed",Heating,"Family/Kid Friendly",Washer,Essentials}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (10,1,'Vintage Design Flat downtown! ','https://www.airbnb.com/rooms/1824675','the.flat |  A high-ceilinged penthouse of a 50s residential building in the centre of Athens, right in front of Kalliga Square and opposite the Theatre Library. "the.flat" is a personal space renovated in style a few months ago that kept its urban identity and now offers its space for a vintage short term stay to visitors from around the world.  "the.flat" has a large living room and dining room for 6, two large bedrooms, kitchen (refrigerator, mini oven, coffee maker and kettle), a bathroom with a bathtub, a w.c. and a large veranda. Provides free wi-fi. Central heating is provided by the building.  walking distances:  1 minute from Patission Ave (28th October Ave) /  6 minutes from Aghios Nikolaos Metro station /  12 minutes from Victoria Metro Station /  12 minutes from National Archaeological Museum /  20 minutes from Omonia Square.  One minute from two supermarkets, grocery stores, a National Bank branch, drugstores, parking stations and right in front of Karamanlaki Square.  Pati',
	2,4,65,15,null,null,null,'Apartment',3,2,1,'https://a1.muscache.com/ac/pictures/4035997/1f7bae95_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a1.muscache.com/ac/pictures/4035997/1f7bae95_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st',null,'Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{TV,"Wireless Internet","Air Conditioning",Kitchen,"Elevator in Building","Family/Kid Friendly"}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (11,2,'Beautiful Apartment Central Athens','https://www.airbnb.com/rooms/360940','This beautiful apartment in Central Athens is in the area of Victoria and only a short walk from the metro and Square.   The apartment has two double bedrooms with balconies, 1 bathroom with a Jakoozi, a spacious open plan fully fitted kitchen, dining and living room adjacent to a large bacony. This apartment has been stylishly renovated and has wooden floors throughout, modern kitchen with all the necessary white goods, wash room with machine and dryer, air conditioning throughout and central heating.  There is also an office area, stereo and TV.  A small storage room is included.  The apartment sleeps up to 6 as there is a sofa bed and camp bed .  Victoria is very close to the  Archaelogical Museum, shopping Mall and busy high street servicing a range of products.  Victoria Square plays host to a number of very good cafΓ© bars and restaurants.  The apartment is on a pedestrian road creating a quiet environment for an Athens flat',
	1,1,95,0,600,2000,null,'Apartment',1,2,1,'https://a1.muscache.com/ac/pictures/5210808/7cf4a030_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a1.muscache.com/ac/pictures/5210808/7cf4a030_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st',null,'Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (12,2,'Follow the Sun','https://www.airbnb.com/rooms/448963','A sunny place for holidays...',
	2,2,10,0,null,null,null,'Apartment',1,1,1,'https://a0.muscache.com/ac/pictures/93635734/32d4d888_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a0.muscache.com/ac/pictures/93635734/32d4d888_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st','Attiki','Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{Internet,"Wireless Internet",Kitchen,Heating}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (13,2,'ROCK APARTMENTS - Iliados','https://www.airbnb.com/rooms/7380844','BEST VALUE FOR MONEY, BEST (email hidden)e apartment is located in one of the most safe areas in Athens. It is 797 square feet (74 square meters), fully refurbished, with 2 bedrooms (fully furnished -LCD TV, Air Condition/Heating, etc), 1 living room, kitchen (cooking facilities included) and bathroom.  Nearby, you can find grocery stores, bakeries, mini-market and butcher. Greek traditional tavernas are located a couple of minutes away from the apartment. Located near the hottest spots of Athens such as Panathinaikon Stadium (1896, First modern Olympic games hosted there), Zappeion and the National Royal Garden (recentrly renovated), 10 minutes (on foot) from Kolonaki (the most fashionable place in Athens), the Sintagma square (metro/tram stations), 13 minutes from Lycabetus hill, 15 minutes on foot from Plaka/Monastiraki (hundrends of traditional tavernas and shops) and finally 10 minutes from many museums such as the War, Vyzantinon and Cycladic Art Museums. ',
	2,2,29,0,188,450,null,'Apartment',2,2,1,'https://a2.muscache.com/ac/pictures/809751/b774a22c_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a2.muscache.com/ac/pictures/809751/b774a22c_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st',null,'Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{TV,"Air Conditioning",Kitchen,"Elevator in Building",Heating,Washer,Dryer}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (14,2,'ROCK APARTMENTS - Kononos ','https://www.airbnb.com/rooms/110085','BEST VALUE FOR MONEY, BEST (email hidden)e apartment is located in one of the most safe areas in Athens. It is 303 square feet (28 square meters), fully refurbished, with 1 bedroom (fully furnished -LCD TV, Air Condition/Heating, etc), kitchen (cooking facilities included) and bathroom.  Nearby, you can find grocery stores, bakeries, mini-market and butcher. Greek traditional tavernas are located a couple of minutes away from the apartment. Located near the hottest spots of Athens such as Panathinaikon Stadium (1896, First modern Olympic games hosted there), Zappeion and the National Royal Garden (recentrly renovated), 15 minutes (on foot) from Kolonaki (the most fashionable place in Athens), the Sintagma square (metro/tram stations), 18 minutes from Lycabetus hill, 20 minutes on foot from Plaka/Monastiraki (hundrends of traditional tavernas and shops) and finally 15 minutes from many museums such as the War, Vyzantinon and Cycladic Art Museums.',
	1,1,59,0,400,1050,null,'Apartment',1,1,1,'https://a1.muscache.com/ac/pictures/809732/63ec0913_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a1.muscache.com/ac/pictures/809732/63ec0913_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st',null,'Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{TV,"Air Conditioning",Kitchen,"Elevator in Building",Heating,Washer,Dryer}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (15,2,'Loft apartment in Gazi, Athens','https://www.airbnb.com/rooms/110066','Enjoy your stay in this newly-built, luxurious loft in the heart of Athens. Stylishly furnished and equipped with all modern amenities, this spacious loft apartment features two levels connected by a staircase and can accommodate up to 3 people, who can also enjoy the rooftop swimming pool and deck, featuring 360-degree views of Athens. Located at walking distance from Kerameikos metro station and Gazi district featuring a wide array of cafes, restaurants, clubs, theatres, as well as at a 15-minute walk from Thiseio and Monastiraki, it is an ideal choice for visitors wanting to experience Athens'' vibrant lifestyle as well as its cultural attractions. A private parking space is also provided for guests. The Gazi district is the new cool place to be in Athens, full of restaurants, cafes, music, and art by the old city gas-works which has been turned into a museum-cultural center, Technopolis, that may be unique in all of Europe. Around the metro at Kerameikos cluster countless eateries',
	2,4,90,20,null,null,null,'Apartment',2,1,1,'https://a0.muscache.com/ac/pictures/91524491/bd9acb2d_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a0.muscache.com/ac/pictures/91524491/bd9acb2d_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st','Gazi','Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{TV,"Wireless Internet","Air Conditioning",Pool,Kitchen,"Family/Kid Friendly",Washer,Essentials}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (16,2,'25min. walking distance from center','https://www.airbnb.com/rooms/7218250',' A noiseless apartment located at Pagkrati, Athens. It is 76 sq.m., having two bedrooms, one living room, one bathroom, one kitchen and a patio. From the front side of the building the apartment is approx. 3 meters from the ground, as in a semi-floor. It can accommodate up to 4 persons. It is fully furnished, with washing,cooking facilities and air conditioning. Also unlimited adsl connection (wi-fi) is available. The apartment is located near several public transport facilities. For example, within one minute from the apartment there is a bus station for trolley bus 4 and blue bus 227 within 5 min. there is a bus station for trolley bus 2 and blue bus 140,etc. Moreover, 10min. away on foot is also the metro station Agios Ioannis (red line). We also note that Syntagma is about 20min. away on foot from the apartment. Finally, a supermarket, a bakery, a grocery store etc. can be found in less that 2 minutes away from apartment.',
	2,3,19,10,null,null,null,'Apartment',3,2,1,'https://a1.muscache.com/ac/pictures/13823443/c3e8c086_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a1.muscache.com/ac/pictures/13823443/c3e8c086_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st',null,'Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{Internet,"Wireless Internet","Air Conditioning",Kitchen,"Family/Kid Friendly",Washer}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (17,2,'STYLISH APARTMENT- HEART OF ATHENS','https://www.airbnb.com/rooms/932359','Family owned apartment, exclusively used  for holiday rental. Recently refurbished, bright, spacious and stylish right in the center of Athens but at a safe distance from the hustle and bustle of the inner city .Located on the 4th floor with lift. Set back from the road and very quiet. The property is just off one of the most central and elegant avenues of Athens (Vasilissis Sophias). It is within walking distance from the American Embassy, the Athens Concert Hall and Hilton Hotel. The neighborhood is lively and very safe. Plenty of bars, restaurants, cinemas, art galleries, fitness centers, supermarkets. Three metro stops away from the Acropolis and the historic center of Athens.     * Both  the bedroom and the living room have a balcony with sitting space, facing the big  garden of an embassy .',
	2,4,59,14,397,1510,null,'Apartment',4,1,1,'https://a2.muscache.com/ac/pictures/26505520/8a1d6213_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a2.muscache.com/ac/pictures/26505520/8a1d6213_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st',null,'Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{TV,"Cable TV",Internet,"Wireless Internet","Air Conditioning",Kitchen,"Elevator in Building",Heating,"Family/Kid Friendly",Washer}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (18,2,'Neoclassic loft in Plaka !','https://www.airbnb.com/rooms/155271',' The classic modern loft in the center of Plaka! Best location in Athens, on the ground floor of neoclassic detached house. 80sqm loft at your exclusive use. Comfortable, clean, cool, open plan living-dinning-kitchen space with a secret garden in the heart of historical center. Newly fitted bathroom with shower, TV, high speed wi-fi internet,fireplace. Located in the most central neighborhood of Plaka, just next to Syntagma square, Acropolis Museum, Ancient Agora, Monastiraki, and a step away from hip cafes, bars, greek tavernas and restaurants. Transportation  Syntagma metro station, buses and tram Acropolis metro station Monastiraki metro station ',
	1,1,70,0,450,1500,null,'Loft',1,1,1,'https://a2.muscache.com/ac/pictures/19545966/f3c5ca96_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a2.muscache.com/ac/pictures/19545966/f3c5ca96_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st',null,'Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{Internet,"Wireless Internet",Kitchen,"Smoking Allowed","Pets Allowed","Indoor Fireplace","Family/Kid Friendly"}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (19,2,'Center of Athens (Akropoli)','https://www.airbnb.com/rooms/1274275','A comfortable appartment very close to the center ( monastiraki, thisio , akropoli, kerameiko, plaka) , metro station kerameikos (blue line) and train station petralona (green line) Very close to the Center, two foltable bikes, washing machine, oven , fridge, king size bed, balcony, close to super market, kafe - bar LOLA. You can host a third person without charges We have to bikes which you are allowed to use!!! Close to all facilities, super market, nice cafe close. The house is in  pedestrian street 1.Metro station KERAMEIKOS(blue line ) 8 minutes , 650 metres 2. Train station PETRALONA ( green line ) 9 minutes 750 metres 3. Bike  4. Walk to center 20 minutes  1,6 km Also you can host one third person without extra charges  .You can use all ingredients in the kitchen and also my painting materials to make your own creations ',
	1,1,50,0,300,null,null,'Apartment',1,1,1,'https://a0.muscache.com/ac/pictures/93037580/328fad70_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a0.muscache.com/ac/pictures/93037580/328fad70_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st','Kerameikos','Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{TV,Kitchen,"Smoking Allowed","Elevator in Building","Hot Tub",Washer,Essentials,Shampoo}',
	null,16,94);
INSERT INTO room (id,ownerid,name,url,description,guests,maxguests,price,pricePerExtra,pricePerWeek,pricePerMonth,squareMetres,roomType,
	beds,bedrooms,bathrooms,thumbnail,defaultPic,floor,neighborhoodOverview,address,postalCode,city,state,country,transport,amenities,
	rules,reviews,reviewAvg)
	VALUES (20,2,'Newly decorated bright apartment','https://www.airbnb.com/rooms/7291718','The apartment is on the 4th floor of a building in β€Zografouβ€, a safe and quiet area of Athens. It consists of two rooms and a living room with an open kitchen.',
	1,1,60,0,350,1000,null,'Apartment',2,2,1,'https://a1.muscache.com/ac/pictures/55020630/5feb1774_original.jpg?interpolation=lanczos-none&size=small&output-format=jpg&output-quality=70',
	'https://a1.muscache.com/ac/pictures/55020630/5feb1774_original.jpg?interpolation=lanczos-none&size=medium&output-format=jpg&output-quality=70',
	'1st','Zografou','Vyronos, Athina, 105 58, Greece','105 58','Athens','Attica',2,null,'{TV,Internet,"Wireless Internet","Air Conditioning",Kitchen,"Elevator in Building","Buzzer/Wireless Intercom",Heating,"Family/Kid Friendly",Washer,"Smoke Detector","Carbon Monoxide Detector","First Aid Kit","Safety Card","Fire Extinguisher",Essentials,Shampoo}',
	null,16,94);
	
INSERT INTO rentdates (id,roomid,startdate,enddate) VALUES (1,1,'2017-01-01','2017-12-31');

INSERT INTO photo (id,roomid,source) VALUES (1,1,'https://a0.muscache.com/im/pictures/3573a5d5-88e4-4562-9957-54d300f14191.jpg?aki_policy=xx_large');
INSERT INTO photo (id,roomid,source) VALUES (2,3,'https://a0.muscache.com/im/pictures/19389470/5b561dc4_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (3,3,'https://a0.muscache.com/im/pictures/19389514/ebc862a7_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (4,3,'https://a0.muscache.com/im/pictures/19391005/734df0f6_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (5,3,'https://a0.muscache.com/im/pictures/19452395/5fcefaa2_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (6,3,'https://a0.muscache.com/im/pictures/19389602/3ea90594_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (7,3,'https://a0.muscache.com/im/pictures/19390869/bbb7f0c8_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (8,3,'https://a0.muscache.com/im/pictures/19389578/227b88a2_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (9,5,'https://a0.muscache.com/im/pictures/13462809/26642ff7_original.jpg?aki_policy=xx_large');
INSERT INTO photo (id,roomid,source) VALUES (10,5,'https://a0.muscache.com/im/pictures/13462824/409f7c89_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (11,5,'https://a0.muscache.com/im/pictures/13462827/b5cab922_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (12,6,'https://a0.muscache.com/im/pictures/2261666/feafdec7_original.jpg?aki_policy=xx_large');
INSERT INTO photo (id,roomid,source) VALUES (13,6,'https://a0.muscache.com/im/pictures/499ab449-3a41-4c71-8ae4-afed647156ce.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (14,6,'https://a0.muscache.com/im/pictures/ae7e0ee5-5749-4925-883e-2bec30b8963f.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (15,7,'https://a0.muscache.com/im/pictures/c72a679d-844d-4af5-9f34-dabded4f50a3.jpg?aki_policy=xx_large');
INSERT INTO photo (id,roomid,source) VALUES (16,7,'https://a0.muscache.com/im/pictures/6fbfa257-0881-488f-bfc5-2ecf47d4bca6.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (17,7,'https://a0.muscache.com/im/pictures/11669134/847cf953_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (18,8,'https://a0.muscache.com/im/pictures/16887278/f6897183_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (19,8,'https://a0.muscache.com/im/pictures/29218188/0634710f_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (20,8,'https://a0.muscache.com/im/pictures/16887193/0449774d_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (21,11,'https://a0.muscache.com/im/pictures/4035997/1f7bae95_original.jpg?aki_policy=xx_large');
INSERT INTO photo (id,roomid,source) VALUES (22,11,'https://a0.muscache.com/im/pictures/4036200/686fb6f0_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (23,11,'https://a0.muscache.com/im/pictures/9231266/0fd37965_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (24,11,'https://a0.muscache.com/im/pictures/4035960/a9074bdc_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (25,11,'https://a0.muscache.com/im/pictures/4036066/770889f7_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (26,14,'https://a0.muscache.com/im/pictures/809751/b774a22c_original.jpg?aki_policy=xx_large');
INSERT INTO photo (id,roomid,source) VALUES (27,14,'https://a0.muscache.com/im/pictures/809753/e83ece72_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (28,14,'https://a0.muscache.com/im/pictures/809767/95199e31_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (29,15,'https://a0.muscache.com/im/pictures/809737/6ee32ca2_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (30,15,'https://a0.muscache.com/im/pictures/809739/22a7d8c7_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (31,18,'https://a0.muscache.com/im/pictures/13823443/c3e8c086_original.jpg?aki_policy=xx_large');
INSERT INTO photo (id,roomid,source) VALUES (32,18,'https://a0.muscache.com/im/pictures/13823486/858308e9_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (33,18,'https://a0.muscache.com/im/pictures/13823538/f5e11135_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (34,19,'https://a0.muscache.com/im/pictures/19545966/f3c5ca96_original.jpg?aki_policy=xx_large');
INSERT INTO photo (id,roomid,source) VALUES (35,19,'https://a0.muscache.com/im/pictures/19546033/5b40b1c8_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (36,19,'https://a0.muscache.com/im/pictures/19545962/5b569503_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (37,19,'https://a0.muscache.com/im/pictures/19546038/763cab60_original.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (38,20,'https://a0.muscache.com/im/pictures/93037580/328fad70_original.jpg?aki_policy=xx_large');
INSERT INTO photo (id,roomid,source) VALUES (39,20,'https://a0.muscache.com/im/pictures/fd959bef-afbb-4c6d-82f0-9738c66bf113.jpg?aki_policy=x_large');
INSERT INTO photo (id,roomid,source) VALUES (40,20,'https://a0.muscache.com/im/pictures/a4ed972c-103d-4b4f-853f-2ebdda92a179.jpg?aki_policy=x_large');

INSERT INTO review (id,roomid,text,score) VALUES (1,1,'Great place!',95);

INSERT INTO message (id, senderid,recipientid, subject,text,dateSent) VALUES (1,1,3,'Hi','I want to rent your room','2017-01-01');

COMMIT;
