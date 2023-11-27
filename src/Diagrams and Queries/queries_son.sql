
create table EğitimKurumu (
  kurum_id int primary key,
  kurum_adı varchar(255),
  adres varchar(255)
);



create table Öğrenci (

  okul_no int primary key NOT NULL,
  ad varchar(255),
  soyad varchar(255),
  doğum_tarihi date  ,
  mail varchar(255)  ,
  tel_no long ,
  sınıf int ,
  adres varchar(255) ,
  mezun_mu boolean ,
  kurum_id int ,
  tc_kimlik long,
  foreign key (kurum_id) references EğitimKurumu (kurum_id)

);

create table ÖğrenciMüsaitSaatler (
  id int,
  saat time,
  primary key(id,saat)
  
);

create table ÖğrenciMüsaitlikDurumu (
  okul_no int NOT NULL,
  gün varchar(255),
  saat_id int,
  primary key(okul_no,gün,saat_id),
  foreign key (okul_no) references Öğrenci(okul_no),
  foreign key (saat_id) references ÖğrenciMüsaitSaatler(id)
  
);

create table Ders (
  ders_kodu int primary key,
  ders_adı varchar(255)
);

create table DersiAlır (
  okul_no int  NOT NULL,
  ders_kodu int,
  primary key(okul_no,ders_kodu),
  foreign key (okul_no) references Öğrenci(okul_no),
  foreign key (ders_kodu) references Ders(ders_kodu)
);

create table Veli (
  okul_no int primary key NOT NULL,
  ad varchar(255) ,
  soyad varchar(255) ,
  tel_no long ,
  mail varchar(255) ,
  foreign key (okul_no) references Öğrenci(okul_no)
 
);

create table Stok (
  stok_id int primary key,
  stok_türü varchar(255),
  miktar int,
  kurum_id int,
  foreign key (kurum_id) references EğitimKurumu(kurum_id)
);

create table Kullanır (
  ders_kodu int primary key,
  stok_id int,
  foreign key (ders_kodu) references Ders(ders_kodu),
  foreign key (stok_id) references Stok(stok_id)
);

create table AçılanDers (
  ders_kodu int primary key,
  kontenjan int,
  talep int,
  foreign key (ders_kodu) references Ders(ders_kodu)

);

create table AçılanDersGünleri (
  gün_id int primary key,
  gün varchar(255)

);

create table AçılanDersZamanları (
  ders_kodu int primary key,
  gün_id int,
  saat time,
  foreign key (ders_kodu) references AçılanDers(ders_kodu),
  foreign key (gün_id) references AçılanDersGünleri(gün_id)

);

create table Personel (
  personel_id int primary key,
  ad varchar(255) ,
  soyad varchar(255) ,
  tc_kimlik long ,
  tel_no long ,
  mail varchar(255) ,
  adres varchar(255) ,
  maaş int ,
  kurum_id int ,
  foreign key (kurum_id) references EğitimKurumu(kurum_id)
  
);

create table DersiVerir (
  ders_kodu int ,
  personel_id int,
  primary key(ders_kodu,personel_id),
  foreign key (ders_kodu) references AçılanDers(ders_kodu),
  foreign key (personel_id) references Personel(personel_id)
);





create table KurumGiderleri (
  gider_id int primary key,
  gider varchar(255),
  tutar int,
  kurum_id int ,
  foreign key (kurum_id) references EğitimKurumu(kurum_id)
  
);





create table İdariPersonel (
  personel_id int primary key,
  foreign key (personel_id) references Personel(personel_id)
  
);

create table TemizlikPersoneli (
  personel_id int primary key,
  foreign key (personel_id) references Personel(personel_id)
  
);

create table Öğretmen (
  personel_id int primary key,
  foreign key (personel_id) references Personel(personel_id)
);

create table FullTimeÇalışan (
  personel_id int primary key,
  foreign key (personel_id) references Personel(personel_id)
);

create table PartTimeÇalışan (
  personel_id int primary key,
  foreign key (personel_id) references Personel(personel_id)
);

create table PartTimeMüsaitSaatler (
  id int primary key,
  saat time
  
);

create table PartTimeMüsaitlikDurumu (
  personel_id int primary key,
  gün varchar(255),
  saat_id int,
  foreign key (personel_id) references PartTimeÇalışan(personel_id),
  foreign key (saat_id) references PartTimeMüsaitSaatler(id)
);

insert into EğitimKurumu values(6530,'TOBBETÜ','SÖĞÜTÖZÜANKARA');

insert into Öğrenci values(1,'Elif','Yılmaz','1998-04-15','elifyilmaz@gmail.com',5931892251,3,'İstanbul/Beyoğlu/Galata',1,6530,80375008223);

insert into Öğrenci values(2,'Mehmet','Kaya','1999-11-05','mehmetkaya@gmail.com',5759178203,1,'Ankara/Yenimahalle/Batıkent',0,6530,17882879179);

insert into Öğrenci values(3,'Zeynep','Demir','1998-02-10','zeynepdemir@gmail.com',5427966392,2,'İzmir/Karşıyaka/Çiğli',0,6530,77754433082);

insert into Öğrenci values(4,'Ali','Şahin','1997-12-30','alisahin@gmail.com',5768935748,4,'Bursa/Nilüfer/Görükle',0,6530,46144247999);

insert into Öğrenci values(5,'Ayşe','Öztürk','1998-01-03','ayseozturk@gmail.com',5935785829,1,'Antalya/Kepez/Varsak',0,6530,16690002114);

insert into Öğrenci values(6,'Mustafa','Aydın','1999-06-25','mustafaaydin@gmail.com',5388193600,3,'Adana/Seyhan/Yeşilevler',1,6530,19875376611);

insert into Öğrenci values(7,'Fatma','Yıldız','1998-05-14','fatmayildiz@gmail.com',5904210525,2,'Konya/Meram/Yenidoğan',0,6530,24546372785);

insert into Öğrenci values(8,'Ahmet','Erdoğan','1997-11-09','ahmeterdogan@gmail.com',5314853937,4,'Kayseri/Kocasinan/Mimarsinan',0,6530,49639751506);

insert into Öğrenci values(9,'Esra','Aksoy','2002-08-02','esraaksoy@gmail.com',5973415613,1,'Trabzon/Yomra/Akçaabat',0,6530,26359302480);

insert into Öğrenci values(10,'Furkan','Çelik','2002-01-29','furkancelik@gmail.com',5108965338,3,'Eskişehir/Odunpazarı/Tepebaşı',1,6530,24202167026);

insert into Öğrenci values(11,'İrem','Tekin','2002-06-21','iremtekin@gmail.com',5279914245,2,'Gaziantep/Şahinbey/Oğuzeli',1,6530,16718610905);

insert into Öğrenci values(12,'Burak','Kılıç','2002-11-14','burakkilic@gmail.com',5747007965,1,'Diyarbakır/Bağlar/Ofis',1,6530,35410437716);

insert into Öğrenci values(13,'Damla','Altun','2002-03-05','damlaaltun@gmail.com',5725500711,4,'Kocaeli/İzmit/Başiskele',0,6530,42765643481);

insert into Öğrenci values(14,'Onur','Aslan','2002-10-17','onuraslan@gmail.com',5358005399,1,'Sakarya/Serdivan/Erenler',1,6530,59775420311);

insert into Öğrenci values(15,'Gizem','Özdemir','2002-04-30','gizemozdemir@gmail.com',5469086690,3,'Mersin/Akdeniz/Çilek',0,6530,43911638377);

insert into Öğrenci values(16,'Emre','Kocaman','2002-09-12','emrekocaman@gmail.com',5123808623,2,'Samsun/Atakum/İlkadım',1,6530,53204962188);

insert into Öğrenci values(17,'Selin','Korkmaz','2002-07-25','selinkorkmaz@gmail.com',5505169396,4,'Denizli/Merkezefendi/Fatih',1,6530,87425574887);

insert into Öğrenci values(18,'Ege','Uçar','2002-02-08','egeucar@gmail.com',5278286674,1,'Kahramanmaraş/Dulkadiroğlu/Onikişubat',1,6530,93502328945);

insert into Öğrenci values(19,'Deniz','Güler','2002-12-13','denizguler@gmail.com',5228859066,3,'Hatay/Antakya/İskenderun',1,6530,40773741289);

insert into Öğrenci values(20,'Ece','Şen','2002-05-16','ecesen@gmail.com',5210073759,2,'Malatya/Yeşilyurt/Akçadağ',0,6530,24117025096);

insert into Öğrenci values(21,'Cem','Ayhan','2002-08-12','cemayhan@gmail.com',5545211510,1,'Manisa/Şehzadeler/Yunusemre',0,6530,42590408548);

insert into Öğrenci values(22,'Yasmin','Yalın','2002-01-04','yasminyalin@gmail.com',5435846166,4,'Trabzon/Ortahisar/Soğuksu',1,6530,60540426425);

insert into Öğrenci values(23,'Baran','Yavuz','2002-06-17','baranyavuz@gmail.com',5745340791,1,'Muğla/Bodrum/Turgutreis',1,6530,93411342011);

insert into Öğrenci values(24,'Aslı','Kuru','2002-11-10','aslikuru@gmail.com',5908964072,3,'Tekirdağ/Çorlu/Barbaros',1,6530,3443568065);

insert into Öğrenci values(25,'Umut','Yaman','2002-03-18','umutyaman@gmail.com',5569730898,2,'Edirne/Merkez/Sarayiçi',0,6530,54478553475);

insert into Öğrenci values(26,'Cansu','Çetin','2002-10-04','cansucetin@gmail.com',5407505523,4,'Zonguldak/Merkez/Ereğli',1,6530,66421118500);

insert into Öğrenci values(27,'Emir','Alp','2002-05-05','emiralp@gmail.com',5915590337,1,'Balıkesir/Altıeylül/Karesi',0,6530,5680589760);

insert into Öğrenci values(28,'Aylin','Yılmazer','2002-08-30','aylinyilmazer@gmail.com',5730672888,3,'Çanakkale/Merkez/Lapseki',0,6530,5005340092);

insert into Öğrenci values(29,'Arda','Bulut','2002-01-17','ardabulut@gmail.com',5245535789,2,'Afyonkarahisar/Merkez/Sandıklı',0,6530,60503663810);

insert into Öğrenci values(30,'İlayda','Koç','2002-06-30','ilaydakoc@gmail.com',5552249289,1,'Uşak/Merkez/Eşme',0,6530,11456333222);

insert into Öğrenci values(31,'Can','Özkan','1998-09-01','canozkan@gmail.com',5253800647,4,'Aksaray/Merkez/Güzelyurt',0,6530,1220841079);

insert into Öğrenci values(32,'Dilara','Aktaş','1999-05-11','dilaraaktas@gmail.com',5552711931,1,'Kütahya/Merkez/Simav',0,6530,62361026911);

insert into Öğrenci values(33,'Kaan','Oğuz','1998-12-11','kaanoguz@gmail.com',5396991267,3,'Kırıkkale/Merkez/Delice',1,6530,29927270707);

insert into Öğrenci values(34,'Büşra','Özçelik','1997-05-24','busraozcelik@gmail.com',5840978389,2,'Düzce/Merkez/Akçakoca',0,6530,28873800759);

insert into Öğrenci values(35,'Koray','Kara','1998-04-17','koraykara@gmail.com',5597176556,4,'Sinop/Merkez/Ayancık',0,6530,29512424720);

insert into Öğrenci values(36,'Melis','Gül','1999-02-08','melisgul@gmail.com',5669221084,1,'Bartın/Merkez/Ulus',0,6530,23076649649);

insert into Öğrenci values(37,'Serkan','Demirtaş','1997-10-29','serkandemirtas@gmail.com',5702283069,3,'Kırşehir/Merkez/Çiçekdağı',0,6530,26013407622);

insert into Öğrenci values(38,'İpek','Tuncer','1998-01-07','ipektuncer@gmail.com',5578636927,2,'Kastamonu/Merkez/Taşköprü',0,6530,66418640417);

insert into Öğrenci values(39,'Hüseyin','Tanrıverdi','1999-07-16','huseyintanriverdi@gmail.com',5942016882,1,'Çankırı/Merkez/Ilgaz',1,6530,76082836178);

insert into Öğrenci values(40,'ElifNur','Yücel','1997-08-12','elifnuryucel@gmail.com',5666687660,4,'Karabük/Merkez/Safranbolu',1,6530,46456104285);

insert into Öğrenci values(41,'Kadir','Turan','1998-06-23','kadirturan@gmail.com',5643233427,1,'Bayburt/Merkez/Aydıntepe',0,6530,98889868577);

insert into Öğrenci values(42,'Bengü','Güneş','1999-03-26','bengugunes@gmail.com',5518229491,3,'Gümüşhane/Merkez/Kelkit',0,6530,18452855683);

insert into Öğrenci values(43,'Emirhan','Gür','1998-09-05','emirhangur@gmail.com',5419296778,2,'Artvin/Merkez/Hopa',1,6530,18895893200);

insert into Öğrenci values(44,'Nazlı','Arslan','1997-11-22','nazliarslan@gmail.com',5931213924,4,'Ardahan/Merkez/Göle',0,6530,17794413927);

insert into Öğrenci values(45,'Bilge','Sağlam','1999-01-29','bilgesaglam@gmail.com',5683138379,1,'Iğdır/Merkez/Tuzluca',1,6530,89531627732);

insert into Öğrenci values(46,'Serhat','Öztürk','1997-05-01','serhatozturk@gmail.com',5747017937,3,'Tunceli/Merkez/Ovacık',0,6530,47331071598);

insert into Öğrenci values(47,'Tuğçe','Köse','1998-02-25','tugcekose@gmail.com',5387721908,2,'Bingöl/Merkez/Genç',1,6530,35597879816);

insert into Öğrenci values(48,'Taha','Ekinci','1999-11-28','tahaekinci@gmail.com',5956726315,1,'Bitlis/Merkez/Adilcevaz',1,6530,24503971388);

insert into Öğrenci values(49,'Sude','Taş','1997-06-06','sudetas@gmail.com',5581009446,4,'Siirt/Merkez/Kurtalan',0,6530,59661244798);

insert into Öğrenci values(50,'Alp','Eren','1998-07-26','alperen@gmail.com',5365312885,1,'Hakkâri/Merkez/Yüksekova',0,6530,84002425294);

insert into Öğrenci values(51,'Gül','Yıldırım','1999-04-06','gulyildirim@gmail.com',5572773598,3,'Şırnak/Merkez/Silopi',0,6530,15653615462);

insert into Öğrenci values(52,'Burcu','Özgür','1997-08-16','burcuozgur@gmail.com',5271115377,2,'Batman/Merkez/Beşiri',0,6530,9965546186);

insert into Öğrenci values(53,'Tayyar','Ateş','1998-11-16','tayyarates@gmail.com',5485678073,4,'Van/Merkez/Edremit',1,6530,28750193595);

insert into Öğrenci values(54,'İdil','Ay','1999-09-13','idilay@gmail.com',5691191546,1,'Muş/Merkez/Malazgirt',0,6530,86866047583);

insert into Öğrenci values(55,'Efe','Şimşek','1997-01-20','efesimsek@gmail.com',5481109708,3,'Ağrı/Merkez/Doğubeyazıt',0,6530,24292056843);

insert into Öğrenci values(56,'Melike','Akman','1998-10-05','melikeakman@gmail.com',5136498331,2,'Kars/Merkez/Digor',0,6530,5979240079);

insert into Öğrenci values(57,'Yiğit','Toprak','1999-06-19','yigittoprak@gmail.com',5192896490,1,'Erzurum/Palandöken/Yakutiye',0,6530,35165828494);

insert into Öğrenci values(58,'Asena','Çolak','1997-10-02','asenacolak@gmail.com',5429130598,4,'Erzincan/Merkez/Kemaliye',1,6530,64713284220);

insert into Öğrenci values(59,'Alper','Türe','1998-01-11','alperture@gmail.com',5218656935,1,'Tunceli/Merkez/Mazgirt',1,6530,36823393799);

insert into Öğrenci values(60,'Melisa','Alkan','1999-07-21','melisaalkan@gmail.com',5110208012,3,'Elazığ/Merkez/Harput',1,6530,28064730084);

insert into Öğrenci values(61,'Orhan','Kurt','1997-02-24','orhankurt@gmail.com',5834995228,2,'Şanlıurfa/Eyyübiye/Haliliye',1,6530,57606712334);

insert into Öğrenci values(62,'Aysu','Ertaş','1998-12-16','aysuertas@gmail.com',5591592452,4,'Diyarbakır/Sur/Bağlarbaşı',0,6530,71556671194);

insert into Öğrenci values(63,'Arif','Gündüz','1999-08-10','arifgunduz@gmail.com',5136954051,1,'Mardin/Artuklu/Kızıltepe',0,6530,85124115724);

insert into Öğrenci values(64,'Eylül','Er','1997-04-30','eyluler@gmail.com',5733369263,3,'Batman/Merkez/Hasankeyf',1,6530,40829924895);

insert into Öğrenci values(65,'Murat','Çınar','1998-09-15','muratcinar@gmail.com',5825216772,2,'Siirt/Pervari/Kurtalan',1,6530,88436756675);

insert into Öğrenci values(66,'Ceren','Tunç','1999-02-01','cerentunc@gmail.com',5784440714,1,'Bitlis/Tatvan/Adilcevaz',0,6530,51826655990);

insert into Öğrenci values(67,'Kaan','Gürsoy','1997-11-29','kaangursoy@gmail.com',5310754249,4,'Bingöl/Yedisu/Solhan',1,6530,9061092524);

insert into Öğrenci values(68,'Zehra','Gürbüz','1998-11-11','zehragurbuz@gmail.com',5444356787,1,'Şırnak/Cizre/Silopi',0,6530,46212576215);

insert into Öğrenci values(69,'Berk','Tuncel','1999-09-23','berktuncel@gmail.com',5252617474,3,'Hakkâri/Yüksekova/Şemdinli',0,6530,80076579412);

insert into Öğrenci values(70,'Ela','Doğan','1997-05-05','eladogan@gmail.com',5843681260,2,'Van/Gevaş/Erciş',1,6530,79528943404);

insert into Öğrenci values(71,'Selçuk','Şahin','1998-03-14','selcuksahin@gmail.com',5367703199,4,'Muş/Bulanık/Varto',1,6530,43881893851);

insert into Öğrenci values(72,'İdil','Aydın','1999-10-01','idilaydin@gmail.com',5470126488,1,'Ağrı/Diyadin/Doğubeyazıt',0,6530,90857065465);

insert into Öğrenci values(73,'Mert','Sarı','1997-02-28','mertsari@gmail.com',5352912168,3,'Kars/Sarıkamış/Ardahan',1,6530,7939170667);

insert into Öğrenci values(74,'Sare','Atalay','1998-12-21','sareatalay@gmail.com',5282644807,2,'Erzurum/Oltu/Horasan',1,6530,53594954766);

insert into Öğrenci values(75,'Ömer','Sezer','1999-08-14','omersezer@gmail.com',5177215045,1,'Erzincan/Üzümlü/Tercan',1,6530,56528691741);

insert into Öğrenci values(76,'Yasemin','Sönmez','1997-04-05','yaseminsonmez@gmail.com',5211065408,4,'Bayburt/Demirözü/İspir',0,6530,15795246529);

insert into Öğrenci values(77,'Caner','Kurtuluş','1998-11-19','canerkurtulus@gmail.com',5736061788,1,'Gümüşhane/Kelkit/Köse',0,6530,47725683416);

insert into Öğrenci values(78,'Nisa','Erkan','1999-09-18','nisaerkan@gmail.com',5280134640,3,'Artvin/Hopa/Murgul',1,6530,45903725755);

insert into Öğrenci values(79,'Kaya','Altay','1997-01-26','kayaaltay@gmail.com',5395410468,2,'Ardahan/Göle/Damal',0,6530,89057897255);

insert into Öğrenci values(80,'Zara','Yurt','1998-10-09','zarayurt@gmail.com',5327449807,4,'Iğdır/Tuzluca/Karakoyunlu',1,6530,56228612296);

insert into Öğrenci values(81,'Serdar','Karadağ','1999-06-30','serdarkaradag@gmail.com',5536815118,1,'Tunceli/Ovacık/Nazımiye',0,6530,24329103629);

insert into Öğrenci values(82,'Simge','Şeker','1997-06-15','simgeseker@gmail.com',5679434912,3,'Bingöl/Genç/Adaklı',0,6530,92256427594);

insert into Öğrenci values(83,'Kuzey','Aslan','1998-05-02','kuzeyaslan@gmail.com',5451680845,2,'Bitlis/Adilcevaz/Ahlat',1,6530,88857838905);

insert into Öğrenci values(84,'Betül','Kılınç','1999-02-25','betulkilinc@gmail.com',5158715494,1,'Siirt/Kurtalan/Eruh',1,6530,82297751031);

insert into Öğrenci values(85,'Uğur','Çavdar','1997-12-08','ugurcavdar@gmail.com',5662351206,4,'Hakkâri/Şemdinli/Çukurca',0,6530,43170874466);

insert into Öğrenci values(86,'Sıla','Çam','1998-07-31','silacam@gmail.com',5854367723,1,'Şırnak/Silopi/İdil',1,6530,84436212227);

insert into Öğrenci values(87,'Tarkan','Erbil','1999-04-10','tarkanerbil@gmail.com',5844166092,3,'Batman/Beşiri/Kozluk',1,6530,21263798563);

insert into Öğrenci values(88,'Berfin','Varol','1997-08-20','berfinvarol@gmail.com',5956228381,2,'Van/Edremit/Çaldıran',1,6530,33693404903);

insert into Öğrenci values(89,'Eray','Yüksel','1998-01-15','erayyuksel@gmail.com',5924473333,4,'Muş/Malazgirt/Varto',1,6530,20976407023);

insert into Öğrenci values(90,'Aybike','Doğru','1999-07-25','aybikedogru@gmail.com',5274830547,1,'Ağrı/Doğubeyazıt/Diyadin',0,6530,58708359649);

insert into Öğrenci values(91,'Özgür','Gönül','1997-10-07','ozgurgonul@gmail.com',5598498003,3,'Kars/Digor/Sarıkamış',0,6530,83727852554);

insert into Öğrenci values(92,'ElifGizem','Kıran','1998-06-26','elifgizemkiran@gmail.com',5543320302,2,'Erzurum/Yakutiye/Palandöken',0,6530,77920218773);

insert into Öğrenci values(93,'Onurcan','Yavuz','1999-03-29','onurcanyavuz@gmail.com',5922858729,1,'Erzincan/Kemaliye/Refahiye',1,6530,63745894421);

insert into Öğrenci values(94,'Duygu','Yılmaz','1997-11-02','duyguyilmaz@gmail.com',5745651536,4,'Bayburt/İspir/Demirözü',0,6530,50793975972);

insert into Öğrenci values(95,'Oktay','Yalçın','1998-09-08','oktayyalcin@gmail.com',5524242229,1,'Gümüşhane/Köse/Şiran',1,6530,80839135306);

insert into Öğrenci values(96,'İlay','Can','1999-01-30','ilaycan@gmail.com',5429917710,3,'Artvin/Murgul/Hopa',0,6530,81817372194);

insert into Öğrenci values(97,'Furkan','Yurtsever','1997-05-06','furkanyurtsever@gmail.com',5939689955,2,'Ardahan/Damal/Göle',1,6530,11660973350);

insert into Öğrenci values(98,'Ceyda','Keleş','1998-03-18','ceydakeles@gmail.com',5506994667,4,'Iğdır/Karakoyunlu/Tuzluca',0,6530,74242852775);

insert into Öğrenci values(99,'Rüzgar','Bektaş','1999-10-11','ruzgarbektas@gmail.com',5971079691,1,'Tunceli/Nazımiye/Ovacık',0,6530,43800318602);

insert into Öğrenci values(100,'Cemre','Duman','1997-02-23','cemreduman@gmail.com',5338086248,3,'Bingöl/Adaklı/Genç',1,6530,30923992200);

insert into Öğrenci values(101,'Deniz','Duran','1998-12-17','denizduran@gmail.com',5817217728,2,'İstanbul/Üsküdar/Kuzguncuk',0,6530,74287733559);

insert into Öğrenci values(102,'Levent','Tekin','1999-08-11','leventtekin@gmail.com',5651909323,1,'Ankara/Keçiören/Şehitler',1,6530,89199381114);

insert into Öğrenci values(103,'Beril','Yeşil','1997-04-29','berilyesil@gmail.com',5155326592,4,'İzmir/Buca/Şirinyer',0,6530,40681907631);

insert into Öğrenci values(104,'Alp','Eren','1998-11-10','alpereren@gmail.com',5734596187,1,'Bursa/Gürsu/Hasanağa',0,6530,65560213533);

insert into Öğrenci values(105,'Zara','Orhan','1999-09-13','zaraorhan@gmail.com',5235315943,3,'Antalya/Konyaaltı/Liman',0,6530,55059134911);

insert into Öğrenci values(106,'Burhan','Özen','1997-01-18','burhanozen@gmail.com',5743136532,2,'Adana/Çukurova/Atakent',1,6530,11365335681);

insert into Öğrenci values(107,'Selma','Bulut','1998-10-03','selmabulut@gmail.com',5164022991,4,'Konya/Karatay/Şems',0,6530,45509078916);

insert into Öğrenci values(108,'Hakan','Özkan','1999-06-16','hakanozkan@gmail.com',5235046047,1,'Kayseri/Talas/Erciyes',1,6530,65096583432);

insert into Öğrenci values(109,'ElifSu','Koç','1997-06-08','elifsukoc@gmail.com',5551374827,3,'Trabzon/Akçaabat/Akçakale',0,6530,69021221104);

insert into Öğrenci values(110,'Serdar','Altın','1998-05-25','serdaraltin@gmail.com',5552336040,2,'Eskişehir/Odunpazarı/YunusEmre',0,6530,5835418315);

insert into Öğrenci values(111,'Cemre','Çelik','1999-02-18','cemrecelik@gmail.com',5642968338,1,'Gaziantep/Şahinbey/Şehitkamil',0,6530,67798491812);

insert into Öğrenci values(112,'Ahmetcan','Güneş','1997-12-05','ahmetcangunes@gmail.com',5561626501,4,'Diyarbakır/Yenişehir/Kayapınar',1,6530,53929387929);

insert into Öğrenci values(113,'Bengisu','Yıldız','1998-07-28','bengisuyildiz@gmail.com',5490589351,1,'Kocaeli/Gebze/Darıca',0,6530,29949735316);

insert into Öğrenci values(114,'Ferhat','Doğan','1999-04-01','ferhatdogan@gmail.com',5330181375,3,'Sakarya/Serdivan/Serdivan',0,6530,97449059873);

insert into Öğrenci values(115,'Büşra','Arı','1997-08-22','busraari@gmail.com',5353408749,2,'Mersin/Mezitli/Çamlıbel',0,6530,34096975610);

insert into Öğrenci values(116,'Alican','Korkmaz','1998-01-17','alicankorkmaz@gmail.com',5304413374,4,'Samsun/Atakum/Atakum',0,6530,53583725944);

insert into Öğrenci values(117,'İrem','Kılıç','1999-07-20','iremkilic@gmail.com',5956736446,1,'Denizli/Pamukkale/Çamlaraltı',0,6530,88788687627);

insert into Öğrenci values(118,'Burcu','Aksoy','1997-10-04','burcuaksoy@gmail.com',5295702243,3,'Kahramanmaraş/Onikişubat/Dulkadiroğlu',1,6530,13277626950);

insert into Öğrenci values(119,'Yavuz','Demir','1998-06-29','yavuzdemir@gmail.com',5965646792,2,'Hatay/İskenderun/Belen',0,6530,16426409809);

insert into Öğrenci values(120,'Melike','Avcı','1999-03-22','melikeavci@gmail.com',5878549561,1,'Malatya/Yeşilyurt/Yeşilyurt',0,6530,29250129552);

insert into Öğrenci values(121,'Tolga','Akbaş','1997-11-14','tolgaakbas@gmail.com',5757589318,4,'Manisa/Akhisar/Cumhuriyet',0,6530,31909934193);

insert into Öğrenci values(122,'Şeyma','Kır','1998-09-07','seymakir@gmail.com',5782164751,1,'Trabzon/Ortahisar/Ortahisar',1,6530,84387322452);

insert into Öğrenci values(123,'Canberk','Kılıç','1999-01-30','canberkkilic@gmail.com',5150749096,3,'Muğla/Fethiye/Karaculha',0,6530,48883242501);

insert into Öğrenci values(124,'Zehra','Akıncı','1997-05-06','zehraakinci@gmail.com',5186340070,2,'Tekirdağ/Çorlu/Velimeşe',1,6530,94883438464);

insert into Öğrenci values(125,'Batuhan','Kurt','1998-03-19','batuhankurt@gmail.com',5138897492,4,'Edirne/Keşan/Kavaklı',0,6530,21938835847);

insert into Öğrenci values(126,'Zümra','Kaya','1999-10-12','zumrakaya@gmail.com',5556063633,1,'Zonguldak/Ereğli/Kandilli',0,6530,47937283299);

insert into Öğrenci values(127,'Ege','Öztürk','1997-02-03','egeozturk@gmail.com',5594816317,3,'Balıkesir/Altıeylül/Şehzadeler',1,6530,81521876342);

insert into Öğrenci values(128,'Yasemin','Aksu','1998-12-27','yaseminaksu@gmail.com',5115816313,2,'Çanakkale/Biga/Boğazkale',1,6530,97471821285);

insert into Öğrenci values(129,'Berkay','Ay','1999-08-21','berkayay@gmail.com',5194018770,1,'Afyonkarahisar/Merkez/Şuhut',1,6530,19129760302);

insert into Öğrenci values(130,'Ceren','Erdoğan','1997-04-10','cerenerdogan@gmail.com',5174106408,4,'Uşak/Banaz/Eşme',0,6530,71401787673);

insert into Öğrenci values(131,'Deniz','Yalın','1998-11-13','denizyalin@gmail.com',5911683838,1,'Aksaray/Merkez/Sultanhanı',1,6530,35705311891);

insert into Öğrenci values(132,'Esila','Şahin','1999-09-16','esilasahin@gmail.com',5739668176,3,'Kütahya/Eskişehir/Tavşanlı',1,6530,18301653084);

insert into Öğrenci values(133,'Alperen','Gür','1997-01-22','alperengur@gmail.com',5228639253,2,'Kırıkkale/Delice/Karakeçili',0,6530,27517204987);

insert into Öğrenci values(134,'Esra','Altun','1998-10-07','esraaltun@gmail.com',5868390895,4,'Düzce/Akçakoca/Kaynaşlı',1,6530,71504882143);

insert into Öğrenci values(135,'Emre','Çolak','1999-06-26','emrecolak@gmail.com',5707874701,1,'Sinop/Ayancık/Erfelek',0,6530,63728022140);

insert into Öğrenci values(136,'Elifnaz','Akman','1997-06-21','elifnazakman@gmail.com',5691106473,3,'Bartın/Ulus/Amasra',1,6530,44272791526);

insert into Öğrenci values(137,'Kerem','Ayhan','1998-05-08','keremayhan@gmail.com',5830388944,2,'Kırşehir/Çiçekdağı/Akpınar',0,6530,34536066284);

insert into Öğrenci values(138,'Gözde','Tuncer','1999-02-01','gozdetuncer@gmail.com',5688991327,1,'Kastamonu/Devrekani/İnebolu',1,6530,36606441067);

insert into Öğrenci values(139,'Mustafa','Kocaman','1997-12-02','mustafakocaman@gmail.com',5147385313,4,'Çankırı/Ilgaz/Eldivan',1,6530,71505674936);

insert into Öğrenci values(140,'Aysel','Kılıç','1998-07-25','ayselkilic@gmail.com',5156899411,1,'Karabük/Eskipazar/Ovacık',1,6530,96640461191);

insert into Öğrenci values(141,'Kaan','Alp','1999-04-08','kaanalp@gmail.com',5562691890,3,'Bayburt/Demirözü/Aydıntepe',0,6530,89267403696);

insert into Öğrenci values(142,'Sude','Yılmazer','1997-08-18','sudeyilmazer@gmail.com',5823667854,2,'Gümüşhane/Şiran/Kürtün',0,6530,88493485281);

insert into Öğrenci values(143,'Doğan','Kuru','1998-01-13','dogankuru@gmail.com',5219767049,4,'Artvin/Murgul/Hopa',1,6530,89959138437);

insert into Öğrenci values(144,'Betül','Yaman','1999-07-18','betulyaman@gmail.com',5357439796,1,'Ardahan/Göle/Damal',1,6530,44532399419);

insert into Öğrenci values(145,'Emirhan','Koç','1997-10-11','emirhankoc@gmail.com',5562228351,3,'Iğdır/Tuzluca/Karakoyunlu',0,6530,38833060081);

insert into Öğrenci values(146,'Aslıhan','Aktaş','1998-06-14','aslihanaktas@gmail.com',5789068716,2,'Tunceli/Ovacık/Nazımiye',0,6530,92637662017);

insert into Öğrenci values(147,'Arda','Bulut','1999-03-17','ardabulut@gmail.com',5207692422,1,'Bingöl/Genç/Adaklı',0,6530,55334768477);

insert into Öğrenci values(148,'Şimal','Yavuz','1997-11-21','simalyavuz@gmail.com',5356608680,4,'Bitlis/Ahlat/Tatvan',1,6530,27389982085);

insert into Öğrenci values(149,'Kaya','Özkan','1998-09-04','kayaozkan@gmail.com',5966113325,1,'Siirt/Kurtalan/Pervari',1,6530,99146419022);

insert into Öğrenci values(150,'Büşra','Çetin','1999-01-26','busracetin@gmail.com',5422713977,3,'Hakkâri/Şemdinli/Çukurca',1,6530,30121353034);

insert into Öğrenci values(151,'Çağlar','Yıldırım','1997-05-04','caglaryildirim@gmail.com',5930153323,2,'Şırnak/İdil/Cizre',0,6530,48473084022);

insert into Öğrenci values(152,'Damla','Tanrıverdi','1998-03-15','damlatanriverdi@gmail.com',5279199776,4,'Batman/Kozluk/Beşiri',0,6530,62228044715);

insert into Öğrenci values(153,'Koray','Yücel','1999-10-08','korayyucel@gmail.com',5325416821,1,'Van/Çaldıran/Edremit',1,6530,49162894734);

insert into Öğrenci values(154,'Elif','Güler','1997-02-23','elifguler@gmail.com',5507972328,3,'Muş/Varto/Malazgirt',1,6530,32149736547);

insert into Öğrenci values(155,'Onur','Tuncer','1998-12-16','onurtuncer@gmail.com',5564950815,2,'Ağrı/Diyadin/Patnos',1,6530,47038882773);

insert into Öğrenci values(156,'Zeynep','Ayhan','1999-08-10','zeynepayhan@gmail.com',5884345994,1,'Kars/Digor/Kağızman',0,6530,53162307554);

insert into Öğrenci values(157,'Furkan','Yalın','1997-04-29','furkanyalin@gmail.com',5727137949,4,'Erzurum/Palandöken/Yakutiye',1,6530,77180123757);

insert into Öğrenci values(158,'Ayşe','Yavuz','1998-11-10','aysayavuz@gmail.com',5694660141,1,'Erzincan/Kemaliye/Refahiye',1,6530,65948688985);

insert into Öğrenci values(159,'Mustafa','Kuru','1999-09-13','mustafakuru@gmail.com',5912643410,3,'Bayburt/İspir/Demirözü',0,6530,75558869279);

insert into Öğrenci values(160,'Fatma','Yaman','1997-01-18','fatmayaman@gmail.com',5562348399,2,'Gümüşhane/Şiran/Kürtün',1,6530,17873481162);

insert into Öğrenci values(161,'Ahmet','Çetin','1998-10-03','ahmetcetin@gmail.com',5849169881,4,'Artvin/Hopa/Murgul',1,6530,27901690566);

insert into Öğrenci values(162,'Esra','Alp','1999-06-16','esraalp@gmail.com',5593149938,1,'Ardahan/Göle/Damal',1,6530,40931491242);

insert into Öğrenci values(163,'Furkan','Yılmazer','1997-06-13','furkanyilmazer@gmail.com',5673312192,3,'Iğdır/Karakoyunlu/Tuzluca',0,6530,13441785975);

insert into Öğrenci values(164,'İrem','Bulut','1998-05-30','irembulut@gmail.com',5590439532,2,'Tunceli/Ovacık/Nazımiye',0,6530,36601432472);

insert into Öğrenci values(165,'Burak','Aktaş','1999-02-23','burakaktas@gmail.com',5104529002,1,'Bingöl/Genç/Adaklı',1,6530,57769211967);

insert into Öğrenci values(166,'Damla','Koç','1997-12-16','damlakoc@gmail.com',5795089829,4,'Bitlis/Ahlat/Tatvan',0,6530,45568216377);

insert into Öğrenci values(167,'Onur','Yıldırım','1998-08-09','onuryildirim@gmail.com',5408885628,1,'Siirt/Kurtalan/Pervari',0,6530,30238454707);

insert into Öğrenci values(168,'Gizem','Tanrıverdi','1999-04-12','gizemtanriverdi@gmail.com',5454658880,3,'Hakkâri/Çukurca/Şemdinli',1,6530,23369964476);

insert into Öğrenci values(169,'Emre','Yücel','1997-08-24','emreyucel@gmail.com',5746335349,2,'Şırnak/İdil/Cizre',1,6530,2170091025);

insert into Öğrenci values(170,'Selin','Tuncer','1998-01-19','selintuncer@gmail.com',5397468953,4,'Batman/Kozluk/Beşiri',0,6530,43125313656);

insert into Öğrenci values(171,'Ege','Güler','1999-07-23','egeguler@gmail.com',5534414819,1,'Van/Çaldıran/Edremit',1,6530,19942731576);

insert into Öğrenci values(172,'Deniz','Ayhan','1997-10-09','denizayhan@gmail.com',5519174370,3,'Muş/Varto/Malazgirt',0,6530,99168020891);

insert into Öğrenci values(173,'Ece','Yalın','1998-07-02','eceyalin@gmail.com',5505764617,2,'Ağrı/Diyadin/Patnos',0,6530,21886100820);

insert into Öğrenci values(174,'Cem','Yavuz','1999-03-25','cemyavuz@gmail.com',5614002290,1,'Kars/Digor/Kağızman',0,6530,80707942369);

insert into Öğrenci values(175,'Yasmin','Kuru','1997-11-19','yasminguler@gmail.com',5127453548,4,'Erzurum/Palandöken/Yakutiye',0,6530,54807738939);

insert into Öğrenci values(176,'Baran','Yaman','1998-09-12','baranyaman@gmail.com',5416427767,1,'Erzincan/Kemaliye/Refahiye',1,6530,49892893375);

insert into Öğrenci values(177,'Aslı','Çetin','1999-01-24','aslibulut@gmail.com',5842701660,3,'Bayburt/İspir/Demirözü',0,6530,1029682599);

insert into Öğrenci values(178,'Umut','Alp','1997-05-09','umutalp@gmail.com',5820744760,2,'Gümüşhane/Şiran/Kürtün',1,6530,13833503742);

insert into Öğrenci values(179,'Cansu','Yılmazer','1998-03-22','cansuyilmazer@gmail.com',5711670382,4,'Artvin/Hopa/Murgul',0,6530,30312779465);

insert into Öğrenci values(180,'Emir','Bulut','1999-10-09','emirbulut@gmail.com',5953068673,1,'Ardahan/Göle/Damal',0,6530,26701452528);

insert into Öğrenci values(181,'Aylin','Aktaş','1997-02-27','aylinaktas@gmail.com',5446038619,3,'Iğdır/Karakoyunlu/Tuzluca',1,6530,33544170287);

insert into Öğrenci values(182,'Arda','Koç','1998-12-20','ardakoc@gmail.com',5647173142,2,'Tunceli/Ovacık/Nazımiye',0,6530,56258167944);

insert into Öğrenci values(183,'İlayda','Yıldırım','1999-08-13','ilaydaguler@gmail.com',5699577988,1,'Bingöl/Genç/Adaklı',1,6530,33728150491);

insert into Öğrenci values(184,'Can','Tanrıverdi','1997-04-08','canayhan@gmail.com',5701648295,4,'Bitlis/Ahlat/Tatvan',1,6530,71684810380);

insert into Öğrenci values(185,'Dilara','Yücel','1998-11-09','dilarayalin@gmail.com',5461369501,1,'Siirt/Kurtalan/Pervari',0,6530,10941419548);

insert into Öğrenci values(186,'Kaan','Güler','1999-09-12','kaanguler@gmail.com',5375997752,3,'Hakkâri/Çukurca/Şemdinli',1,6530,34516512508);

insert into Öğrenci values(187,'Büşra','Ayhan','1997-01-23','busraayhan@gmail.com',5132985411,2,'Şırnak/İdil/Cizre',0,6530,91488415706);

insert into Öğrenci values(188,'Koray','Yalın','1998-10-08','korayyalin@gmail.com',5855535539,4,'Batman/Kozluk/Beşiri',1,6530,57257052183);

insert into Öğrenci values(189,'Melis','Yavuz','1999-06-26','melisyavuz@gmail.com',5590868506,1,'Van/Çaldıran/Edremit',0,6530,84974626382);

insert into Öğrenci values(190,'Serkan','Kuru','1997-06-20','serkankuru@gmail.com',5132766855,3,'Muş/Varto/Malazgirt',1,6530,59895672167);

insert into Öğrenci values(191,'İpek','Yaman','1998-05-07','ipekyilmazer@gmail.com',5839665834,2,'Ağrı/Diyadin/Patnos',1,6530,54002006199);

insert into Öğrenci values(192,'Hüseyin','Çetin','1999-02-28','huseyinbulut@gmail.com',5527224786,1,'Kars/Digor/Kağızman',1,6530,14720587424);

insert into Öğrenci values(193,'ElifNur','Alp','1997-12-11','elifnuralp@gmail.com',5686302043,4,'Erzurum/Palandöken/Yakutiye',0,6530,54824396054);

insert into Öğrenci values(194,'Kadir','Yılmazer','1998-08-04','kadiryilmazer@gmail.com',5601022753,1,'Erzincan/Kemaliye/Refahiye',0,6530,59461680961);

insert into Öğrenci values(195,'Bengü','Bulut','1999-04-11','bengubulut@gmail.com',5567882935,3,'Bayburt/İspir/Demirözü',1,6530,22045651412);

insert into Öğrenci values(196,'Emirhan','Aktaş','1997-08-19','emirhanaktas@gmail.com',5767642818,2,'Gümüşhane/Şiran/Kürtün',0,6530,52897557940);

insert into Öğrenci values(197,'Nazlı','Koç','1998-01-14','nazlikoc@gmail.com',5782192305,4,'Artvin/Hopa/Murgul',0,6530,30909043428);

insert into Öğrenci values(198,'Bilge','Yıldırım','1999-07-17','bilgeyildirim@gmail.com',5416470400,1,'Ardahan/Göle/Damal',1,6530,61786674041);

insert into Öğrenci values(199,'Serhat','Tanrıverdi','1997-10-10','serhatayhan@gmail.com',5422954164,3,'Iğdır/Karakoyunlu/Tuzluca',0,6530,77782044379);

insert into Öğrenci values(200,'Tuğçe','Yücel','1998-07-01','tugceyucel@gmail.com',5902983498,2,'Tunceli/Ovacık/Nazımiye',0,6530,86849946550);

insert into Öğrenci values(201,'Taha','Güler','1999-03-14','tahaekinci@gmail.com',5434028116,1,'İstanbul/Kadıköy/Moda',1,6530,56720538851);

insert into Öğrenci values(202,'Sude','Ayhan','1997-11-18','sudeyas@gmail.com',5111507498,4,'Ankara/Mamak/Ege',1,6530,21505225741);

insert into Öğrenci values(203,'Alp','Yalın','1998-09-11','alperenalp@gmail.com',5480293209,1,'İzmir/Karabağlar/Çamlık',1,6530,56903250213);

insert into Öğrenci values(204,'Gül','Yavuz','1999-01-26','gulbulut@gmail.com',5220652423,3,'Bursa/Yıldırım/Demirtaş',0,6530,76894720535);

insert into Öğrenci values(205,'Burcu','Kuru','1997-05-04','burcuozgur@gmail.com',5316340835,2,'Antalya/Muratpaşa/Liman',0,6530,51940718184);

insert into Öğrenci values(206,'Tayyar','Yaman','1998-03-17','tayyarates@gmail.com',5888402909,4,'Adana/Seyhan/Çınarlı',1,6530,82160472611);

insert into Öğrenci values(207,'İdil','Çetin','1999-10-11','idilay@gmail.com',5678078069,1,'Konya/Meram/Aksu',0,6530,99533221999);

insert into Öğrenci values(208,'Efe','Alp','1997-02-23','efealp@gmail.com',5206982288,3,'Kayseri/Kocasinan/Talas',1,6530,33655162324);

insert into Öğrenci values(209,'Melike','Yılmazer','1998-12-17','melikeyilmazer@gmail.com',5534617563,2,'Trabzon/Ortahisar/Soğuksu',0,6530,47723131112);

insert into Öğrenci values(210,'Yiğit','Bulut','1999-08-11','yigitbulut@gmail.com',5140680396,1,'Eskişehir/Tepebaşı/Atatürk',1,6530,21081910055);

insert into Öğrenci values(211,'Asena','Aktaş','1997-04-29','asenatanriverdi@gmail.com',5459021300,4,'Gaziantep/Oğuzeli/Şahinbey',1,6530,15664552572);

insert into Öğrenci values(212,'Alper','Koç','1998-11-10','alperture@gmail.com',5963236053,1,'Diyarbakır/Bağlar/Ofis',0,6530,39082537737);

insert into Öğrenci values(213,'Melisa','Yıldırım','1999-09-13','melisaalkan@gmail.com',5115919546,3,'Kocaeli/Başiskele/Yuvacık',0,6530,37829826340);

insert into Öğrenci values(214,'Orhan','Tanrıverdi','1997-01-18','orhankurt@gmail.com',5311870247,2,'Sakarya/Adapazarı/Akarca',0,6530,99692251104);

insert into Öğrenci values(215,'Aysu','Yücel','1998-10-03','aysuertas@gmail.com',5400347500,4,'Mersin/Toroslar/Akdeniz',0,6530,58141205393);

insert into Öğrenci values(216,'Arif','Güler','1999-06-16','arifgunduz@gmail.com',5693893896,1,'Samsun/İlkadım/Atakum',0,6530,28558752804);

insert into Öğrenci values(217,'Eylül','Ayhan','1997-06-08','eyluler@gmail.com',5604350573,3,'Denizli/Merkezefendi/Gazi',1,6530,34870266374);

insert into Öğrenci values(218,'Murat','Yalın','1998-05-25','muratcinar@gmail.com',5561564407,2,'Kahramanmaraş/Dulkadiroğlu/Türkoğlu',0,6530,44834055821);

insert into Öğrenci values(219,'Ceren','Yavuz','1999-02-18','cerentunc@gmail.com',5909401888,1,'Hatay/Antakya/Arsuz',0,6530,48892319208);

insert into Öğrenci values(220,'Kaan','Kuru','1997-12-05','kaangursoy@gmail.com',5845886958,4,'Malatya/Battalgazi/Hekimhan',1,6530,89099093366);

insert into Öğrenci values(221,'Zehra','Yaman','1998-07-28','zehragurbuz@gmail.com',5800712236,1,'Manisa/Şehzadeler/Yunusemre',0,6530,84228681584);

insert into Öğrenci values(222,'Berk','Çetin','1999-04-01','berktuncel@gmail.com',5253925535,3,'Trabzon/Yomra/Araklı',1,6530,89052130787);

insert into Öğrenci values(223,'Ela','Alp','1997-08-22','eladogan@gmail.com',5994365296,2,'Muğla/Bodrum/Gümbet',0,6530,61252207109);

insert into Öğrenci values(224,'Selçuk','Yılmazer','1998-01-17','selcuksahin@gmail.com',5290393277,4,'Tekirdağ/Süleymanpaşa/Barbaros',1,6530,42688584722);

insert into Öğrenci values(225,'İdil','Bulut','1999-07-20','idilaydin@gmail.com',5517199329,1,'Edirne/Merkez/Kaleiçi',0,6530,40664271670);

insert into Öğrenci values(226,'Mert','Aktaş','1997-10-04','mertsari@gmail.com',5545983930,3,'Zonguldak/Merkez/Kilimli',0,6530,12538756748);

insert into Öğrenci values(227,'Sare','Koç','1998-06-29','sareatalay@gmail.com',5192341170,2,'Balıkesir/Altıeylül/Karesi',1,6530,44893048335);

insert into Öğrenci values(228,'Ömer','Yıldırım','1999-03-22','omersezer@gmail.com',5190994035,1,'Çanakkale/Merkez/Gökçeada',0,6530,68331864782);

insert into Öğrenci values(229,'Yasemin','Tanrıverdi','1997-11-14','yaseminsonmez@gmail.com',5225648460,4,'Afyonkarahisar/Merkez/Sandıklı',0,6530,60310555300);

insert into Öğrenci values(230,'Caner','Yücel','1998-09-07','canerkurtulus@gmail.com',5622644950,1,'Uşak/Merkez/Ulubey',0,6530,44405273325);

insert into Öğrenci values(231,'Nisa','Güler','1999-01-30','nisaerkan@gmail.com',5204867780,3,'Aksaray/Merkez/Ortaköy',1,6530,73606308435);

insert into Öğrenci values(232,'Kaya','Ayhan','1997-05-06','kayaaltay@gmail.com',5231254517,2,'Kütahya/Merkez/Altıntaş',1,6530,60450053477);

insert into Öğrenci values(233,'Zara','Yalın','1998-03-19','zarayurt@gmail.com',5157696604,4,'Kırıkkale/Merkez/Delice',1,6530,98228985355);

insert into Öğrenci values(234,'Serdar','Yavuz','1999-10-12','serdarkaradag@gmail.com',5365305264,1,'Düzce/Merkez/Çilimli',0,6530,89640688814);

insert into Öğrenci values(235,'Simge','Kuru','1997-02-03','simgeseker@gmail.com',5517472798,3,'Sinop/Merkez/Türkeli',1,6530,23571676719);

insert into Öğrenci values(236,'Kuzey','Yaman','1998-12-27','kuzeyaslan@gmail.com',5663162779,2,'Bartın/Merkez/Kurucaşile',0,6530,28230533425);

insert into Öğrenci values(237,'Betül','Çetin','1999-08-21','betulkilinc@gmail.com',5826797199,1,'Kırşehir/Merkez/Akpınar',1,6530,42637212623);

insert into Öğrenci values(238,'Uğur','Alp','1997-04-10','ugurcavdar@gmail.com',5110356136,4,'Kastamonu/Merkez/Devrekani',1,6530,33478944386);

insert into Öğrenci values(239,'Sıla','Yılmazer','1998-11-13','silacam@gmail.com',5375300024,1,'Çankırı/Merkez/Kurşunlu',0,6530,2607697278);

insert into Öğrenci values(240,'Tarkan','Bulut','1999-09-16','tarkanerbil@gmail.com',5592167013,3,'Karabük/Merkez/Yenice',1,6530,83309752731);

insert into Öğrenci values(241,'Berfin','Aktaş','1997-01-22','berfinvarol@gmail.com',5726763384,2,'Bayburt/Merkez/Demirözü',1,6530,64912121352);

insert into Öğrenci values(242,'Eray','Koç','1998-10-07','erayyuksel@gmail.com',5544229805,4,'Gümüşhane/Merkez/Kürtün',1,6530,20208738152);

insert into Öğrenci values(243,'Aybike','Yıldırım','1999-06-26','aybikedogru@gmail.com',5219618176,1,'Artvin/Hopa/Murgul',1,6530,11124907227);

insert into Öğrenci values(244,'Özgür','Tanrıverdi','1997-06-21','ozgurgonul@gmail.com',5131888476,3,'Ardahan/Merkez/Göle',1,6530,8683931891);

insert into Öğrenci values(245,'ElifGizem','Yücel','1998-05-08','elifgizemkiran@gmail.com',5547985525,2,'Iğdır/Merkez/Aralık',0,6530,15599313351);

insert into Öğrenci values(246,'Onurcan','Güler','1999-02-01','onurcanyavuz@gmail.com',5207464363,1,'Tunceli/Merkez/Ovacık',0,6530,74311935272);

insert into Öğrenci values(247,'Duygu','Ayhan','1997-12-02','duyguyilmaz@gmail.com',5505090672,4,'Bingöl/Merkez/Karlıova',0,6530,87071687547);

insert into Öğrenci values(248,'Oktay','Yalın','1998-07-25','oktayyalcin@gmail.com',5950311756,1,'Bitlis/Merkez/Ahlat',1,6530,76622121354);

insert into Öğrenci values(249,'İlay','Yavuz','1999-04-08','ilaycan@gmail.com',5599202734,3,'Siirt/Merkez/Kurtalan',0,6530,2953477805);

insert into Öğrenci values(250,'Furkan','Kuru','1997-08-18','furkanyurtsever@gmail.com',5355172703,2,'Hakkâri/Merkez/Yüksekova',0,6530,88490200719);

insert into Öğrenci values(251,'Ceyda','Yaman','1998-01-13','ceydakeles@gmail.com',5513047634,4,'Şırnak/Merkez/Silopi',0,6530,13632482205);

insert into Öğrenci values(252,'Rüzgar','Çetin','1999-07-18','ruzgarbektas@gmail.com',5608603855,1,'Batman/Merkez/Beşiri',1,6530,37471180535);

insert into Öğrenci values(253,'Cemre','Alp','1997-10-11','cemreduman@gmail.com',5488973767,3,'Van/Merkez/Edremit',0,6530,36797405742);

insert into Öğrenci values(254,'Deniz','Yılmazer','1998-06-14','denizduran@gmail.com',5532622776,2,'Muş/Merkez/Malazgirt',1,6530,80561669336);

insert into Öğrenci values(255,'Levent','Bulut','1999-03-17','leventtekin@gmail.com',5752350113,1,'Ağrı/Merkez/Patnos',1,6530,4737571816);

insert into Öğrenci values(256,'Beril','Aktaş','1997-11-21','berilyesil@gmail.com',5887757041,4,'Kars/Merkez/Sarıkamış',1,6530,87625914341);

insert into Öğrenci values(257,'Alp','Koç','1998-09-04','alpereren@gmail.com',5573735456,1,'Erzurum/Palandöken/Yakutiye',0,6530,50292880948);

insert into Öğrenci values(258,'Zara','Yıldırım','1999-01-26','zaraorhan@gmail.com',5606160638,3,'Erzincan/Merkez/Kemaliye',1,6530,82656027659);

insert into Öğrenci values(259,'Burhan','Tanrıverdi','1997-05-04','burhanozen@gmail.com',5202951465,2,'Bayburt/Merkez/Aydıntepe',1,6530,4378566700);

insert into Öğrenci values(260,'Selma','Yücel','1998-03-15','selmabulut@gmail.com',5417231140,4,'Gümüşhane/Merkez/Şiran',0,6530,99095483223);

insert into Öğrenci values(261,'Hakan','Güler','1999-10-08','hakanozkan@gmail.com',5973420970,1,'Artvin/Merkez/Hopa',0,6530,30901984449);

insert into Öğrenci values(262,'ElifSu','Ayhan','1997-02-23','elifsukoc@gmail.com',5776280316,3,'Ardahan/Merkez/Göle',0,6530,22504519023);

insert into Öğrenci values(263,'Serdar','Yalın','1998-12-16','serdaraltin@gmail.com',5180946292,2,'Iğdır/Merkez/Tuzluca',1,6530,77419777185);

insert into Öğrenci values(264,'Cemre','Yavuz','1999-08-10','cemrecelik@gmail.com',5275718724,1,'Tunceli/Merkez/Ovacık',1,6530,57243344345);

insert into Öğrenci values(265,'Ahmetcan','Kuru','1997-04-29','ahmetcangunes@gmail.com',5893139760,4,'Bingöl/Merkez/Genç',1,6530,86265221340);

insert into Öğrenci values(266,'Bengisu','Yaman','1998-11-10','bengisuyildiz@gmail.com',5487102800,1,'Bitlis/Merkez/Ahlat',1,6530,22809154960);

insert into Öğrenci values(267,'Ferhat','Çetin','2002-04-15','ferhatdogan@gmail.com',5533439518,3,'Siirt/Merkez/Kurtalan',0,6530,29500897171);

insert into Öğrenci values(268,'Büşra','Alp','2003-11-05','busraari@gmail.com',5276420375,2,'Hakkâri/Merkez/Çukurca',1,6530,47887275348);

insert into Öğrenci values(269,'Alican','Yılmazer','2002-07-19','alicankorkmaz@gmail.com',5237814727,4,'Şırnak/Merkez/İdil',1,6530,14131711492);

insert into Öğrenci values(270,'İrem','Bulut','2002-02-10','iremkilic@gmail.com',5218780519,1,'Batman/Merkez/Kozluk',0,6530,55450864726);

insert into Öğrenci values(271,'Burcu','Aktaş','2002-09-22','burcuaksoy@gmail.com',5460809803,3,'Van/Merkez/Erciş',1,6530,79055614587);

insert into Öğrenci values(272,'Yavuz','Koç','2002-01-30','yavuzdemir@gmail.com',5685270522,2,'Muş/Merkez/Varto',1,6530,3669831568);

insert into Öğrenci values(273,'Melike','Yıldırım','2002-05-18','melikeavci@gmail.com',5306985958,1,'Ağrı/Merkez/Doğubeyazıt',1,6530,80944826427);

insert into Öğrenci values(274,'Tolga','Tanrıverdi','2002-08-14','tolgaakbas@gmail.com',5159859159,4,'Kars/Merkez/Digor',1,6530,83447085003);

insert into Öğrenci values(275,'Şeyma','Yücel','2002-12-03','seymakir@gmail.com',5994295051,1,'Erzurum/Yakutiye/Palandöken',1,6530,49327042656);

insert into Öğrenci values(276,'Canberk','Güler','2002-06-27','canberkkilic@gmail.com',5820923105,3,'Erzincan/Kemaliye/Refahiye',0,6530,52523558686);

insert into Öğrenci values(277,'Zehra','Ayhan','2002-11-20','zehraakinci@gmail.com',5852594912,2,'Bayburt/Demirözü/İspir',1,6530,22975826819);

insert into Öğrenci values(278,'Batuhan','Yalın','2002-03-08','batuhankurt@gmail.com',5446821671,4,'Gümüşhane/Kürtün/Şiran',0,6530,90122860985);

insert into Öğrenci values(279,'Zümra','Yavuz','2002-10-12','zumrakaya@gmail.com',5580027918,1,'Artvin/Murgul/Hopa',0,6530,2373337129);

insert into Öğrenci values(280,'Ege','Kuru','2002-04-07','egeozturk@gmail.com',5863236685,3,'Ardahan/Göle/Damal',0,6530,2514337125);

insert into Öğrenci values(281,'Yasemin','Yaman','2002-09-01','yaseminaksu@gmail.com',5300696216,2,'Iğdır/Tuzluca/Karakoyunlu',0,6530,77334308792);

insert into Öğrenci values(282,'Berkay','Çetin','2002-07-14','berkayay@gmail.com',5237164785,1,'Tunceli/Ovacık/Nazımiye',0,6530,35818191887);

insert into Öğrenci values(283,'Ceren','Alp','2002-02-22','cerenerdogan@gmail.com',5347926522,4,'Bingöl/Genç/Adaklı',0,6530,55238979238);

insert into Öğrenci values(284,'Deniz','Yılmazer','2002-05-30','denizyalin@gmail.com',5954724329,1,'Bitlis/Ahlat/Tatvan',1,6530,8730098420);

insert into Öğrenci values(285,'Esila','Bulut','2002-08-26','esilasahin@gmail.com',5392032184,3,'Siirt/Kurtalan/Pervari',1,6530,26343642830);

insert into Öğrenci values(286,'Alperen','Aktaş','2002-01-14','alperengur@gmail.com',5340212032,2,'Hakkâri/Şemdinli/Yüksekova',0,6530,73609925069);

insert into Öğrenci values(287,'Esra','Koç','2002-06-05','esraaltun@gmail.com',5393842320,4,'Şırnak/Cizre/İdil',1,6530,62818594274);

insert into Öğrenci values(288,'Emre','Yıldırım','2002-10-24','emrecolak@gmail.com',5222433665,1,'Batman/Beşiri/Kozluk',0,6530,44105415448);

insert into Öğrenci values(289,'Elifnaz','Tanrıverdi','2002-03-28','elifnazakman@gmail.com',5709523300,3,'Van/Edremit/Çaldıran',0,6530,75352212156);

insert into Öğrenci values(290,'Kerem','Yücel','2002-11-16','keremayhan@gmail.com',5552462803,2,'Muş/Malazgirt/Varto',0,6530,18171419234);

insert into Öğrenci values(291,'Gözde','Güler','2002-04-23','gozdetuncer@gmail.com',5704628080,1,'Ağrı/Doğubeyazıt/Diyadin',0,6530,22865429413);

insert into Öğrenci values(292,'Mustafa','Ayhan','2002-09-05','mustafakocaman@gmail.com',5809787780,4,'Kars/Sarıkamış/Digor',1,6530,54897507389);

insert into Öğrenci values(293,'Aysel','Yalın','2002-07-18','ayselkilic@gmail.com',5526112483,1,'Erzurum/Horasan/Oltu',0,6530,56252925677);

insert into Öğrenci values(294,'Kaan','Yavuz','2002-02-01','kaanalp@gmail.com',5766574904,3,'Erzincan/Üzümlü/Kemaliye',1,6530,92076211854);

insert into Öğrenci values(295,'Sude','Kuru','2002-12-27','sudeyilmazer@gmail.com',5588106240,2,'Bayburt/İspir/Demirözü',1,6530,68802098272);

insert into Öğrenci values(296,'Doğan','Yaman','2002-06-10','dogankuru@gmail.com',5312835585,4,'Gümüşhane/Şiran/Kürtün',0,6530,92811013318);

insert into Öğrenci values(297,'Betül','Çetin','2002-11-29','betulyaman@gmail.com',5573582335,1,'Artvin/Hopa/Murgul',1,6530,81165346957);

insert into Öğrenci values(298,'Emirhan','Alp','2002-03-16','emirhankoc@gmail.com',5473479117,3,'Ardahan/Göle/Damal',1,6530,4088554599);

insert into Öğrenci values(299,'Aslıhan','Yılmazer','2002-10-06','aslihanaktas@gmail.com',5190409447,2,'Iğdır/Karakoyunlu/Tuzluca',0,6530,60128355855);

insert into Öğrenci values(300,'Arda','Bulut','2002-04-17','ardabulut@gmail.com',5406466858,1,'Tunceli/Nazımiye/Ovacık',1,6530,30004859345);

insert into Öğrenci values(301,'Şimal','Aktaş','2002-09-29','onuryildirim@gmail.com',5532464269,4,'İstanbul/Beykoz/Paşabahçe',1,6530,24576465496);

insert into Öğrenci values(302,'Kaya','Koç','2002-08-09','gizemtanriverdi@gmail.com',5191321379,1,'Ankara/Yenimahalle/Batıkent',1,6530,76894546486);

insert into Öğrenci values(303,'Büşra','Yıldırım','2002-01-25','emreyucel@gmail.com',5418875937,3,'İzmir/Konak/Alsancak',0,6530,16995790077);

insert into Öğrenci values(304,'Çağlar','Tanrıverdi','2002-05-03','selintuncer@gmail.com',5263915961,2,'Bursa/Osmangazi/Çekirge',0,6530,9521132886);

insert into Öğrenci values(305,'Damla','Yücel','2002-12-20','egeguler@gmail.com',5166098489,4,'Antalya/Kepez/Varsak',0,6530,21226318058);

insert into Öğrenci values(306,'Koray','Güler','2002-06-16','denizayhan@gmail.com',5669952898,1,'Adana/Seyhan/Atakent',1,6530,69337131922);

insert into Öğrenci values(307,'Elif','Ayhan','2002-11-09','eceyalin@gmail.com',5548181912,3,'Konya/Selçuklu/Meram',1,6530,7406285248);

insert into Öğrenci values(308,'Onur','Yalın','2002-03-05','cemyavuz@gmail.com',5136225450,2,'Kayseri/Melikgazi/Mimarsinan',1,6530,97045147901);

insert into Öğrenci values(309,'Zeynep','Yavuz','2002-10-18','yasminguler@gmail.com',5624168424,1,'Trabzon/Ortahisar/Akçaabat',1,6530,71394557881);

insert into Öğrenci values(310,'Furkan','Kuru','2002-04-29','baranyaman@gmail.com',5665847384,4,'Eskişehir/Tepebaşı/Odunpazarı',1,6530,20610703374);

insert into Öğrenci values(311,'Ayşe','Yaman','2002-09-12','aslibulut@gmail.com',5440913861,1,'Gaziantep/Şahinbey/Oğuzeli',1,6530,47062027973);

insert into Öğrenci values(312,'Mustafa','Çetin','2002-07-25','umutalp@gmail.com',5961020555,3,'Diyarbakır/Yenişehir/Bağlarbaşı',1,6530,20048159890);

insert into Öğrenci values(313,'Fatma','Alp','2002-02-08','cansuyilmazer@gmail.com',5534088710,2,'Kocaeli/İzmit/Başiskele',1,6530,81924501832);

insert into Öğrenci values(314,'Ahmet','Yılmazer','2002-12-13','emirbulut@gmail.com',5775061512,4,'Sakarya/Serdivan/Erenler',1,6530,6133118531);

insert into Öğrenci values(315,'Esra','Bulut','2002-05-20','aylinaktas@gmail.com',5887787092,1,'Mersin/Akdeniz/Mezitli',1,6530,17461998881);

insert into Öğrenci values(316,'Furkan','Aktaş','2002-08-16','ardakoc@gmail.com',5215882935,3,'Samsun/Atakum/İlkadım',0,6530,57318943376);

insert into Öğrenci values(317,'İrem','Koç','2002-01-02','ilaydaguler@gmail.com',5944336583,2,'Denizli/Pamukkale/Kaleiçi',0,6530,36921737314);

insert into Öğrenci values(318,'Burak','Yıldırım','2002-06-21','canayhan@gmail.com',5673442288,1,'Kahramanmaraş/Onikişubat/Dulkadiroğlu',1,6530,6730446445);

insert into Öğrenci values(319,'Damla','Tanrıverdi','2002-11-02','dilarayalin@gmail.com',5801154455,4,'Hatay/İskenderun/Antakya',0,6530,39569995563);

insert into Öğrenci values(320,'Onur','Yücel','2002-03-21','kaanguler@gmail.com',5645356815,1,'Malatya/Yeşilyurt/Battalgazi',1,6530,70965077722);

insert into Öğrenci values(321,'Gizem','Güler','2002-10-27','busraayhan@gmail.com',5595273263,3,'Manisa/Şehzadeler/Yunusemre',1,6530,55787079620);

insert into Öğrenci values(322,'Emre','Ayhan','2002-04-10','korayyalin@gmail.com',5749565851,2,'Trabzon/Yomra/Arsin',1,6530,57737335454);

insert into Öğrenci values(323,'Selin','Yalın','2002-09-23','melisyavuz@gmail.com',5549730007,4,'Muğla/Fethiye/Ölüdeniz',0,6530,89068124629);

insert into Öğrenci values(324,'Ege','Yavuz','2002-07-06','serkankuru@gmail.com',5826312642,1,'Tekirdağ/Çorlu/Barbaros',1,6530,8111968391);

insert into Öğrenci values(325,'Deniz','Kuru','2002-02-15','ipekyilmazer@gmail.com',5471829133,3,'Edirne/Merkez/Kaleiçi',0,6530,78205101489);

insert into Öğrenci values(326,'Ece','Yaman','2002-12-08','huseyinbulut@gmail.com',5544859825,2,'Zonguldak/Ereğli/Kandilli',1,6530,5219309210);

insert into Öğrenci values(327,'Cem','Çetin','2002-05-11','elifnuralp@gmail.com',5290464293,1,'Balıkesir/Altıeylül/Karesi',1,6530,57011173537);

insert into Öğrenci values(328,'Yasmin','Alp','2002-08-07','kadiryilmazer@gmail.com',5391133492,4,'Çanakkale/Merkez/Eceabat',0,6530,86713970324);

insert into Öğrenci values(329,'Baran','Yılmazer','2002-01-19','bengubulut@gmail.com',5164581450,1,'Afyonkarahisar/Merkez/Sandıklı',0,6530,39807584946);

insert into Öğrenci values(330,'Aslı','Bulut','2002-06-02','emirhanaktas@gmail.com',5629985720,3,'Uşak/Merkez/Banaz',0,6530,90754908835);

insert into Öğrenci values(331,'Umut','Aktaş','2002-11-15','nazlikoc@gmail.com',5883499223,2,'Aksaray/Merkez/Ortaköy',1,6530,32135133152);

insert into Öğrenci values(332,'Cansu','Koç','2002-03-02','bilgeyildirim@gmail.com',5725376783,4,'Kütahya/Merkez/Simav',0,6530,48258453004);

insert into Öğrenci values(333,'Emir','Yıldırım','2002-10-09','serhatayhan@gmail.com',5179079718,1,'Kırıkkale/Merkez/Yahşihan',1,6530,65540132652);

insert into Öğrenci values(334,'Aylin','Tanrıverdi','2002-04-28','tugceyucel@gmail.com',5678542218,3,'Düzce/Merkez/Akçakoca',1,6530,36757960040);

insert into Öğrenci values(335,'Arda','Yücel','2002-09-11','tahaguler@gmail.com',5656756979,2,'Sinop/Merkez/Türkeli',1,6530,28934369829);

insert into Öğrenci values(336,'İlayda','Güler','2002-07-24','sudeakin@gmail.com',5837866941,1,'Bartın/Merkez/Amasra',1,6530,2659308905);

insert into Öğrenci values(337,'Can','Ayhan','2002-02-07','alperenyilmaz@gmail.com',5886977357,4,'Kırşehir/Merkez/Akpınar',1,6530,23644871821);

insert into Öğrenci values(338,'Dilara','Yalın','2002-12-19','gulayhan@gmail.com',5970654442,1,'Kastamonu/Merkez/İnebolu',0,6530,17777965166);

insert into Öğrenci values(339,'Kaan','Yavuz','2002-05-26','burcuatalay@gmail.com',5784463102,3,'Çankırı/Merkez/Kurşunlu',0,6530,22619392557);

insert into Öğrenci values(340,'Büşra','Kuru','2002-08-21','mustafakurt@gmail.com',5385154012,2,'Karabük/Merkez/Safranbolu',1,6530,80923883215);

insert into Öğrenci values(341,'Koray','Yaman','2002-01-09','cemakinci@gmail.com',5649632336,4,'Bayburt/Merkez/Demirözü',1,6530,58078707744);

insert into Öğrenci values(342,'Melis','Çetin','2002-06-14','zehratunc@gmail.com',5600945369,1,'Gümüşhane/Merkez/Kürtün',1,6530,74717540769);

insert into Öğrenci values(343,'Serkan','Alp','2002-11-07','simayucel@gmail.com',5968071160,3,'Artvin/Hopa/Arhavi',1,6530,56143413162);

insert into Öğrenci values(344,'İpek','Yılmazer','2002-03-18','kuzeykaya@gmail.com',5113016361,2,'Ardahan/Merkez/Göle',0,6530,71739786982);

insert into Öğrenci values(345,'Hüseyin','Bulut','2002-10-03','betulbulut@gmail.com',5680657562,1,'Iğdır/Merkez/Karakoyunlu',1,6530,75317124921);

insert into Öğrenci values(346,'ElifNur','Aktaş','2002-04-14','uguralp@gmail.com',5686369367,4,'Tunceli/Merkez/Ovacık',0,6530,64209052679);

insert into Öğrenci values(347,'Kadir','Koç','2002-09-26','silayilmaz@gmail.com',5363609955,1,'Bingöl/Merkez/Yayladere',1,6530,38990952745);

insert into Öğrenci values(348,'Bengü','Yıldırım','2002-07-09','silayilmaz@gmail.com',5964093993,3,'Bitlis/Merkez/Ahlat',0,6530,32329969787);

insert into Öğrenci values(349,'Emirhan','Tanrıverdi','2002-02-20','tarkanbulut@gmail.com',5173650528,2,'Siirt/Merkez/Kurtalan',0,6530,26273202193);

insert into Öğrenci values(350,'Nazlı','Yücel','2002-12-04','berfinvarol@gmail.com',5824641637,4,'Hakkâri/Merkez/Çukurca',1,6530,14529027174);

insert into Öğrenci values(351,'Bilge','Güler','2002-05-17','eraycetin@gmail.com',5974511359,1,'Şırnak/Merkez/Silopi',1,6530,61628965423);

insert into Öğrenci values(352,'Serhat','Ayhan','2002-08-13','aybikedogru@gmail.com',5998436915,3,'Batman/Merkez/Gercüş',1,6530,80206442587);

insert into Öğrenci values(353,'Tuğçe','Yalın','2002-01-31','ozgurgonul@gmail.com',5806156599,2,'Van/Merkez/Erciş',1,6530,88750949094);

insert into Öğrenci values(354,'Taha','Yavuz','2002-06-23','elifgizemkiran@gmail.com',5202831853,1,'Muş/Merkez/Malazgirt',0,6530,9370908274);

insert into Öğrenci values(355,'Sude','Kuru','2002-11-14','onurcanyavuz@gmail.com',5717336577,4,'Ağrı/Merkez/Patnos',1,6530,60184933718);

insert into Öğrenci values(356,'Alp','Yaman','2002-03-07','duyguyilmaz@gmail.com',5945640488,1,'Kars/Merkez/Digor',0,6530,15630539174);

insert into Öğrenci values(357,'Gül','Çetin','2002-10-17','oktayyalcin@gmail.com',5279178842,3,'Erzurum/Palandöken/Yakutiye',1,6530,34992921735);

insert into Öğrenci values(358,'Burcu','Alp','2002-04-26','ilaycan@gmail.com',5974563513,2,'Erzincan/Merkez/Kemaliye',0,6530,42243752184);

insert into Öğrenci values(359,'Tayyar','Yılmazer','2002-09-09','furkanyurtsever@gmail.com',5105561764,4,'Bayburt/Merkez/Aydıntepe',1,6530,33324643790);

insert into Öğrenci values(360,'İdil','Bulut','2002-07-22','ceydakeles@gmail.com',5853775568,1,'Gümüşhane/Merkez/Şiran',0,6530,35086950462);

insert into Öğrenci values(361,'Efe','Aktaş','2002-02-05','ruzgarbektas@gmail.com',5398289763,3,'Artvin/Merkez/Hopa',0,6530,19442648509);

insert into Öğrenci values(362,'Melike','Koç','2002-12-29','cemreduman@gmail.com',5945708531,2,'Ardahan/Merkez/Göle',1,6530,29298304342);

insert into Öğrenci values(363,'Yiğit','Yıldırım','2002-06-12','denizduran@gmail.com',5317375859,1,'Iğdır/Merkez/Tuzluca',0,6530,55022822271);

insert into Öğrenci values(364,'Asena','Tanrıverdi','2002-11-05','leventtekin@gmail.com',5804653919,4,'Tunceli/Merkez/Ovacık',0,6530,67155376449);

insert into Öğrenci values(365,'Alper','Yücel','2002-03-24','berilyesil@gmail.com',5411301642,1,'Bingöl/Merkez/Yedisu',1,6530,10170783148);

insert into Öğrenci values(366,'Melisa','Güler','2002-10-30','alpereren@gmail.com',5262245151,3,'Bitlis/Merkez/Ahlat',1,6530,59237263716);

insert into Öğrenci values(367,'Orhan','Ayhan','2002-05-05','zaraorhan@gmail.com',5685865113,2,'Siirt/Merkez/Kurtalan',0,6530,63737292471);

insert into Öğrenci values(368,'Aysu','Yalın','2002-08-31','burhanozen@gmail.com',5582647973,4,'Hakkâri/Merkez/Çukurca',1,6530,57145053376);

insert into Öğrenci values(369,'Arif','Yavuz','2002-01-16','selmabulut@gmail.com',5131188122,1,'Şırnak/Merkez/İdil',1,6530,3673185343);

insert into Öğrenci values(370,'Eylül','Kuru','2002-06-29','hakanozkan@gmail.com',5874047276,3,'Batman/Merkez/Beşiri',1,6530,77768790657);

insert into Öğrenci values(371,'Murat','Yaman','2002-11-22','elifsukoc@gmail.com',5981035811,2,'Van/Merkez/Edremit',1,6530,35774235425);

insert into Öğrenci values(372,'Ceren','Çetin','2002-03-11','serdaraltin@gmail.com',5224692982,1,'Muş/Merkez/Varto',0,6530,14197756673);

insert into Öğrenci values(373,'Kaan','Alp','2002-10-13','cemrecelik@gmail.com',5486525340,4,'Ağrı/Merkez/Diyadin',1,6530,75705685303);

insert into Öğrenci values(374,'Zehra','Yılmazer','2002-04-20','ahmetcangunes@gmail.com',5178216124,1,'Kars/Merkez/Kağızman',0,6530,79619076689);

insert into Öğrenci values(375,'Berk','Bulut','2002-09-02','bengisuyildiz@gmail.com',5811147322,3,'Erzurum/Yakutiye/Palandöken',0,6530,53876841719);

insert into Öğrenci values(376,'Ela','Aktaş','2002-07-15','ferhatdogan@gmail.com',5929116270,2,'Erzincan/Kemaliye/Tercan',1,6530,8084046994);

insert into Öğrenci values(377,'Selçuk','Koç','2002-02-12','busraari@gmail.com',5424057101,4,'Bayburt/İspir/Demirözü',0,6530,6199120845);

insert into Öğrenci values(378,'İdil','Yıldırım','2002-12-06','alicankorkmaz@gmail.com',5552781236,1,'Gümüşhane/Şiran/Kürtün',0,6530,69094225497);

insert into Öğrenci values(379,'Mert','Tanrıverdi','2002-05-09','iremkilic@gmail.com',5758732654,3,'Artvin/Murgul/Borçka',1,6530,49070330356);

insert into Öğrenci values(380,'Sare','Yücel','2002-08-05','burcuaksoy@gmail.com',5116147713,2,'Ardahan/Göle/Damal',0,6530,6984159997);

insert into Öğrenci values(381,'Ömer','Güler','2002-01-21','yavuzdemir@gmail.com',5937674426,1,'Iğdır/Karakoyunlu/Tuzluca',1,6530,4526506089);

insert into Öğrenci values(382,'Yasemin','Ayhan','2002-06-04','melikeavci@gmail.com',5887857041,4,'Tunceli/Ovacık/Hozat',1,6530,30184847007);

insert into Öğrenci values(383,'Caner','Yalın','2002-11-27','tolgaakbas@gmail.com',5493455059,1,'Bingöl/Genç/Karlıova',0,6530,3333798089);

insert into Öğrenci values(384,'Nisa','Yavuz','2002-03-16','seymakir@gmail.com',5792379603,3,'Bitlis/Ahlat/Tatvan',1,6530,54685161341);

insert into Öğrenci values(385,'Kaya','Kuru','2002-10-21','canberkkilic@gmail.com',5705011538,2,'Siirt/Kurtalan/Pervari',1,6530,54004317653);

insert into Öğrenci values(386,'Zara','Yaman','2002-04-01','zehraakinci@gmail.com',5562291108,4,'Hakkâri/Şemdinli/Yüksekova',1,6530,24956542443);

insert into Öğrenci values(387,'Serdar','Çetin','2002-09-14','batuhankurt@gmail.com',5976902771,1,'Şırnak/İdil/Cizre',1,6530,27745115877);

insert into Öğrenci values(388,'Simge','Alp','2002-07-27','zumrakaya@gmail.com',5609967297,3,'Batman/Kozluk/Beşiri',0,6530,48547128631);

insert into Öğrenci values(389,'Kuzey','Yılmazer','2002-02-03','egeozturk@gmail.com',5838093780,2,'Van/Edremit/Çaldıran',0,6530,75935951911);

insert into Öğrenci values(390,'Betül','Bulut','2002-12-26','yaseminaksu@gmail.com',5685805883,1,'Muş/Malazgirt/Bulanık',0,6530,13151456187);

insert into Öğrenci values(391,'Uğur','Aktaş','2002-06-09','berkayay@gmail.com',5167281469,4,'Ağrı/Doğubeyazıt/Patnos',0,6530,44612107609);

insert into Öğrenci values(392,'Sıla','Koç','2002-11-02','cerenerdogan@gmail.com',5947175328,1,'Kars/Digor/Sarıkamış',0,6530,31866576287);

insert into Öğrenci values(393,'Tarkan','Yıldırım','2002-03-21','denizyalin@gmail.com',5415668750,3,'Erzurum/Yakutiye/Palandöken',0,6530,9063999002);

insert into Öğrenci values(394,'Berfin','Tanrıverdi','2002-10-26','esilasahin@gmail.com',5831345985,2,'Erzincan/Kemaliye/Refahiye',0,6530,81986383932);

insert into Öğrenci values(395,'Eray','Yücel','2002-04-09','alperengur@gmail.com',5751623147,4,'Bayburt/İspir/Demirözü',1,6530,68471500314);

insert into Öğrenci values(396,'Aybike','Güler','2002-09-22','esraaltun@gmail.com',5765226459,1,'Gümüşhane/Şiran/Kürtün',0,6530,59225169639);

insert into Öğrenci values(397,'Özgür','Ayhan','2002-08-02','emrecolak@gmail.com',5787329227,3,'Artvin/Hopa/Borçka',1,6530,14179226289);

insert into Öğrenci values(398,'ElifGizem','Yalın','2002-01-29','elifnazakman@gmail.com',5954979198,2,'Ardahan/Göle/Posof',1,6530,5031491477);

insert into Öğrenci values(399,'Onurcan','Yavuz','2002-06-21','keremayhan@gmail.com',5656661351,1,'Iğdır/Karakoyunlu/Tuzluca',1,6530,8910984303);

insert into Öğrenci values(400,'Duygu','Kuru','2002-11-14','gozdetuncer@gmail.com',5711102566,4,'Tunceli/Nazımiye/Pertek',0,6530,71308410502);

insert into Öğrenci values(401,'Oktay','Yaman','2002-03-05','mustafakocaman@gmail.com',5170806010,1,'İstanbul/Ümraniye/Çarşı',0,6530,67562392359);

insert into Öğrenci values(402,'İlay','Çetin','2002-10-17','ayselkilic@gmail.com',5275806787,3,'Ankara/Çankaya/Kocatepe',1,6530,93514107155);

insert into Öğrenci values(403,'Furkan','Alp','2002-04-30','kaanalp@gmail.com',5246885583,2,'İzmir/Bornova/Evka',0,6530,85849339154);

insert into Öğrenci values(404,'Ceyda','Yılmazer','2002-09-12','sudeyilmazer@gmail.com',5111862845,4,'Bursa/Nilüfer/Esentepe',0,6530,99066766219);

insert into Öğrenci values(405,'Rüzgar','Bulut','2002-07-25','dogankuru@gmail.com',5946531845,1,'Antalya/Konyaaltı/Arapsuyu',1,6530,41440122504);

insert into Öğrenci values(406,'Cemre','Aktaş','2002-02-08','betulyaman@gmail.com',5986186138,3,'Adana/Seyhan/Güneşli',0,6530,2498134615);

insert into Öğrenci values(407,'Deniz','Koç','2002-12-13','emirhankoc@gmail.com',5532815366,2,'Konya/Meram/Akıncılar',0,6530,73239718849);

insert into Öğrenci values(408,'Levent','Yıldırım','2002-05-16','aslihanaktas@gmail.com',5599250682,1,'Kayseri/Talas/Büyükgöl',0,6530,16784408259);

insert into Öğrenci values(409,'Beril','Tanrıverdi','2002-08-12','ardabulut@gmail.com',5803380412,4,'Trabzon/Akçaabat/Fatih',0,6530,53797269682);

insert into Öğrenci values(410,'Alp','Yücel','2002-01-04','simalyavuz@gmail.com',5657797153,1,'Eskişehir/Odunpazarı/Batıkent',1,6530,6883279768);

insert into Öğrenci values(411,'Zara','Güler','2002-06-17','kayaozkan@gmail.com',5618394384,3,'Gaziantep/Şahinbey/Şehitkamil',1,6530,10227230655);

insert into Öğrenci values(412,'Burhan','Ayhan','2002-11-10','busracetin@gmail.com',5836981373,2,'Diyarbakır/Bağlar/Kayapınar',0,6530,94504619217);

insert into Öğrenci values(413,'Selma','Yalın','2002-03-18','caglaryildirim@gmail.com',5964600859,4,'Kocaeli/Gebze/MimarSinan',1,6530,36723113369);

insert into Öğrenci values(414,'Hakan','Yavuz','2002-10-04','damlatanriverdi@gmail.com',5270368754,1,'Sakarya/Serdivan/Adapazarı',1,6530,34735035597);

insert into Öğrenci values(415,'ElifSu','Kuru','2002-05-05','korayyucel@gmail.com',5607876717,3,'Mersin/Mezitli/Çukurova',0,6530,70682196268);

insert into Öğrenci values(416,'Serdar','Yaman','2002-08-30','elifguler@gmail.com',5674859194,2,'Samsun/İlkadım/Atakum',0,6530,30504443855);

insert into Öğrenci values(417,'Cemre','Çetin','2002-01-17','onurtuncer@gmail.com',5215317622,1,'Denizli/Pamukkale/Çınar',1,6530,5800379821);

insert into Öğrenci values(418,'Ahmetcan','Alp','2002-06-30','zeynepayhan@gmail.com',5559895303,4,'Kahramanmaraş/Onikişubat/Dulkadiroğlu',1,6530,5728379897);

insert into Öğrenci values(419,'Bengisu','Yılmazer','2002-11-23','furkanyalin@gmail.com',5664087219,1,'Hatay/İskenderun/Defne',1,6530,65397751689);

insert into Öğrenci values(420,'Ferhat','Bulut','2002-03-12','aysayavuz@gmail.com',5770390300,3,'Malatya/Battalgazi/Yeşilyurt',0,6530,3263577165);

insert into Öğrenci values(421,'Büşra','Aktaş','2002-10-09','mustafakuru@gmail.com',5581544527,2,'Manisa/Akhisar/Muradiye',0,6530,35730851735);

insert into Öğrenci values(422,'Alican','Koç','2002-04-18','fatmayaman@gmail.com',5865447442,4,'Trabzon/Yomra/Çaykara',0,6530,16414206607);

insert into Öğrenci values(423,'İrem','Yıldırım','2002-09-01','ahmetcetin@gmail.com',5359164813,1,'Muğla/Bodrum/Ortakent',1,6530,86456626569);

insert into Öğrenci values(424,'Burcu','Tanrıverdi','2002-07-14','esraalp@gmail.com',5360476256,3,'Tekirdağ/Süleymanpaşa/Yıldırım',1,6530,17852824004);

insert into Öğrenci values(425,'Yavuz','Yücel','2002-02-23','furkanyilmazer@gmail.com',5185499075,2,'Edirne/Merkez/Keşan',1,6530,89482383499);

insert into Öğrenci values(426,'Melike','Güler','2002-12-07','irembulut@gmail.com',5496294053,1,'Zonguldak/Ereğli/Alaplı',1,6530,62240754755);

insert into Öğrenci values(427,'Tolga','Ayhan','2002-05-10','burakaktas@gmail.com',5208956548,4,'Balıkesir/Altıeylül/Ayvalık',0,6530,7923169078);

insert into Öğrenci values(428,'Şeyma','Yalın','2002-08-06','damlakoc@gmail.com',5560171167,1,'Çanakkale/Biga/Çan',1,6530,6959239149);

insert into Öğrenci values(429,'Canberk','Yavuz','2002-01-20','onuryildirim@gmail.com',5919346682,3,'Afyonkarahisar/Merkez/Sandıklı',1,6530,10152814915);

insert into Öğrenci values(430,'Zehra','Kuru','2002-06-03','gizemtanriverdi@gmail.com',5256287171,2,'Uşak/Merkez/Ulubey',1,6530,48772934990);

insert into Öğrenci values(431,'Batuhan','Yaman','2002-11-26','emreyucel@gmail.com',5654557747,4,'Aksaray/Merkez/Ağaçören',1,6530,60655144099);

insert into Öğrenci values(432,'Zümra','Çetin','2002-03-15','selintuncer@gmail.com',5311716205,1,'Kütahya/Merkez/Hisarcık',0,6530,97528446307);

insert into Öğrenci values(433,'Ege','Alp','2002-10-20','egeguler@gmail.com',5917536248,3,'Kırıkkale/Merkez/Bahşılı',0,6530,16117629321);

insert into Öğrenci values(434,'Yasemin','Yılmazer','2002-04-02','denizayhan@gmail.com',5432998315,2,'Düzce/Merkez/Çilimli',1,6530,39828629552);

insert into Öğrenci values(435,'Berkay','Bulut','2002-09-15','eceyalin@gmail.com',5513598449,1,'Sinop/Merkez/Gerze',0,6530,79951369242);

insert into Öğrenci values(436,'Ceren','Aktaş','2002-07-28','cemyavuz@gmail.com',5620976009,4,'Bartın/Merkez/Amasra',0,6530,78431559900);

insert into Öğrenci values(437,'Deniz','Koç','2002-02-05','yasminguler@gmail.com',5100560265,1,'Kırşehir/Merkez/Mucur',1,6530,51609995691);

insert into Öğrenci values(438,'Esila','Yıldırım','2002-12-27','baranyaman@gmail.com',5894053251,3,'Kastamonu/Merkez/Araç',1,6530,90030469599);

insert into Öğrenci values(439,'Alperen','Tanrıverdi','2002-06-10','aslibulut@gmail.com',5714285688,2,'Çankırı/Merkez/Korgun',0,6530,73310845434);

insert into Öğrenci values(440,'Esra','Yücel','2002-11-03','umutalp@gmail.com',5508293070,4,'Karabük/Merkez/Safranbolu',1,6530,63232724585);

insert into Öğrenci values(441,'Emre','Güler','2002-03-22','cansuyilmazer@gmail.com',5471628666,1,'Bayburt/Merkez/Demirözü',0,6530,93015542982);

insert into Öğrenci values(442,'Elifnaz','Ayhan','2002-10-27','emirbulut@gmail.com',5232642575,3,'Gümüşhane/Merkez/Kelkit',0,6530,40569967647);

insert into Öğrenci values(443,'Kerem','Yalın','2002-05-01','aylinaktas@gmail.com',5385324724,2,'Artvin/Hopa/Borçka',1,6530,10314470341);

insert into Öğrenci values(444,'Gözde','Yavuz','2002-08-26','ardakoc@gmail.com',5656496300,1,'Ardahan/Merkez/Hanak',0,6530,74970921255);

insert into Öğrenci values(445,'Mustafa','Kuru','2002-01-13','ilaydaguler@gmail.com',5844684797,4,'Iğdır/Merkez/Tuzluca',1,6530,85318067186);

insert into Öğrenci values(446,'Aysel','Yaman','2002-06-26','canayhan@gmail.com',5283714063,1,'Tunceli/Merkez/Ovacık',1,6530,15408262403);

insert into Öğrenci values(447,'Kaan','Çetin','2002-11-19','dilarayalin@gmail.com',5265075684,3,'Bingöl/Merkez/Karlıova',0,6530,48107375520);

insert into Öğrenci values(448,'Sude','Alp','2002-03-08','kaanguler@gmail.com',5422244455,2,'Bitlis/Merkez/Tatvan',1,6530,59217583471);

insert into Öğrenci values(449,'Doğan','Yılmazer','2002-10-11','busraayhan@gmail.com',5959071340,4,'Siirt/Merkez/Pervari',1,6530,11522962843);

insert into Öğrenci values(450,'Betül','Bulut','2002-04-21','korayyalin@gmail.com',5647859505,1,'Hakkâri/Merkez/Şemdinli',0,6530,13393641491);

insert into Öğrenci values(451,'Emirhan','Aktaş','2002-09-03','melisyavuz@gmail.com',5572793504,3,'Şırnak/Merkez/Silopi',0,6530,83808191324);

insert into Öğrenci values(452,'Aslıhan','Koç','2002-07-16','serkankuru@gmail.com',5896704029,2,'Batman/Merkez/Gercüş',1,6530,55811954886);

insert into Öğrenci values(453,'Arda','Yıldırım','2002-02-09','ipekyilmazer@gmail.com',5442005749,1,'Van/Merkez/Erciş',1,6530,2056569629);

insert into Öğrenci values(454,'Şimal','Tanrıverdi','2002-12-14','huseyinbulut@gmail.com',5548409082,4,'Muş/Merkez/Bulanık',0,6530,37628551174);

insert into Öğrenci values(455,'Kaya','Yücel','2002-05-17','elifnuralp@gmail.com',5610191070,1,'Ağrı/Merkez/Diyadin',0,6530,63979507290);

insert into Öğrenci values(456,'Büşra','Güler','2002-08-13','kadiryilmazer@gmail.com',5541947153,3,'Kars/Merkez/Digor',0,6530,82519152210);

insert into Öğrenci values(457,'Çağlar','Ayhan','2002-01-05','bengubulut@gmail.com',5895255612,2,'Erzurum/Yakutiye/Palandöken',1,6530,68511306111);

insert into Öğrenci values(458,'Damla','Yalın','2002-06-18','emirhanaktas@gmail.com',5568245017,4,'Erzincan/Merkez/Kemaliye',0,6530,73779525733);

insert into Öğrenci values(459,'Koray','Yavuz','2002-11-11','nazlikoc@gmail.com',5737886768,1,'Bayburt/Merkez/Aydıntepe',0,6530,97702581879);

insert into Öğrenci values(460,'Elif','Kuru','2002-03-19','bilgeyildirim@gmail.com',5868514125,3,'Gümüşhane/Merkez/Şiran',0,6530,19693447432);

insert into Öğrenci values(461,'Onur','Yaman','2002-10-05','serhatayhan@gmail.com',5209744400,2,'Artvin/Hopa/Borçka',0,6530,95755210794);

insert into Öğrenci values(462,'Zeynep','Çetin','2002-04-26','tugceyucel@gmail.com',5677263706,1,'Ardahan/Merkez/Hanak',0,6530,87231714657);

insert into Öğrenci values(463,'Furkan','Alp','2002-09-08','tahaguler@gmail.com',5360639762,4,'Iğdır/Merkez/Tuzluca',0,6530,59821161869);

insert into Öğrenci values(464,'Ayşe','Yılmazer','2002-07-21','sudeakin@gmail.com',5683214083,1,'Tunceli/Merkez/Ovacık',0,6530,28986739095);

insert into Öğrenci values(465,'Mustafa','Bulut','2002-02-14','alperenyilmaz@gmail.com',5995088770,3,'Bingöl/Merkez/Yedisu',0,6530,33004106039);

insert into Öğrenci values(466,'Fatma','Aktaş','2002-12-29','gulayhan@gmail.com',5694042794,2,'Bitlis/Merkez/Ahlat',1,6530,89859285766);

insert into Öğrenci values(467,'Ahmet','Koç','2002-06-12','burcuatalay@gmail.com',5390612334,4,'Siirt/Merkez/Pervari',0,6530,23249647921);

insert into Öğrenci values(468,'Esra','Yıldırım','2002-11-05','mustafakurt@gmail.com',5703767368,1,'Hakkâri/Merkez/Çukurca',1,6530,90297573342);

insert into Öğrenci values(469,'Furkan','Tanrıverdi','2002-03-24','cemakinci@gmail.com',5373166072,3,'Şırnak/Merkez/İdil',0,6530,78007482425);

insert into Öğrenci values(470,'İrem','Yücel','2002-10-30','zehratunc@gmail.com',5358406463,2,'Batman/Merkez/Beşiri',1,6530,60521758063);

insert into Öğrenci values(471,'Burak','Güler','2002-05-05','simayucel@gmail.com',5684142288,1,'Van/Merkez/Edremit',0,6530,35072786729);

insert into Öğrenci values(472,'Damla','Ayhan','2002-08-31','kuzeykaya@gmail.com',5762218017,4,'Muş/Merkez/Varto',0,6530,38909092793);

insert into Öğrenci values(473,'Onur','Yalın','2002-01-16','betulbulut@gmail.com',5778659247,1,'Ağrı/Merkez/Doğubeyazıt',0,6530,95111304727);

insert into Öğrenci values(474,'Gizem','Yavuz','2002-06-29','uguralp@gmail.com',5653870224,3,'Kars/Merkez/Kağızman',1,6530,66382996571);

insert into Öğrenci values(475,'Emre','Kuru','2002-11-22','silayilmaz@gmail.com',5274471555,2,'Erzurum/Yakutiye/Palandöken',0,6530,82426866195);

insert into Öğrenci values(476,'Selin','Yaman','2002-03-11','tarkanbulut@gmail.com',5186874607,4,'Erzincan/Kemaliye/Refahiye',1,6530,13354517642);

insert into Öğrenci values(477,'Ege','Çetin','2002-10-13','berfinvarol@gmail.com',5939593696,1,'Bayburt/Merkez/Demirözü',0,6530,5700564988);

insert into Öğrenci values(478,'Deniz','Alp','2002-04-20','eraycetin@gmail.com',5500581677,3,'Gümüşhane/Şiran/Kürtün',0,6530,61058675131);

insert into Öğrenci values(479,'Ece','Yılmazer','2002-09-02','aybikedogru@gmail.com',5548546085,2,'Artvin/Hopa/Borçka',0,6530,31786908638);

insert into Öğrenci values(480,'Cem','Bulut','2002-07-15','ozgurgonul@gmail.com',5377387603,1,'Ardahan/Merkez/Göle',1,6530,25264008401);

insert into Öğrenci values(481,'Yasmin','Aktaş','2002-02-12','elifgizemkiran@gmail.com',5158697995,4,'Iğdır/Karakoyunlu/Tuzluca',1,6530,45482911779);

insert into Öğrenci values(482,'Baran','Koç','2002-12-06','onurcanyavuz@gmail.com',5218485498,1,'Tunceli/Ovacık/Hozat',0,6530,32434715669);

insert into Öğrenci values(483,'Aslı','Yıldırım','2002-05-09','duyguyilmaz@gmail.com',5277966893,3,'Bingöl/Genç/Karlıova',0,6530,85506009157);

insert into Öğrenci values(484,'Umut','Tanrıverdi','2002-08-05','oktayyalcin@gmail.com',5767532651,2,'Bitlis/Ahlat/Tatvan',0,6530,56436798449);

insert into Öğrenci values(485,'Cansu','Yücel','2002-01-21','ilaycan@gmail.com',5120360409,4,'Siirt/Kurtalan/Pervari',1,6530,17994939383);

insert into Öğrenci values(486,'Emir','Güler','2002-06-04','furkanyurtsever@gmail.com',5601529564,1,'Hakkâri/Şemdinli/Yüksekova',1,6530,51127629560);

insert into Öğrenci values(487,'Aylin','Ayhan','2002-11-27','ceydakeles@gmail.com',5334401514,3,'Şırnak/İdil/Cizre',0,6530,45368999255);

insert into Öğrenci values(488,'Arda','Yalın','2002-03-16','ruzgarbektas@gmail.com',5340813844,2,'Batman/Kozluk/Beşiri',0,6530,60888173944);

insert into Öğrenci values(489,'İlayda','Yavuz','2002-10-21','cemreduman@gmail.com',5508255615,1,'Van/Edremit/Çaldıran',1,6530,17268119781);

insert into Öğrenci values(490,'Can','Kuru','2002-04-01','denizduran@gmail.com',5421625570,4,'Muş/Malazgirt/Varto',1,6530,15340173241);

insert into Öğrenci values(491,'Dilara','Yaman','2002-09-14','leventtekin@gmail.com',5863418052,1,'Ağrı/Doğubeyazıt/Diyadin',0,6530,78672737536);

insert into Öğrenci values(492,'Kaan','Çetin','2002-07-27','berilyesil@gmail.com',5810083993,3,'Kars/Sarıkamış/Digor',1,6530,89923159872);

insert into Öğrenci values(493,'Büşra','Alp','2002-02-03','alpereren@gmail.com',5442816457,2,'Erzurum/Horasan/Oltu',0,6530,65344514801);

insert into Öğrenci values(494,'Koray','Yılmazer','2002-12-26','zaraorhan@gmail.com',5744265678,4,'Erzincan/Üzümlü/Kemaliye',1,6530,15174555799);

insert into Öğrenci values(495,'Melis','Bulut','2002-06-09','burhanozen@gmail.com',5666559494,1,'Bayburt/İspir/Demirözü',1,6530,71507672389);

insert into Öğrenci values(496,'Serkan','Aktaş','2002-11-02','selmabulut@gmail.com',5150430335,3,'Gümüşhane/Şiran/Kürtün',1,6530,80766167348);

insert into Öğrenci values(497,'İpek','Koç','2002-03-21','hakanozkan@gmail.com',5932656537,2,'Artvin/Hopa/Murgul',0,6530,72429737915);

insert into Öğrenci values(498,'Hüseyin','Yıldırım','2002-10-26','elifsukoc@gmail.com',5309546423,1,'Ardahan/Göle/Damal',0,6530,48689050842);

insert into Öğrenci values(499,'ElifNur','Tanrıverdi','2002-04-09','serdaraltin@gmail.com',5774306889,4,'Iğdır/Karakoyunlu/Tuzluca',1,6530,26689494240);

insert into Öğrenci values(500,'Kadir','Yücel','2002-09-22','cemrecelik@gmail.com',5253016761,1,'Tunceli/Nazımiye/Pertek',0,6530,23633767174);


insert into ÖğrenciMüsaitSaatler values(1,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(1,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(1,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(1,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(1,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(2,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(2,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(3,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(3,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(3,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(3,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(3,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(4,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(4,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(4,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(4,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(5,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(6,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(6,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(6,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(7,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(7,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(8,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(8,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(8,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(9,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(9,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(9,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(9,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(9,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(10,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(11,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(11,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(11,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(12,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(12,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(13,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(13,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(13,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(14,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(14,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(14,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(14,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(14,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(15,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(16,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(16,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(17,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(17,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(17,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(18,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(19,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(19,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(20,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(20,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(20,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(20,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(20,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(21,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(21,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(21,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(21,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(21,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(22,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(22,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(22,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(23,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(23,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(23,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(24,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(24,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(24,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(25,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(25,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(26,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(26,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(26,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(26,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(26,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(27,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(27,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(27,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(27,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(28,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(28,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(28,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(28,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(29,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(29,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(29,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(29,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(30,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(30,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(30,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(30,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(30,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(31,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(31,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(31,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(31,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(32,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(32,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(32,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(32,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(33,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(33,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(33,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(34,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(34,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(35,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(35,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(35,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(36,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(36,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(37,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(37,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(37,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(37,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(38,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(39,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(40,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(40,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(40,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(41,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(42,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(42,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(42,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(42,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(43,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(43,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(43,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(44,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(44,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(44,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(44,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(45,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(45,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(45,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(45,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(46,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(46,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(46,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(47,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(47,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(48,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(48,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(48,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(49,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(49,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(49,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(50,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(50,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(51,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(51,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(51,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(52,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(52,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(52,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(53,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(53,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(53,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(54,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(55,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(55,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(55,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(56,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(57,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(57,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(57,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(58,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(58,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(59,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(59,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(59,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(60,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(60,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(60,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(60,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(61,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(61,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(61,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(61,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(61,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(62,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(63,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(63,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(63,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(63,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(64,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(65,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(65,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(65,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(65,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(66,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(66,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(67,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(67,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(67,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(68,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(69,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(70,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(70,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(70,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(70,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(70,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(71,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(72,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(72,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(72,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(72,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(73,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(73,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(73,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(74,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(74,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(75,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(75,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(76,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(76,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(77,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(77,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(77,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(77,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(78,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(79,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(79,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(80,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(80,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(80,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(81,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(81,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(81,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(81,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(81,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(82,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(82,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(82,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(83,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(83,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(83,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(83,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(83,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(84,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(84,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(84,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(84,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(84,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(85,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(85,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(85,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(85,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(85,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(86,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(86,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(86,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(86,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(86,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(87,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(87,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(87,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(88,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(88,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(88,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(89,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(89,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(90,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(90,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(90,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(91,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(91,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(91,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(92,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(92,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(92,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(92,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(93,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(93,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(93,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(93,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(93,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(94,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(94,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(94,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(95,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(96,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(97,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(97,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(97,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(97,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(98,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(98,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(98,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(98,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(99,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(99,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(99,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(99,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(100,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(100,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(100,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(101,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(101,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(101,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(101,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(101,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(102,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(102,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(103,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(103,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(104,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(105,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(106,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(106,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(106,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(106,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(107,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(107,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(107,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(107,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(107,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(108,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(108,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(108,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(108,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(109,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(109,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(109,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(110,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(110,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(110,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(110,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(110,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(111,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(111,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(112,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(112,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(112,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(112,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(112,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(113,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(114,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(115,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(115,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(115,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(115,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(115,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(116,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(116,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(117,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(117,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(117,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(117,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(118,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(118,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(118,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(118,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(119,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(119,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(119,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(119,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(119,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(120,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(121,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(121,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(121,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(121,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(122,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(122,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(122,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(122,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(123,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(124,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(124,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(124,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(124,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(124,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(125,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(125,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(125,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(125,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(125,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(126,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(126,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(126,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(126,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(127,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(127,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(128,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(129,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(129,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(130,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(130,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(130,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(131,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(131,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(131,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(131,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(131,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(132,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(132,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(132,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(133,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(134,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(134,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(135,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(136,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(137,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(137,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(138,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(138,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(139,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(139,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(140,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(140,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(140,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(141,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(142,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(142,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(142,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(142,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(142,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(143,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(144,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(144,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(144,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(144,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(144,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(145,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(146,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(146,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(146,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(146,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(146,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(147,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(147,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(148,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(148,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(148,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(148,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(149,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(150,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(150,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(150,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(151,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(151,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(152,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(152,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(152,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(152,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(153,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(154,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(154,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(154,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(155,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(155,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(155,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(155,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(155,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(156,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(156,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(157,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(157,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(157,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(157,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(157,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(158,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(158,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(158,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(158,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(158,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(159,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(159,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(159,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(159,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(160,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(160,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(160,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(161,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(161,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(162,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(162,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(163,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(163,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(163,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(164,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(164,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(164,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(164,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(165,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(165,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(165,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(165,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(165,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(166,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(166,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(166,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(166,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(166,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(167,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(167,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(168,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(168,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(169,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(169,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(169,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(169,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(170,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(170,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(170,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(170,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(171,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(172,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(173,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(173,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(173,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(173,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(173,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(174,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(174,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(174,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(174,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(175,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(175,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(175,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(175,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(176,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(176,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(176,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(176,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(176,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(177,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(177,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(177,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(177,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(178,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(178,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(178,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(178,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(179,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(179,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(180,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(180,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(180,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(181,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(181,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(181,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(182,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(182,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(182,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(182,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(182,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(183,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(184,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(185,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(186,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(186,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(187,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(188,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(189,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(190,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(190,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(190,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(190,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(190,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(191,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(191,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(191,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(192,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(192,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(192,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(192,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(193,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(193,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(194,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(194,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(194,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(195,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(195,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(196,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(196,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(196,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(197,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(197,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(197,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(197,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(198,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(198,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(199,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(199,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(200,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(200,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(200,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(201,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(201,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(201,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(201,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(202,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(202,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(203,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(203,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(204,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(204,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(205,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(206,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(206,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(206,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(206,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(207,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(207,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(207,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(207,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(207,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(208,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(208,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(208,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(209,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(209,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(209,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(209,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(210,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(210,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(210,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(210,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(210,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(211,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(211,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(211,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(211,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(212,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(213,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(213,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(213,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(213,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(213,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(214,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(214,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(214,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(215,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(216,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(216,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(217,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(217,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(217,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(217,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(217,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(218,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(218,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(218,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(218,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(218,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(219,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(219,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(219,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(219,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(220,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(220,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(220,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(220,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(221,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(221,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(221,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(221,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(222,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(223,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(223,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(223,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(223,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(224,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(224,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(224,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(224,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(224,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(225,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(225,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(225,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(225,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(225,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(226,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(226,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(226,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(226,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(227,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(227,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(227,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(227,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(228,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(228,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(228,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(228,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(229,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(229,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(229,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(230,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(230,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(230,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(231,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(231,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(231,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(231,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(231,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(232,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(232,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(232,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(233,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(233,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(233,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(234,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(234,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(235,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(235,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(236,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(236,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(237,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(237,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(238,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(238,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(238,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(238,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(239,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(239,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(239,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(239,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(239,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(240,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(240,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(240,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(240,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(241,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(241,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(241,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(241,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(242,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(242,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(242,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(243,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(244,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(244,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(245,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(245,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(245,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(245,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(246,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(246,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(246,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(246,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(247,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(247,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(247,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(248,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(248,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(249,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(249,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(249,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(249,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(249,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(250,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(250,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(250,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(250,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(251,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(252,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(253,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(253,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(253,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(254,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(254,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(255,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(255,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(256,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(256,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(256,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(257,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(258,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(258,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(258,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(259,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(259,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(259,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(259,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(259,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(260,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(260,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(260,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(261,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(261,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(261,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(261,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(261,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(262,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(263,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(264,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(265,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(265,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(265,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(266,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(266,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(266,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(267,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(267,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(267,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(268,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(268,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(268,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(268,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(269,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(269,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(269,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(269,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(269,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(270,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(271,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(271,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(271,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(272,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(272,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(272,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(272,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(272,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(273,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(273,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(273,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(273,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(274,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(274,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(275,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(275,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(276,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(276,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(276,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(276,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(276,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(277,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(277,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(278,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(278,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(279,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(279,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(280,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(280,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(280,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(281,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(282,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(283,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(283,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(283,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(284,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(284,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(285,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(285,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(285,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(286,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(286,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(286,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(287,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(288,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(288,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(289,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(289,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(289,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(289,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(290,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(290,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(290,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(291,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(291,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(291,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(291,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(291,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(292,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(293,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(294,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(295,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(296,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(296,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(296,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(296,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(296,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(297,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(297,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(297,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(298,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(299,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(299,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(299,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(299,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(300,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(300,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(301,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(301,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(301,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(301,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(302,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(302,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(302,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(303,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(304,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(304,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(305,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(305,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(305,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(305,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(306,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(306,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(306,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(306,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(306,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(307,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(307,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(307,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(307,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(307,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(308,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(308,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(308,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(308,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(308,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(309,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(309,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(310,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(310,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(310,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(310,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(310,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(311,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(311,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(312,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(312,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(312,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(312,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(312,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(313,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(313,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(314,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(314,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(314,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(314,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(315,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(315,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(315,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(316,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(316,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(316,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(316,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(317,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(317,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(317,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(318,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(318,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(318,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(318,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(319,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(319,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(319,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(319,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(320,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(321,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(321,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(321,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(322,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(322,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(322,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(323,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(323,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(323,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(323,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(324,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(325,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(325,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(325,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(325,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(325,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(326,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(326,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(326,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(326,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(326,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(327,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(327,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(327,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(327,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(327,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(328,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(328,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(328,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(328,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(328,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(329,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(329,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(329,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(329,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(329,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(330,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(331,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(331,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(331,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(331,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(332,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(332,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(333,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(333,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(333,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(333,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(333,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(334,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(334,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(334,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(334,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(335,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(335,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(335,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(335,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(336,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(336,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(336,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(336,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(336,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(337,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(337,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(337,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(337,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(337,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(338,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(338,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(338,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(339,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(339,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(339,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(340,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(340,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(340,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(340,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(340,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(341,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(341,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(341,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(341,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(342,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(342,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(343,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(343,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(343,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(344,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(344,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(344,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(344,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(344,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(345,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(345,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(345,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(345,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(345,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(346,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(346,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(347,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(348,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(348,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(348,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(348,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(349,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(350,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(350,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(350,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(351,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(352,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(352,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(353,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(353,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(353,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(354,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(354,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(355,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(356,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(356,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(356,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(357,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(357,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(357,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(357,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(358,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(358,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(358,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(358,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(358,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(359,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(359,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(359,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(359,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(360,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(360,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(360,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(361,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(361,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(361,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(361,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(362,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(362,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(362,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(362,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(362,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(363,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(363,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(363,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(364,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(364,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(364,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(364,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(364,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(365,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(365,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(365,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(365,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(366,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(366,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(366,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(366,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(366,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(367,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(367,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(367,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(367,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(368,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(368,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(368,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(368,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(368,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(369,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(369,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(369,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(369,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(369,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(370,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(371,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(371,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(371,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(372,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(372,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(372,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(372,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(373,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(373,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(373,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(373,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(373,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(374,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(374,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(375,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(375,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(375,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(375,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(376,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(376,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(376,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(376,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(376,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(377,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(377,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(377,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(377,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(378,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(378,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(378,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(378,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(379,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(379,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(379,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(380,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(380,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(380,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(381,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(381,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(382,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(382,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(382,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(382,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(383,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(383,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(384,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(385,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(385,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(385,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(386,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(386,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(386,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(386,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(387,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(387,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(387,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(388,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(388,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(388,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(388,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(388,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(389,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(389,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(389,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(390,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(390,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(390,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(390,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(391,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(391,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(391,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(392,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(392,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(392,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(392,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(393,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(393,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(394,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(394,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(394,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(395,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(395,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(395,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(395,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(395,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(396,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(397,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(397,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(398,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(398,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(398,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(398,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(399,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(400,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(401,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(402,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(402,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(402,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(403,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(403,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(403,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(403,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(403,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(404,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(404,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(404,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(404,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(405,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(405,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(405,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(406,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(407,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(408,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(408,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(408,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(408,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(408,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(409,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(409,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(409,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(409,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(409,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(410,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(410,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(410,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(411,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(412,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(412,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(412,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(412,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(412,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(413,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(413,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(414,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(414,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(414,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(415,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(415,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(415,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(415,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(416,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(416,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(417,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(417,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(417,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(417,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(417,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(418,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(418,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(418,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(418,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(419,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(420,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(420,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(420,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(420,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(420,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(421,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(422,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(422,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(423,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(423,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(423,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(424,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(425,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(425,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(425,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(425,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(425,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(426,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(426,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(427,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(427,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(427,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(427,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(428,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(428,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(428,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(428,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(428,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(429,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(429,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(429,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(429,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(429,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(430,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(430,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(430,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(430,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(431,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(431,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(431,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(431,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(431,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(432,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(432,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(432,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(433,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(434,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(434,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(435,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(435,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(435,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(436,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(436,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(436,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(437,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(437,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(438,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(438,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(438,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(438,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(438,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(439,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(440,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(440,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(440,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(440,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(441,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(441,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(442,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(442,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(443,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(443,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(444,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(444,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(444,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(444,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(445,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(445,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(446,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(446,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(446,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(446,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(446,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(447,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(447,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(447,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(447,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(447,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(448,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(448,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(449,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(449,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(449,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(449,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(449,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(450,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(450,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(450,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(450,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(450,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(451,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(451,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(451,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(451,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(451,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(452,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(452,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(452,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(452,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(453,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(454,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(455,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(455,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(455,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(455,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(455,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(456,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(456,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(456,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(456,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(456,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(457,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(457,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(457,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(457,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(458,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(458,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(458,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(459,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(459,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(459,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(459,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(459,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(460,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(460,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(460,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(461,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(461,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(462,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(462,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(462,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(462,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(463,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(464,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(464,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(464,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(464,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(464,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(465,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(465,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(465,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(465,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(465,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(466,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(466,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(466,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(467,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(467,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(467,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(468,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(468,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(468,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(468,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(469,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(470,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(470,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(471,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(471,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(471,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(472,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(473,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(473,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(473,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(473,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(474,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(474,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(474,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(474,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(474,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(475,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(476,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(476,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(476,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(476,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(476,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(477,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(477,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(477,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(477,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(477,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(478,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(478,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(478,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(478,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(478,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(479,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(479,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(479,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(479,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(480,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(481,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(482,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(482,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(482,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(482,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(482,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(483,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(483,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(483,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(484,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(484,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(484,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(484,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(484,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(485,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(485,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(485,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(485,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(485,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(486,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(486,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(486,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(487,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(487,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(488,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(488,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(488,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(488,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(489,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(489,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(489,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(489,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(490,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(490,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(490,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(490,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(491,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(491,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(492,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(492,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(492,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(492,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(493,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(493,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(493,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(493,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(493,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(494,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(494,'16:00:00');

insert into ÖğrenciMüsaitSaatler values(494,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(494,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(494,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(495,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(495,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(496,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(496,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(496,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(497,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(497,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(497,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(497,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(498,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(499,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(500,'14:00:00');

insert into ÖğrenciMüsaitSaatler values(500,'12:00:00');

insert into ÖğrenciMüsaitSaatler values(500,'08:00:00');

insert into ÖğrenciMüsaitSaatler values(500,'10:00:00');

insert into ÖğrenciMüsaitSaatler values(500,'16:00:00');

insert into ÖğrenciMüsaitlikDurumu values(1,'cuma',2000);

insert into ÖğrenciMüsaitlikDurumu values(1,'pazartesi',2001);

insert into ÖğrenciMüsaitlikDurumu values(1,'çarşamba',2002);

insert into ÖğrenciMüsaitlikDurumu values(1,'salı',2003);

insert into ÖğrenciMüsaitlikDurumu values(2,'cuma',2004);

insert into ÖğrenciMüsaitlikDurumu values(2,'salı',2005);

insert into ÖğrenciMüsaitlikDurumu values(2,'pazartesi',2006);

insert into ÖğrenciMüsaitlikDurumu values(2,'perşembe',2007);

insert into ÖğrenciMüsaitlikDurumu values(3,'perşembe',2008);

insert into ÖğrenciMüsaitlikDurumu values(3,'çarşamba',2009);

insert into ÖğrenciMüsaitlikDurumu values(3,'salı',2010);

insert into ÖğrenciMüsaitlikDurumu values(4,'cuma',2011);

insert into ÖğrenciMüsaitlikDurumu values(4,'salı',2012);

insert into ÖğrenciMüsaitlikDurumu values(5,'cuma',2013);

insert into ÖğrenciMüsaitlikDurumu values(5,'perşembe',2014);

insert into ÖğrenciMüsaitlikDurumu values(5,'çarşamba',2015);

insert into ÖğrenciMüsaitlikDurumu values(5,'pazartesi',2016);

insert into ÖğrenciMüsaitlikDurumu values(6,'pazartesi',2017);

insert into ÖğrenciMüsaitlikDurumu values(6,'perşembe',2018);

insert into ÖğrenciMüsaitlikDurumu values(6,'çarşamba',2019);

insert into ÖğrenciMüsaitlikDurumu values(6,'cuma',2020);

insert into ÖğrenciMüsaitlikDurumu values(7,'cuma',2021);

insert into ÖğrenciMüsaitlikDurumu values(7,'perşembe',2022);

insert into ÖğrenciMüsaitlikDurumu values(7,'çarşamba',2023);

insert into ÖğrenciMüsaitlikDurumu values(7,'pazartesi',2024);

insert into ÖğrenciMüsaitlikDurumu values(7,'salı',2025);

insert into ÖğrenciMüsaitlikDurumu values(8,'pazartesi',2026);

insert into ÖğrenciMüsaitlikDurumu values(9,'cuma',2027);

insert into ÖğrenciMüsaitlikDurumu values(9,'çarşamba',2028);

insert into ÖğrenciMüsaitlikDurumu values(9,'salı',2029);

insert into ÖğrenciMüsaitlikDurumu values(10,'salı',2030);

insert into ÖğrenciMüsaitlikDurumu values(10,'perşembe',2031);

insert into ÖğrenciMüsaitlikDurumu values(10,'çarşamba',2032);

insert into ÖğrenciMüsaitlikDurumu values(11,'cuma',2033);

insert into ÖğrenciMüsaitlikDurumu values(11,'salı',2034);

insert into ÖğrenciMüsaitlikDurumu values(11,'çarşamba',2035);

insert into ÖğrenciMüsaitlikDurumu values(12,'pazartesi',2036);

insert into ÖğrenciMüsaitlikDurumu values(12,'salı',2037);

insert into ÖğrenciMüsaitlikDurumu values(13,'salı',2038);

insert into ÖğrenciMüsaitlikDurumu values(14,'perşembe',2039);

insert into ÖğrenciMüsaitlikDurumu values(14,'çarşamba',2040);

insert into ÖğrenciMüsaitlikDurumu values(14,'salı',2041);

insert into ÖğrenciMüsaitlikDurumu values(14,'cuma',2042);

insert into ÖğrenciMüsaitlikDurumu values(14,'pazartesi',2043);

insert into ÖğrenciMüsaitlikDurumu values(15,'perşembe',2044);

insert into ÖğrenciMüsaitlikDurumu values(16,'pazartesi',2045);

insert into ÖğrenciMüsaitlikDurumu values(16,'çarşamba',2046);

insert into ÖğrenciMüsaitlikDurumu values(17,'çarşamba',2047);

insert into ÖğrenciMüsaitlikDurumu values(18,'perşembe',2048);

insert into ÖğrenciMüsaitlikDurumu values(18,'salı',2049);

insert into ÖğrenciMüsaitlikDurumu values(18,'cuma',2050);

insert into ÖğrenciMüsaitlikDurumu values(18,'çarşamba',2051);

insert into ÖğrenciMüsaitlikDurumu values(18,'pazartesi',2052);

insert into ÖğrenciMüsaitlikDurumu values(19,'çarşamba',2053);

insert into ÖğrenciMüsaitlikDurumu values(19,'pazartesi',2054);

insert into ÖğrenciMüsaitlikDurumu values(19,'cuma',2055);

insert into ÖğrenciMüsaitlikDurumu values(19,'salı',2056);

insert into ÖğrenciMüsaitlikDurumu values(20,'salı',2057);

insert into ÖğrenciMüsaitlikDurumu values(20,'çarşamba',2058);

insert into ÖğrenciMüsaitlikDurumu values(20,'pazartesi',2059);

insert into ÖğrenciMüsaitlikDurumu values(20,'perşembe',2060);

insert into ÖğrenciMüsaitlikDurumu values(20,'cuma',2061);

insert into ÖğrenciMüsaitlikDurumu values(21,'cuma',2062);

insert into ÖğrenciMüsaitlikDurumu values(21,'salı',2063);

insert into ÖğrenciMüsaitlikDurumu values(21,'pazartesi',2064);

insert into ÖğrenciMüsaitlikDurumu values(22,'cuma',2065);

insert into ÖğrenciMüsaitlikDurumu values(23,'çarşamba',2066);

insert into ÖğrenciMüsaitlikDurumu values(23,'pazartesi',2067);

insert into ÖğrenciMüsaitlikDurumu values(23,'perşembe',2068);

insert into ÖğrenciMüsaitlikDurumu values(23,'salı',2069);

insert into ÖğrenciMüsaitlikDurumu values(23,'cuma',2070);

insert into ÖğrenciMüsaitlikDurumu values(24,'salı',2071);

insert into ÖğrenciMüsaitlikDurumu values(24,'perşembe',2072);

insert into ÖğrenciMüsaitlikDurumu values(25,'perşembe',2073);

insert into ÖğrenciMüsaitlikDurumu values(26,'perşembe',2074);

insert into ÖğrenciMüsaitlikDurumu values(26,'salı',2075);

insert into ÖğrenciMüsaitlikDurumu values(26,'çarşamba',2076);

insert into ÖğrenciMüsaitlikDurumu values(26,'pazartesi',2077);

insert into ÖğrenciMüsaitlikDurumu values(26,'cuma',2078);

insert into ÖğrenciMüsaitlikDurumu values(27,'cuma',2079);

insert into ÖğrenciMüsaitlikDurumu values(27,'perşembe',2080);

insert into ÖğrenciMüsaitlikDurumu values(28,'salı',2081);

insert into ÖğrenciMüsaitlikDurumu values(29,'perşembe',2082);

insert into ÖğrenciMüsaitlikDurumu values(29,'cuma',2083);

insert into ÖğrenciMüsaitlikDurumu values(29,'pazartesi',2084);

insert into ÖğrenciMüsaitlikDurumu values(29,'salı',2085);

insert into ÖğrenciMüsaitlikDurumu values(29,'çarşamba',2086);

insert into ÖğrenciMüsaitlikDurumu values(30,'salı',2087);

insert into ÖğrenciMüsaitlikDurumu values(30,'pazartesi',2088);

insert into ÖğrenciMüsaitlikDurumu values(30,'cuma',2089);

insert into ÖğrenciMüsaitlikDurumu values(30,'perşembe',2090);

insert into ÖğrenciMüsaitlikDurumu values(30,'çarşamba',2091);

insert into ÖğrenciMüsaitlikDurumu values(31,'salı',2092);

insert into ÖğrenciMüsaitlikDurumu values(31,'perşembe',2093);

insert into ÖğrenciMüsaitlikDurumu values(31,'pazartesi',2094);

insert into ÖğrenciMüsaitlikDurumu values(31,'cuma',2095);

insert into ÖğrenciMüsaitlikDurumu values(32,'çarşamba',2096);

insert into ÖğrenciMüsaitlikDurumu values(32,'perşembe',2097);

insert into ÖğrenciMüsaitlikDurumu values(32,'salı',2098);

insert into ÖğrenciMüsaitlikDurumu values(32,'cuma',2099);

insert into ÖğrenciMüsaitlikDurumu values(33,'cuma',2100);

insert into ÖğrenciMüsaitlikDurumu values(33,'perşembe',2101);

insert into ÖğrenciMüsaitlikDurumu values(34,'salı',2102);

insert into ÖğrenciMüsaitlikDurumu values(34,'perşembe',2103);

insert into ÖğrenciMüsaitlikDurumu values(34,'cuma',2104);

insert into ÖğrenciMüsaitlikDurumu values(34,'pazartesi',2105);

insert into ÖğrenciMüsaitlikDurumu values(35,'çarşamba',2106);

insert into ÖğrenciMüsaitlikDurumu values(35,'salı',2107);

insert into ÖğrenciMüsaitlikDurumu values(35,'pazartesi',2108);

insert into ÖğrenciMüsaitlikDurumu values(36,'salı',2109);

insert into ÖğrenciMüsaitlikDurumu values(36,'çarşamba',2110);

insert into ÖğrenciMüsaitlikDurumu values(36,'perşembe',2111);

insert into ÖğrenciMüsaitlikDurumu values(36,'pazartesi',2112);

insert into ÖğrenciMüsaitlikDurumu values(37,'çarşamba',2113);

insert into ÖğrenciMüsaitlikDurumu values(37,'salı',2114);

insert into ÖğrenciMüsaitlikDurumu values(37,'pazartesi',2115);

insert into ÖğrenciMüsaitlikDurumu values(38,'salı',2116);

insert into ÖğrenciMüsaitlikDurumu values(38,'perşembe',2117);

insert into ÖğrenciMüsaitlikDurumu values(38,'çarşamba',2118);

insert into ÖğrenciMüsaitlikDurumu values(38,'pazartesi',2119);

insert into ÖğrenciMüsaitlikDurumu values(39,'salı',2120);

insert into ÖğrenciMüsaitlikDurumu values(40,'çarşamba',2121);

insert into ÖğrenciMüsaitlikDurumu values(40,'salı',2122);

insert into ÖğrenciMüsaitlikDurumu values(40,'cuma',2123);

insert into ÖğrenciMüsaitlikDurumu values(41,'cuma',2124);

insert into ÖğrenciMüsaitlikDurumu values(41,'perşembe',2125);

insert into ÖğrenciMüsaitlikDurumu values(42,'çarşamba',2126);

insert into ÖğrenciMüsaitlikDurumu values(42,'perşembe',2127);

insert into ÖğrenciMüsaitlikDurumu values(43,'salı',2128);

insert into ÖğrenciMüsaitlikDurumu values(43,'pazartesi',2129);

insert into ÖğrenciMüsaitlikDurumu values(43,'cuma',2130);

insert into ÖğrenciMüsaitlikDurumu values(44,'perşembe',2131);

insert into ÖğrenciMüsaitlikDurumu values(44,'çarşamba',2132);

insert into ÖğrenciMüsaitlikDurumu values(44,'pazartesi',2133);

insert into ÖğrenciMüsaitlikDurumu values(44,'cuma',2134);

insert into ÖğrenciMüsaitlikDurumu values(44,'salı',2135);

insert into ÖğrenciMüsaitlikDurumu values(45,'salı',2136);

insert into ÖğrenciMüsaitlikDurumu values(45,'çarşamba',2137);

insert into ÖğrenciMüsaitlikDurumu values(46,'pazartesi',2138);

insert into ÖğrenciMüsaitlikDurumu values(46,'salı',2139);

insert into ÖğrenciMüsaitlikDurumu values(46,'cuma',2140);

insert into ÖğrenciMüsaitlikDurumu values(47,'salı',2141);

insert into ÖğrenciMüsaitlikDurumu values(47,'pazartesi',2142);

insert into ÖğrenciMüsaitlikDurumu values(47,'perşembe',2143);

insert into ÖğrenciMüsaitlikDurumu values(47,'cuma',2144);

insert into ÖğrenciMüsaitlikDurumu values(47,'çarşamba',2145);

insert into ÖğrenciMüsaitlikDurumu values(48,'cuma',2146);

insert into ÖğrenciMüsaitlikDurumu values(48,'pazartesi',2147);

insert into ÖğrenciMüsaitlikDurumu values(48,'perşembe',2148);

insert into ÖğrenciMüsaitlikDurumu values(49,'pazartesi',2149);

insert into ÖğrenciMüsaitlikDurumu values(49,'cuma',2150);

insert into ÖğrenciMüsaitlikDurumu values(50,'salı',2151);

insert into ÖğrenciMüsaitlikDurumu values(51,'cuma',2152);

insert into ÖğrenciMüsaitlikDurumu values(51,'perşembe',2153);

insert into ÖğrenciMüsaitlikDurumu values(51,'çarşamba',2154);

insert into ÖğrenciMüsaitlikDurumu values(52,'çarşamba',2155);

insert into ÖğrenciMüsaitlikDurumu values(52,'cuma',2156);

insert into ÖğrenciMüsaitlikDurumu values(52,'pazartesi',2157);

insert into ÖğrenciMüsaitlikDurumu values(52,'salı',2158);

insert into ÖğrenciMüsaitlikDurumu values(52,'perşembe',2159);

insert into ÖğrenciMüsaitlikDurumu values(53,'cuma',2160);

insert into ÖğrenciMüsaitlikDurumu values(53,'çarşamba',2161);

insert into ÖğrenciMüsaitlikDurumu values(53,'perşembe',2162);

insert into ÖğrenciMüsaitlikDurumu values(54,'perşembe',2163);

insert into ÖğrenciMüsaitlikDurumu values(54,'çarşamba',2164);

insert into ÖğrenciMüsaitlikDurumu values(54,'cuma',2165);

insert into ÖğrenciMüsaitlikDurumu values(54,'salı',2166);

insert into ÖğrenciMüsaitlikDurumu values(55,'perşembe',2167);

insert into ÖğrenciMüsaitlikDurumu values(56,'pazartesi',2168);

insert into ÖğrenciMüsaitlikDurumu values(56,'salı',2169);

insert into ÖğrenciMüsaitlikDurumu values(56,'çarşamba',2170);

insert into ÖğrenciMüsaitlikDurumu values(56,'cuma',2171);

insert into ÖğrenciMüsaitlikDurumu values(56,'perşembe',2172);

insert into ÖğrenciMüsaitlikDurumu values(57,'salı',2173);

insert into ÖğrenciMüsaitlikDurumu values(57,'perşembe',2174);

insert into ÖğrenciMüsaitlikDurumu values(58,'çarşamba',2175);

insert into ÖğrenciMüsaitlikDurumu values(58,'pazartesi',2176);

insert into ÖğrenciMüsaitlikDurumu values(59,'çarşamba',2177);

insert into ÖğrenciMüsaitlikDurumu values(59,'pazartesi',2178);

insert into ÖğrenciMüsaitlikDurumu values(59,'salı',2179);

insert into ÖğrenciMüsaitlikDurumu values(60,'cuma',2180);

insert into ÖğrenciMüsaitlikDurumu values(60,'çarşamba',2181);

insert into ÖğrenciMüsaitlikDurumu values(60,'perşembe',2182);

insert into ÖğrenciMüsaitlikDurumu values(60,'salı',2183);

insert into ÖğrenciMüsaitlikDurumu values(60,'pazartesi',2184);

insert into ÖğrenciMüsaitlikDurumu values(61,'çarşamba',2185);

insert into ÖğrenciMüsaitlikDurumu values(61,'perşembe',2186);

insert into ÖğrenciMüsaitlikDurumu values(61,'cuma',2187);

insert into ÖğrenciMüsaitlikDurumu values(61,'salı',2188);

insert into ÖğrenciMüsaitlikDurumu values(61,'pazartesi',2189);

insert into ÖğrenciMüsaitlikDurumu values(62,'salı',2190);

insert into ÖğrenciMüsaitlikDurumu values(62,'çarşamba',2191);

insert into ÖğrenciMüsaitlikDurumu values(63,'çarşamba',2192);

insert into ÖğrenciMüsaitlikDurumu values(63,'cuma',2193);

insert into ÖğrenciMüsaitlikDurumu values(64,'çarşamba',2194);

insert into ÖğrenciMüsaitlikDurumu values(65,'pazartesi',2195);

insert into ÖğrenciMüsaitlikDurumu values(65,'perşembe',2196);

insert into ÖğrenciMüsaitlikDurumu values(65,'salı',2197);

insert into ÖğrenciMüsaitlikDurumu values(66,'cuma',2198);

insert into ÖğrenciMüsaitlikDurumu values(66,'pazartesi',2199);

insert into ÖğrenciMüsaitlikDurumu values(66,'perşembe',2200);

insert into ÖğrenciMüsaitlikDurumu values(67,'salı',2201);

insert into ÖğrenciMüsaitlikDurumu values(67,'çarşamba',2202);

insert into ÖğrenciMüsaitlikDurumu values(68,'perşembe',2203);

insert into ÖğrenciMüsaitlikDurumu values(68,'çarşamba',2204);

insert into ÖğrenciMüsaitlikDurumu values(68,'cuma',2205);

insert into ÖğrenciMüsaitlikDurumu values(69,'pazartesi',2206);

insert into ÖğrenciMüsaitlikDurumu values(69,'çarşamba',2207);

insert into ÖğrenciMüsaitlikDurumu values(70,'cuma',2208);

insert into ÖğrenciMüsaitlikDurumu values(70,'salı',2209);

insert into ÖğrenciMüsaitlikDurumu values(70,'pazartesi',2210);

insert into ÖğrenciMüsaitlikDurumu values(70,'perşembe',2211);

insert into ÖğrenciMüsaitlikDurumu values(70,'çarşamba',2212);

insert into ÖğrenciMüsaitlikDurumu values(71,'pazartesi',2213);

insert into ÖğrenciMüsaitlikDurumu values(71,'perşembe',2214);

insert into ÖğrenciMüsaitlikDurumu values(71,'cuma',2215);

insert into ÖğrenciMüsaitlikDurumu values(71,'salı',2216);

insert into ÖğrenciMüsaitlikDurumu values(71,'çarşamba',2217);

insert into ÖğrenciMüsaitlikDurumu values(72,'çarşamba',2218);

insert into ÖğrenciMüsaitlikDurumu values(72,'perşembe',2219);

insert into ÖğrenciMüsaitlikDurumu values(72,'pazartesi',2220);

insert into ÖğrenciMüsaitlikDurumu values(73,'perşembe',2221);

insert into ÖğrenciMüsaitlikDurumu values(73,'çarşamba',2222);

insert into ÖğrenciMüsaitlikDurumu values(73,'salı',2223);

insert into ÖğrenciMüsaitlikDurumu values(73,'pazartesi',2224);

insert into ÖğrenciMüsaitlikDurumu values(74,'perşembe',2225);

insert into ÖğrenciMüsaitlikDurumu values(75,'cuma',2226);

insert into ÖğrenciMüsaitlikDurumu values(75,'salı',2227);

insert into ÖğrenciMüsaitlikDurumu values(75,'pazartesi',2228);

insert into ÖğrenciMüsaitlikDurumu values(75,'çarşamba',2229);

insert into ÖğrenciMüsaitlikDurumu values(76,'perşembe',2230);

insert into ÖğrenciMüsaitlikDurumu values(77,'salı',2231);

insert into ÖğrenciMüsaitlikDurumu values(77,'perşembe',2232);

insert into ÖğrenciMüsaitlikDurumu values(77,'pazartesi',2233);

insert into ÖğrenciMüsaitlikDurumu values(78,'cuma',2234);

insert into ÖğrenciMüsaitlikDurumu values(78,'salı',2235);

insert into ÖğrenciMüsaitlikDurumu values(78,'pazartesi',2236);

insert into ÖğrenciMüsaitlikDurumu values(78,'çarşamba',2237);

insert into ÖğrenciMüsaitlikDurumu values(79,'perşembe',2238);

insert into ÖğrenciMüsaitlikDurumu values(79,'salı',2239);

insert into ÖğrenciMüsaitlikDurumu values(80,'perşembe',2240);

insert into ÖğrenciMüsaitlikDurumu values(80,'çarşamba',2241);

insert into ÖğrenciMüsaitlikDurumu values(80,'salı',2242);

insert into ÖğrenciMüsaitlikDurumu values(80,'cuma',2243);

insert into ÖğrenciMüsaitlikDurumu values(81,'pazartesi',2244);

insert into ÖğrenciMüsaitlikDurumu values(81,'perşembe',2245);

insert into ÖğrenciMüsaitlikDurumu values(81,'çarşamba',2246);

insert into ÖğrenciMüsaitlikDurumu values(81,'cuma',2247);

insert into ÖğrenciMüsaitlikDurumu values(81,'salı',2248);

insert into ÖğrenciMüsaitlikDurumu values(82,'çarşamba',2249);

insert into ÖğrenciMüsaitlikDurumu values(82,'cuma',2250);

insert into ÖğrenciMüsaitlikDurumu values(82,'pazartesi',2251);

insert into ÖğrenciMüsaitlikDurumu values(82,'salı',2252);

insert into ÖğrenciMüsaitlikDurumu values(82,'perşembe',2253);

insert into ÖğrenciMüsaitlikDurumu values(83,'perşembe',2254);

insert into ÖğrenciMüsaitlikDurumu values(83,'çarşamba',2255);

insert into ÖğrenciMüsaitlikDurumu values(83,'salı',2256);

insert into ÖğrenciMüsaitlikDurumu values(83,'pazartesi',2257);

insert into ÖğrenciMüsaitlikDurumu values(83,'cuma',2258);

insert into ÖğrenciMüsaitlikDurumu values(84,'çarşamba',2259);

insert into ÖğrenciMüsaitlikDurumu values(84,'pazartesi',2260);

insert into ÖğrenciMüsaitlikDurumu values(84,'perşembe',2261);

insert into ÖğrenciMüsaitlikDurumu values(84,'cuma',2262);

insert into ÖğrenciMüsaitlikDurumu values(84,'salı',2263);

insert into ÖğrenciMüsaitlikDurumu values(85,'salı',2264);

insert into ÖğrenciMüsaitlikDurumu values(86,'perşembe',2265);

insert into ÖğrenciMüsaitlikDurumu values(87,'salı',2266);

insert into ÖğrenciMüsaitlikDurumu values(87,'çarşamba',2267);

insert into ÖğrenciMüsaitlikDurumu values(88,'cuma',2268);

insert into ÖğrenciMüsaitlikDurumu values(88,'pazartesi',2269);

insert into ÖğrenciMüsaitlikDurumu values(88,'salı',2270);

insert into ÖğrenciMüsaitlikDurumu values(88,'perşembe',2271);

insert into ÖğrenciMüsaitlikDurumu values(88,'çarşamba',2272);

insert into ÖğrenciMüsaitlikDurumu values(89,'perşembe',2273);

insert into ÖğrenciMüsaitlikDurumu values(89,'pazartesi',2274);

insert into ÖğrenciMüsaitlikDurumu values(89,'çarşamba',2275);

insert into ÖğrenciMüsaitlikDurumu values(89,'salı',2276);

insert into ÖğrenciMüsaitlikDurumu values(89,'cuma',2277);

insert into ÖğrenciMüsaitlikDurumu values(90,'perşembe',2278);

insert into ÖğrenciMüsaitlikDurumu values(90,'pazartesi',2279);

insert into ÖğrenciMüsaitlikDurumu values(90,'çarşamba',2280);

insert into ÖğrenciMüsaitlikDurumu values(91,'çarşamba',2281);

insert into ÖğrenciMüsaitlikDurumu values(91,'salı',2282);

insert into ÖğrenciMüsaitlikDurumu values(91,'perşembe',2283);

insert into ÖğrenciMüsaitlikDurumu values(91,'cuma',2284);

insert into ÖğrenciMüsaitlikDurumu values(91,'pazartesi',2285);

insert into ÖğrenciMüsaitlikDurumu values(92,'salı',2286);

insert into ÖğrenciMüsaitlikDurumu values(92,'cuma',2287);

insert into ÖğrenciMüsaitlikDurumu values(92,'perşembe',2288);

insert into ÖğrenciMüsaitlikDurumu values(92,'pazartesi',2289);

insert into ÖğrenciMüsaitlikDurumu values(92,'çarşamba',2290);

insert into ÖğrenciMüsaitlikDurumu values(93,'salı',2291);

insert into ÖğrenciMüsaitlikDurumu values(93,'cuma',2292);

insert into ÖğrenciMüsaitlikDurumu values(93,'pazartesi',2293);

insert into ÖğrenciMüsaitlikDurumu values(94,'cuma',2294);

insert into ÖğrenciMüsaitlikDurumu values(94,'pazartesi',2295);

insert into ÖğrenciMüsaitlikDurumu values(94,'salı',2296);

insert into ÖğrenciMüsaitlikDurumu values(94,'perşembe',2297);

insert into ÖğrenciMüsaitlikDurumu values(95,'cuma',2298);

insert into ÖğrenciMüsaitlikDurumu values(95,'çarşamba',2299);

insert into ÖğrenciMüsaitlikDurumu values(95,'perşembe',2300);

insert into ÖğrenciMüsaitlikDurumu values(96,'salı',2301);

insert into ÖğrenciMüsaitlikDurumu values(97,'cuma',2302);

insert into ÖğrenciMüsaitlikDurumu values(97,'perşembe',2303);

insert into ÖğrenciMüsaitlikDurumu values(97,'çarşamba',2304);

insert into ÖğrenciMüsaitlikDurumu values(97,'pazartesi',2305);

insert into ÖğrenciMüsaitlikDurumu values(98,'çarşamba',2306);

insert into ÖğrenciMüsaitlikDurumu values(98,'perşembe',2307);

insert into ÖğrenciMüsaitlikDurumu values(98,'pazartesi',2308);

insert into ÖğrenciMüsaitlikDurumu values(98,'cuma',2309);

insert into ÖğrenciMüsaitlikDurumu values(99,'cuma',2310);

insert into ÖğrenciMüsaitlikDurumu values(99,'çarşamba',2311);

insert into ÖğrenciMüsaitlikDurumu values(99,'pazartesi',2312);

insert into ÖğrenciMüsaitlikDurumu values(100,'cuma',2313);

insert into ÖğrenciMüsaitlikDurumu values(100,'pazartesi',2314);

insert into ÖğrenciMüsaitlikDurumu values(100,'çarşamba',2315);

insert into ÖğrenciMüsaitlikDurumu values(100,'salı',2316);

insert into ÖğrenciMüsaitlikDurumu values(100,'perşembe',2317);

insert into ÖğrenciMüsaitlikDurumu values(101,'salı',2318);

insert into ÖğrenciMüsaitlikDurumu values(101,'pazartesi',2319);

insert into ÖğrenciMüsaitlikDurumu values(101,'cuma',2320);

insert into ÖğrenciMüsaitlikDurumu values(102,'salı',2321);

insert into ÖğrenciMüsaitlikDurumu values(102,'cuma',2322);

insert into ÖğrenciMüsaitlikDurumu values(102,'pazartesi',2323);

insert into ÖğrenciMüsaitlikDurumu values(102,'çarşamba',2324);

insert into ÖğrenciMüsaitlikDurumu values(102,'perşembe',2325);

insert into ÖğrenciMüsaitlikDurumu values(103,'salı',2326);

insert into ÖğrenciMüsaitlikDurumu values(103,'perşembe',2327);

insert into ÖğrenciMüsaitlikDurumu values(103,'cuma',2328);

insert into ÖğrenciMüsaitlikDurumu values(104,'çarşamba',2329);

insert into ÖğrenciMüsaitlikDurumu values(104,'salı',2330);

insert into ÖğrenciMüsaitlikDurumu values(104,'cuma',2331);

insert into ÖğrenciMüsaitlikDurumu values(105,'perşembe',2332);

insert into ÖğrenciMüsaitlikDurumu values(105,'çarşamba',2333);

insert into ÖğrenciMüsaitlikDurumu values(105,'pazartesi',2334);

insert into ÖğrenciMüsaitlikDurumu values(105,'cuma',2335);

insert into ÖğrenciMüsaitlikDurumu values(105,'salı',2336);

insert into ÖğrenciMüsaitlikDurumu values(106,'çarşamba',2337);

insert into ÖğrenciMüsaitlikDurumu values(106,'perşembe',2338);

insert into ÖğrenciMüsaitlikDurumu values(106,'cuma',2339);

insert into ÖğrenciMüsaitlikDurumu values(107,'salı',2340);

insert into ÖğrenciMüsaitlikDurumu values(107,'perşembe',2341);

insert into ÖğrenciMüsaitlikDurumu values(108,'perşembe',2342);

insert into ÖğrenciMüsaitlikDurumu values(108,'salı',2343);

insert into ÖğrenciMüsaitlikDurumu values(108,'pazartesi',2344);

insert into ÖğrenciMüsaitlikDurumu values(108,'cuma',2345);

insert into ÖğrenciMüsaitlikDurumu values(108,'çarşamba',2346);

insert into ÖğrenciMüsaitlikDurumu values(109,'salı',2347);

insert into ÖğrenciMüsaitlikDurumu values(109,'cuma',2348);

insert into ÖğrenciMüsaitlikDurumu values(109,'çarşamba',2349);

insert into ÖğrenciMüsaitlikDurumu values(110,'salı',2350);

insert into ÖğrenciMüsaitlikDurumu values(110,'pazartesi',2351);

insert into ÖğrenciMüsaitlikDurumu values(110,'cuma',2352);

insert into ÖğrenciMüsaitlikDurumu values(110,'çarşamba',2353);

insert into ÖğrenciMüsaitlikDurumu values(111,'perşembe',2354);

insert into ÖğrenciMüsaitlikDurumu values(112,'salı',2355);

insert into ÖğrenciMüsaitlikDurumu values(112,'cuma',2356);

insert into ÖğrenciMüsaitlikDurumu values(112,'pazartesi',2357);

insert into ÖğrenciMüsaitlikDurumu values(112,'çarşamba',2358);

insert into ÖğrenciMüsaitlikDurumu values(113,'pazartesi',2359);

insert into ÖğrenciMüsaitlikDurumu values(114,'perşembe',2360);

insert into ÖğrenciMüsaitlikDurumu values(114,'salı',2361);

insert into ÖğrenciMüsaitlikDurumu values(114,'çarşamba',2362);

insert into ÖğrenciMüsaitlikDurumu values(114,'cuma',2363);

insert into ÖğrenciMüsaitlikDurumu values(114,'pazartesi',2364);

insert into ÖğrenciMüsaitlikDurumu values(115,'perşembe',2365);

insert into ÖğrenciMüsaitlikDurumu values(115,'salı',2366);

insert into ÖğrenciMüsaitlikDurumu values(115,'pazartesi',2367);

insert into ÖğrenciMüsaitlikDurumu values(115,'cuma',2368);

insert into ÖğrenciMüsaitlikDurumu values(115,'çarşamba',2369);

insert into ÖğrenciMüsaitlikDurumu values(116,'salı',2370);

insert into ÖğrenciMüsaitlikDurumu values(116,'çarşamba',2371);

insert into ÖğrenciMüsaitlikDurumu values(116,'pazartesi',2372);

insert into ÖğrenciMüsaitlikDurumu values(116,'perşembe',2373);

insert into ÖğrenciMüsaitlikDurumu values(116,'cuma',2374);

insert into ÖğrenciMüsaitlikDurumu values(117,'pazartesi',2375);

insert into ÖğrenciMüsaitlikDurumu values(117,'cuma',2376);

insert into ÖğrenciMüsaitlikDurumu values(117,'salı',2377);

insert into ÖğrenciMüsaitlikDurumu values(117,'çarşamba',2378);

insert into ÖğrenciMüsaitlikDurumu values(117,'perşembe',2379);

insert into ÖğrenciMüsaitlikDurumu values(118,'salı',2380);

insert into ÖğrenciMüsaitlikDurumu values(119,'perşembe',2381);

insert into ÖğrenciMüsaitlikDurumu values(120,'cuma',2382);

insert into ÖğrenciMüsaitlikDurumu values(120,'pazartesi',2383);

insert into ÖğrenciMüsaitlikDurumu values(121,'çarşamba',2384);

insert into ÖğrenciMüsaitlikDurumu values(121,'pazartesi',2385);

insert into ÖğrenciMüsaitlikDurumu values(122,'cuma',2386);

insert into ÖğrenciMüsaitlikDurumu values(122,'salı',2387);

insert into ÖğrenciMüsaitlikDurumu values(123,'pazartesi',2388);

insert into ÖğrenciMüsaitlikDurumu values(124,'çarşamba',2389);

insert into ÖğrenciMüsaitlikDurumu values(124,'pazartesi',2390);

insert into ÖğrenciMüsaitlikDurumu values(124,'salı',2391);

insert into ÖğrenciMüsaitlikDurumu values(124,'cuma',2392);

insert into ÖğrenciMüsaitlikDurumu values(125,'perşembe',2393);

insert into ÖğrenciMüsaitlikDurumu values(125,'pazartesi',2394);

insert into ÖğrenciMüsaitlikDurumu values(126,'cuma',2395);

insert into ÖğrenciMüsaitlikDurumu values(126,'salı',2396);

insert into ÖğrenciMüsaitlikDurumu values(126,'perşembe',2397);

insert into ÖğrenciMüsaitlikDurumu values(126,'çarşamba',2398);

insert into ÖğrenciMüsaitlikDurumu values(126,'pazartesi',2399);

insert into ÖğrenciMüsaitlikDurumu values(127,'perşembe',2400);

insert into ÖğrenciMüsaitlikDurumu values(127,'salı',2401);

insert into ÖğrenciMüsaitlikDurumu values(127,'pazartesi',2402);

insert into ÖğrenciMüsaitlikDurumu values(128,'salı',2403);

insert into ÖğrenciMüsaitlikDurumu values(128,'perşembe',2404);

insert into ÖğrenciMüsaitlikDurumu values(128,'pazartesi',2405);

insert into ÖğrenciMüsaitlikDurumu values(128,'cuma',2406);

insert into ÖğrenciMüsaitlikDurumu values(129,'cuma',2407);

insert into ÖğrenciMüsaitlikDurumu values(129,'perşembe',2408);

insert into ÖğrenciMüsaitlikDurumu values(129,'çarşamba',2409);

insert into ÖğrenciMüsaitlikDurumu values(129,'pazartesi',2410);

insert into ÖğrenciMüsaitlikDurumu values(129,'salı',2411);

insert into ÖğrenciMüsaitlikDurumu values(130,'çarşamba',2412);

insert into ÖğrenciMüsaitlikDurumu values(130,'cuma',2413);

insert into ÖğrenciMüsaitlikDurumu values(130,'salı',2414);

insert into ÖğrenciMüsaitlikDurumu values(130,'pazartesi',2415);

insert into ÖğrenciMüsaitlikDurumu values(131,'cuma',2416);

insert into ÖğrenciMüsaitlikDurumu values(131,'pazartesi',2417);

insert into ÖğrenciMüsaitlikDurumu values(132,'pazartesi',2418);

insert into ÖğrenciMüsaitlikDurumu values(132,'perşembe',2419);

insert into ÖğrenciMüsaitlikDurumu values(132,'çarşamba',2420);

insert into ÖğrenciMüsaitlikDurumu values(133,'pazartesi',2421);

insert into ÖğrenciMüsaitlikDurumu values(133,'perşembe',2422);

insert into ÖğrenciMüsaitlikDurumu values(133,'çarşamba',2423);

insert into ÖğrenciMüsaitlikDurumu values(133,'cuma',2424);

insert into ÖğrenciMüsaitlikDurumu values(133,'salı',2425);

insert into ÖğrenciMüsaitlikDurumu values(134,'perşembe',2426);

insert into ÖğrenciMüsaitlikDurumu values(134,'cuma',2427);

insert into ÖğrenciMüsaitlikDurumu values(134,'pazartesi',2428);

insert into ÖğrenciMüsaitlikDurumu values(134,'çarşamba',2429);

insert into ÖğrenciMüsaitlikDurumu values(134,'salı',2430);

insert into ÖğrenciMüsaitlikDurumu values(135,'pazartesi',2431);

insert into ÖğrenciMüsaitlikDurumu values(135,'salı',2432);

insert into ÖğrenciMüsaitlikDurumu values(135,'cuma',2433);

insert into ÖğrenciMüsaitlikDurumu values(135,'perşembe',2434);

insert into ÖğrenciMüsaitlikDurumu values(136,'cuma',2435);

insert into ÖğrenciMüsaitlikDurumu values(136,'pazartesi',2436);

insert into ÖğrenciMüsaitlikDurumu values(136,'perşembe',2437);

insert into ÖğrenciMüsaitlikDurumu values(136,'çarşamba',2438);

insert into ÖğrenciMüsaitlikDurumu values(137,'pazartesi',2439);

insert into ÖğrenciMüsaitlikDurumu values(137,'cuma',2440);

insert into ÖğrenciMüsaitlikDurumu values(137,'salı',2441);

insert into ÖğrenciMüsaitlikDurumu values(138,'pazartesi',2442);

insert into ÖğrenciMüsaitlikDurumu values(139,'pazartesi',2443);

insert into ÖğrenciMüsaitlikDurumu values(139,'perşembe',2444);

insert into ÖğrenciMüsaitlikDurumu values(139,'cuma',2445);

insert into ÖğrenciMüsaitlikDurumu values(139,'çarşamba',2446);

insert into ÖğrenciMüsaitlikDurumu values(140,'pazartesi',2447);

insert into ÖğrenciMüsaitlikDurumu values(141,'cuma',2448);

insert into ÖğrenciMüsaitlikDurumu values(141,'perşembe',2449);

insert into ÖğrenciMüsaitlikDurumu values(141,'çarşamba',2450);

insert into ÖğrenciMüsaitlikDurumu values(142,'cuma',2451);

insert into ÖğrenciMüsaitlikDurumu values(143,'perşembe',2452);

insert into ÖğrenciMüsaitlikDurumu values(144,'cuma',2453);

insert into ÖğrenciMüsaitlikDurumu values(145,'cuma',2454);

insert into ÖğrenciMüsaitlikDurumu values(145,'çarşamba',2455);

insert into ÖğrenciMüsaitlikDurumu values(145,'salı',2456);

insert into ÖğrenciMüsaitlikDurumu values(145,'pazartesi',2457);

insert into ÖğrenciMüsaitlikDurumu values(146,'pazartesi',2458);

insert into ÖğrenciMüsaitlikDurumu values(146,'çarşamba',2459);

insert into ÖğrenciMüsaitlikDurumu values(146,'cuma',2460);

insert into ÖğrenciMüsaitlikDurumu values(146,'perşembe',2461);

insert into ÖğrenciMüsaitlikDurumu values(147,'pazartesi',2462);

insert into ÖğrenciMüsaitlikDurumu values(147,'cuma',2463);

insert into ÖğrenciMüsaitlikDurumu values(147,'perşembe',2464);

insert into ÖğrenciMüsaitlikDurumu values(147,'salı',2465);

insert into ÖğrenciMüsaitlikDurumu values(147,'çarşamba',2466);

insert into ÖğrenciMüsaitlikDurumu values(148,'salı',2467);

insert into ÖğrenciMüsaitlikDurumu values(148,'cuma',2468);

insert into ÖğrenciMüsaitlikDurumu values(149,'cuma',2469);

insert into ÖğrenciMüsaitlikDurumu values(149,'çarşamba',2470);

insert into ÖğrenciMüsaitlikDurumu values(149,'pazartesi',2471);

insert into ÖğrenciMüsaitlikDurumu values(149,'perşembe',2472);

insert into ÖğrenciMüsaitlikDurumu values(149,'salı',2473);

insert into ÖğrenciMüsaitlikDurumu values(150,'salı',2474);

insert into ÖğrenciMüsaitlikDurumu values(150,'perşembe',2475);

insert into ÖğrenciMüsaitlikDurumu values(150,'çarşamba',2476);

insert into ÖğrenciMüsaitlikDurumu values(151,'çarşamba',2477);

insert into ÖğrenciMüsaitlikDurumu values(151,'pazartesi',2478);

insert into ÖğrenciMüsaitlikDurumu values(151,'cuma',2479);

insert into ÖğrenciMüsaitlikDurumu values(152,'perşembe',2480);

insert into ÖğrenciMüsaitlikDurumu values(152,'pazartesi',2481);

insert into ÖğrenciMüsaitlikDurumu values(152,'cuma',2482);

insert into ÖğrenciMüsaitlikDurumu values(152,'çarşamba',2483);

insert into ÖğrenciMüsaitlikDurumu values(153,'çarşamba',2484);

insert into ÖğrenciMüsaitlikDurumu values(153,'cuma',2485);

insert into ÖğrenciMüsaitlikDurumu values(153,'perşembe',2486);

insert into ÖğrenciMüsaitlikDurumu values(154,'pazartesi',2487);

insert into ÖğrenciMüsaitlikDurumu values(154,'cuma',2488);

insert into ÖğrenciMüsaitlikDurumu values(154,'salı',2489);

insert into ÖğrenciMüsaitlikDurumu values(154,'çarşamba',2490);

insert into ÖğrenciMüsaitlikDurumu values(154,'perşembe',2491);

insert into ÖğrenciMüsaitlikDurumu values(155,'pazartesi',2492);

insert into ÖğrenciMüsaitlikDurumu values(155,'çarşamba',2493);

insert into ÖğrenciMüsaitlikDurumu values(155,'perşembe',2494);

insert into ÖğrenciMüsaitlikDurumu values(155,'salı',2495);

insert into ÖğrenciMüsaitlikDurumu values(156,'salı',2496);

insert into ÖğrenciMüsaitlikDurumu values(156,'pazartesi',2497);

insert into ÖğrenciMüsaitlikDurumu values(157,'cuma',2498);

insert into ÖğrenciMüsaitlikDurumu values(158,'cuma',2499);

insert into ÖğrenciMüsaitlikDurumu values(159,'pazartesi',2500);

insert into ÖğrenciMüsaitlikDurumu values(159,'perşembe',2501);

insert into ÖğrenciMüsaitlikDurumu values(159,'çarşamba',2502);

insert into ÖğrenciMüsaitlikDurumu values(160,'perşembe',2503);

insert into ÖğrenciMüsaitlikDurumu values(160,'cuma',2504);

insert into ÖğrenciMüsaitlikDurumu values(160,'pazartesi',2505);

insert into ÖğrenciMüsaitlikDurumu values(161,'salı',2506);

insert into ÖğrenciMüsaitlikDurumu values(161,'çarşamba',2507);

insert into ÖğrenciMüsaitlikDurumu values(161,'cuma',2508);

insert into ÖğrenciMüsaitlikDurumu values(162,'cuma',2509);

insert into ÖğrenciMüsaitlikDurumu values(162,'salı',2510);

insert into ÖğrenciMüsaitlikDurumu values(162,'çarşamba',2511);

insert into ÖğrenciMüsaitlikDurumu values(162,'perşembe',2512);

insert into ÖğrenciMüsaitlikDurumu values(163,'salı',2513);

insert into ÖğrenciMüsaitlikDurumu values(163,'cuma',2514);

insert into ÖğrenciMüsaitlikDurumu values(163,'çarşamba',2515);

insert into ÖğrenciMüsaitlikDurumu values(163,'pazartesi',2516);

insert into ÖğrenciMüsaitlikDurumu values(163,'perşembe',2517);

insert into ÖğrenciMüsaitlikDurumu values(164,'pazartesi',2518);

insert into ÖğrenciMüsaitlikDurumu values(164,'salı',2519);

insert into ÖğrenciMüsaitlikDurumu values(164,'cuma',2520);

insert into ÖğrenciMüsaitlikDurumu values(164,'çarşamba',2521);

insert into ÖğrenciMüsaitlikDurumu values(164,'perşembe',2522);

insert into ÖğrenciMüsaitlikDurumu values(165,'salı',2523);

insert into ÖğrenciMüsaitlikDurumu values(165,'pazartesi',2524);

insert into ÖğrenciMüsaitlikDurumu values(166,'salı',2525);

insert into ÖğrenciMüsaitlikDurumu values(167,'salı',2526);

insert into ÖğrenciMüsaitlikDurumu values(167,'pazartesi',2527);

insert into ÖğrenciMüsaitlikDurumu values(168,'çarşamba',2528);

insert into ÖğrenciMüsaitlikDurumu values(168,'perşembe',2529);

insert into ÖğrenciMüsaitlikDurumu values(168,'pazartesi',2530);

insert into ÖğrenciMüsaitlikDurumu values(168,'salı',2531);

insert into ÖğrenciMüsaitlikDurumu values(169,'perşembe',2532);

insert into ÖğrenciMüsaitlikDurumu values(169,'çarşamba',2533);

insert into ÖğrenciMüsaitlikDurumu values(169,'cuma',2534);

insert into ÖğrenciMüsaitlikDurumu values(169,'pazartesi',2535);

insert into ÖğrenciMüsaitlikDurumu values(170,'cuma',2536);

insert into ÖğrenciMüsaitlikDurumu values(170,'pazartesi',2537);

insert into ÖğrenciMüsaitlikDurumu values(170,'perşembe',2538);

insert into ÖğrenciMüsaitlikDurumu values(171,'cuma',2539);

insert into ÖğrenciMüsaitlikDurumu values(171,'çarşamba',2540);

insert into ÖğrenciMüsaitlikDurumu values(171,'perşembe',2541);

insert into ÖğrenciMüsaitlikDurumu values(171,'salı',2542);

insert into ÖğrenciMüsaitlikDurumu values(172,'perşembe',2543);

insert into ÖğrenciMüsaitlikDurumu values(173,'salı',2544);

insert into ÖğrenciMüsaitlikDurumu values(173,'cuma',2545);

insert into ÖğrenciMüsaitlikDurumu values(173,'pazartesi',2546);

insert into ÖğrenciMüsaitlikDurumu values(173,'perşembe',2547);

insert into ÖğrenciMüsaitlikDurumu values(174,'cuma',2548);

insert into ÖğrenciMüsaitlikDurumu values(174,'perşembe',2549);

insert into ÖğrenciMüsaitlikDurumu values(174,'pazartesi',2550);

insert into ÖğrenciMüsaitlikDurumu values(174,'çarşamba',2551);

insert into ÖğrenciMüsaitlikDurumu values(175,'pazartesi',2552);

insert into ÖğrenciMüsaitlikDurumu values(176,'pazartesi',2553);

insert into ÖğrenciMüsaitlikDurumu values(176,'perşembe',2554);

insert into ÖğrenciMüsaitlikDurumu values(176,'salı',2555);

insert into ÖğrenciMüsaitlikDurumu values(177,'salı',2556);

insert into ÖğrenciMüsaitlikDurumu values(177,'cuma',2557);

insert into ÖğrenciMüsaitlikDurumu values(177,'pazartesi',2558);

insert into ÖğrenciMüsaitlikDurumu values(178,'çarşamba',2559);

insert into ÖğrenciMüsaitlikDurumu values(178,'salı',2560);

insert into ÖğrenciMüsaitlikDurumu values(178,'perşembe',2561);

insert into ÖğrenciMüsaitlikDurumu values(179,'perşembe',2562);

insert into ÖğrenciMüsaitlikDurumu values(179,'pazartesi',2563);

insert into ÖğrenciMüsaitlikDurumu values(180,'çarşamba',2564);

insert into ÖğrenciMüsaitlikDurumu values(180,'perşembe',2565);

insert into ÖğrenciMüsaitlikDurumu values(181,'perşembe',2566);

insert into ÖğrenciMüsaitlikDurumu values(182,'pazartesi',2567);

insert into ÖğrenciMüsaitlikDurumu values(183,'salı',2568);

insert into ÖğrenciMüsaitlikDurumu values(183,'pazartesi',2569);

insert into ÖğrenciMüsaitlikDurumu values(183,'cuma',2570);

insert into ÖğrenciMüsaitlikDurumu values(183,'çarşamba',2571);

insert into ÖğrenciMüsaitlikDurumu values(184,'salı',2572);

insert into ÖğrenciMüsaitlikDurumu values(184,'çarşamba',2573);

insert into ÖğrenciMüsaitlikDurumu values(185,'pazartesi',2574);

insert into ÖğrenciMüsaitlikDurumu values(185,'salı',2575);

insert into ÖğrenciMüsaitlikDurumu values(186,'salı',2576);

insert into ÖğrenciMüsaitlikDurumu values(186,'pazartesi',2577);

insert into ÖğrenciMüsaitlikDurumu values(186,'cuma',2578);

insert into ÖğrenciMüsaitlikDurumu values(186,'çarşamba',2579);

insert into ÖğrenciMüsaitlikDurumu values(187,'salı',2580);

insert into ÖğrenciMüsaitlikDurumu values(187,'pazartesi',2581);

insert into ÖğrenciMüsaitlikDurumu values(188,'perşembe',2582);

insert into ÖğrenciMüsaitlikDurumu values(188,'cuma',2583);

insert into ÖğrenciMüsaitlikDurumu values(188,'salı',2584);

insert into ÖğrenciMüsaitlikDurumu values(188,'çarşamba',2585);

insert into ÖğrenciMüsaitlikDurumu values(188,'pazartesi',2586);

insert into ÖğrenciMüsaitlikDurumu values(189,'cuma',2587);

insert into ÖğrenciMüsaitlikDurumu values(189,'çarşamba',2588);

insert into ÖğrenciMüsaitlikDurumu values(189,'pazartesi',2589);

insert into ÖğrenciMüsaitlikDurumu values(190,'cuma',2590);

insert into ÖğrenciMüsaitlikDurumu values(191,'perşembe',2591);

insert into ÖğrenciMüsaitlikDurumu values(191,'çarşamba',2592);

insert into ÖğrenciMüsaitlikDurumu values(191,'pazartesi',2593);

insert into ÖğrenciMüsaitlikDurumu values(192,'çarşamba',2594);

insert into ÖğrenciMüsaitlikDurumu values(192,'cuma',2595);

insert into ÖğrenciMüsaitlikDurumu values(192,'perşembe',2596);

insert into ÖğrenciMüsaitlikDurumu values(192,'salı',2597);

insert into ÖğrenciMüsaitlikDurumu values(193,'perşembe',2598);

insert into ÖğrenciMüsaitlikDurumu values(193,'cuma',2599);

insert into ÖğrenciMüsaitlikDurumu values(194,'pazartesi',2600);

insert into ÖğrenciMüsaitlikDurumu values(194,'çarşamba',2601);

insert into ÖğrenciMüsaitlikDurumu values(194,'perşembe',2602);

insert into ÖğrenciMüsaitlikDurumu values(195,'cuma',2603);

insert into ÖğrenciMüsaitlikDurumu values(195,'pazartesi',2604);

insert into ÖğrenciMüsaitlikDurumu values(196,'çarşamba',2605);

insert into ÖğrenciMüsaitlikDurumu values(196,'pazartesi',2606);

insert into ÖğrenciMüsaitlikDurumu values(196,'perşembe',2607);

insert into ÖğrenciMüsaitlikDurumu values(196,'cuma',2608);

insert into ÖğrenciMüsaitlikDurumu values(196,'salı',2609);

insert into ÖğrenciMüsaitlikDurumu values(197,'çarşamba',2610);

insert into ÖğrenciMüsaitlikDurumu values(197,'cuma',2611);

insert into ÖğrenciMüsaitlikDurumu values(197,'perşembe',2612);

insert into ÖğrenciMüsaitlikDurumu values(197,'salı',2613);

insert into ÖğrenciMüsaitlikDurumu values(198,'salı',2614);

insert into ÖğrenciMüsaitlikDurumu values(199,'perşembe',2615);

insert into ÖğrenciMüsaitlikDurumu values(200,'çarşamba',2616);

insert into ÖğrenciMüsaitlikDurumu values(201,'cuma',2617);

insert into ÖğrenciMüsaitlikDurumu values(201,'çarşamba',2618);

insert into ÖğrenciMüsaitlikDurumu values(202,'salı',2619);

insert into ÖğrenciMüsaitlikDurumu values(202,'cuma',2620);

insert into ÖğrenciMüsaitlikDurumu values(202,'pazartesi',2621);

insert into ÖğrenciMüsaitlikDurumu values(202,'perşembe',2622);

insert into ÖğrenciMüsaitlikDurumu values(203,'salı',2623);

insert into ÖğrenciMüsaitlikDurumu values(203,'pazartesi',2624);

insert into ÖğrenciMüsaitlikDurumu values(203,'cuma',2625);

insert into ÖğrenciMüsaitlikDurumu values(203,'çarşamba',2626);

insert into ÖğrenciMüsaitlikDurumu values(203,'perşembe',2627);

insert into ÖğrenciMüsaitlikDurumu values(204,'cuma',2628);

insert into ÖğrenciMüsaitlikDurumu values(204,'pazartesi',2629);

insert into ÖğrenciMüsaitlikDurumu values(205,'perşembe',2630);

insert into ÖğrenciMüsaitlikDurumu values(206,'salı',2631);

insert into ÖğrenciMüsaitlikDurumu values(206,'çarşamba',2632);

insert into ÖğrenciMüsaitlikDurumu values(206,'cuma',2633);

insert into ÖğrenciMüsaitlikDurumu values(206,'perşembe',2634);

insert into ÖğrenciMüsaitlikDurumu values(206,'pazartesi',2635);

insert into ÖğrenciMüsaitlikDurumu values(207,'salı',2636);

insert into ÖğrenciMüsaitlikDurumu values(207,'cuma',2637);

insert into ÖğrenciMüsaitlikDurumu values(207,'perşembe',2638);

insert into ÖğrenciMüsaitlikDurumu values(208,'perşembe',2639);

insert into ÖğrenciMüsaitlikDurumu values(208,'pazartesi',2640);

insert into ÖğrenciMüsaitlikDurumu values(208,'çarşamba',2641);

insert into ÖğrenciMüsaitlikDurumu values(208,'cuma',2642);

insert into ÖğrenciMüsaitlikDurumu values(209,'perşembe',2643);

insert into ÖğrenciMüsaitlikDurumu values(210,'salı',2644);

insert into ÖğrenciMüsaitlikDurumu values(210,'perşembe',2645);

insert into ÖğrenciMüsaitlikDurumu values(211,'pazartesi',2646);

insert into ÖğrenciMüsaitlikDurumu values(212,'perşembe',2647);

insert into ÖğrenciMüsaitlikDurumu values(212,'pazartesi',2648);

insert into ÖğrenciMüsaitlikDurumu values(213,'salı',2649);

insert into ÖğrenciMüsaitlikDurumu values(213,'perşembe',2650);

insert into ÖğrenciMüsaitlikDurumu values(213,'pazartesi',2651);

insert into ÖğrenciMüsaitlikDurumu values(213,'cuma',2652);

insert into ÖğrenciMüsaitlikDurumu values(214,'çarşamba',2653);

insert into ÖğrenciMüsaitlikDurumu values(214,'cuma',2654);

insert into ÖğrenciMüsaitlikDurumu values(215,'pazartesi',2655);

insert into ÖğrenciMüsaitlikDurumu values(215,'salı',2656);

insert into ÖğrenciMüsaitlikDurumu values(216,'pazartesi',2657);

insert into ÖğrenciMüsaitlikDurumu values(216,'cuma',2658);

insert into ÖğrenciMüsaitlikDurumu values(216,'salı',2659);

insert into ÖğrenciMüsaitlikDurumu values(216,'perşembe',2660);

insert into ÖğrenciMüsaitlikDurumu values(216,'çarşamba',2661);

insert into ÖğrenciMüsaitlikDurumu values(217,'salı',2662);

insert into ÖğrenciMüsaitlikDurumu values(217,'perşembe',2663);

insert into ÖğrenciMüsaitlikDurumu values(217,'cuma',2664);

insert into ÖğrenciMüsaitlikDurumu values(218,'çarşamba',2665);

insert into ÖğrenciMüsaitlikDurumu values(218,'cuma',2666);

insert into ÖğrenciMüsaitlikDurumu values(218,'pazartesi',2667);

insert into ÖğrenciMüsaitlikDurumu values(218,'salı',2668);

insert into ÖğrenciMüsaitlikDurumu values(218,'perşembe',2669);

insert into ÖğrenciMüsaitlikDurumu values(219,'perşembe',2670);

insert into ÖğrenciMüsaitlikDurumu values(219,'çarşamba',2671);

insert into ÖğrenciMüsaitlikDurumu values(220,'cuma',2672);

insert into ÖğrenciMüsaitlikDurumu values(220,'salı',2673);

insert into ÖğrenciMüsaitlikDurumu values(220,'çarşamba',2674);

insert into ÖğrenciMüsaitlikDurumu values(220,'perşembe',2675);

insert into ÖğrenciMüsaitlikDurumu values(221,'cuma',2676);

insert into ÖğrenciMüsaitlikDurumu values(221,'perşembe',2677);

insert into ÖğrenciMüsaitlikDurumu values(221,'çarşamba',2678);

insert into ÖğrenciMüsaitlikDurumu values(222,'perşembe',2679);

insert into ÖğrenciMüsaitlikDurumu values(222,'cuma',2680);

insert into ÖğrenciMüsaitlikDurumu values(222,'salı',2681);

insert into ÖğrenciMüsaitlikDurumu values(222,'çarşamba',2682);

insert into ÖğrenciMüsaitlikDurumu values(222,'pazartesi',2683);

insert into ÖğrenciMüsaitlikDurumu values(223,'çarşamba',2684);

insert into ÖğrenciMüsaitlikDurumu values(223,'cuma',2685);

insert into ÖğrenciMüsaitlikDurumu values(224,'cuma',2686);

insert into ÖğrenciMüsaitlikDurumu values(224,'çarşamba',2687);

insert into ÖğrenciMüsaitlikDurumu values(224,'salı',2688);

insert into ÖğrenciMüsaitlikDurumu values(224,'pazartesi',2689);

insert into ÖğrenciMüsaitlikDurumu values(225,'cuma',2690);

insert into ÖğrenciMüsaitlikDurumu values(225,'perşembe',2691);

insert into ÖğrenciMüsaitlikDurumu values(225,'pazartesi',2692);

insert into ÖğrenciMüsaitlikDurumu values(225,'çarşamba',2693);

insert into ÖğrenciMüsaitlikDurumu values(226,'çarşamba',2694);

insert into ÖğrenciMüsaitlikDurumu values(226,'pazartesi',2695);

insert into ÖğrenciMüsaitlikDurumu values(226,'cuma',2696);

insert into ÖğrenciMüsaitlikDurumu values(226,'salı',2697);

insert into ÖğrenciMüsaitlikDurumu values(227,'perşembe',2698);

insert into ÖğrenciMüsaitlikDurumu values(227,'çarşamba',2699);

insert into ÖğrenciMüsaitlikDurumu values(227,'cuma',2700);

insert into ÖğrenciMüsaitlikDurumu values(227,'pazartesi',2701);

insert into ÖğrenciMüsaitlikDurumu values(228,'pazartesi',2702);

insert into ÖğrenciMüsaitlikDurumu values(228,'perşembe',2703);

insert into ÖğrenciMüsaitlikDurumu values(228,'çarşamba',2704);

insert into ÖğrenciMüsaitlikDurumu values(228,'cuma',2705);

insert into ÖğrenciMüsaitlikDurumu values(228,'salı',2706);

insert into ÖğrenciMüsaitlikDurumu values(229,'perşembe',2707);

insert into ÖğrenciMüsaitlikDurumu values(229,'pazartesi',2708);

insert into ÖğrenciMüsaitlikDurumu values(229,'cuma',2709);

insert into ÖğrenciMüsaitlikDurumu values(229,'çarşamba',2710);

insert into ÖğrenciMüsaitlikDurumu values(229,'salı',2711);

insert into ÖğrenciMüsaitlikDurumu values(230,'cuma',2712);

insert into ÖğrenciMüsaitlikDurumu values(231,'çarşamba',2713);

insert into ÖğrenciMüsaitlikDurumu values(232,'perşembe',2714);

insert into ÖğrenciMüsaitlikDurumu values(232,'pazartesi',2715);

insert into ÖğrenciMüsaitlikDurumu values(232,'salı',2716);

insert into ÖğrenciMüsaitlikDurumu values(232,'cuma',2717);

insert into ÖğrenciMüsaitlikDurumu values(232,'çarşamba',2718);

insert into ÖğrenciMüsaitlikDurumu values(233,'çarşamba',2719);

insert into ÖğrenciMüsaitlikDurumu values(233,'pazartesi',2720);

insert into ÖğrenciMüsaitlikDurumu values(234,'çarşamba',2721);

insert into ÖğrenciMüsaitlikDurumu values(234,'perşembe',2722);

insert into ÖğrenciMüsaitlikDurumu values(235,'pazartesi',2723);

insert into ÖğrenciMüsaitlikDurumu values(235,'salı',2724);

insert into ÖğrenciMüsaitlikDurumu values(235,'çarşamba',2725);

insert into ÖğrenciMüsaitlikDurumu values(235,'cuma',2726);

insert into ÖğrenciMüsaitlikDurumu values(236,'salı',2727);

insert into ÖğrenciMüsaitlikDurumu values(236,'perşembe',2728);

insert into ÖğrenciMüsaitlikDurumu values(236,'pazartesi',2729);

insert into ÖğrenciMüsaitlikDurumu values(236,'çarşamba',2730);

insert into ÖğrenciMüsaitlikDurumu values(236,'cuma',2731);

insert into ÖğrenciMüsaitlikDurumu values(237,'pazartesi',2732);

insert into ÖğrenciMüsaitlikDurumu values(237,'salı',2733);

insert into ÖğrenciMüsaitlikDurumu values(237,'perşembe',2734);

insert into ÖğrenciMüsaitlikDurumu values(238,'çarşamba',2735);

insert into ÖğrenciMüsaitlikDurumu values(238,'pazartesi',2736);

insert into ÖğrenciMüsaitlikDurumu values(239,'perşembe',2737);

insert into ÖğrenciMüsaitlikDurumu values(240,'pazartesi',2738);

insert into ÖğrenciMüsaitlikDurumu values(240,'salı',2739);

insert into ÖğrenciMüsaitlikDurumu values(240,'perşembe',2740);

insert into ÖğrenciMüsaitlikDurumu values(240,'çarşamba',2741);

insert into ÖğrenciMüsaitlikDurumu values(241,'cuma',2742);

insert into ÖğrenciMüsaitlikDurumu values(242,'perşembe',2743);

insert into ÖğrenciMüsaitlikDurumu values(242,'salı',2744);

insert into ÖğrenciMüsaitlikDurumu values(243,'perşembe',2745);

insert into ÖğrenciMüsaitlikDurumu values(243,'cuma',2746);

insert into ÖğrenciMüsaitlikDurumu values(243,'çarşamba',2747);

insert into ÖğrenciMüsaitlikDurumu values(243,'salı',2748);

insert into ÖğrenciMüsaitlikDurumu values(244,'çarşamba',2749);

insert into ÖğrenciMüsaitlikDurumu values(244,'pazartesi',2750);

insert into ÖğrenciMüsaitlikDurumu values(244,'salı',2751);

insert into ÖğrenciMüsaitlikDurumu values(245,'çarşamba',2752);

insert into ÖğrenciMüsaitlikDurumu values(245,'cuma',2753);

insert into ÖğrenciMüsaitlikDurumu values(245,'perşembe',2754);

insert into ÖğrenciMüsaitlikDurumu values(246,'salı',2755);

insert into ÖğrenciMüsaitlikDurumu values(247,'cuma',2756);

insert into ÖğrenciMüsaitlikDurumu values(247,'pazartesi',2757);

insert into ÖğrenciMüsaitlikDurumu values(248,'perşembe',2758);

insert into ÖğrenciMüsaitlikDurumu values(248,'cuma',2759);

insert into ÖğrenciMüsaitlikDurumu values(248,'pazartesi',2760);

insert into ÖğrenciMüsaitlikDurumu values(249,'çarşamba',2761);

insert into ÖğrenciMüsaitlikDurumu values(249,'pazartesi',2762);

insert into ÖğrenciMüsaitlikDurumu values(249,'perşembe',2763);

insert into ÖğrenciMüsaitlikDurumu values(249,'salı',2764);

insert into ÖğrenciMüsaitlikDurumu values(250,'cuma',2765);

insert into ÖğrenciMüsaitlikDurumu values(250,'pazartesi',2766);

insert into ÖğrenciMüsaitlikDurumu values(250,'perşembe',2767);

insert into ÖğrenciMüsaitlikDurumu values(251,'çarşamba',2768);

insert into ÖğrenciMüsaitlikDurumu values(251,'pazartesi',2769);

insert into ÖğrenciMüsaitlikDurumu values(251,'perşembe',2770);

insert into ÖğrenciMüsaitlikDurumu values(252,'pazartesi',2771);

insert into ÖğrenciMüsaitlikDurumu values(252,'salı',2772);

insert into ÖğrenciMüsaitlikDurumu values(252,'perşembe',2773);

insert into ÖğrenciMüsaitlikDurumu values(253,'pazartesi',2774);

insert into ÖğrenciMüsaitlikDurumu values(253,'çarşamba',2775);

insert into ÖğrenciMüsaitlikDurumu values(253,'salı',2776);

insert into ÖğrenciMüsaitlikDurumu values(253,'perşembe',2777);
insert into ÖğrenciMüsaitlikDurumu values(253,'cuma',2778);

insert into ÖğrenciMüsaitlikDurumu values(254,'çarşamba',2779);

insert into ÖğrenciMüsaitlikDurumu values(254,'salı',2780);

insert into ÖğrenciMüsaitlikDurumu values(254,'cuma',2781);

insert into ÖğrenciMüsaitlikDurumu values(254,'perşembe',2782);

insert into ÖğrenciMüsaitlikDurumu values(254,'pazartesi',2783);

insert into ÖğrenciMüsaitlikDurumu values(255,'çarşamba',2784);

insert into ÖğrenciMüsaitlikDurumu values(255,'salı',2785);

insert into ÖğrenciMüsaitlikDurumu values(255,'pazartesi',2786);

insert into ÖğrenciMüsaitlikDurumu values(256,'çarşamba',2787);

insert into ÖğrenciMüsaitlikDurumu values(256,'salı',2788);

insert into ÖğrenciMüsaitlikDurumu values(257,'perşembe',2789);

insert into ÖğrenciMüsaitlikDurumu values(257,'pazartesi',2790);

insert into ÖğrenciMüsaitlikDurumu values(257,'cuma',2791);

insert into ÖğrenciMüsaitlikDurumu values(257,'salı',2792);

insert into ÖğrenciMüsaitlikDurumu values(257,'çarşamba',2793);

insert into ÖğrenciMüsaitlikDurumu values(258,'perşembe',2794);

insert into ÖğrenciMüsaitlikDurumu values(259,'pazartesi',2795);

insert into ÖğrenciMüsaitlikDurumu values(259,'perşembe',2796);

insert into ÖğrenciMüsaitlikDurumu values(260,'pazartesi',2797);

insert into ÖğrenciMüsaitlikDurumu values(260,'perşembe',2798);

insert into ÖğrenciMüsaitlikDurumu values(260,'cuma',2799);

insert into ÖğrenciMüsaitlikDurumu values(261,'perşembe',2800);

insert into ÖğrenciMüsaitlikDurumu values(261,'salı',2801);

insert into ÖğrenciMüsaitlikDurumu values(261,'çarşamba',2802);

insert into ÖğrenciMüsaitlikDurumu values(261,'cuma',2803);

insert into ÖğrenciMüsaitlikDurumu values(262,'cuma',2804);

insert into ÖğrenciMüsaitlikDurumu values(262,'pazartesi',2805);

insert into ÖğrenciMüsaitlikDurumu values(262,'çarşamba',2806);

insert into ÖğrenciMüsaitlikDurumu values(262,'perşembe',2807);

insert into ÖğrenciMüsaitlikDurumu values(262,'salı',2808);

insert into ÖğrenciMüsaitlikDurumu values(263,'pazartesi',2809);

insert into ÖğrenciMüsaitlikDurumu values(263,'perşembe',2810);

insert into ÖğrenciMüsaitlikDurumu values(263,'cuma',2811);

insert into ÖğrenciMüsaitlikDurumu values(263,'çarşamba',2812);

insert into ÖğrenciMüsaitlikDurumu values(264,'perşembe',2813);

insert into ÖğrenciMüsaitlikDurumu values(265,'cuma',2814);

insert into ÖğrenciMüsaitlikDurumu values(266,'çarşamba',2815);

insert into ÖğrenciMüsaitlikDurumu values(266,'perşembe',2816);

insert into ÖğrenciMüsaitlikDurumu values(266,'cuma',2817);

insert into ÖğrenciMüsaitlikDurumu values(267,'pazartesi',2818);

insert into ÖğrenciMüsaitlikDurumu values(268,'perşembe',2819);

insert into ÖğrenciMüsaitlikDurumu values(269,'cuma',2820);

insert into ÖğrenciMüsaitlikDurumu values(269,'salı',2821);

insert into ÖğrenciMüsaitlikDurumu values(269,'pazartesi',2822);

insert into ÖğrenciMüsaitlikDurumu values(269,'perşembe',2823);

insert into ÖğrenciMüsaitlikDurumu values(270,'cuma',2824);

insert into ÖğrenciMüsaitlikDurumu values(271,'pazartesi',2825);

insert into ÖğrenciMüsaitlikDurumu values(271,'cuma',2826);

insert into ÖğrenciMüsaitlikDurumu values(271,'çarşamba',2827);

insert into ÖğrenciMüsaitlikDurumu values(272,'çarşamba',2828);

insert into ÖğrenciMüsaitlikDurumu values(273,'salı',2829);

insert into ÖğrenciMüsaitlikDurumu values(273,'cuma',2830);

insert into ÖğrenciMüsaitlikDurumu values(274,'perşembe',2831);

insert into ÖğrenciMüsaitlikDurumu values(274,'çarşamba',2832);

insert into ÖğrenciMüsaitlikDurumu values(275,'pazartesi',2833);

insert into ÖğrenciMüsaitlikDurumu values(276,'perşembe',2834);

insert into ÖğrenciMüsaitlikDurumu values(276,'salı',2835);

insert into ÖğrenciMüsaitlikDurumu values(276,'çarşamba',2836);

insert into ÖğrenciMüsaitlikDurumu values(276,'cuma',2837);

insert into ÖğrenciMüsaitlikDurumu values(276,'pazartesi',2838);

insert into ÖğrenciMüsaitlikDurumu values(277,'çarşamba',2839);

insert into ÖğrenciMüsaitlikDurumu values(278,'cuma',2840);

insert into ÖğrenciMüsaitlikDurumu values(278,'salı',2841);

insert into ÖğrenciMüsaitlikDurumu values(278,'çarşamba',2842);

insert into ÖğrenciMüsaitlikDurumu values(278,'perşembe',2843);

insert into ÖğrenciMüsaitlikDurumu values(279,'perşembe',2844);

insert into ÖğrenciMüsaitlikDurumu values(279,'salı',2845);

insert into ÖğrenciMüsaitlikDurumu values(279,'cuma',2846);

insert into ÖğrenciMüsaitlikDurumu values(279,'çarşamba',2847);

insert into ÖğrenciMüsaitlikDurumu values(280,'pazartesi',2848);

insert into ÖğrenciMüsaitlikDurumu values(280,'perşembe',2849);

insert into ÖğrenciMüsaitlikDurumu values(280,'çarşamba',2850);

insert into ÖğrenciMüsaitlikDurumu values(280,'cuma',2851);

insert into ÖğrenciMüsaitlikDurumu values(280,'salı',2852);

insert into ÖğrenciMüsaitlikDurumu values(281,'perşembe',2853);

insert into ÖğrenciMüsaitlikDurumu values(281,'cuma',2854);

insert into ÖğrenciMüsaitlikDurumu values(281,'pazartesi',2855);

insert into ÖğrenciMüsaitlikDurumu values(281,'salı',2856);

insert into ÖğrenciMüsaitlikDurumu values(282,'çarşamba',2857);

insert into ÖğrenciMüsaitlikDurumu values(282,'salı',2858);

insert into ÖğrenciMüsaitlikDurumu values(282,'cuma',2859);

insert into ÖğrenciMüsaitlikDurumu values(283,'perşembe',2860);

insert into ÖğrenciMüsaitlikDurumu values(283,'salı',2861);

insert into ÖğrenciMüsaitlikDurumu values(283,'çarşamba',2862);

insert into ÖğrenciMüsaitlikDurumu values(283,'cuma',2863);

insert into ÖğrenciMüsaitlikDurumu values(284,'çarşamba',2864);

insert into ÖğrenciMüsaitlikDurumu values(285,'salı',2865);

insert into ÖğrenciMüsaitlikDurumu values(285,'çarşamba',2866);

insert into ÖğrenciMüsaitlikDurumu values(285,'perşembe',2867);

insert into ÖğrenciMüsaitlikDurumu values(285,'pazartesi',2868);

insert into ÖğrenciMüsaitlikDurumu values(285,'cuma',2869);

insert into ÖğrenciMüsaitlikDurumu values(286,'pazartesi',2870);

insert into ÖğrenciMüsaitlikDurumu values(286,'çarşamba',2871);

insert into ÖğrenciMüsaitlikDurumu values(286,'perşembe',2872);

insert into ÖğrenciMüsaitlikDurumu values(286,'salı',2873);

insert into ÖğrenciMüsaitlikDurumu values(286,'cuma',2874);

insert into ÖğrenciMüsaitlikDurumu values(287,'çarşamba',2875);

insert into ÖğrenciMüsaitlikDurumu values(287,'salı',2876);

insert into ÖğrenciMüsaitlikDurumu values(287,'cuma',2877);

insert into ÖğrenciMüsaitlikDurumu values(287,'pazartesi',2878);

insert into ÖğrenciMüsaitlikDurumu values(288,'cuma',2879);

insert into ÖğrenciMüsaitlikDurumu values(288,'perşembe',2880);

insert into ÖğrenciMüsaitlikDurumu values(288,'salı',2881);

insert into ÖğrenciMüsaitlikDurumu values(288,'pazartesi',2882);

insert into ÖğrenciMüsaitlikDurumu values(289,'pazartesi',2883);

insert into ÖğrenciMüsaitlikDurumu values(289,'cuma',2884);

insert into ÖğrenciMüsaitlikDurumu values(290,'çarşamba',2885);

insert into ÖğrenciMüsaitlikDurumu values(291,'cuma',2886);

insert into ÖğrenciMüsaitlikDurumu values(291,'perşembe',2887);

insert into ÖğrenciMüsaitlikDurumu values(292,'pazartesi',2888);

insert into ÖğrenciMüsaitlikDurumu values(292,'cuma',2889);

insert into ÖğrenciMüsaitlikDurumu values(292,'salı',2890);

insert into ÖğrenciMüsaitlikDurumu values(292,'perşembe',2891);

insert into ÖğrenciMüsaitlikDurumu values(293,'perşembe',2892);

insert into ÖğrenciMüsaitlikDurumu values(293,'cuma',2893);

insert into ÖğrenciMüsaitlikDurumu values(293,'çarşamba',2894);

insert into ÖğrenciMüsaitlikDurumu values(293,'salı',2895);

insert into ÖğrenciMüsaitlikDurumu values(293,'pazartesi',2896);

insert into ÖğrenciMüsaitlikDurumu values(294,'salı',2897);

insert into ÖğrenciMüsaitlikDurumu values(294,'cuma',2898);

insert into ÖğrenciMüsaitlikDurumu values(294,'perşembe',2899);

insert into ÖğrenciMüsaitlikDurumu values(295,'çarşamba',2900);

insert into ÖğrenciMüsaitlikDurumu values(295,'salı',2901);

insert into ÖğrenciMüsaitlikDurumu values(295,'perşembe',2902);

insert into ÖğrenciMüsaitlikDurumu values(296,'cuma',2903);

insert into ÖğrenciMüsaitlikDurumu values(296,'pazartesi',2904);

insert into ÖğrenciMüsaitlikDurumu values(297,'salı',2905);

insert into ÖğrenciMüsaitlikDurumu values(297,'perşembe',2906);

insert into ÖğrenciMüsaitlikDurumu values(297,'cuma',2907);

insert into ÖğrenciMüsaitlikDurumu values(298,'çarşamba',2908);

insert into ÖğrenciMüsaitlikDurumu values(298,'salı',2909);

insert into ÖğrenciMüsaitlikDurumu values(298,'cuma',2910);

insert into ÖğrenciMüsaitlikDurumu values(298,'perşembe',2911);

insert into ÖğrenciMüsaitlikDurumu values(299,'cuma',2912);

insert into ÖğrenciMüsaitlikDurumu values(299,'çarşamba',2913);

insert into ÖğrenciMüsaitlikDurumu values(300,'perşembe',2914);

insert into ÖğrenciMüsaitlikDurumu values(300,'çarşamba',2915);

insert into ÖğrenciMüsaitlikDurumu values(300,'cuma',2916);

insert into ÖğrenciMüsaitlikDurumu values(300,'salı',2917);

insert into ÖğrenciMüsaitlikDurumu values(300,'pazartesi',2918);

insert into ÖğrenciMüsaitlikDurumu values(301,'cuma',2919);

insert into ÖğrenciMüsaitlikDurumu values(301,'çarşamba',2920);

insert into ÖğrenciMüsaitlikDurumu values(301,'perşembe',2921);

insert into ÖğrenciMüsaitlikDurumu values(301,'pazartesi',2922);

insert into ÖğrenciMüsaitlikDurumu values(301,'salı',2923);

insert into ÖğrenciMüsaitlikDurumu values(302,'çarşamba',2924);

insert into ÖğrenciMüsaitlikDurumu values(302,'pazartesi',2925);

insert into ÖğrenciMüsaitlikDurumu values(302,'perşembe',2926);

insert into ÖğrenciMüsaitlikDurumu values(302,'salı',2927);

insert into ÖğrenciMüsaitlikDurumu values(302,'cuma',2928);

insert into ÖğrenciMüsaitlikDurumu values(303,'çarşamba',2929);

insert into ÖğrenciMüsaitlikDurumu values(303,'cuma',2930);

insert into ÖğrenciMüsaitlikDurumu values(303,'pazartesi',2931);

insert into ÖğrenciMüsaitlikDurumu values(304,'pazartesi',2932);

insert into ÖğrenciMüsaitlikDurumu values(304,'cuma',2933);

insert into ÖğrenciMüsaitlikDurumu values(304,'çarşamba',2934);

insert into ÖğrenciMüsaitlikDurumu values(304,'salı',2935);

insert into ÖğrenciMüsaitlikDurumu values(305,'cuma',2936);

insert into ÖğrenciMüsaitlikDurumu values(306,'pazartesi',2937);

insert into ÖğrenciMüsaitlikDurumu values(306,'perşembe',2938);

insert into ÖğrenciMüsaitlikDurumu values(306,'çarşamba',2939);

insert into ÖğrenciMüsaitlikDurumu values(306,'salı',2940);

insert into ÖğrenciMüsaitlikDurumu values(307,'perşembe',2941);

insert into ÖğrenciMüsaitlikDurumu values(307,'çarşamba',2942);

insert into ÖğrenciMüsaitlikDurumu values(307,'cuma',2943);

insert into ÖğrenciMüsaitlikDurumu values(307,'pazartesi',2944);

insert into ÖğrenciMüsaitlikDurumu values(307,'salı',2945);

insert into ÖğrenciMüsaitlikDurumu values(308,'cuma',2946);

insert into ÖğrenciMüsaitlikDurumu values(308,'salı',2947);

insert into ÖğrenciMüsaitlikDurumu values(309,'salı',2948);

insert into ÖğrenciMüsaitlikDurumu values(309,'pazartesi',2949);

insert into ÖğrenciMüsaitlikDurumu values(309,'çarşamba',2950);

insert into ÖğrenciMüsaitlikDurumu values(309,'cuma',2951);

insert into ÖğrenciMüsaitlikDurumu values(310,'salı',2952);

insert into ÖğrenciMüsaitlikDurumu values(310,'pazartesi',2953);

insert into ÖğrenciMüsaitlikDurumu values(310,'perşembe',2954);

insert into ÖğrenciMüsaitlikDurumu values(310,'çarşamba',2955);

insert into ÖğrenciMüsaitlikDurumu values(310,'cuma',2956);

insert into ÖğrenciMüsaitlikDurumu values(311,'cuma',2957);

insert into ÖğrenciMüsaitlikDurumu values(311,'çarşamba',2958);

insert into ÖğrenciMüsaitlikDurumu values(311,'pazartesi',2959);

insert into ÖğrenciMüsaitlikDurumu values(311,'salı',2960);

insert into ÖğrenciMüsaitlikDurumu values(312,'perşembe',2961);

insert into ÖğrenciMüsaitlikDurumu values(313,'pazartesi',2962);

insert into ÖğrenciMüsaitlikDurumu values(313,'çarşamba',2963);

insert into ÖğrenciMüsaitlikDurumu values(314,'çarşamba',2964);

insert into ÖğrenciMüsaitlikDurumu values(314,'salı',2965);

insert into ÖğrenciMüsaitlikDurumu values(314,'cuma',2966);

insert into ÖğrenciMüsaitlikDurumu values(314,'pazartesi',2967);

insert into ÖğrenciMüsaitlikDurumu values(315,'pazartesi',2968);

insert into ÖğrenciMüsaitlikDurumu values(315,'çarşamba',2969);

insert into ÖğrenciMüsaitlikDurumu values(315,'salı',2970);

insert into ÖğrenciMüsaitlikDurumu values(315,'perşembe',2971);

insert into ÖğrenciMüsaitlikDurumu values(315,'cuma',2972);

insert into ÖğrenciMüsaitlikDurumu values(316,'salı',2973);

insert into ÖğrenciMüsaitlikDurumu values(316,'perşembe',2974);

insert into ÖğrenciMüsaitlikDurumu values(316,'pazartesi',2975);

insert into ÖğrenciMüsaitlikDurumu values(316,'çarşamba',2976);

insert into ÖğrenciMüsaitlikDurumu values(317,'cuma',2977);

insert into ÖğrenciMüsaitlikDurumu values(317,'perşembe',2978);

insert into ÖğrenciMüsaitlikDurumu values(317,'salı',2979);

insert into ÖğrenciMüsaitlikDurumu values(318,'perşembe',2980);

insert into ÖğrenciMüsaitlikDurumu values(319,'pazartesi',2981);

insert into ÖğrenciMüsaitlikDurumu values(319,'çarşamba',2982);

insert into ÖğrenciMüsaitlikDurumu values(319,'cuma',2983);

insert into ÖğrenciMüsaitlikDurumu values(320,'çarşamba',2984);

insert into ÖğrenciMüsaitlikDurumu values(320,'salı',2985);

insert into ÖğrenciMüsaitlikDurumu values(321,'pazartesi',2986);

insert into ÖğrenciMüsaitlikDurumu values(322,'pazartesi',2987);

insert into ÖğrenciMüsaitlikDurumu values(322,'salı',2988);

insert into ÖğrenciMüsaitlikDurumu values(322,'perşembe',2989);

insert into ÖğrenciMüsaitlikDurumu values(323,'pazartesi',2990);

insert into ÖğrenciMüsaitlikDurumu values(323,'salı',2991);

insert into ÖğrenciMüsaitlikDurumu values(323,'çarşamba',2992);

insert into ÖğrenciMüsaitlikDurumu values(323,'cuma',2993);

insert into ÖğrenciMüsaitlikDurumu values(323,'perşembe',2994);

insert into ÖğrenciMüsaitlikDurumu values(324,'cuma',2995);

insert into ÖğrenciMüsaitlikDurumu values(324,'pazartesi',2996);

insert into ÖğrenciMüsaitlikDurumu values(324,'çarşamba',2997);

insert into ÖğrenciMüsaitlikDurumu values(324,'perşembe',2998);

insert into ÖğrenciMüsaitlikDurumu values(325,'çarşamba',2999);

insert into ÖğrenciMüsaitlikDurumu values(325,'salı',3000);

insert into ÖğrenciMüsaitlikDurumu values(326,'salı',3001);

insert into ÖğrenciMüsaitlikDurumu values(326,'cuma',3002);

insert into ÖğrenciMüsaitlikDurumu values(326,'pazartesi',3003);

insert into ÖğrenciMüsaitlikDurumu values(326,'çarşamba',3004);

insert into ÖğrenciMüsaitlikDurumu values(327,'çarşamba',3005);

insert into ÖğrenciMüsaitlikDurumu values(327,'cuma',3006);

insert into ÖğrenciMüsaitlikDurumu values(327,'pazartesi',3007);

insert into ÖğrenciMüsaitlikDurumu values(327,'salı',3008);

insert into ÖğrenciMüsaitlikDurumu values(327,'perşembe',3009);

insert into ÖğrenciMüsaitlikDurumu values(328,'salı',3010);

insert into ÖğrenciMüsaitlikDurumu values(328,'perşembe',3011);

insert into ÖğrenciMüsaitlikDurumu values(328,'pazartesi',3012);

insert into ÖğrenciMüsaitlikDurumu values(329,'salı',3013);

insert into ÖğrenciMüsaitlikDurumu values(329,'perşembe',3014);

insert into ÖğrenciMüsaitlikDurumu values(329,'çarşamba',3015);

insert into ÖğrenciMüsaitlikDurumu values(329,'pazartesi',3016);

insert into ÖğrenciMüsaitlikDurumu values(329,'cuma',3017);

insert into ÖğrenciMüsaitlikDurumu values(330,'pazartesi',3018);

insert into ÖğrenciMüsaitlikDurumu values(330,'perşembe',3019);

insert into ÖğrenciMüsaitlikDurumu values(331,'perşembe',3020);

insert into ÖğrenciMüsaitlikDurumu values(331,'cuma',3021);

insert into ÖğrenciMüsaitlikDurumu values(331,'çarşamba',3022);

insert into ÖğrenciMüsaitlikDurumu values(331,'pazartesi',3023);

insert into ÖğrenciMüsaitlikDurumu values(332,'cuma',3024);

insert into ÖğrenciMüsaitlikDurumu values(332,'salı',3025);

insert into ÖğrenciMüsaitlikDurumu values(332,'çarşamba',3026);

insert into ÖğrenciMüsaitlikDurumu values(332,'pazartesi',3027);

insert into ÖğrenciMüsaitlikDurumu values(332,'perşembe',3028);

insert into ÖğrenciMüsaitlikDurumu values(333,'perşembe',3029);

insert into ÖğrenciMüsaitlikDurumu values(333,'pazartesi',3030);

insert into ÖğrenciMüsaitlikDurumu values(333,'salı',3031);

insert into ÖğrenciMüsaitlikDurumu values(333,'çarşamba',3032);

insert into ÖğrenciMüsaitlikDurumu values(333,'cuma',3033);

insert into ÖğrenciMüsaitlikDurumu values(334,'perşembe',3034);

insert into ÖğrenciMüsaitlikDurumu values(334,'pazartesi',3035);

insert into ÖğrenciMüsaitlikDurumu values(334,'cuma',3036);

insert into ÖğrenciMüsaitlikDurumu values(334,'salı',3037);

insert into ÖğrenciMüsaitlikDurumu values(334,'çarşamba',3038);

insert into ÖğrenciMüsaitlikDurumu values(335,'perşembe',3039);

insert into ÖğrenciMüsaitlikDurumu values(335,'çarşamba',3040);

insert into ÖğrenciMüsaitlikDurumu values(335,'pazartesi',3041);

insert into ÖğrenciMüsaitlikDurumu values(335,'cuma',3042);

insert into ÖğrenciMüsaitlikDurumu values(335,'salı',3043);

insert into ÖğrenciMüsaitlikDurumu values(336,'salı',3044);

insert into ÖğrenciMüsaitlikDurumu values(336,'perşembe',3045);

insert into ÖğrenciMüsaitlikDurumu values(336,'pazartesi',3046);

insert into ÖğrenciMüsaitlikDurumu values(336,'cuma',3047);

insert into ÖğrenciMüsaitlikDurumu values(337,'cuma',3048);

insert into ÖğrenciMüsaitlikDurumu values(337,'pazartesi',3049);

insert into ÖğrenciMüsaitlikDurumu values(337,'perşembe',3050);

insert into ÖğrenciMüsaitlikDurumu values(338,'cuma',3051);

insert into ÖğrenciMüsaitlikDurumu values(338,'pazartesi',3052);

insert into ÖğrenciMüsaitlikDurumu values(339,'pazartesi',3053);

insert into ÖğrenciMüsaitlikDurumu values(339,'perşembe',3054);

insert into ÖğrenciMüsaitlikDurumu values(339,'cuma',3055);

insert into ÖğrenciMüsaitlikDurumu values(339,'salı',3056);

insert into ÖğrenciMüsaitlikDurumu values(339,'çarşamba',3057);

insert into ÖğrenciMüsaitlikDurumu values(340,'cuma',3058);

insert into ÖğrenciMüsaitlikDurumu values(340,'pazartesi',3059);

insert into ÖğrenciMüsaitlikDurumu values(340,'çarşamba',3060);

insert into ÖğrenciMüsaitlikDurumu values(341,'salı',3061);

insert into ÖğrenciMüsaitlikDurumu values(341,'cuma',3062);

insert into ÖğrenciMüsaitlikDurumu values(342,'pazartesi',3063);

insert into ÖğrenciMüsaitlikDurumu values(342,'perşembe',3064);

insert into ÖğrenciMüsaitlikDurumu values(342,'çarşamba',3065);

insert into ÖğrenciMüsaitlikDurumu values(342,'cuma',3066);

insert into ÖğrenciMüsaitlikDurumu values(342,'salı',3067);

insert into ÖğrenciMüsaitlikDurumu values(343,'çarşamba',3068);

insert into ÖğrenciMüsaitlikDurumu values(343,'salı',3069);

insert into ÖğrenciMüsaitlikDurumu values(343,'pazartesi',3070);

insert into ÖğrenciMüsaitlikDurumu values(344,'pazartesi',3071);

insert into ÖğrenciMüsaitlikDurumu values(344,'çarşamba',3072);

insert into ÖğrenciMüsaitlikDurumu values(344,'perşembe',3073);

insert into ÖğrenciMüsaitlikDurumu values(345,'salı',3074);

insert into ÖğrenciMüsaitlikDurumu values(345,'çarşamba',3075);

insert into ÖğrenciMüsaitlikDurumu values(346,'perşembe',3076);

insert into ÖğrenciMüsaitlikDurumu values(346,'cuma',3077);

insert into ÖğrenciMüsaitlikDurumu values(346,'çarşamba',3078);

insert into ÖğrenciMüsaitlikDurumu values(346,'pazartesi',3079);

insert into ÖğrenciMüsaitlikDurumu values(346,'salı',3080);

insert into ÖğrenciMüsaitlikDurumu values(347,'salı',3081);

insert into ÖğrenciMüsaitlikDurumu values(347,'cuma',3082);

insert into ÖğrenciMüsaitlikDurumu values(347,'pazartesi',3083);

insert into ÖğrenciMüsaitlikDurumu values(347,'perşembe',3084);

insert into ÖğrenciMüsaitlikDurumu values(347,'çarşamba',3085);

insert into ÖğrenciMüsaitlikDurumu values(348,'pazartesi',3086);

insert into ÖğrenciMüsaitlikDurumu values(348,'çarşamba',3087);

insert into ÖğrenciMüsaitlikDurumu values(348,'salı',3088);

insert into ÖğrenciMüsaitlikDurumu values(348,'perşembe',3089);

insert into ÖğrenciMüsaitlikDurumu values(349,'perşembe',3090);

insert into ÖğrenciMüsaitlikDurumu values(349,'salı',3091);

insert into ÖğrenciMüsaitlikDurumu values(350,'perşembe',3092);

insert into ÖğrenciMüsaitlikDurumu values(350,'pazartesi',3093);

insert into ÖğrenciMüsaitlikDurumu values(350,'cuma',3094);

insert into ÖğrenciMüsaitlikDurumu values(350,'salı',3095);

insert into ÖğrenciMüsaitlikDurumu values(351,'cuma',3096);

insert into ÖğrenciMüsaitlikDurumu values(351,'salı',3097);

insert into ÖğrenciMüsaitlikDurumu values(351,'çarşamba',3098);

insert into ÖğrenciMüsaitlikDurumu values(352,'pazartesi',3099);

insert into ÖğrenciMüsaitlikDurumu values(353,'çarşamba',3100);

insert into ÖğrenciMüsaitlikDurumu values(353,'perşembe',3101);

insert into ÖğrenciMüsaitlikDurumu values(353,'pazartesi',3102);

insert into ÖğrenciMüsaitlikDurumu values(354,'perşembe',3103);

insert into ÖğrenciMüsaitlikDurumu values(354,'cuma',3104);

insert into ÖğrenciMüsaitlikDurumu values(355,'salı',3105);

insert into ÖğrenciMüsaitlikDurumu values(355,'pazartesi',3106);

insert into ÖğrenciMüsaitlikDurumu values(355,'cuma',3107);

insert into ÖğrenciMüsaitlikDurumu values(356,'perşembe',3108);

insert into ÖğrenciMüsaitlikDurumu values(356,'çarşamba',3109);

insert into ÖğrenciMüsaitlikDurumu values(356,'salı',3110);

insert into ÖğrenciMüsaitlikDurumu values(356,'cuma',3111);

insert into ÖğrenciMüsaitlikDurumu values(356,'pazartesi',3112);

insert into ÖğrenciMüsaitlikDurumu values(357,'cuma',3113);

insert into ÖğrenciMüsaitlikDurumu values(358,'cuma',3114);

insert into ÖğrenciMüsaitlikDurumu values(358,'salı',3115);

insert into ÖğrenciMüsaitlikDurumu values(358,'pazartesi',3116);

insert into ÖğrenciMüsaitlikDurumu values(359,'perşembe',3117);

insert into ÖğrenciMüsaitlikDurumu values(359,'pazartesi',3118);

insert into ÖğrenciMüsaitlikDurumu values(360,'perşembe',3119);

insert into ÖğrenciMüsaitlikDurumu values(361,'perşembe',3120);

insert into ÖğrenciMüsaitlikDurumu values(361,'salı',3121);

insert into ÖğrenciMüsaitlikDurumu values(361,'çarşamba',3122);

insert into ÖğrenciMüsaitlikDurumu values(361,'pazartesi',3123);

insert into ÖğrenciMüsaitlikDurumu values(361,'cuma',3124);

insert into ÖğrenciMüsaitlikDurumu values(362,'perşembe',3125);

insert into ÖğrenciMüsaitlikDurumu values(362,'çarşamba',3126);

insert into ÖğrenciMüsaitlikDurumu values(362,'pazartesi',3127);

insert into ÖğrenciMüsaitlikDurumu values(362,'salı',3128);

insert into ÖğrenciMüsaitlikDurumu values(362,'cuma',3129);

insert into ÖğrenciMüsaitlikDurumu values(363,'çarşamba',3130);

insert into ÖğrenciMüsaitlikDurumu values(364,'perşembe',3131);

insert into ÖğrenciMüsaitlikDurumu values(364,'pazartesi',3132);

insert into ÖğrenciMüsaitlikDurumu values(364,'cuma',3133);

insert into ÖğrenciMüsaitlikDurumu values(365,'perşembe',3134);

insert into ÖğrenciMüsaitlikDurumu values(365,'çarşamba',3135);

insert into ÖğrenciMüsaitlikDurumu values(365,'pazartesi',3136);

insert into ÖğrenciMüsaitlikDurumu values(366,'perşembe',3137);

insert into ÖğrenciMüsaitlikDurumu values(366,'pazartesi',3138);

insert into ÖğrenciMüsaitlikDurumu values(367,'salı',3139);

insert into ÖğrenciMüsaitlikDurumu values(367,'pazartesi',3140);

insert into ÖğrenciMüsaitlikDurumu values(367,'çarşamba',3141);

insert into ÖğrenciMüsaitlikDurumu values(367,'cuma',3142);

insert into ÖğrenciMüsaitlikDurumu values(367,'perşembe',3143);

insert into ÖğrenciMüsaitlikDurumu values(368,'çarşamba',3144);

insert into ÖğrenciMüsaitlikDurumu values(368,'salı',3145);

insert into ÖğrenciMüsaitlikDurumu values(369,'cuma',3146);

insert into ÖğrenciMüsaitlikDurumu values(370,'pazartesi',3147);

insert into ÖğrenciMüsaitlikDurumu values(371,'perşembe',3148);

insert into ÖğrenciMüsaitlikDurumu values(371,'salı',3149);

insert into ÖğrenciMüsaitlikDurumu values(371,'cuma',3150);

insert into ÖğrenciMüsaitlikDurumu values(372,'cuma',3151);

insert into ÖğrenciMüsaitlikDurumu values(372,'salı',3152);

insert into ÖğrenciMüsaitlikDurumu values(372,'pazartesi',3153);

insert into ÖğrenciMüsaitlikDurumu values(373,'pazartesi',3154);

insert into ÖğrenciMüsaitlikDurumu values(373,'perşembe',3155);

insert into ÖğrenciMüsaitlikDurumu values(373,'cuma',3156);

insert into ÖğrenciMüsaitlikDurumu values(373,'çarşamba',3157);

insert into ÖğrenciMüsaitlikDurumu values(373,'salı',3158);

insert into ÖğrenciMüsaitlikDurumu values(374,'cuma',3159);

insert into ÖğrenciMüsaitlikDurumu values(375,'pazartesi',3160);

insert into ÖğrenciMüsaitlikDurumu values(375,'çarşamba',3161);

insert into ÖğrenciMüsaitlikDurumu values(375,'salı',3162);

insert into ÖğrenciMüsaitlikDurumu values(375,'cuma',3163);

insert into ÖğrenciMüsaitlikDurumu values(375,'perşembe',3164);

insert into ÖğrenciMüsaitlikDurumu values(376,'perşembe',3165);

insert into ÖğrenciMüsaitlikDurumu values(376,'salı',3166);

insert into ÖğrenciMüsaitlikDurumu values(376,'cuma',3167);

insert into ÖğrenciMüsaitlikDurumu values(376,'pazartesi',3168);

insert into ÖğrenciMüsaitlikDurumu values(377,'perşembe',3169);

insert into ÖğrenciMüsaitlikDurumu values(377,'cuma',3170);

insert into ÖğrenciMüsaitlikDurumu values(377,'çarşamba',3171);

insert into ÖğrenciMüsaitlikDurumu values(377,'pazartesi',3172);

insert into ÖğrenciMüsaitlikDurumu values(378,'perşembe',3173);

insert into ÖğrenciMüsaitlikDurumu values(378,'çarşamba',3174);

insert into ÖğrenciMüsaitlikDurumu values(378,'cuma',3175);

insert into ÖğrenciMüsaitlikDurumu values(378,'pazartesi',3176);

insert into ÖğrenciMüsaitlikDurumu values(379,'perşembe',3177);

insert into ÖğrenciMüsaitlikDurumu values(379,'pazartesi',3178);

insert into ÖğrenciMüsaitlikDurumu values(379,'salı',3179);

insert into ÖğrenciMüsaitlikDurumu values(379,'cuma',3180);

insert into ÖğrenciMüsaitlikDurumu values(379,'çarşamba',3181);

insert into ÖğrenciMüsaitlikDurumu values(380,'çarşamba',3182);

insert into ÖğrenciMüsaitlikDurumu values(380,'cuma',3183);

insert into ÖğrenciMüsaitlikDurumu values(380,'salı',3184);

insert into ÖğrenciMüsaitlikDurumu values(381,'pazartesi',3185);

insert into ÖğrenciMüsaitlikDurumu values(381,'cuma',3186);

insert into ÖğrenciMüsaitlikDurumu values(382,'cuma',3187);

insert into ÖğrenciMüsaitlikDurumu values(383,'çarşamba',3188);

insert into ÖğrenciMüsaitlikDurumu values(383,'pazartesi',3189);

insert into ÖğrenciMüsaitlikDurumu values(383,'perşembe',3190);

insert into ÖğrenciMüsaitlikDurumu values(383,'salı',3191);

insert into ÖğrenciMüsaitlikDurumu values(384,'perşembe',3192);

insert into ÖğrenciMüsaitlikDurumu values(384,'pazartesi',3193);

insert into ÖğrenciMüsaitlikDurumu values(384,'salı',3194);

insert into ÖğrenciMüsaitlikDurumu values(384,'çarşamba',3195);

insert into ÖğrenciMüsaitlikDurumu values(385,'cuma',3196);

insert into ÖğrenciMüsaitlikDurumu values(385,'çarşamba',3197);

insert into ÖğrenciMüsaitlikDurumu values(386,'salı',3198);

insert into ÖğrenciMüsaitlikDurumu values(386,'perşembe',3199);

insert into ÖğrenciMüsaitlikDurumu values(386,'çarşamba',3200);

insert into ÖğrenciMüsaitlikDurumu values(386,'pazartesi',3201);

insert into ÖğrenciMüsaitlikDurumu values(387,'pazartesi',3202);

insert into ÖğrenciMüsaitlikDurumu values(387,'çarşamba',3203);

insert into ÖğrenciMüsaitlikDurumu values(387,'salı',3204);

insert into ÖğrenciMüsaitlikDurumu values(388,'perşembe',3205);

insert into ÖğrenciMüsaitlikDurumu values(388,'salı',3206);

insert into ÖğrenciMüsaitlikDurumu values(388,'çarşamba',3207);

insert into ÖğrenciMüsaitlikDurumu values(388,'pazartesi',3208);

insert into ÖğrenciMüsaitlikDurumu values(388,'cuma',3209);

insert into ÖğrenciMüsaitlikDurumu values(389,'perşembe',3210);

insert into ÖğrenciMüsaitlikDurumu values(389,'cuma',3211);

insert into ÖğrenciMüsaitlikDurumu values(390,'çarşamba',3212);

insert into ÖğrenciMüsaitlikDurumu values(391,'cuma',3213);

insert into ÖğrenciMüsaitlikDurumu values(391,'perşembe',3214);

insert into ÖğrenciMüsaitlikDurumu values(391,'pazartesi',3215);

insert into ÖğrenciMüsaitlikDurumu values(392,'pazartesi',3216);

insert into ÖğrenciMüsaitlikDurumu values(392,'perşembe',3217);

insert into ÖğrenciMüsaitlikDurumu values(393,'salı',3218);

insert into ÖğrenciMüsaitlikDurumu values(393,'pazartesi',3219);

insert into ÖğrenciMüsaitlikDurumu values(393,'perşembe',3220);

insert into ÖğrenciMüsaitlikDurumu values(393,'çarşamba',3221);

insert into ÖğrenciMüsaitlikDurumu values(393,'cuma',3222);

insert into ÖğrenciMüsaitlikDurumu values(394,'çarşamba',3223);

insert into ÖğrenciMüsaitlikDurumu values(395,'perşembe',3224);

insert into ÖğrenciMüsaitlikDurumu values(395,'cuma',3225);

insert into ÖğrenciMüsaitlikDurumu values(395,'çarşamba',3226);

insert into ÖğrenciMüsaitlikDurumu values(396,'çarşamba',3227);

insert into ÖğrenciMüsaitlikDurumu values(396,'pazartesi',3228);

insert into ÖğrenciMüsaitlikDurumu values(396,'cuma',3229);

insert into ÖğrenciMüsaitlikDurumu values(396,'perşembe',3230);

insert into ÖğrenciMüsaitlikDurumu values(396,'salı',3231);

insert into ÖğrenciMüsaitlikDurumu values(397,'çarşamba',3232);

insert into ÖğrenciMüsaitlikDurumu values(397,'cuma',3233);

insert into ÖğrenciMüsaitlikDurumu values(397,'perşembe',3234);

insert into ÖğrenciMüsaitlikDurumu values(397,'salı',3235);

insert into ÖğrenciMüsaitlikDurumu values(398,'pazartesi',3236);

insert into ÖğrenciMüsaitlikDurumu values(398,'çarşamba',3237);

insert into ÖğrenciMüsaitlikDurumu values(398,'salı',3238);

insert into ÖğrenciMüsaitlikDurumu values(398,'perşembe',3239);

insert into ÖğrenciMüsaitlikDurumu values(398,'cuma',3240);

insert into ÖğrenciMüsaitlikDurumu values(399,'pazartesi',3241);

insert into ÖğrenciMüsaitlikDurumu values(399,'çarşamba',3242);

insert into ÖğrenciMüsaitlikDurumu values(400,'pazartesi',3243);

insert into ÖğrenciMüsaitlikDurumu values(400,'perşembe',3244);

insert into ÖğrenciMüsaitlikDurumu values(400,'çarşamba',3245);

insert into ÖğrenciMüsaitlikDurumu values(401,'perşembe',3246);

insert into ÖğrenciMüsaitlikDurumu values(401,'salı',3247);

insert into ÖğrenciMüsaitlikDurumu values(401,'pazartesi',3248);

insert into ÖğrenciMüsaitlikDurumu values(401,'çarşamba',3249);

insert into ÖğrenciMüsaitlikDurumu values(401,'cuma',3250);

insert into ÖğrenciMüsaitlikDurumu values(402,'çarşamba',3251);

insert into ÖğrenciMüsaitlikDurumu values(402,'salı',3252);

insert into ÖğrenciMüsaitlikDurumu values(402,'pazartesi',3253);

insert into ÖğrenciMüsaitlikDurumu values(403,'çarşamba',3254);

insert into ÖğrenciMüsaitlikDurumu values(403,'pazartesi',3255);

insert into ÖğrenciMüsaitlikDurumu values(403,'salı',3256);

insert into ÖğrenciMüsaitlikDurumu values(403,'perşembe',3257);

insert into ÖğrenciMüsaitlikDurumu values(404,'perşembe',3258);

insert into ÖğrenciMüsaitlikDurumu values(404,'salı',3259);

insert into ÖğrenciMüsaitlikDurumu values(404,'cuma',3260);

insert into ÖğrenciMüsaitlikDurumu values(404,'pazartesi',3261);

insert into ÖğrenciMüsaitlikDurumu values(404,'çarşamba',3262);

insert into ÖğrenciMüsaitlikDurumu values(405,'salı',3263);

insert into ÖğrenciMüsaitlikDurumu values(406,'cuma',3264);

insert into ÖğrenciMüsaitlikDurumu values(406,'çarşamba',3265);

insert into ÖğrenciMüsaitlikDurumu values(406,'pazartesi',3266);

insert into ÖğrenciMüsaitlikDurumu values(407,'perşembe',3267);

insert into ÖğrenciMüsaitlikDurumu values(408,'cuma',3268);

insert into ÖğrenciMüsaitlikDurumu values(408,'pazartesi',3269);

insert into ÖğrenciMüsaitlikDurumu values(408,'salı',3270);

insert into ÖğrenciMüsaitlikDurumu values(408,'perşembe',3271);

insert into ÖğrenciMüsaitlikDurumu values(409,'perşembe',3272);

insert into ÖğrenciMüsaitlikDurumu values(409,'çarşamba',3273);

insert into ÖğrenciMüsaitlikDurumu values(410,'pazartesi',3274);

insert into ÖğrenciMüsaitlikDurumu values(411,'pazartesi',3275);

insert into ÖğrenciMüsaitlikDurumu values(411,'cuma',3276);

insert into ÖğrenciMüsaitlikDurumu values(411,'perşembe',3277);

insert into ÖğrenciMüsaitlikDurumu values(411,'çarşamba',3278);

insert into ÖğrenciMüsaitlikDurumu values(411,'salı',3279);

insert into ÖğrenciMüsaitlikDurumu values(412,'salı',3280);

insert into ÖğrenciMüsaitlikDurumu values(413,'salı',3281);

insert into ÖğrenciMüsaitlikDurumu values(413,'pazartesi',3282);

insert into ÖğrenciMüsaitlikDurumu values(413,'çarşamba',3283);

insert into ÖğrenciMüsaitlikDurumu values(414,'salı',3284);

insert into ÖğrenciMüsaitlikDurumu values(414,'cuma',3285);

insert into ÖğrenciMüsaitlikDurumu values(414,'perşembe',3286);

insert into ÖğrenciMüsaitlikDurumu values(415,'perşembe',3287);

insert into ÖğrenciMüsaitlikDurumu values(416,'çarşamba',3288);

insert into ÖğrenciMüsaitlikDurumu values(416,'perşembe',3289);

insert into ÖğrenciMüsaitlikDurumu values(416,'pazartesi',3290);

insert into ÖğrenciMüsaitlikDurumu values(416,'salı',3291);

insert into ÖğrenciMüsaitlikDurumu values(417,'salı',3292);

insert into ÖğrenciMüsaitlikDurumu values(417,'perşembe',3293);

insert into ÖğrenciMüsaitlikDurumu values(417,'pazartesi',3294);

insert into ÖğrenciMüsaitlikDurumu values(417,'cuma',3295);

insert into ÖğrenciMüsaitlikDurumu values(417,'çarşamba',3296);

insert into ÖğrenciMüsaitlikDurumu values(418,'cuma',3297);

insert into ÖğrenciMüsaitlikDurumu values(418,'çarşamba',3298);

insert into ÖğrenciMüsaitlikDurumu values(418,'perşembe',3299);

insert into ÖğrenciMüsaitlikDurumu values(418,'salı',3300);

insert into ÖğrenciMüsaitlikDurumu values(418,'pazartesi',3301);

insert into ÖğrenciMüsaitlikDurumu values(419,'çarşamba',3302);

insert into ÖğrenciMüsaitlikDurumu values(419,'cuma',3303);

insert into ÖğrenciMüsaitlikDurumu values(420,'salı',3304);

insert into ÖğrenciMüsaitlikDurumu values(421,'çarşamba',3305);

insert into ÖğrenciMüsaitlikDurumu values(421,'cuma',3306);

insert into ÖğrenciMüsaitlikDurumu values(421,'pazartesi',3307);

insert into ÖğrenciMüsaitlikDurumu values(421,'perşembe',3308);

insert into ÖğrenciMüsaitlikDurumu values(422,'perşembe',3309);

insert into ÖğrenciMüsaitlikDurumu values(422,'cuma',3310);

insert into ÖğrenciMüsaitlikDurumu values(422,'salı',3311);

insert into ÖğrenciMüsaitlikDurumu values(423,'perşembe',3312);

insert into ÖğrenciMüsaitlikDurumu values(423,'cuma',3313);

insert into ÖğrenciMüsaitlikDurumu values(423,'pazartesi',3314);

insert into ÖğrenciMüsaitlikDurumu values(423,'çarşamba',3315);

insert into ÖğrenciMüsaitlikDurumu values(424,'cuma',3316);

insert into ÖğrenciMüsaitlikDurumu values(424,'çarşamba',3317);

insert into ÖğrenciMüsaitlikDurumu values(425,'salı',3318);

insert into ÖğrenciMüsaitlikDurumu values(425,'perşembe',3319);

insert into ÖğrenciMüsaitlikDurumu values(425,'cuma',3320);

insert into ÖğrenciMüsaitlikDurumu values(425,'pazartesi',3321);

insert into ÖğrenciMüsaitlikDurumu values(426,'pazartesi',3322);

insert into ÖğrenciMüsaitlikDurumu values(426,'salı',3323);

insert into ÖğrenciMüsaitlikDurumu values(426,'perşembe',3324);

insert into ÖğrenciMüsaitlikDurumu values(426,'çarşamba',3325);

insert into ÖğrenciMüsaitlikDurumu values(426,'cuma',3326);

insert into ÖğrenciMüsaitlikDurumu values(427,'çarşamba',3327);

insert into ÖğrenciMüsaitlikDurumu values(427,'perşembe',3328);

insert into ÖğrenciMüsaitlikDurumu values(427,'salı',3329);

insert into ÖğrenciMüsaitlikDurumu values(427,'pazartesi',3330);

insert into ÖğrenciMüsaitlikDurumu values(428,'salı',3331);

insert into ÖğrenciMüsaitlikDurumu values(428,'cuma',3332);

insert into ÖğrenciMüsaitlikDurumu values(429,'perşembe',3333);

insert into ÖğrenciMüsaitlikDurumu values(429,'çarşamba',3334);

insert into ÖğrenciMüsaitlikDurumu values(429,'pazartesi',3335);

insert into ÖğrenciMüsaitlikDurumu values(429,'salı',3336);

insert into ÖğrenciMüsaitlikDurumu values(429,'cuma',3337);

insert into ÖğrenciMüsaitlikDurumu values(430,'salı',3338);

insert into ÖğrenciMüsaitlikDurumu values(430,'pazartesi',3339);

insert into ÖğrenciMüsaitlikDurumu values(430,'cuma',3340);

insert into ÖğrenciMüsaitlikDurumu values(431,'pazartesi',3341);

insert into ÖğrenciMüsaitlikDurumu values(432,'perşembe',3342);

insert into ÖğrenciMüsaitlikDurumu values(432,'cuma',3343);

insert into ÖğrenciMüsaitlikDurumu values(433,'cuma',3344);

insert into ÖğrenciMüsaitlikDurumu values(433,'salı',3345);

insert into ÖğrenciMüsaitlikDurumu values(433,'çarşamba',3346);

insert into ÖğrenciMüsaitlikDurumu values(433,'perşembe',3347);

insert into ÖğrenciMüsaitlikDurumu values(433,'pazartesi',3348);

insert into ÖğrenciMüsaitlikDurumu values(434,'cuma',3349);

insert into ÖğrenciMüsaitlikDurumu values(434,'salı',3350);

insert into ÖğrenciMüsaitlikDurumu values(434,'çarşamba',3351);

insert into ÖğrenciMüsaitlikDurumu values(434,'perşembe',3352);

insert into ÖğrenciMüsaitlikDurumu values(434,'pazartesi',3353);

insert into ÖğrenciMüsaitlikDurumu values(435,'perşembe',3354);

insert into ÖğrenciMüsaitlikDurumu values(435,'cuma',3355);

insert into ÖğrenciMüsaitlikDurumu values(435,'çarşamba',3356);

insert into ÖğrenciMüsaitlikDurumu values(436,'pazartesi',3357);

insert into ÖğrenciMüsaitlikDurumu values(436,'çarşamba',3358);

insert into ÖğrenciMüsaitlikDurumu values(436,'cuma',3359);

insert into ÖğrenciMüsaitlikDurumu values(437,'perşembe',3360);

insert into ÖğrenciMüsaitlikDurumu values(437,'pazartesi',3361);

insert into ÖğrenciMüsaitlikDurumu values(437,'cuma',3362);

insert into ÖğrenciMüsaitlikDurumu values(437,'çarşamba',3363);

insert into ÖğrenciMüsaitlikDurumu values(437,'salı',3364);

insert into ÖğrenciMüsaitlikDurumu values(438,'perşembe',3365);

insert into ÖğrenciMüsaitlikDurumu values(439,'cuma',3366);

insert into ÖğrenciMüsaitlikDurumu values(439,'salı',3367);

insert into ÖğrenciMüsaitlikDurumu values(440,'salı',3368);

insert into ÖğrenciMüsaitlikDurumu values(441,'cuma',3369);

insert into ÖğrenciMüsaitlikDurumu values(441,'salı',3370);

insert into ÖğrenciMüsaitlikDurumu values(441,'pazartesi',3371);

insert into ÖğrenciMüsaitlikDurumu values(442,'pazartesi',3372);

insert into ÖğrenciMüsaitlikDurumu values(442,'perşembe',3373);

insert into ÖğrenciMüsaitlikDurumu values(443,'perşembe',3374);

insert into ÖğrenciMüsaitlikDurumu values(443,'cuma',3375);

insert into ÖğrenciMüsaitlikDurumu values(444,'cuma',3376);

insert into ÖğrenciMüsaitlikDurumu values(444,'çarşamba',3377);

insert into ÖğrenciMüsaitlikDurumu values(444,'salı',3378);

insert into ÖğrenciMüsaitlikDurumu values(445,'salı',3379);

insert into ÖğrenciMüsaitlikDurumu values(445,'çarşamba',3380);

insert into ÖğrenciMüsaitlikDurumu values(445,'perşembe',3381);

insert into ÖğrenciMüsaitlikDurumu values(445,'pazartesi',3382);

insert into ÖğrenciMüsaitlikDurumu values(446,'salı',3383);

insert into ÖğrenciMüsaitlikDurumu values(446,'perşembe',3384);

insert into ÖğrenciMüsaitlikDurumu values(446,'çarşamba',3385);

insert into ÖğrenciMüsaitlikDurumu values(446,'pazartesi',3386);

insert into ÖğrenciMüsaitlikDurumu values(447,'pazartesi',3387);

insert into ÖğrenciMüsaitlikDurumu values(447,'perşembe',3388);

insert into ÖğrenciMüsaitlikDurumu values(448,'perşembe',3389);

insert into ÖğrenciMüsaitlikDurumu values(449,'salı',3390);

insert into ÖğrenciMüsaitlikDurumu values(449,'çarşamba',3391);

insert into ÖğrenciMüsaitlikDurumu values(450,'perşembe',3392);

insert into ÖğrenciMüsaitlikDurumu values(450,'salı',3393);

insert into ÖğrenciMüsaitlikDurumu values(450,'cuma',3394);

insert into ÖğrenciMüsaitlikDurumu values(451,'cuma',3395);

insert into ÖğrenciMüsaitlikDurumu values(451,'çarşamba',3396);

insert into ÖğrenciMüsaitlikDurumu values(451,'perşembe',3397);

insert into ÖğrenciMüsaitlikDurumu values(451,'salı',3398);

insert into ÖğrenciMüsaitlikDurumu values(451,'pazartesi',3399);

insert into ÖğrenciMüsaitlikDurumu values(452,'cuma',3400);

insert into ÖğrenciMüsaitlikDurumu values(452,'çarşamba',3401);

insert into ÖğrenciMüsaitlikDurumu values(452,'salı',3402);

insert into ÖğrenciMüsaitlikDurumu values(452,'pazartesi',3403);

insert into ÖğrenciMüsaitlikDurumu values(453,'pazartesi',3404);

insert into ÖğrenciMüsaitlikDurumu values(453,'salı',3405);

insert into ÖğrenciMüsaitlikDurumu values(453,'çarşamba',3406);

insert into ÖğrenciMüsaitlikDurumu values(454,'çarşamba',3407);

insert into ÖğrenciMüsaitlikDurumu values(454,'perşembe',3408);

insert into ÖğrenciMüsaitlikDurumu values(454,'salı',3409);

insert into ÖğrenciMüsaitlikDurumu values(455,'perşembe',3410);

insert into ÖğrenciMüsaitlikDurumu values(455,'salı',3411);

insert into ÖğrenciMüsaitlikDurumu values(455,'çarşamba',3412);

insert into ÖğrenciMüsaitlikDurumu values(455,'pazartesi',3413);

insert into ÖğrenciMüsaitlikDurumu values(456,'pazartesi',3414);

insert into ÖğrenciMüsaitlikDurumu values(456,'çarşamba',3415);

insert into ÖğrenciMüsaitlikDurumu values(456,'perşembe',3416);

insert into ÖğrenciMüsaitlikDurumu values(457,'perşembe',3417);

insert into ÖğrenciMüsaitlikDurumu values(457,'çarşamba',3418);

insert into ÖğrenciMüsaitlikDurumu values(457,'cuma',3419);

insert into ÖğrenciMüsaitlikDurumu values(457,'salı',3420);

insert into ÖğrenciMüsaitlikDurumu values(457,'pazartesi',3421);

insert into ÖğrenciMüsaitlikDurumu values(458,'pazartesi',3422);

insert into ÖğrenciMüsaitlikDurumu values(458,'cuma',3423);

insert into ÖğrenciMüsaitlikDurumu values(459,'perşembe',3424);

insert into ÖğrenciMüsaitlikDurumu values(459,'çarşamba',3425);

insert into ÖğrenciMüsaitlikDurumu values(459,'cuma',3426);

insert into ÖğrenciMüsaitlikDurumu values(459,'salı',3427);

insert into ÖğrenciMüsaitlikDurumu values(460,'cuma',3428);

insert into ÖğrenciMüsaitlikDurumu values(461,'pazartesi',3429);

insert into ÖğrenciMüsaitlikDurumu values(461,'çarşamba',3430);

insert into ÖğrenciMüsaitlikDurumu values(461,'perşembe',3431);

insert into ÖğrenciMüsaitlikDurumu values(461,'salı',3432);

insert into ÖğrenciMüsaitlikDurumu values(461,'cuma',3433);

insert into ÖğrenciMüsaitlikDurumu values(462,'cuma',3434);

insert into ÖğrenciMüsaitlikDurumu values(462,'perşembe',3435);

insert into ÖğrenciMüsaitlikDurumu values(462,'salı',3436);

insert into ÖğrenciMüsaitlikDurumu values(463,'çarşamba',3437);

insert into ÖğrenciMüsaitlikDurumu values(463,'pazartesi',3438);

insert into ÖğrenciMüsaitlikDurumu values(463,'perşembe',3439);

insert into ÖğrenciMüsaitlikDurumu values(463,'cuma',3440);

insert into ÖğrenciMüsaitlikDurumu values(464,'pazartesi',3441);

insert into ÖğrenciMüsaitlikDurumu values(464,'cuma',3442);

insert into ÖğrenciMüsaitlikDurumu values(465,'çarşamba',3443);

insert into ÖğrenciMüsaitlikDurumu values(466,'pazartesi',3444);

insert into ÖğrenciMüsaitlikDurumu values(466,'cuma',3445);

insert into ÖğrenciMüsaitlikDurumu values(466,'perşembe',3446);

insert into ÖğrenciMüsaitlikDurumu values(466,'salı',3447);

insert into ÖğrenciMüsaitlikDurumu values(467,'pazartesi',3448);

insert into ÖğrenciMüsaitlikDurumu values(467,'cuma',3449);

insert into ÖğrenciMüsaitlikDurumu values(468,'salı',3450);

insert into ÖğrenciMüsaitlikDurumu values(468,'perşembe',3451);

insert into ÖğrenciMüsaitlikDurumu values(469,'perşembe',3452);

insert into ÖğrenciMüsaitlikDurumu values(469,'cuma',3453);

insert into ÖğrenciMüsaitlikDurumu values(469,'pazartesi',3454);

insert into ÖğrenciMüsaitlikDurumu values(469,'çarşamba',3455);

insert into ÖğrenciMüsaitlikDurumu values(470,'cuma',3456);

insert into ÖğrenciMüsaitlikDurumu values(470,'perşembe',3457);

insert into ÖğrenciMüsaitlikDurumu values(471,'salı',3458);

insert into ÖğrenciMüsaitlikDurumu values(471,'perşembe',3459);

insert into ÖğrenciMüsaitlikDurumu values(471,'pazartesi',3460);

insert into ÖğrenciMüsaitlikDurumu values(471,'cuma',3461);

insert into ÖğrenciMüsaitlikDurumu values(472,'pazartesi',3462);

insert into ÖğrenciMüsaitlikDurumu values(473,'perşembe',3463);

insert into ÖğrenciMüsaitlikDurumu values(473,'salı',3464);

insert into ÖğrenciMüsaitlikDurumu values(473,'cuma',3465);

insert into ÖğrenciMüsaitlikDurumu values(474,'perşembe',3466);

insert into ÖğrenciMüsaitlikDurumu values(474,'salı',3467);

insert into ÖğrenciMüsaitlikDurumu values(475,'salı',3468);

insert into ÖğrenciMüsaitlikDurumu values(475,'cuma',3469);

insert into ÖğrenciMüsaitlikDurumu values(475,'pazartesi',3470);

insert into ÖğrenciMüsaitlikDurumu values(475,'perşembe',3471);

insert into ÖğrenciMüsaitlikDurumu values(475,'çarşamba',3472);

insert into ÖğrenciMüsaitlikDurumu values(476,'cuma',3473);

insert into ÖğrenciMüsaitlikDurumu values(477,'salı',3474);

insert into ÖğrenciMüsaitlikDurumu values(477,'perşembe',3475);

insert into ÖğrenciMüsaitlikDurumu values(477,'cuma',3476);

insert into ÖğrenciMüsaitlikDurumu values(477,'pazartesi',3477);

insert into ÖğrenciMüsaitlikDurumu values(478,'perşembe',3478);

insert into ÖğrenciMüsaitlikDurumu values(478,'çarşamba',3479);

insert into ÖğrenciMüsaitlikDurumu values(478,'salı',3480);

insert into ÖğrenciMüsaitlikDurumu values(478,'cuma',3481);

insert into ÖğrenciMüsaitlikDurumu values(478,'pazartesi',3482);

insert into ÖğrenciMüsaitlikDurumu values(479,'pazartesi',3483);

insert into ÖğrenciMüsaitlikDurumu values(479,'perşembe',3484);

insert into ÖğrenciMüsaitlikDurumu values(479,'cuma',3485);

insert into ÖğrenciMüsaitlikDurumu values(480,'perşembe',3486);

insert into ÖğrenciMüsaitlikDurumu values(480,'pazartesi',3487);

insert into ÖğrenciMüsaitlikDurumu values(481,'pazartesi',3488);

insert into ÖğrenciMüsaitlikDurumu values(482,'perşembe',3489);

insert into ÖğrenciMüsaitlikDurumu values(482,'pazartesi',3490);

insert into ÖğrenciMüsaitlikDurumu values(482,'salı',3491);

insert into ÖğrenciMüsaitlikDurumu values(482,'cuma',3492);

insert into ÖğrenciMüsaitlikDurumu values(483,'cuma',3493);

insert into ÖğrenciMüsaitlikDurumu values(484,'perşembe',3494);

insert into ÖğrenciMüsaitlikDurumu values(485,'pazartesi',3495);

insert into ÖğrenciMüsaitlikDurumu values(485,'çarşamba',3496);

insert into ÖğrenciMüsaitlikDurumu values(485,'salı',3497);

insert into ÖğrenciMüsaitlikDurumu values(485,'perşembe',3498);

insert into ÖğrenciMüsaitlikDurumu values(485,'cuma',3499);

insert into ÖğrenciMüsaitlikDurumu values(486,'perşembe',3500);

insert into ÖğrenciMüsaitlikDurumu values(486,'çarşamba',3501);

insert into ÖğrenciMüsaitlikDurumu values(487,'salı',3502);

insert into ÖğrenciMüsaitlikDurumu values(487,'perşembe',3503);

insert into ÖğrenciMüsaitlikDurumu values(487,'cuma',3504);

insert into ÖğrenciMüsaitlikDurumu values(487,'çarşamba',3505);

insert into ÖğrenciMüsaitlikDurumu values(488,'perşembe',3506);

insert into ÖğrenciMüsaitlikDurumu values(489,'perşembe',3507);

insert into ÖğrenciMüsaitlikDurumu values(489,'salı',3508);

insert into ÖğrenciMüsaitlikDurumu values(489,'pazartesi',3509);

insert into ÖğrenciMüsaitlikDurumu values(489,'çarşamba',3510);

insert into ÖğrenciMüsaitlikDurumu values(490,'perşembe',3511);

insert into ÖğrenciMüsaitlikDurumu values(490,'çarşamba',3512);

insert into ÖğrenciMüsaitlikDurumu values(491,'perşembe',3513);

insert into ÖğrenciMüsaitlikDurumu values(491,'pazartesi',3514);

insert into ÖğrenciMüsaitlikDurumu values(491,'cuma',3515);

insert into ÖğrenciMüsaitlikDurumu values(491,'çarşamba',3516);

insert into ÖğrenciMüsaitlikDurumu values(492,'salı',3517);

insert into ÖğrenciMüsaitlikDurumu values(492,'perşembe',3518);

insert into ÖğrenciMüsaitlikDurumu values(493,'çarşamba',3519);

insert into ÖğrenciMüsaitlikDurumu values(493,'salı',3520);

insert into ÖğrenciMüsaitlikDurumu values(493,'cuma',3521);

insert into ÖğrenciMüsaitlikDurumu values(493,'perşembe',3522);

insert into ÖğrenciMüsaitlikDurumu values(494,'perşembe',3523);

insert into ÖğrenciMüsaitlikDurumu values(494,'pazartesi',3524);

insert into ÖğrenciMüsaitlikDurumu values(494,'cuma',3525);

insert into ÖğrenciMüsaitlikDurumu values(494,'salı',3526);

insert into ÖğrenciMüsaitlikDurumu values(495,'cuma',3527);

insert into ÖğrenciMüsaitlikDurumu values(495,'perşembe',3528);

insert into ÖğrenciMüsaitlikDurumu values(495,'pazartesi',3529);

insert into ÖğrenciMüsaitlikDurumu values(495,'çarşamba',3530);

insert into ÖğrenciMüsaitlikDurumu values(496,'pazartesi',3531);

insert into ÖğrenciMüsaitlikDurumu values(496,'çarşamba',3532);

insert into ÖğrenciMüsaitlikDurumu values(496,'cuma',3533);

insert into ÖğrenciMüsaitlikDurumu values(496,'perşembe',3534);

insert into ÖğrenciMüsaitlikDurumu values(497,'salı',3535);

insert into ÖğrenciMüsaitlikDurumu values(498,'cuma',3536);

insert into ÖğrenciMüsaitlikDurumu values(498,'perşembe',3537);

insert into ÖğrenciMüsaitlikDurumu values(498,'pazartesi',3538);

insert into ÖğrenciMüsaitlikDurumu values(498,'çarşamba',3539);

insert into ÖğrenciMüsaitlikDurumu values(499,'pazartesi',3540);

insert into ÖğrenciMüsaitlikDurumu values(499,'perşembe',3541);

insert into ÖğrenciMüsaitlikDurumu values(499,'çarşamba',3542);

insert into ÖğrenciMüsaitlikDurumu values(500,'perşembe',3543);

insert into ÖğrenciMüsaitlikDurumu values(500,'cuma',3544);

insert into ÖğrenciMüsaitlikDurumu values(500,'pazartesi',3545);

insert into Ders values(1001,'Matematik');

insert into Ders values(1002,'ingilizce');

insert into Ders values(1003,'almanca');

insert into Ders values(1004,'satranç');

insert into Ders values(1005,'webtasarım');

insert into Ders values(1006,'robotikproglamlama');
insert into DersiAlır values(1,1003);

insert into DersiAlır values(1,1002);

insert into DersiAlır values(1,1006);

insert into DersiAlır values(1,1004);

insert into DersiAlır values(2,1002);

insert into DersiAlır values(2,1004);

insert into DersiAlır values(2,1003);

insert into DersiAlır values(2,1006);

insert into DersiAlır values(2,1001);

insert into DersiAlır values(3,1006);

insert into DersiAlır values(3,1001);

insert into DersiAlır values(3,1005);

insert into DersiAlır values(4,1002);

insert into DersiAlır values(4,1004);

insert into DersiAlır values(5,1001);

insert into DersiAlır values(5,1003);

insert into DersiAlır values(5,1004);

insert into DersiAlır values(5,1006);

insert into DersiAlır values(6,1003);

insert into DersiAlır values(6,1001);

insert into DersiAlır values(6,1005);

insert into DersiAlır values(7,1002);

insert into DersiAlır values(7,1004);

insert into DersiAlır values(8,1006);

insert into DersiAlır values(8,1005);

insert into DersiAlır values(8,1001);

insert into DersiAlır values(9,1003);

insert into DersiAlır values(10,1003);

insert into DersiAlır values(10,1006);

insert into DersiAlır values(10,1005);

insert into DersiAlır values(10,1002);

insert into DersiAlır values(10,1001);

insert into DersiAlır values(11,1005);

insert into DersiAlır values(11,1003);

insert into DersiAlır values(11,1002);

insert into DersiAlır values(11,1006);

insert into DersiAlır values(12,1005);

insert into DersiAlır values(12,1004);

insert into DersiAlır values(13,1001);

insert into DersiAlır values(13,1004);

insert into DersiAlır values(13,1002);

insert into DersiAlır values(13,1006);

insert into DersiAlır values(13,1005);

insert into DersiAlır values(14,1001);

insert into DersiAlır values(14,1003);

insert into DersiAlır values(15,1004);

insert into DersiAlır values(15,1005);

insert into DersiAlır values(16,1005);

insert into DersiAlır values(17,1005);

insert into DersiAlır values(17,1003);

insert into DersiAlır values(17,1002);

insert into DersiAlır values(17,1004);

insert into DersiAlır values(18,1005);

insert into DersiAlır values(18,1001);

insert into DersiAlır values(18,1002);

insert into DersiAlır values(18,1004);

insert into DersiAlır values(18,1003);

insert into DersiAlır values(19,1002);

insert into DersiAlır values(19,1001);

insert into DersiAlır values(19,1003);

insert into DersiAlır values(19,1004);

insert into DersiAlır values(19,1005);

insert into DersiAlır values(20,1001);

insert into DersiAlır values(20,1003);

insert into DersiAlır values(20,1006);

insert into DersiAlır values(21,1005);

insert into DersiAlır values(22,1006);

insert into DersiAlır values(22,1004);

insert into DersiAlır values(22,1003);

insert into DersiAlır values(23,1004);

insert into DersiAlır values(23,1002);

insert into DersiAlır values(23,1003);

insert into DersiAlır values(23,1001);

insert into DersiAlır values(24,1006);

insert into DersiAlır values(24,1003);

insert into DersiAlır values(24,1002);

insert into DersiAlır values(25,1005);

insert into DersiAlır values(25,1002);

insert into DersiAlır values(26,1005);

insert into DersiAlır values(26,1003);

insert into DersiAlır values(26,1002);

insert into DersiAlır values(26,1004);

insert into DersiAlır values(26,1001);

insert into DersiAlır values(27,1006);

insert into DersiAlır values(27,1004);

insert into DersiAlır values(27,1002);

insert into DersiAlır values(27,1003);

insert into DersiAlır values(27,1001);

insert into DersiAlır values(28,1003);

insert into DersiAlır values(29,1002);

insert into DersiAlır values(29,1006);

insert into DersiAlır values(29,1005);

insert into DersiAlır values(29,1001);

insert into DersiAlır values(29,1004);

insert into DersiAlır values(30,1005);

insert into DersiAlır values(31,1001);

insert into DersiAlır values(31,1006);

insert into DersiAlır values(31,1002);

insert into DersiAlır values(31,1003);

insert into DersiAlır values(32,1006);

insert into DersiAlır values(32,1005);

insert into DersiAlır values(32,1001);

insert into DersiAlır values(32,1003);

insert into DersiAlır values(33,1001);

insert into DersiAlır values(33,1003);

insert into DersiAlır values(33,1002);

insert into DersiAlır values(33,1004);

insert into DersiAlır values(34,1005);

insert into DersiAlır values(34,1002);

insert into DersiAlır values(34,1006);

insert into DersiAlır values(34,1003);

insert into DersiAlır values(34,1004);

insert into DersiAlır values(35,1003);

insert into DersiAlır values(35,1005);

insert into DersiAlır values(35,1004);

insert into DersiAlır values(35,1001);

insert into DersiAlır values(36,1006);

insert into DersiAlır values(36,1005);

insert into DersiAlır values(37,1004);

insert into DersiAlır values(37,1002);

insert into DersiAlır values(37,1001);

insert into DersiAlır values(38,1006);

insert into DersiAlır values(38,1005);

insert into DersiAlır values(38,1001);

insert into DersiAlır values(38,1004);

insert into DersiAlır values(38,1003);

insert into DersiAlır values(39,1004);

insert into DersiAlır values(39,1005);

insert into DersiAlır values(39,1001);

insert into DersiAlır values(39,1002);

insert into DersiAlır values(39,1003);

insert into DersiAlır values(40,1002);

insert into DersiAlır values(41,1005);

insert into DersiAlır values(41,1003);

insert into DersiAlır values(41,1002);

insert into DersiAlır values(41,1001);

insert into DersiAlır values(41,1004);

insert into DersiAlır values(42,1006);

insert into DersiAlır values(42,1002);

insert into DersiAlır values(43,1006);

insert into DersiAlır values(43,1003);

insert into DersiAlır values(43,1005);

insert into DersiAlır values(44,1006);

insert into DersiAlır values(44,1004);

insert into DersiAlır values(44,1005);

insert into DersiAlır values(44,1001);

insert into DersiAlır values(45,1002);

insert into DersiAlır values(45,1003);

insert into DersiAlır values(45,1001);

insert into DersiAlır values(45,1004);

insert into DersiAlır values(46,1002);

insert into DersiAlır values(46,1004);

insert into DersiAlır values(47,1002);

insert into DersiAlır values(48,1001);

insert into DersiAlır values(48,1002);

insert into DersiAlır values(48,1006);

insert into DersiAlır values(48,1004);

insert into DersiAlır values(49,1003);

insert into DersiAlır values(50,1006);

insert into DersiAlır values(50,1004);

insert into DersiAlır values(50,1001);

insert into DersiAlır values(51,1001);

insert into DersiAlır values(51,1006);

insert into DersiAlır values(52,1002);

insert into DersiAlır values(52,1005);

insert into DersiAlır values(52,1004);

insert into DersiAlır values(53,1002);

insert into DersiAlır values(53,1005);

insert into DersiAlır values(53,1003);

insert into DersiAlır values(53,1004);

insert into DersiAlır values(53,1006);

insert into DersiAlır values(54,1002);

insert into DersiAlır values(54,1003);

insert into DersiAlır values(54,1001);

insert into DersiAlır values(54,1004);

insert into DersiAlır values(54,1005);

insert into DersiAlır values(55,1006);

insert into DersiAlır values(55,1002);

insert into DersiAlır values(55,1001);

insert into DersiAlır values(55,1003);

insert into DersiAlır values(56,1006);

insert into DersiAlır values(56,1004);

insert into DersiAlır values(56,1003);

insert into DersiAlır values(56,1005);

insert into DersiAlır values(57,1006);

insert into DersiAlır values(58,1002);

insert into DersiAlır values(59,1001);

insert into DersiAlır values(59,1004);

insert into DersiAlır values(59,1002);

insert into DersiAlır values(60,1001);

insert into DersiAlır values(60,1002);

insert into DersiAlır values(60,1006);

insert into DersiAlır values(60,1004);

insert into DersiAlır values(61,1002);

insert into DersiAlır values(61,1005);

insert into DersiAlır values(61,1003);

insert into DersiAlır values(61,1004);

insert into DersiAlır values(62,1003);

insert into DersiAlır values(63,1005);

insert into DersiAlır values(63,1003);

insert into DersiAlır values(64,1004);

insert into DersiAlır values(64,1006);

insert into DersiAlır values(64,1005);

insert into DersiAlır values(64,1002);

insert into DersiAlır values(65,1005);

insert into DersiAlır values(65,1002);

insert into DersiAlır values(65,1006);

insert into DersiAlır values(65,1004);

insert into DersiAlır values(66,1006);

insert into DersiAlır values(66,1004);

insert into DersiAlır values(66,1005);

insert into DersiAlır values(66,1003);

insert into DersiAlır values(67,1006);

insert into DersiAlır values(68,1004);

insert into DersiAlır values(68,1002);

insert into DersiAlır values(68,1001);

insert into DersiAlır values(68,1003);

insert into DersiAlır values(68,1005);

insert into DersiAlır values(69,1006);

insert into DersiAlır values(69,1001);

insert into DersiAlır values(69,1002);

insert into DersiAlır values(69,1004);

insert into DersiAlır values(69,1005);

insert into DersiAlır values(70,1006);

insert into DersiAlır values(70,1005);

insert into DersiAlır values(70,1003);

insert into DersiAlır values(71,1006);

insert into DersiAlır values(71,1001);

insert into DersiAlır values(71,1003);

insert into DersiAlır values(71,1004);

insert into DersiAlır values(72,1003);

insert into DersiAlır values(72,1006);

insert into DersiAlır values(73,1001);

insert into DersiAlır values(74,1001);

insert into DersiAlır values(74,1003);

insert into DersiAlır values(75,1004);

insert into DersiAlır values(75,1002);

insert into DersiAlır values(76,1003);

insert into DersiAlır values(76,1002);

insert into DersiAlır values(76,1004);

insert into DersiAlır values(76,1005);

insert into DersiAlır values(77,1004);

insert into DersiAlır values(78,1004);

insert into DersiAlır values(78,1001);

insert into DersiAlır values(78,1003);

insert into DersiAlır values(78,1005);

insert into DersiAlır values(79,1005);

insert into DersiAlır values(79,1001);

insert into DersiAlır values(79,1004);

insert into DersiAlır values(80,1005);

insert into DersiAlır values(81,1001);

insert into DersiAlır values(81,1005);

insert into DersiAlır values(81,1006);

insert into DersiAlır values(81,1002);

insert into DersiAlır values(82,1004);

insert into DersiAlır values(82,1001);

insert into DersiAlır values(82,1002);

insert into DersiAlır values(82,1005);

insert into DersiAlır values(83,1001);

insert into DersiAlır values(83,1003);

insert into DersiAlır values(83,1004);

insert into DersiAlır values(84,1003);

insert into DersiAlır values(85,1004);

insert into DersiAlır values(86,1005);

insert into DersiAlır values(86,1002);

insert into DersiAlır values(87,1001);

insert into DersiAlır values(87,1006);

insert into DersiAlır values(87,1004);

insert into DersiAlır values(87,1005);

insert into DersiAlır values(87,1003);

insert into DersiAlır values(88,1002);

insert into DersiAlır values(88,1004);

insert into DersiAlır values(88,1001);

insert into DersiAlır values(88,1003);

insert into DersiAlır values(88,1006);

insert into DersiAlır values(89,1005);

insert into DersiAlır values(90,1003);

insert into DersiAlır values(90,1005);

insert into DersiAlır values(91,1004);

insert into DersiAlır values(91,1001);

insert into DersiAlır values(91,1006);

insert into DersiAlır values(91,1005);

insert into DersiAlır values(92,1002);

insert into DersiAlır values(92,1004);

insert into DersiAlır values(92,1006);

insert into DersiAlır values(93,1005);

insert into DersiAlır values(93,1006);

insert into DersiAlır values(93,1001);

insert into DersiAlır values(93,1003);

insert into DersiAlır values(93,1004);

insert into DersiAlır values(94,1005);

insert into DersiAlır values(94,1003);

insert into DersiAlır values(94,1002);

insert into DersiAlır values(95,1006);

insert into DersiAlır values(95,1001);

insert into DersiAlır values(95,1005);

insert into DersiAlır values(95,1002);

insert into DersiAlır values(96,1005);

insert into DersiAlır values(97,1003);

insert into DersiAlır values(97,1005);

insert into DersiAlır values(97,1002);

insert into DersiAlır values(97,1001);

insert into DersiAlır values(98,1001);

insert into DersiAlır values(98,1004);

insert into DersiAlır values(98,1002);

insert into DersiAlır values(99,1002);

insert into DersiAlır values(99,1003);

insert into DersiAlır values(100,1002);

insert into DersiAlır values(100,1004);

insert into DersiAlır values(100,1005);

insert into DersiAlır values(100,1006);

insert into DersiAlır values(100,1001);

insert into DersiAlır values(101,1002);

insert into DersiAlır values(101,1003);

insert into DersiAlır values(101,1004);

insert into DersiAlır values(102,1004);

insert into DersiAlır values(102,1002);

insert into DersiAlır values(103,1005);

insert into DersiAlır values(104,1005);

insert into DersiAlır values(105,1004);

insert into DersiAlır values(106,1004);

insert into DersiAlır values(106,1003);

insert into DersiAlır values(106,1001);

insert into DersiAlır values(107,1002);

insert into DersiAlır values(108,1005);

insert into DersiAlır values(109,1002);

insert into DersiAlır values(109,1003);

insert into DersiAlır values(109,1001);

insert into DersiAlır values(109,1004);

insert into DersiAlır values(109,1005);

insert into DersiAlır values(110,1003);

insert into DersiAlır values(110,1002);

insert into DersiAlır values(110,1005);

insert into DersiAlır values(111,1006);

insert into DersiAlır values(112,1003);

insert into DersiAlır values(112,1001);

insert into DersiAlır values(112,1006);

insert into DersiAlır values(112,1004);

insert into DersiAlır values(112,1005);

insert into DersiAlır values(113,1003);

insert into DersiAlır values(113,1005);

insert into DersiAlır values(114,1006);

insert into DersiAlır values(114,1005);

insert into DersiAlır values(114,1004);

insert into DersiAlır values(114,1003);

insert into DersiAlır values(115,1001);

insert into DersiAlır values(115,1006);

insert into DersiAlır values(115,1002);

insert into DersiAlır values(115,1003);

insert into DersiAlır values(116,1003);

insert into DersiAlır values(116,1006);

insert into DersiAlır values(117,1006);

insert into DersiAlır values(117,1004);

insert into DersiAlır values(117,1003);

insert into DersiAlır values(117,1001);

insert into DersiAlır values(118,1001);

insert into DersiAlır values(118,1002);

insert into DersiAlır values(118,1003);

insert into DersiAlır values(119,1003);

insert into DersiAlır values(119,1005);

insert into DersiAlır values(119,1006);

insert into DersiAlır values(120,1002);

insert into DersiAlır values(120,1006);

insert into DersiAlır values(120,1003);

insert into DersiAlır values(120,1001);

insert into DersiAlır values(121,1004);

insert into DersiAlır values(122,1002);

insert into DersiAlır values(123,1001);

insert into DersiAlır values(124,1001);

insert into DersiAlır values(125,1006);

insert into DersiAlır values(125,1005);

insert into DersiAlır values(126,1003);

insert into DersiAlır values(127,1004);

insert into DersiAlır values(127,1006);

insert into DersiAlır values(127,1003);

insert into DersiAlır values(127,1001);

insert into DersiAlır values(127,1005);

insert into DersiAlır values(128,1003);

insert into DersiAlır values(128,1002);

insert into DersiAlır values(129,1006);

insert into DersiAlır values(129,1001);

insert into DersiAlır values(129,1003);

insert into DersiAlır values(130,1003);

insert into DersiAlır values(130,1006);

insert into DersiAlır values(130,1005);

insert into DersiAlır values(130,1001);

insert into DersiAlır values(131,1002);

insert into DersiAlır values(132,1002);

insert into DersiAlır values(132,1004);

insert into DersiAlır values(132,1001);

insert into DersiAlır values(132,1003);

insert into DersiAlır values(132,1006);

insert into DersiAlır values(133,1001);

insert into DersiAlır values(133,1006);

insert into DersiAlır values(134,1006);

insert into DersiAlır values(134,1003);

insert into DersiAlır values(134,1004);

insert into DersiAlır values(135,1003);

insert into DersiAlır values(136,1001);

insert into DersiAlır values(136,1003);

insert into DersiAlır values(136,1002);

insert into DersiAlır values(136,1005);

insert into DersiAlır values(136,1006);

insert into DersiAlır values(137,1002);

insert into DersiAlır values(137,1004);

insert into DersiAlır values(138,1004);

insert into DersiAlır values(138,1005);

insert into DersiAlır values(138,1002);

insert into DersiAlır values(138,1001);

insert into DersiAlır values(138,1003);

insert into DersiAlır values(139,1006);

insert into DersiAlır values(139,1003);

insert into DersiAlır values(140,1005);

insert into DersiAlır values(140,1002);

insert into DersiAlır values(140,1004);

insert into DersiAlır values(141,1003);

insert into DersiAlır values(142,1002);

insert into DersiAlır values(143,1002);

insert into DersiAlır values(143,1006);

insert into DersiAlır values(143,1005);

insert into DersiAlır values(143,1001);

insert into DersiAlır values(143,1004);

insert into DersiAlır values(144,1006);

insert into DersiAlır values(144,1005);

insert into DersiAlır values(144,1004);

insert into DersiAlır values(144,1003);

insert into DersiAlır values(145,1004);

insert into DersiAlır values(145,1001);

insert into DersiAlır values(145,1002);

insert into DersiAlır values(146,1004);

insert into DersiAlır values(146,1006);

insert into DersiAlır values(147,1003);

insert into DersiAlır values(147,1002);

insert into DersiAlır values(147,1006);

insert into DersiAlır values(147,1001);

insert into DersiAlır values(148,1002);

insert into DersiAlır values(149,1003);

insert into DersiAlır values(149,1005);

insert into DersiAlır values(149,1004);

insert into DersiAlır values(149,1002);

insert into DersiAlır values(149,1001);

insert into DersiAlır values(150,1006);

insert into DersiAlır values(150,1003);

insert into DersiAlır values(150,1002);

insert into DersiAlır values(151,1002);

insert into DersiAlır values(151,1006);

insert into DersiAlır values(151,1004);

insert into DersiAlır values(151,1003);

insert into DersiAlır values(152,1001);

insert into DersiAlır values(152,1006);

insert into DersiAlır values(152,1004);

insert into DersiAlır values(153,1006);

insert into DersiAlır values(153,1002);

insert into DersiAlır values(153,1005);

insert into DersiAlır values(154,1006);

insert into DersiAlır values(154,1004);

insert into DersiAlır values(155,1004);

insert into DersiAlır values(155,1005);

insert into DersiAlır values(155,1003);

insert into DersiAlır values(156,1003);

insert into DersiAlır values(156,1006);

insert into DersiAlır values(156,1005);

insert into DersiAlır values(156,1002);

insert into DersiAlır values(157,1003);

insert into DersiAlır values(157,1006);

insert into DersiAlır values(158,1002);

insert into DersiAlır values(159,1002);

insert into DersiAlır values(160,1002);

insert into DersiAlır values(160,1003);

insert into DersiAlır values(160,1006);

insert into DersiAlır values(160,1005);

insert into DersiAlır values(160,1004);

insert into DersiAlır values(161,1003);

insert into DersiAlır values(161,1002);

insert into DersiAlır values(161,1005);

insert into DersiAlır values(161,1001);

insert into DersiAlır values(161,1004);

insert into DersiAlır values(162,1004);

insert into DersiAlır values(162,1005);

insert into DersiAlır values(162,1002);

insert into DersiAlır values(162,1006);

insert into DersiAlır values(163,1006);

insert into DersiAlır values(163,1005);

insert into DersiAlır values(163,1001);

insert into DersiAlır values(163,1004);

insert into DersiAlır values(163,1003);

insert into DersiAlır values(164,1001);

insert into DersiAlır values(165,1004);

insert into DersiAlır values(166,1002);

insert into DersiAlır values(166,1006);

insert into DersiAlır values(166,1003);

insert into DersiAlır values(166,1001);

insert into DersiAlır values(167,1006);

insert into DersiAlır values(167,1002);

insert into DersiAlır values(167,1004);

insert into DersiAlır values(167,1003);

insert into DersiAlır values(168,1001);

insert into DersiAlır values(169,1002);

insert into DersiAlır values(169,1004);

insert into DersiAlır values(169,1005);

insert into DersiAlır values(170,1002);

insert into DersiAlır values(170,1006);

insert into DersiAlır values(171,1006);

insert into DersiAlır values(172,1006);

insert into DersiAlır values(172,1005);

insert into DersiAlır values(172,1002);

insert into DersiAlır values(172,1004);

insert into DersiAlır values(173,1005);

insert into DersiAlır values(173,1003);

insert into DersiAlır values(173,1006);

insert into DersiAlır values(173,1001);

insert into DersiAlır values(174,1003);

insert into DersiAlır values(175,1003);

insert into DersiAlır values(175,1002);

insert into DersiAlır values(175,1005);

insert into DersiAlır values(175,1004);

insert into DersiAlır values(175,1006);

insert into DersiAlır values(176,1002);

insert into DersiAlır values(176,1006);

insert into DersiAlır values(177,1003);

insert into DersiAlır values(177,1004);

insert into DersiAlır values(177,1005);

insert into DersiAlır values(177,1002);

insert into DersiAlır values(178,1002);

insert into DersiAlır values(179,1003);

insert into DersiAlır values(179,1001);

insert into DersiAlır values(179,1004);

insert into DersiAlır values(180,1006);

insert into DersiAlır values(180,1004);

insert into DersiAlır values(180,1005);

insert into DersiAlır values(180,1003);

insert into DersiAlır values(180,1001);

insert into DersiAlır values(181,1002);

insert into DersiAlır values(181,1006);

insert into DersiAlır values(181,1001);

insert into DersiAlır values(181,1004);

insert into DersiAlır values(182,1001);

insert into DersiAlır values(182,1005);

insert into DersiAlır values(183,1004);

insert into DersiAlır values(183,1005);

insert into DersiAlır values(183,1006);

insert into DersiAlır values(183,1002);

insert into DersiAlır values(183,1001);

insert into DersiAlır values(184,1005);

insert into DersiAlır values(184,1001);

insert into DersiAlır values(184,1002);

insert into DersiAlır values(185,1003);

insert into DersiAlır values(185,1005);

insert into DersiAlır values(186,1002);

insert into DersiAlır values(186,1003);

insert into DersiAlır values(186,1001);

insert into DersiAlır values(187,1002);

insert into DersiAlır values(187,1004);

insert into DersiAlır values(188,1006);

insert into DersiAlır values(188,1002);

insert into DersiAlır values(188,1005);

insert into DersiAlır values(188,1001);

insert into DersiAlır values(188,1004);

insert into DersiAlır values(189,1006);

insert into DersiAlır values(189,1001);

insert into DersiAlır values(189,1005);

insert into DersiAlır values(189,1002);

insert into DersiAlır values(189,1004);

insert into DersiAlır values(190,1002);

insert into DersiAlır values(190,1005);

insert into DersiAlır values(190,1003);

insert into DersiAlır values(190,1001);

insert into DersiAlır values(191,1001);

insert into DersiAlır values(192,1003);

insert into DersiAlır values(192,1001);

insert into DersiAlır values(193,1005);

insert into DersiAlır values(193,1003);

insert into DersiAlır values(193,1002);

insert into DersiAlır values(194,1005);

insert into DersiAlır values(194,1002);

insert into DersiAlır values(194,1004);

insert into DersiAlır values(194,1006);

insert into DersiAlır values(195,1005);

insert into DersiAlır values(195,1003);

insert into DersiAlır values(195,1001);

insert into DersiAlır values(196,1004);

insert into DersiAlır values(196,1001);

insert into DersiAlır values(196,1002);

insert into DersiAlır values(197,1003);

insert into DersiAlır values(197,1006);

insert into DersiAlır values(197,1001);

insert into DersiAlır values(197,1005);

insert into DersiAlır values(198,1005);

insert into DersiAlır values(198,1001);

insert into DersiAlır values(198,1006);

insert into DersiAlır values(198,1003);

insert into DersiAlır values(199,1004);

insert into DersiAlır values(199,1006);

insert into DersiAlır values(199,1003);

insert into DersiAlır values(199,1005);

insert into DersiAlır values(199,1001);

insert into DersiAlır values(200,1001);

insert into DersiAlır values(200,1005);

insert into DersiAlır values(200,1003);

insert into DersiAlır values(200,1004);

insert into DersiAlır values(201,1006);

insert into DersiAlır values(201,1003);

insert into DersiAlır values(201,1005);

insert into DersiAlır values(201,1004);

insert into DersiAlır values(201,1001);

insert into DersiAlır values(202,1001);

insert into DersiAlır values(203,1006);

insert into DersiAlır values(204,1001);

insert into DersiAlır values(205,1004);

insert into DersiAlır values(206,1002);

insert into DersiAlır values(206,1006);

insert into DersiAlır values(206,1003);

insert into DersiAlır values(206,1004);

insert into DersiAlır values(206,1005);

insert into DersiAlır values(207,1004);

insert into DersiAlır values(207,1006);

insert into DersiAlır values(207,1005);

insert into DersiAlır values(207,1003);

insert into DersiAlır values(207,1002);

insert into DersiAlır values(208,1004);

insert into DersiAlır values(208,1001);

insert into DersiAlır values(209,1001);

insert into DersiAlır values(209,1005);

insert into DersiAlır values(209,1004);

insert into DersiAlır values(209,1006);

insert into DersiAlır values(210,1003);

insert into DersiAlır values(211,1003);

insert into DersiAlır values(211,1004);

insert into DersiAlır values(212,1004);

insert into DersiAlır values(212,1003);

insert into DersiAlır values(212,1001);

insert into DersiAlır values(212,1002);

insert into DersiAlır values(213,1001);

insert into DersiAlır values(214,1002);

insert into DersiAlır values(214,1003);

insert into DersiAlır values(214,1005);

insert into DersiAlır values(214,1004);

insert into DersiAlır values(214,1006);

insert into DersiAlır values(215,1005);

insert into DersiAlır values(215,1003);

insert into DersiAlır values(215,1001);

insert into DersiAlır values(215,1004);

insert into DersiAlır values(215,1002);

insert into DersiAlır values(216,1006);

insert into DersiAlır values(216,1001);

insert into DersiAlır values(216,1004);

insert into DersiAlır values(216,1003);

insert into DersiAlır values(216,1002);

insert into DersiAlır values(217,1001);

insert into DersiAlır values(217,1002);

insert into DersiAlır values(217,1006);

insert into DersiAlır values(217,1004);

insert into DersiAlır values(217,1005);

insert into DersiAlır values(218,1006);

insert into DersiAlır values(218,1004);

insert into DersiAlır values(218,1001);

insert into DersiAlır values(219,1005);

insert into DersiAlır values(219,1004);

insert into DersiAlır values(219,1002);

insert into DersiAlır values(220,1006);

insert into DersiAlır values(221,1003);

insert into DersiAlır values(221,1004);

insert into DersiAlır values(221,1005);

insert into DersiAlır values(221,1001);

insert into DersiAlır values(221,1002);

insert into DersiAlır values(222,1002);

insert into DersiAlır values(222,1003);

insert into DersiAlır values(222,1006);

insert into DersiAlır values(223,1001);

insert into DersiAlır values(223,1004);

insert into DersiAlır values(223,1003);

insert into DersiAlır values(223,1006);

insert into DersiAlır values(224,1001);

insert into DersiAlır values(224,1005);

insert into DersiAlır values(224,1004);

insert into DersiAlır values(224,1006);

insert into DersiAlır values(225,1005);

insert into DersiAlır values(226,1002);

insert into DersiAlır values(227,1001);

insert into DersiAlır values(227,1003);

insert into DersiAlır values(227,1006);

insert into DersiAlır values(227,1002);

insert into DersiAlır values(227,1004);

insert into DersiAlır values(228,1005);

insert into DersiAlır values(229,1004);

insert into DersiAlır values(230,1004);

insert into DersiAlır values(231,1004);

insert into DersiAlır values(231,1005);

insert into DersiAlır values(231,1003);

insert into DersiAlır values(231,1001);

insert into DersiAlır values(232,1001);

insert into DersiAlır values(232,1005);

insert into DersiAlır values(232,1004);

insert into DersiAlır values(232,1003);

insert into DersiAlır values(232,1006);

insert into DersiAlır values(233,1004);

insert into DersiAlır values(233,1006);

insert into DersiAlır values(233,1003);

insert into DersiAlır values(233,1002);

insert into DersiAlır values(234,1001);

insert into DersiAlır values(235,1004);

insert into DersiAlır values(235,1006);

insert into DersiAlır values(235,1002);

insert into DersiAlır values(235,1001);

insert into DersiAlır values(235,1003);

insert into DersiAlır values(236,1001);

insert into DersiAlır values(236,1004);

insert into DersiAlır values(236,1002);

insert into DersiAlır values(237,1005);

insert into DersiAlır values(237,1003);

insert into DersiAlır values(237,1002);

insert into DersiAlır values(238,1005);

insert into DersiAlır values(238,1001);

insert into DersiAlır values(238,1006);

insert into DersiAlır values(239,1002);

insert into DersiAlır values(239,1003);

insert into DersiAlır values(239,1005);

insert into DersiAlır values(239,1006);

insert into DersiAlır values(239,1001);

insert into DersiAlır values(240,1001);

insert into DersiAlır values(240,1006);

insert into DersiAlır values(240,1002);

insert into DersiAlır values(241,1004);

insert into DersiAlır values(241,1002);

insert into DersiAlır values(241,1005);

insert into DersiAlır values(241,1006);

insert into DersiAlır values(241,1003);

insert into DersiAlır values(242,1001);

insert into DersiAlır values(242,1005);

insert into DersiAlır values(243,1001);

insert into DersiAlır values(244,1006);

insert into DersiAlır values(244,1002);

insert into DersiAlır values(244,1003);

insert into DersiAlır values(244,1001);

insert into DersiAlır values(244,1004);

insert into DersiAlır values(245,1006);

insert into DersiAlır values(245,1004);

insert into DersiAlır values(245,1003);

insert into DersiAlır values(245,1002);

insert into DersiAlır values(245,1001);

insert into DersiAlır values(246,1003);

insert into DersiAlır values(247,1005);

insert into DersiAlır values(247,1004);

insert into DersiAlır values(247,1003);

insert into DersiAlır values(247,1002);

insert into DersiAlır values(248,1002);

insert into DersiAlır values(249,1001);

insert into DersiAlır values(249,1005);

insert into DersiAlır values(249,1003);

insert into DersiAlır values(249,1002);

insert into DersiAlır values(250,1006);

insert into DersiAlır values(250,1005);

insert into DersiAlır values(250,1002);

insert into DersiAlır values(250,1004);

insert into DersiAlır values(250,1003);

insert into DersiAlır values(251,1006);

insert into DersiAlır values(251,1004);

insert into DersiAlır values(252,1005);

insert into DersiAlır values(252,1002);

insert into DersiAlır values(253,1005);

insert into DersiAlır values(253,1004);

insert into DersiAlır values(253,1003);

insert into DersiAlır values(253,1006);

insert into DersiAlır values(254,1003);

insert into DersiAlır values(254,1002);

insert into DersiAlır values(254,1005);

insert into DersiAlır values(255,1006);

insert into DersiAlır values(255,1005);

insert into DersiAlır values(255,1002);

insert into DersiAlır values(255,1004);

insert into DersiAlır values(256,1002);

insert into DersiAlır values(257,1006);

insert into DersiAlır values(258,1004);

insert into DersiAlır values(259,1001);

insert into DersiAlır values(259,1005);

insert into DersiAlır values(259,1002);

insert into DersiAlır values(259,1006);

insert into DersiAlır values(259,1003);

insert into DersiAlır values(260,1006);

insert into DersiAlır values(260,1003);

insert into DersiAlır values(260,1002);

insert into DersiAlır values(261,1005);

insert into DersiAlır values(261,1004);

insert into DersiAlır values(261,1006);

insert into DersiAlır values(261,1002);

insert into DersiAlır values(262,1001);

insert into DersiAlır values(262,1002);

insert into DersiAlır values(262,1006);

insert into DersiAlır values(262,1003);

insert into DersiAlır values(262,1005);

insert into DersiAlır values(263,1002);

insert into DersiAlır values(263,1001);

insert into DersiAlır values(264,1004);

insert into DersiAlır values(265,1001);

insert into DersiAlır values(265,1006);

insert into DersiAlır values(265,1004);

insert into DersiAlır values(265,1002);

insert into DersiAlır values(266,1004);

insert into DersiAlır values(266,1005);

insert into DersiAlır values(266,1006);

insert into DersiAlır values(266,1002);

insert into DersiAlır values(266,1003);

insert into DersiAlır values(267,1006);

insert into DersiAlır values(267,1001);

insert into DersiAlır values(267,1003);

insert into DersiAlır values(267,1004);

insert into DersiAlır values(268,1004);

insert into DersiAlır values(269,1005);

insert into DersiAlır values(269,1003);

insert into DersiAlır values(269,1001);

insert into DersiAlır values(270,1002);

insert into DersiAlır values(270,1001);

insert into DersiAlır values(270,1004);

insert into DersiAlır values(271,1006);

insert into DersiAlır values(271,1004);

insert into DersiAlır values(271,1001);

insert into DersiAlır values(271,1003);

insert into DersiAlır values(272,1002);

insert into DersiAlır values(272,1005);

insert into DersiAlır values(273,1002);

insert into DersiAlır values(273,1001);

insert into DersiAlır values(273,1005);

insert into DersiAlır values(273,1006);

insert into DersiAlır values(273,1004);

insert into DersiAlır values(274,1002);

insert into DersiAlır values(275,1001);

insert into DersiAlır values(275,1003);

insert into DersiAlır values(275,1005);

insert into DersiAlır values(275,1004);

insert into DersiAlır values(275,1006);

insert into DersiAlır values(276,1006);

insert into DersiAlır values(276,1001);

insert into DersiAlır values(276,1005);

insert into DersiAlır values(276,1004);

insert into DersiAlır values(277,1004);

insert into DersiAlır values(277,1001);

insert into DersiAlır values(278,1006);

insert into DersiAlır values(278,1003);

insert into DersiAlır values(278,1001);

insert into DersiAlır values(278,1002);

insert into DersiAlır values(279,1001);

insert into DersiAlır values(280,1006);

insert into DersiAlır values(280,1003);

insert into DersiAlır values(281,1006);

insert into DersiAlır values(281,1004);

insert into DersiAlır values(281,1001);

insert into DersiAlır values(282,1002);

insert into DersiAlır values(283,1003);

insert into DersiAlır values(284,1004);

insert into DersiAlır values(284,1003);

insert into DersiAlır values(284,1005);

insert into DersiAlır values(284,1006);

insert into DersiAlır values(284,1002);

insert into DersiAlır values(285,1005);

insert into DersiAlır values(286,1004);

insert into DersiAlır values(286,1005);

insert into DersiAlır values(286,1002);

insert into DersiAlır values(286,1001);

insert into DersiAlır values(286,1003);

insert into DersiAlır values(287,1006);

insert into DersiAlır values(287,1004);

insert into DersiAlır values(287,1002);

insert into DersiAlır values(287,1003);

insert into DersiAlır values(287,1001);

insert into DersiAlır values(288,1003);

insert into DersiAlır values(288,1002);

insert into DersiAlır values(288,1006);

insert into DersiAlır values(288,1001);

insert into DersiAlır values(288,1004);

insert into DersiAlır values(289,1004);

insert into DersiAlır values(289,1002);

insert into DersiAlır values(289,1003);

insert into DersiAlır values(289,1005);

insert into DersiAlır values(289,1006);

insert into DersiAlır values(290,1004);

insert into DersiAlır values(290,1001);

insert into DersiAlır values(290,1006);

insert into DersiAlır values(290,1003);

insert into DersiAlır values(291,1001);

insert into DersiAlır values(291,1002);

insert into DersiAlır values(291,1004);

insert into DersiAlır values(291,1006);

insert into DersiAlır values(292,1002);

insert into DersiAlır values(292,1001);

insert into DersiAlır values(292,1006);

insert into DersiAlır values(293,1002);

insert into DersiAlır values(293,1001);

insert into DersiAlır values(294,1006);

insert into DersiAlır values(294,1003);

insert into DersiAlır values(294,1001);

insert into DersiAlır values(294,1002);

insert into DersiAlır values(295,1001);

insert into DersiAlır values(295,1002);

insert into DersiAlır values(295,1006);

insert into DersiAlır values(295,1003);

insert into DersiAlır values(295,1005);

insert into DersiAlır values(296,1002);

insert into DersiAlır values(296,1003);

insert into DersiAlır values(296,1001);

insert into DersiAlır values(297,1005);

insert into DersiAlır values(297,1002);

insert into DersiAlır values(297,1004);

insert into DersiAlır values(297,1003);

insert into DersiAlır values(297,1006);

insert into DersiAlır values(298,1001);

insert into DersiAlır values(299,1005);

insert into DersiAlır values(299,1003);

insert into DersiAlır values(299,1004);

insert into DersiAlır values(299,1001);

insert into DersiAlır values(300,1006);

insert into DersiAlır values(300,1004);

insert into DersiAlır values(300,1001);

insert into DersiAlır values(301,1003);

insert into DersiAlır values(301,1006);

insert into DersiAlır values(301,1002);

insert into DersiAlır values(301,1004);

insert into DersiAlır values(302,1003);

insert into DersiAlır values(302,1005);

insert into DersiAlır values(302,1002);

insert into DersiAlır values(302,1006);

insert into DersiAlır values(302,1004);

insert into DersiAlır values(303,1004);

insert into DersiAlır values(304,1005);

insert into DersiAlır values(304,1004);

insert into DersiAlır values(304,1006);

insert into DersiAlır values(305,1003);

insert into DersiAlır values(305,1005);

insert into DersiAlır values(305,1001);

insert into DersiAlır values(305,1004);

insert into DersiAlır values(305,1006);

insert into DersiAlır values(306,1005);

insert into DersiAlır values(306,1006);

insert into DersiAlır values(306,1004);

insert into DersiAlır values(306,1002);

insert into DersiAlır values(307,1002);

insert into DersiAlır values(307,1001);

insert into DersiAlır values(307,1005);

insert into DersiAlır values(307,1003);

insert into DersiAlır values(308,1001);

insert into DersiAlır values(309,1005);

insert into DersiAlır values(309,1006);

insert into DersiAlır values(309,1002);

insert into DersiAlır values(310,1002);

insert into DersiAlır values(310,1006);

insert into DersiAlır values(310,1003);

insert into DersiAlır values(311,1004);

insert into DersiAlır values(311,1003);

insert into DersiAlır values(311,1002);

insert into DersiAlır values(311,1005);

insert into DersiAlır values(312,1006);

insert into DersiAlır values(312,1001);

insert into DersiAlır values(312,1002);

insert into DersiAlır values(312,1005);

insert into DersiAlır values(312,1004);

insert into DersiAlır values(313,1004);

insert into DersiAlır values(313,1003);

insert into DersiAlır values(313,1002);

insert into DersiAlır values(313,1005);

insert into DersiAlır values(314,1006);

insert into DersiAlır values(314,1004);

insert into DersiAlır values(314,1003);

insert into DersiAlır values(315,1002);

insert into DersiAlır values(315,1003);

insert into DersiAlır values(316,1003);

insert into DersiAlır values(316,1004);

insert into DersiAlır values(316,1005);

insert into DersiAlır values(317,1002);

insert into DersiAlır values(317,1006);

insert into DersiAlır values(317,1004);

insert into DersiAlır values(317,1003);

insert into DersiAlır values(318,1005);

insert into DersiAlır values(318,1006);

insert into DersiAlır values(318,1001);

insert into DersiAlır values(319,1001);

insert into DersiAlır values(320,1002);

insert into DersiAlır values(321,1006);

insert into DersiAlır values(321,1002);

insert into DersiAlır values(321,1001);

insert into DersiAlır values(322,1003);

insert into DersiAlır values(323,1004);

insert into DersiAlır values(324,1001);

insert into DersiAlır values(324,1005);

insert into DersiAlır values(324,1004);

insert into DersiAlır values(325,1003);

insert into DersiAlır values(325,1002);

insert into DersiAlır values(326,1003);

insert into DersiAlır values(326,1001);

insert into DersiAlır values(326,1002);

insert into DersiAlır values(326,1005);

insert into DersiAlır values(326,1004);

insert into DersiAlır values(327,1003);

insert into DersiAlır values(327,1004);

insert into DersiAlır values(327,1006);

insert into DersiAlır values(328,1006);

insert into DersiAlır values(328,1003);

insert into DersiAlır values(328,1001);

insert into DersiAlır values(328,1004);

insert into DersiAlır values(328,1002);

insert into DersiAlır values(329,1006);

insert into DersiAlır values(329,1004);

insert into DersiAlır values(329,1002);

insert into DersiAlır values(329,1005);

insert into DersiAlır values(329,1003);

insert into DersiAlır values(330,1001);

insert into DersiAlır values(330,1005);

insert into DersiAlır values(330,1002);

insert into DersiAlır values(330,1003);

insert into DersiAlır values(330,1004);

insert into DersiAlır values(331,1001);

insert into DersiAlır values(331,1004);

insert into DersiAlır values(331,1002);

insert into DersiAlır values(331,1005);

insert into DersiAlır values(332,1004);

insert into DersiAlır values(332,1005);

insert into DersiAlır values(332,1002);

insert into DersiAlır values(332,1003);

insert into DersiAlır values(332,1001);

insert into DersiAlır values(333,1005);

insert into DersiAlır values(333,1002);

insert into DersiAlır values(333,1003);

insert into DersiAlır values(333,1001);

insert into DersiAlır values(334,1002);

insert into DersiAlır values(334,1001);

insert into DersiAlır values(335,1006);

insert into DersiAlır values(336,1005);

insert into DersiAlır values(337,1005);

insert into DersiAlır values(337,1002);

insert into DersiAlır values(337,1001);

insert into DersiAlır values(337,1004);

insert into DersiAlır values(338,1005);

insert into DersiAlır values(338,1004);

insert into DersiAlır values(338,1002);

insert into DersiAlır values(338,1003);

insert into DersiAlır values(338,1006);

insert into DersiAlır values(339,1002);

insert into DersiAlır values(340,1005);

insert into DersiAlır values(341,1002);

insert into DersiAlır values(341,1006);

insert into DersiAlır values(342,1006);

insert into DersiAlır values(342,1005);

insert into DersiAlır values(342,1001);

insert into DersiAlır values(343,1001);

insert into DersiAlır values(343,1003);

insert into DersiAlır values(343,1002);

insert into DersiAlır values(343,1004);

insert into DersiAlır values(344,1006);

insert into DersiAlır values(344,1004);

insert into DersiAlır values(344,1001);

insert into DersiAlır values(345,1006);

insert into DersiAlır values(345,1002);

insert into DersiAlır values(345,1003);

insert into DersiAlır values(345,1004);

insert into DersiAlır values(346,1003);

insert into DersiAlır values(346,1002);

insert into DersiAlır values(346,1004);

insert into DersiAlır values(347,1005);

insert into DersiAlır values(347,1002);

insert into DersiAlır values(348,1006);

insert into DersiAlır values(348,1005);

insert into DersiAlır values(348,1001);

insert into DersiAlır values(349,1004);

insert into DersiAlır values(350,1004);

insert into DersiAlır values(350,1005);

insert into DersiAlır values(350,1006);

insert into DersiAlır values(350,1003);

insert into DersiAlır values(351,1005);

insert into DersiAlır values(351,1006);

insert into DersiAlır values(351,1002);

insert into DersiAlır values(351,1003);

insert into DersiAlır values(352,1004);

insert into DersiAlır values(352,1003);

insert into DersiAlır values(352,1002);

insert into DersiAlır values(352,1005);

insert into DersiAlır values(353,1004);

insert into DersiAlır values(353,1002);

insert into DersiAlır values(353,1006);

insert into DersiAlır values(353,1001);

insert into DersiAlır values(354,1003);

insert into DersiAlır values(354,1005);

insert into DersiAlır values(354,1001);

insert into DersiAlır values(355,1005);

insert into DersiAlır values(355,1006);

insert into DersiAlır values(355,1003);

insert into DersiAlır values(355,1001);

insert into DersiAlır values(356,1003);

insert into DersiAlır values(357,1002);

insert into DersiAlır values(358,1001);

insert into DersiAlır values(359,1002);

insert into DersiAlır values(360,1002);

insert into DersiAlır values(360,1005);

insert into DersiAlır values(361,1005);

insert into DersiAlır values(361,1002);

insert into DersiAlır values(361,1006);

insert into DersiAlır values(361,1003);

insert into DersiAlır values(362,1006);

insert into DersiAlır values(362,1002);

insert into DersiAlır values(363,1002);

insert into DersiAlır values(364,1005);

insert into DersiAlır values(364,1002);

insert into DersiAlır values(364,1003);

insert into DersiAlır values(364,1004);

insert into DersiAlır values(365,1001);

insert into DersiAlır values(365,1004);

insert into DersiAlır values(366,1001);

insert into DersiAlır values(366,1003);

insert into DersiAlır values(366,1006);

insert into DersiAlır values(366,1004);

insert into DersiAlır values(366,1002);

insert into DersiAlır values(367,1001);

insert into DersiAlır values(367,1003);

insert into DersiAlır values(367,1002);

insert into DersiAlır values(367,1006);

insert into DersiAlır values(367,1005);

insert into DersiAlır values(368,1006);

insert into DersiAlır values(368,1002);

insert into DersiAlır values(368,1005);

insert into DersiAlır values(368,1004);

insert into DersiAlır values(369,1003);

insert into DersiAlır values(369,1002);

insert into DersiAlır values(370,1005);

insert into DersiAlır values(370,1006);

insert into DersiAlır values(370,1004);

insert into DersiAlır values(370,1003);

insert into DersiAlır values(371,1006);

insert into DersiAlır values(371,1002);

insert into DersiAlır values(371,1003);

insert into DersiAlır values(371,1001);

insert into DersiAlır values(371,1005);

insert into DersiAlır values(372,1004);

insert into DersiAlır values(372,1003);

insert into DersiAlır values(372,1001);

insert into DersiAlır values(372,1002);

insert into DersiAlır values(372,1005);

insert into DersiAlır values(373,1001);

insert into DersiAlır values(374,1006);

insert into DersiAlır values(374,1004);

insert into DersiAlır values(374,1002);

insert into DersiAlır values(375,1004);

insert into DersiAlır values(375,1001);

insert into DersiAlır values(375,1005);

insert into DersiAlır values(376,1003);

insert into DersiAlır values(376,1006);

insert into DersiAlır values(376,1001);

insert into DersiAlır values(376,1005);

insert into DersiAlır values(377,1006);

insert into DersiAlır values(377,1004);

insert into DersiAlır values(377,1002);

insert into DersiAlır values(377,1005);

insert into DersiAlır values(377,1003);

insert into DersiAlır values(378,1006);

insert into DersiAlır values(378,1002);

insert into DersiAlır values(378,1004);

insert into DersiAlır values(378,1003);

insert into DersiAlır values(378,1005);

insert into DersiAlır values(379,1006);

insert into DersiAlır values(379,1001);

insert into DersiAlır values(379,1003);

insert into DersiAlır values(380,1003);

insert into DersiAlır values(380,1006);

insert into DersiAlır values(380,1001);

insert into DersiAlır values(380,1002);

insert into DersiAlır values(380,1005);

insert into DersiAlır values(381,1005);

insert into DersiAlır values(381,1002);

insert into DersiAlır values(381,1006);

insert into DersiAlır values(381,1004);

insert into DersiAlır values(381,1003);

insert into DersiAlır values(382,1002);

insert into DersiAlır values(382,1001);

insert into DersiAlır values(383,1001);

insert into DersiAlır values(383,1006);

insert into DersiAlır values(383,1004);

insert into DersiAlır values(383,1005);

insert into DersiAlır values(384,1003);

insert into DersiAlır values(384,1002);

insert into DersiAlır values(384,1005);

insert into DersiAlır values(385,1004);

insert into DersiAlır values(386,1004);

insert into DersiAlır values(386,1003);

insert into DersiAlır values(387,1002);

insert into DersiAlır values(388,1002);

insert into DersiAlır values(389,1005);

insert into DersiAlır values(390,1005);

insert into DersiAlır values(390,1003);

insert into DersiAlır values(390,1006);

insert into DersiAlır values(390,1004);

insert into DersiAlır values(390,1002);

insert into DersiAlır values(391,1001);

insert into DersiAlır values(391,1003);

insert into DersiAlır values(391,1005);

insert into DersiAlır values(392,1003);

insert into DersiAlır values(393,1003);

insert into DersiAlır values(393,1006);

insert into DersiAlır values(393,1001);

insert into DersiAlır values(394,1004);

insert into DersiAlır values(394,1002);

insert into DersiAlır values(395,1004);

insert into DersiAlır values(396,1001);

insert into DersiAlır values(396,1006);

insert into DersiAlır values(396,1002);

insert into DersiAlır values(397,1004);

insert into DersiAlır values(397,1006);

insert into DersiAlır values(398,1001);

insert into DersiAlır values(398,1005);

insert into DersiAlır values(398,1003);

insert into DersiAlır values(398,1004);

insert into DersiAlır values(398,1002);

insert into DersiAlır values(399,1006);

insert into DersiAlır values(400,1004);

insert into DersiAlır values(400,1006);

insert into DersiAlır values(400,1005);

insert into DersiAlır values(400,1001);

insert into DersiAlır values(401,1001);

insert into DersiAlır values(401,1006);

insert into DersiAlır values(401,1003);

insert into DersiAlır values(402,1005);

insert into DersiAlır values(402,1003);

insert into DersiAlır values(403,1003);

insert into DersiAlır values(403,1005);

insert into DersiAlır values(403,1004);

insert into DersiAlır values(403,1001);

insert into DersiAlır values(404,1001);

insert into DersiAlır values(404,1006);

insert into DersiAlır values(404,1005);

insert into DersiAlır values(404,1004);

insert into DersiAlır values(405,1004);

insert into DersiAlır values(405,1002);

insert into DersiAlır values(406,1001);

insert into DersiAlır values(406,1002);

insert into DersiAlır values(406,1006);

insert into DersiAlır values(407,1001);

insert into DersiAlır values(408,1004);

insert into DersiAlır values(408,1001);

insert into DersiAlır values(409,1002);

insert into DersiAlır values(409,1003);

insert into DersiAlır values(409,1006);

insert into DersiAlır values(409,1004);

insert into DersiAlır values(410,1005);

insert into DersiAlır values(410,1004);

insert into DersiAlır values(410,1001);

insert into DersiAlır values(410,1006);

insert into DersiAlır values(410,1003);

insert into DersiAlır values(411,1001);

insert into DersiAlır values(412,1005);

insert into DersiAlır values(412,1003);

insert into DersiAlır values(413,1005);

insert into DersiAlır values(413,1001);

insert into DersiAlır values(413,1002);

insert into DersiAlır values(414,1006);

insert into DersiAlır values(414,1004);

insert into DersiAlır values(414,1005);

insert into DersiAlır values(414,1003);

insert into DersiAlır values(415,1003);

insert into DersiAlır values(415,1006);

insert into DersiAlır values(415,1001);

insert into DersiAlır values(415,1004);

insert into DersiAlır values(416,1003);

insert into DersiAlır values(416,1001);

insert into DersiAlır values(416,1002);

insert into DersiAlır values(417,1001);

insert into DersiAlır values(417,1005);

insert into DersiAlır values(417,1004);

insert into DersiAlır values(417,1002);

insert into DersiAlır values(417,1006);

insert into DersiAlır values(418,1005);

insert into DersiAlır values(418,1002);

insert into DersiAlır values(418,1006);

insert into DersiAlır values(418,1004);

insert into DersiAlır values(418,1003);

insert into DersiAlır values(419,1005);

insert into DersiAlır values(419,1004);

insert into DersiAlır values(419,1001);

insert into DersiAlır values(420,1003);

insert into DersiAlır values(420,1006);

insert into DersiAlır values(420,1005);

insert into DersiAlır values(420,1002);

insert into DersiAlır values(421,1004);

insert into DersiAlır values(421,1001);

insert into DersiAlır values(422,1003);

insert into DersiAlır values(422,1004);

insert into DersiAlır values(422,1001);

insert into DersiAlır values(422,1002);

insert into DersiAlır values(423,1004);

insert into DersiAlır values(423,1002);

insert into DersiAlır values(424,1001);

insert into DersiAlır values(424,1006);

insert into DersiAlır values(424,1002);

insert into DersiAlır values(424,1003);

insert into DersiAlır values(425,1004);

insert into DersiAlır values(425,1001);

insert into DersiAlır values(425,1003);

insert into DersiAlır values(425,1006);

insert into DersiAlır values(425,1005);

insert into DersiAlır values(426,1003);

insert into DersiAlır values(427,1001);

insert into DersiAlır values(427,1004);

insert into DersiAlır values(427,1005);

insert into DersiAlır values(427,1003);

insert into DersiAlır values(428,1004);

insert into DersiAlır values(429,1002);

insert into DersiAlır values(430,1006);

insert into DersiAlır values(430,1002);

insert into DersiAlır values(431,1004);

insert into DersiAlır values(432,1002);

insert into DersiAlır values(432,1006);

insert into DersiAlır values(432,1003);

insert into DersiAlır values(432,1001);

insert into DersiAlır values(432,1004);

insert into DersiAlır values(433,1001);

insert into DersiAlır values(433,1003);

insert into DersiAlır values(433,1005);

insert into DersiAlır values(434,1002);

insert into DersiAlır values(434,1006);

insert into DersiAlır values(435,1003);

insert into DersiAlır values(435,1002);

insert into DersiAlır values(436,1002);

insert into DersiAlır values(437,1004);

insert into DersiAlır values(437,1005);

insert into DersiAlır values(437,1003);

insert into DersiAlır values(438,1002);

insert into DersiAlır values(438,1006);

insert into DersiAlır values(438,1001);

insert into DersiAlır values(439,1002);

insert into DersiAlır values(439,1006);

insert into DersiAlır values(439,1003);

insert into DersiAlır values(439,1001);

insert into DersiAlır values(440,1002);

insert into DersiAlır values(441,1002);

insert into DersiAlır values(442,1006);

insert into DersiAlır values(442,1001);

insert into DersiAlır values(442,1005);

insert into DersiAlır values(442,1004);

insert into DersiAlır values(443,1004);

insert into DersiAlır values(443,1006);

insert into DersiAlır values(443,1005);

insert into DersiAlır values(443,1003);

insert into DersiAlır values(443,1001);

insert into DersiAlır values(444,1003);

insert into DersiAlır values(444,1005);

insert into DersiAlır values(444,1006);

insert into DersiAlır values(444,1002);

insert into DersiAlır values(445,1001);

insert into DersiAlır values(445,1005);

insert into DersiAlır values(445,1006);

insert into DersiAlır values(445,1003);

insert into DersiAlır values(445,1002);

insert into DersiAlır values(446,1004);

insert into DersiAlır values(446,1003);

insert into DersiAlır values(446,1002);

insert into DersiAlır values(447,1001);

insert into DersiAlır values(447,1002);

insert into DersiAlır values(447,1005);

insert into DersiAlır values(447,1006);

insert into DersiAlır values(447,1004);

insert into DersiAlır values(448,1003);

insert into DersiAlır values(448,1004);

insert into DersiAlır values(448,1006);

insert into DersiAlır values(448,1005);

insert into DersiAlır values(449,1001);

insert into DersiAlır values(449,1002);

insert into DersiAlır values(449,1003);

insert into DersiAlır values(449,1004);

insert into DersiAlır values(450,1003);

insert into DersiAlır values(450,1002);

insert into DersiAlır values(450,1006);

insert into DersiAlır values(450,1005);

insert into DersiAlır values(450,1004);

insert into DersiAlır values(451,1004);

insert into DersiAlır values(451,1006);

insert into DersiAlır values(451,1003);

insert into DersiAlır values(451,1002);

insert into DersiAlır values(452,1001);

insert into DersiAlır values(452,1002);

insert into DersiAlır values(453,1002);

insert into DersiAlır values(454,1004);

insert into DersiAlır values(454,1005);

insert into DersiAlır values(455,1005);

insert into DersiAlır values(455,1001);

insert into DersiAlır values(456,1005);

insert into DersiAlır values(457,1005);

insert into DersiAlır values(457,1002);

insert into DersiAlır values(457,1003);

insert into DersiAlır values(457,1001);

insert into DersiAlır values(458,1003);

insert into DersiAlır values(458,1004);

insert into DersiAlır values(459,1003);

insert into DersiAlır values(460,1003);

insert into DersiAlır values(461,1006);

insert into DersiAlır values(461,1003);

insert into DersiAlır values(461,1002);

insert into DersiAlır values(461,1005);

insert into DersiAlır values(462,1005);

insert into DersiAlır values(462,1003);

insert into DersiAlır values(462,1002);

insert into DersiAlır values(462,1001);

insert into DersiAlır values(462,1006);

insert into DersiAlır values(463,1001);

insert into DersiAlır values(463,1004);

insert into DersiAlır values(463,1002);

insert into DersiAlır values(463,1006);

insert into DersiAlır values(464,1006);

insert into DersiAlır values(464,1005);

insert into DersiAlır values(464,1004);

insert into DersiAlır values(464,1003);

insert into DersiAlır values(465,1006);

insert into DersiAlır values(465,1004);

insert into DersiAlır values(465,1001);

insert into DersiAlır values(465,1003);

insert into DersiAlır values(465,1002);

insert into DersiAlır values(466,1006);

insert into DersiAlır values(467,1005);

insert into DersiAlır values(467,1006);

insert into DersiAlır values(468,1002);

insert into DersiAlır values(468,1004);

insert into DersiAlır values(468,1001);

insert into DersiAlır values(468,1006);

insert into DersiAlır values(469,1006);

insert into DersiAlır values(469,1001);

insert into DersiAlır values(469,1005);

insert into DersiAlır values(470,1006);

insert into DersiAlır values(470,1002);

insert into DersiAlır values(471,1002);

insert into DersiAlır values(471,1004);

insert into DersiAlır values(472,1005);

insert into DersiAlır values(472,1006);

insert into DersiAlır values(472,1001);

insert into DersiAlır values(472,1002);

insert into DersiAlır values(473,1003);

insert into DersiAlır values(473,1002);

insert into DersiAlır values(474,1006);

insert into DersiAlır values(474,1002);

insert into DersiAlır values(474,1001);

insert into DersiAlır values(474,1003);

insert into DersiAlır values(475,1001);

insert into DersiAlır values(475,1006);

insert into DersiAlır values(475,1003);

insert into DersiAlır values(475,1004);

insert into DersiAlır values(476,1002);

insert into DersiAlır values(476,1003);

insert into DersiAlır values(476,1006);

insert into DersiAlır values(476,1001);

insert into DersiAlır values(477,1004);

insert into DersiAlır values(478,1001);

insert into DersiAlır values(479,1005);

insert into DersiAlır values(479,1002);

insert into DersiAlır values(479,1004);

insert into DersiAlır values(480,1001);

insert into DersiAlır values(480,1002);

insert into DersiAlır values(480,1003);

insert into DersiAlır values(480,1004);

insert into DersiAlır values(480,1006);

insert into DersiAlır values(481,1005);

insert into DersiAlır values(481,1002);

insert into DersiAlır values(481,1003);

insert into DersiAlır values(481,1006);

insert into DersiAlır values(481,1004);

insert into DersiAlır values(482,1002);

insert into DersiAlır values(482,1003);

insert into DersiAlır values(482,1006);

insert into DersiAlır values(483,1005);

insert into DersiAlır values(484,1005);

insert into DersiAlır values(485,1001);

insert into DersiAlır values(486,1005);

insert into DersiAlır values(487,1005);

insert into DersiAlır values(487,1002);

insert into DersiAlır values(488,1006);

insert into DersiAlır values(488,1004);

insert into DersiAlır values(488,1003);

insert into DersiAlır values(489,1003);

insert into DersiAlır values(489,1006);

insert into DersiAlır values(489,1002);

insert into DersiAlır values(489,1001);

insert into DersiAlır values(490,1003);

insert into DersiAlır values(490,1006);

insert into DersiAlır values(490,1004);

insert into DersiAlır values(490,1002);

insert into DersiAlır values(491,1003);

insert into DersiAlır values(492,1003);

insert into DersiAlır values(493,1004);

insert into DersiAlır values(494,1003);

insert into DersiAlır values(494,1001);

insert into DersiAlır values(494,1006);

insert into DersiAlır values(494,1002);

insert into DersiAlır values(495,1006);

insert into DersiAlır values(495,1003);

insert into DersiAlır values(495,1004);

insert into DersiAlır values(495,1005);

insert into DersiAlır values(496,1006);

insert into DersiAlır values(497,1003);

insert into DersiAlır values(498,1006);

insert into DersiAlır values(498,1004);

insert into DersiAlır values(498,1002);

insert into DersiAlır values(498,1001);

insert into DersiAlır values(498,1003);

insert into DersiAlır values(499,1006);

insert into DersiAlır values(499,1004);

insert into DersiAlır values(500,1006);

insert into DersiAlır values(500,1004);

insert into DersiAlır values(500,1002);
insert into Veli values(1,'Mehmet','Yılmaz',5306659787,'Mehmet.Yılmaz@hotmail.com');

insert into Veli values(2,'Ayşe','Kaya',5685775987,'Ayşe.Kaya@hotmail.com');

insert into Veli values(3,'Mustafa','Demir',5903750803,'Mustafa.Demir@hotmail.com');

insert into Veli values(4,'Fatma','Şahin',5423125339,'Fatma.Şahin@hotmail.com');

insert into Veli values(5,'Ahmet','Öztürk',5361947273,'Ahmet.Öztürk@hotmail.com');

insert into Veli values(6,'Zeynep','Aydın',5470182115,'Zeynep.Aydın@hotmail.com');

insert into Veli values(7,'Emine','Yıldız',5677956011,'Emine.Yıldız@hotmail.com');

insert into Veli values(8,'Hasan','Erdoğan',5384582885,'Hasan.Erdoğan@hotmail.com');

insert into Veli values(9,'Hüseyin','Aksoy',5403102365,'Hüseyin.Aksoy@hotmail.com');

insert into Veli values(10,'Hatice','Çelik',5484130671,'Hatice.Çelik@hotmail.com');

insert into Veli values(11,'Ali','Tekin',5334240977,'Ali.Tekin@hotmail.com');

insert into Veli values(12,'Sibel','Kılıç',5442089443,'Sibel.Kılıç@hotmail.com');

insert into Veli values(13,'Yusuf','Altun',5349013733,'Yusuf.Altun@hotmail.com');

insert into Veli values(14,'Esra','Aslan',5162385615,'Esra.Aslan@hotmail.com');

insert into Veli values(15,'İsmail','Özdemir',5603720115,'İsmail.Özdemir@hotmail.com');

insert into Veli values(16,'Gamze','Kocaman',5634447261,'Gamze.Kocaman@hotmail.com');

insert into Veli values(17,'Merve','Korkmaz',5580014341,'Merve.Korkmaz@hotmail.com');

insert into Veli values(18,'Burak','Uçar',5618938353,'Burak.Uçar@hotmail.com');

insert into Veli values(19,'Elif','Güler',5766365383,'Elif.Güler@hotmail.com');

insert into Veli values(20,'Onur','Şen',5763595817,'Onur.Şen@hotmail.com');

insert into Veli values(21,'Selim','Ayhan',5648149491,'Selim.Ayhan@hotmail.com');

insert into Veli values(22,'Rabia','Yalın',5370452195,'Rabia.Yalın@hotmail.com');

insert into Veli values(23,'Serkan','Yavuz',5376327153,'Serkan.Yavuz@hotmail.com');

insert into Veli values(24,'Cemre','Kuru',5124182685,'Cemre.Kuru@hotmail.com');

insert into Veli values(25,'Kaan','Yaman',5466737341,'Kaan.Yaman@hotmail.com');

insert into Veli values(26,'Dilara','Çetin',5988523647,'Dilara.Çetin@hotmail.com');

insert into Veli values(27,'Baran','Alp',5176650963,'Baran.Alp@hotmail.com');

insert into Veli values(28,'Nazlı','Yılmazer',5547532525,'Nazlı.Yılmazer@hotmail.com');

insert into Veli values(29,'Onurcan','Bulut',5330622753,'Onurcan.Bulut@hotmail.com');

insert into Veli values(30,'Melis','Koç',5695924633,'Melis.Koç@hotmail.com');

insert into Veli values(31,'İrem','Özkan',5730119659,'İrem.Özkan@hotmail.com');

insert into Veli values(32,'Furkan','Aktaş',5482816601,'Furkan.Aktaş@hotmail.com');

insert into Veli values(33,'Deniz','Oğuz',5542793317,'Deniz.Oğuz@hotmail.com');

insert into Veli values(34,'Ece','Özçelik',5813712309,'Ece.Özçelik@hotmail.com');

insert into Veli values(35,'Burakcan','Kara',5522241357,'Burakcan.Kara@hotmail.com');

insert into Veli values(36,'Damla','Gül',5118191503,'Damla.Gül@hotmail.com');

insert into Veli values(37,'Ferhat','Demirtaş',5912859171,'Ferhat.Demirtaş@hotmail.com');

insert into Veli values(38,'Gizem','Tuncer',5514697541,'Gizem.Tuncer@hotmail.com');

insert into Veli values(39,'Oğuzhan','Tanrıverdi',5390672087,'Oğuzhan.Tanrıverdi@hotmail.com');

insert into Veli values(40,'Cansu','Yücel',5801116347,'Cansu.Yücel@hotmail.com');

insert into Veli values(41,'Serdar','Turan',5876416221,'Serdar.Turan@hotmail.com');

insert into Veli values(42,'Yasemin','Güneş',5603047917,'Yasemin.Güneş@hotmail.com');

insert into Veli values(43,'İbrahim','Gür',5361183751,'İbrahim.Gür@hotmail.com');

insert into Veli values(44,'Duygu','Arslan',5799723501,'Duygu.Arslan@hotmail.com');

insert into Veli values(45,'Kadir','Sağlam',5256880375,'Kadir.Sağlam@hotmail.com');

insert into Veli values(46,'Bengü','Öztürk',5780899349,'Bengü.Öztürk@hotmail.com');

insert into Veli values(47,'Murat','Köse',5188287183,'Murat.Köse@hotmail.com');

insert into Veli values(48,'Berfin','Ekinci',5528687599,'Berfin.Ekinci@hotmail.com');

insert into Veli values(49,'Levent','Taş',5626487861,'Levent.Taş@hotmail.com');

insert into Veli values(50,'Zehra','Eren',5744752077,'Zehra.Eren@hotmail.com');

insert into Veli values(51,'Can','Yıldırım',5515183977,'Can.Yıldırım@hotmail.com');

insert into Veli values(52,'Sude','Özgür',5296363033,'Sude.Özgür@hotmail.com');

insert into Veli values(53,'Orhan','Ateş',5965887889,'Orhan.Ateş@hotmail.com');

insert into Veli values(54,'Büşra','Ay',5240595823,'Büşra.Ay@hotmail.com');

insert into Veli values(55,'Ömer','Şimşek',5274003999,'Ömer.Şimşek@hotmail.com');

insert into Veli values(56,'Selin','Akman',5179377147,'Selin.Akman@hotmail.com');

insert into Veli values(57,'Ahu','Toprak',5877210169,'Ahu.Toprak@hotmail.com');

insert into Veli values(58,'Oktay','Çolak',5633146025,'Oktay.Çolak@hotmail.com');

insert into Veli values(59,'Buse','Türe',5764606043,'Buse.Türe@hotmail.com');

insert into Veli values(60,'Efe','Alkan',5106097191,'Efe.Alkan@hotmail.com');

insert into Veli values(61,'Tuğba','Kurt',5737339785,'Tuğba.Kurt@hotmail.com');

insert into Veli values(62,'Kaan','Ertaş',5419780583,'Kaan.Ertaş@hotmail.com');

insert into Veli values(63,'Şule','Gündüz',5462973601,'Şule.Gündüz@hotmail.com');

insert into Veli values(64,'Tuncay','Er',5168244675,'Tuncay.Er@hotmail.com');

insert into Veli values(65,'Şebnem','Çınar',5796053145,'Şebnem.Çınar@hotmail.com');

insert into Veli values(66,'Eray','Tunç',5664407481,'Eray.Tunç@hotmail.com');

insert into Veli values(67,'Gülşen','Gürsoy',5441865373,'Gülşen.Gürsoy@hotmail.com');

insert into Veli values(68,'Alp','Gürbüz',5852217033,'Alp.Gürbüz@hotmail.com');

insert into Veli values(69,'Beste','Tuncel',5788245847,'Beste.Tuncel@hotmail.com');

insert into Veli values(70,'Serdar','Doğan',5818912431,'Serdar.Doğan@hotmail.com');

insert into Veli values(71,'İlayda','Şahin',5356925553,'İlayda.Şahin@hotmail.com');

insert into Veli values(72,'Burhan','Aydın',5147071771,'Burhan.Aydın@hotmail.com');

insert into Veli values(73,'Sinem','Sarı',5402348589,'Sinem.Sarı@hotmail.com');

insert into Veli values(74,'Batuhan','Atalay',5179932113,'Batuhan.Atalay@hotmail.com');

insert into Veli values(75,'Ayten','Sezer',5117417865,'Ayten.Sezer@hotmail.com');

insert into Veli values(76,'Hakan','Sönmez',5743208659,'Hakan.Sönmez@hotmail.com');

insert into Veli values(77,'Ezgi','Kurtuluş',5369902597,'Ezgi.Kurtuluş@hotmail.com');

insert into Veli values(78,'Cihan','Erkan',5146696861,'Cihan.Erkan@hotmail.com');

insert into Veli values(79,'Özge','Altay',5772986291,'Özge.Altay@hotmail.com');

insert into Veli values(80,'Tarkan','Yurt',5529981471,'Tarkan.Yurt@hotmail.com');

insert into Veli values(81,'Rüya','Karadağ',5384325471,'Rüya.Karadağ@hotmail.com');

insert into Veli values(82,'Tamer','Şeker',5886760059,'Tamer.Şeker@hotmail.com');

insert into Veli values(83,'Sema','Aslan',5235133133,'Sema.Aslan@hotmail.com');

insert into Veli values(84,'Emre','Kılınç',5689796737,'Emre.Kılınç@hotmail.com');

insert into Veli values(85,'Tuğçe','Çavdar',5769363555,'Tuğçe.Çavdar@hotmail.com');

insert into Veli values(86,'Arda','Çam',5313796729,'Arda.Çam@hotmail.com');

insert into Veli values(87,'Ayşegül','Erbil',5409786265,'Ayşegül.Erbil@hotmail.com');

insert into Veli values(88,'Yiğit','Varol',5614413323,'Yiğit.Varol@hotmail.com');

insert into Veli values(89,'Feride','Yüksel',5166178917,'Feride.Yüksel@hotmail.com');

insert into Veli values(90,'Özkan','Doğru',5483307619,'Özkan.Doğru@hotmail.com');

insert into Veli values(91,'Betül','Gönül',5354764849,'Betül.Gönül@hotmail.com');

insert into Veli values(92,'Ferit','Kıran',5505432815,'Ferit.Kıran@hotmail.com');

insert into Veli values(93,'Nurgül','Yavuz',5522841685,'Nurgül.Yavuz@hotmail.com');

insert into Veli values(94,'Emrah','Yılmaz',5725868819,'Emrah.Yılmaz@hotmail.com');

insert into Veli values(95,'Elifnaz','Yalçın',5323484429,'Elifnaz.Yalçın@hotmail.com');

insert into Veli values(96,'Alper','Can',5245504725,'Alper.Can@hotmail.com');

insert into Veli values(97,'Eylül','Yurtsever',5417294467,'Eylül.Yurtsever@hotmail.com');

insert into Veli values(98,'Denizhan','Keleş',5596378963,'Denizhan.Keleş@hotmail.com');

insert into Veli values(99,'Meltem','Bektaş',5950378559,'Meltem.Bektaş@hotmail.com');

insert into Veli values(100,'Caner','Duman',5305985739,'Caner.Duman@hotmail.com');

insert into Veli values(101,'Zara','Duran',5519726325,'Zara.Duran@hotmail.com');

insert into Veli values(102,'Bora','Tekin',5996795467,'Bora.Tekin@hotmail.com');

insert into Veli values(103,'Merve','Yeşil',5905054711,'Merve.Yeşil@hotmail.com');

insert into Veli values(104,'Emrullah','Eren',5226850275,'Emrullah.Eren@hotmail.com');

insert into Veli values(105,'Ceren','Orhan',5507305059,'Ceren.Orhan@hotmail.com');

insert into Veli values(106,'Burcu','Özen',5493455553,'Burcu.Özen@hotmail.com');

insert into Veli values(107,'Kuzey','Bulut',5331512615,'Kuzey.Bulut@hotmail.com');

insert into Veli values(108,'Ayça','Özkan',5371162037,'Ayça.Özkan@hotmail.com');

insert into Veli values(109,'Yasin','Koç',5562245931,'Yasin.Koç@hotmail.com');

insert into Veli values(110,'Simge','Altın',5619786735,'Simge.Altın@hotmail.com');

insert into Veli values(111,'Vedat','Çelik',5307965101,'Vedat.Çelik@hotmail.com');

insert into Veli values(112,'Elvan','Güneş',5205780957,'Elvan.Güneş@hotmail.com');

insert into Veli values(113,'Tolga','Yıldız',5190661025,'Tolga.Yıldız@hotmail.com');

insert into Veli values(114,'Gamze','Doğan',5915922259,'Gamze.Doğan@hotmail.com');

insert into Veli values(115,'Yusufcan','Arı',5602296023,'Yusufcan.Arı@hotmail.com');

insert into Veli values(116,'Beyza','Korkmaz',5342691159,'Beyza.Korkmaz@hotmail.com');

insert into Veli values(117,'Cenk','Kılıç',5126698291,'Cenk.Kılıç@hotmail.com');

insert into Veli values(118,'Elifnur','Aksoy',5824254627,'Elifnur.Aksoy@hotmail.com');

insert into Veli values(119,'Görkem','Demir',5865769423,'Görkem.Demir@hotmail.com');

insert into Veli values(120,'Selcan','Avcı',5635626149,'Selcan.Avcı@hotmail.com');

insert into Veli values(121,'Alp','Akbaş',5537805469,'Alp.Akbaş@hotmail.com');

insert into Veli values(122,'Beril','Kır',5949825113,'Beril.Kır@hotmail.com');

insert into Veli values(123,'Uğur','Kılıç',5204185357,'Uğur.Kılıç@hotmail.com');

insert into Veli values(124,'Yağmur','Akıncı',5575295471,'Yağmur.Akıncı@hotmail.com');

insert into Veli values(125,'Alperen','Kurt',5341697047,'Alperen.Kurt@hotmail.com');

insert into Veli values(126,'Hazal','Kaya',5769099175,'Hazal.Kaya@hotmail.com');

insert into Veli values(127,'Erkan','Öztürk',5542065421,'Erkan.Öztürk@hotmail.com');

insert into Veli values(128,'Naz','Aksu',5588996075,'Naz.Aksu@hotmail.com');

insert into Veli values(129,'Ercan','Ay',5998723513,'Ercan.Ay@hotmail.com');

insert into Veli values(130,'Yasmin','Erdoğan',5582725419,'Yasmin.Erdoğan@hotmail.com');

insert into Veli values(131,'Koray','Yalın',5952217389,'Koray.Yalın@hotmail.com');

insert into Veli values(132,'Aybüke','Şahin',5200862899,'Aybüke.Şahin@hotmail.com');

insert into Veli values(133,'Fatih','Gür',5226389861,'Fatih.Gür@hotmail.com');

insert into Veli values(134,'Sevil','Altun',5322572059,'Sevil.Altun@hotmail.com');

insert into Veli values(135,'Çağlar','Çolak',5963450749,'Çağlar.Çolak@hotmail.com');

insert into Veli values(136,'Damla','Akman',5223462595,'Damla.Akman@hotmail.com');

insert into Veli values(137,'Burçin','Ayhan',5878172713,'Burçin.Ayhan@hotmail.com');

insert into Veli values(138,'Yunus','Tuncer',5157203137,'Yunus.Tuncer@hotmail.com');

insert into Veli values(139,'Melek','Kocaman',5688381575,'Melek.Kocaman@hotmail.com');

insert into Veli values(140,'Oğuz','Kılıç',5885542789,'Oğuz.Kılıç@hotmail.com');

insert into Veli values(141,'Beyzanur','Alp',5329768399,'Beyzanur.Alp@hotmail.com');

insert into Veli values(142,'Volkan','Yılmazer',5264706737,'Volkan.Yılmazer@hotmail.com');

insert into Veli values(143,'Büşra','Kuru',5600432037,'Büşra.Kuru@hotmail.com');

insert into Veli values(144,'Canan','Yaman',5513090607,'Canan.Yaman@hotmail.com');

insert into Veli values(145,'Halit','Koç',5402710993,'Halit.Koç@hotmail.com');

insert into Veli values(146,'Zeliha','Aktaş',5485738319,'Zeliha.Aktaş@hotmail.com');

insert into Veli values(147,'Kağan','Bulut',5421965039,'Kağan.Bulut@hotmail.com');

insert into Veli values(148,'Derya','Yavuz',5979584991,'Derya.Yavuz@hotmail.com');

insert into Veli values(149,'Kaan','Özkan',5611847175,'Kaan.Özkan@hotmail.com');

insert into Veli values(150,'Cemile','Çetin',5268555273,'Cemile.Çetin@hotmail.com');

insert into Veli values(151,'Halilİbrahim','Yıldırım',5883813881,'Halilİbrahim.Yıldırım@hotmail.com');

insert into Veli values(152,'Gözde','Tanrıverdi',5339045449,'Gözde.Tanrıverdi@hotmail.com');

insert into Veli values(153,'Mert','Yücel',5356478553,'Mert.Yücel@hotmail.com');

insert into Veli values(154,'Aydan','Güler',5678566239,'Aydan.Güler@hotmail.com');

insert into Veli values(155,'Ufuk','Tuncer',5690698899,'Ufuk.Tuncer@hotmail.com');

insert into Veli values(156,'Eda','Ayhan',5606818885,'Eda.Ayhan@hotmail.com');

insert into Veli values(157,'Yusuf','Yalın',5897719639,'Yusuf.Yalın@hotmail.com');

insert into Veli values(158,'Yaren','Yavuz',5145107273,'Yaren.Yavuz@hotmail.com');

insert into Veli values(159,'Bilge','Kuru',5163333251,'Bilge.Kuru@hotmail.com');

insert into Veli values(160,'Taylan','Yaman',5780521275,'Taylan.Yaman@hotmail.com');

insert into Veli values(161,'Sena','Çetin',5614601897,'Sena.Çetin@hotmail.com');

insert into Veli values(162,'Ferdi','Alp',5900705045,'Ferdi.Alp@hotmail.com');

insert into Veli values(163,'Selva','Yılmazer',5513097905,'Selva.Yılmazer@hotmail.com');

insert into Veli values(164,'Kaan','Bulut',5549213957,'Kaan.Bulut@hotmail.com');

insert into Veli values(165,'Serap','Aktaş',5487771693,'Serap.Aktaş@hotmail.com');

insert into Veli values(166,'Ege','Koç',5958940221,'Ege.Koç@hotmail.com');

insert into Veli values(167,'Sibel','Yıldırım',5345715041,'Sibel.Yıldırım@hotmail.com');

insert into Veli values(168,'Umut','Tanrıverdi',5819869009,'Umut.Tanrıverdi@hotmail.com');

insert into Veli values(169,'Selin','Yücel',5909600937,'Selin.Yücel@hotmail.com');

insert into Veli values(170,'Mustafa','Tuncer',5372851241,'Mustafa.Tuncer@hotmail.com');

insert into Veli values(171,'Yasemin','Güler',5913307701,'Yasemin.Güler@hotmail.com');

insert into Veli values(172,'Ahmet','Ayhan',5288899769,'Ahmet.Ayhan@hotmail.com');

insert into Veli values(173,'Duygu','Yalın',5620395505,'Duygu.Yalın@hotmail.com');

insert into Veli values(174,'Burak','Yavuz',5272980511,'Burak.Yavuz@hotmail.com');

insert into Veli values(175,'İnci','Kuru',5436064275,'İnci.Kuru@hotmail.com');

insert into Veli values(176,'Cihan','Yaman',5908367303,'Cihan.Yaman@hotmail.com');

insert into Veli values(177,'Gülçin','Çetin',5917505141,'Gülçin.Çetin@hotmail.com');

insert into Veli values(178,'Alp','Alp',5769904835,'Alp.Alp@hotmail.com');

insert into Veli values(179,'Elif','Yılmazer',5635285181,'Elif.Yılmazer@hotmail.com');

insert into Veli values(180,'Kaya','Bulut',5697447961,'Kaya.Bulut@hotmail.com');

insert into Veli values(181,'Zara','Aktaş',5729155789,'Zara.Aktaş@hotmail.com');

insert into Veli values(182,'Berk','Koç',5247407403,'Berk.Koç@hotmail.com');

insert into Veli values(183,'Bengü','Yıldırım',5657945907,'Bengü.Yıldırım@hotmail.com');

insert into Veli values(184,'Onur','Tanrıverdi',5223111499,'Onur.Tanrıverdi@hotmail.com');

insert into Veli values(185,'Ece','Yücel',5461915667,'Ece.Yücel@hotmail.com');

insert into Veli values(186,'Mehmet','Güler',5245789155,'Mehmet.Güler@hotmail.com');

insert into Veli values(187,'Gülşah','Ayhan',5276409445,'Gülşah.Ayhan@hotmail.com');

insert into Veli values(188,'Can','Yalın',5692127787,'Can.Yalın@hotmail.com');

insert into Veli values(189,'Damla','Yavuz',5470688619,'Damla.Yavuz@hotmail.com');

insert into Veli values(190,'Özkan','Kuru',5857250387,'Özkan.Kuru@hotmail.com');

insert into Veli values(191,'Betül','Yaman',5624493071,'Betül.Yaman@hotmail.com');

insert into Veli values(192,'Ferit','Çetin',5648492657,'Ferit.Çetin@hotmail.com');

insert into Veli values(193,'Nurgül','Alp',5547749375,'Nurgül.Alp@hotmail.com');

insert into Veli values(194,'Emrah','Yılmazer',5777993577,'Emrah.Yılmazer@hotmail.com');

insert into Veli values(195,'Elifnaz','Bulut',5642377877,'Elifnaz.Bulut@hotmail.com');

insert into Veli values(196,'Alper','Aktaş',5775811603,'Alper.Aktaş@hotmail.com');

insert into Veli values(197,'Eylül','Koç',5218354197,'Eylül.Koç@hotmail.com');

insert into Veli values(198,'Denizhan','Yıldırım',5783503783,'Denizhan.Yıldırım@hotmail.com');

insert into Veli values(199,'Meltem','Tanrıverdi',5447338635,'Meltem.Tanrıverdi@hotmail.com');

insert into Veli values(200,'Caner','Yücel',5469884901,'Caner.Yücel@hotmail.com');

insert into Veli values(201,'Zara','Güler',5959725233,'Zara.Güler@hotmail.com');

insert into Veli values(202,'Bora','Ayhan',5493228603,'Bora.Ayhan@hotmail.com');

insert into Veli values(203,'Merve','Yalın',5720514571,'Merve.Yalın@hotmail.com');

insert into Veli values(204,'Emrullah','Yavuz',5351473137,'Emrullah.Yavuz@hotmail.com');

insert into Veli values(205,'Ceren','Kuru',5851140487,'Ceren.Kuru@hotmail.com');

insert into Veli values(206,'Burcu','Yaman',5931584805,'Burcu.Yaman@hotmail.com');

insert into Veli values(207,'Kuzey','Çetin',5411185895,'Kuzey.Çetin@hotmail.com');

insert into Veli values(208,'Ayça','Alp',5674087117,'Ayça.Alp@hotmail.com');

insert into Veli values(209,'Yasin','Yılmazer',5967396019,'Yasin.Yılmazer@hotmail.com');

insert into Veli values(210,'Simge','Bulut',5512795537,'Simge.Bulut@hotmail.com');

insert into Veli values(211,'Vedat','Aktaş',5490523513,'Vedat.Aktaş@hotmail.com');

insert into Veli values(212,'Elvan','Koç',5279704859,'Elvan.Koç@hotmail.com');

insert into Veli values(213,'Tolga','Yıldırım',5237340675,'Tolga.Yıldırım@hotmail.com');

insert into Veli values(214,'Gamze','Tanrıverdi',5150004677,'Gamze.Tanrıverdi@hotmail.com');

insert into Veli values(215,'Yusufcan','Yücel',5588602023,'Yusufcan.Yücel@hotmail.com');

insert into Veli values(216,'Beyza','Güler',5355763941,'Beyza.Güler@hotmail.com');

insert into Veli values(217,'Cenk','Ayhan',5907740045,'Cenk.Ayhan@hotmail.com');

insert into Veli values(218,'Elifnur','Yalın',5110955167,'Elifnur.Yalın@hotmail.com');

insert into Veli values(219,'Görkem','Yavuz',5170813989,'Görkem.Yavuz@hotmail.com');

insert into Veli values(220,'Selcan','Kuru',5225984099,'Selcan.Kuru@hotmail.com');

insert into Veli values(221,'Alp','Yaman',5667766661,'Alp.Yaman@hotmail.com');

insert into Veli values(222,'Beril','Çetin',5281523783,'Beril.Çetin@hotmail.com');

insert into Veli values(223,'Uğur','Alp',5537090187,'Uğur.Alp@hotmail.com');

insert into Veli values(224,'Yağmur','Yılmazer',5495576059,'Yağmur.Yılmazer@hotmail.com');

insert into Veli values(225,'Alperen','Bulut',5517035983,'Alperen.Bulut@hotmail.com');

insert into Veli values(226,'Hazal','Aktaş',5142396321,'Hazal.Aktaş@hotmail.com');

insert into Veli values(227,'Erkan','Koç',5646204015,'Erkan.Koç@hotmail.com');

insert into Veli values(228,'Naz','Yıldırım',5209479949,'Naz.Yıldırım@hotmail.com');

insert into Veli values(229,'Ercan','Tanrıverdi',5527306411,'Ercan.Tanrıverdi@hotmail.com');

insert into Veli values(230,'Yasmin','Yücel',5618378241,'Yasmin.Yücel@hotmail.com');

insert into Veli values(231,'Koray','Güler',5940008785,'Koray.Güler@hotmail.com');

insert into Veli values(232,'Aybüke','Ayhan',5360695409,'Aybüke.Ayhan@hotmail.com');

insert into Veli values(233,'Fatih','Yalın',5102467451,'Fatih.Yalın@hotmail.com');

insert into Veli values(234,'Sevil','Yavuz',5187225661,'Sevil.Yavuz@hotmail.com');

insert into Veli values(235,'Çağlar','Kuru',5853861261,'Çağlar.Kuru@hotmail.com');

insert into Veli values(236,'Damla','Yaman',5321037619,'Damla.Akman@hotmail.com');

insert into Veli values(237,'Burçin','Çetin',5473742285,'Burçin.Çetin@hotmail.com');

insert into Veli values(238,'Yunus','Alp',5794089769,'Yunus.Alp@hotmail.com');

insert into Veli values(239,'Melek','Yılmazer',5700269725,'Melek.Yılmazer@hotmail.com');

insert into Veli values(240,'Oğuz','Bulut',5703844055,'Oğuz.Bulut@hotmail.com');

insert into Veli values(241,'Beyzanur','Aktaş',5697991145,'Beyzanur.Aktaş@hotmail.com');

insert into Veli values(242,'Volkan','Koç',5921473323,'Volkan.Koç@hotmail.com');

insert into Veli values(243,'Büşra','Yıldırım',5423921951,'Büşra.Yıldırım@hotmail.com');

insert into Veli values(244,'Canan','Tanrıverdi',5702536887,'Canan.Tanrıverdi@hotmail.com');

insert into Veli values(245,'Halit','Yücel',5685721337,'Halit.Yücel@hotmail.com');

insert into Veli values(246,'Zeliha','Güler',5292015957,'Zeliha.Güler@hotmail.com');

insert into Veli values(247,'Kağan','Ayhan',5832373341,'Kağan.Ayhan@hotmail.com');

insert into Veli values(248,'Derya','Yalın',5601343693,'Derya.Yalın@hotmail.com');

insert into Veli values(249,'Kaan','Yavuz',5484694267,'Kaan.Yavuz@hotmail.com');

insert into Veli values(250,'Cemile','Kuru',5806848081,'Cemile.Kuru@hotmail.com');

insert into Veli values(251,'Halilİbrahim','Yaman',5121752177,'Halilİbrahim.Yaman@hotmail.com');

insert into Veli values(252,'Gözde','Çetin',5237597449,'Gözde.Çetin@hotmail.com');

insert into Veli values(253,'Mert','Alp',5526936459,'Mert.Alp@hotmail.com');

insert into Veli values(254,'Aydan','Yılmazer',5447210371,'Aydan.Yılmazer@hotmail.com');

insert into Veli values(255,'Ufuk','Bulut',5661830329,'Ufuk.Bulut@hotmail.com');

insert into Veli values(256,'Eda','Aktaş',5483242307,'Eda.Aktaş@hotmail.com');

insert into Veli values(257,'Yusuf','Koç',5695104721,'Yusuf.Koç@hotmail.com');

insert into Veli values(258,'Yaren','Yıldırım',5929985325,'Yaren.Yıldırım@hotmail.com');

insert into Veli values(259,'Bilge','Tanrıverdi',5873972297,'Bilge.Tanrıverdi@hotmail.com');

insert into Veli values(260,'Taylan','Yücel',5559889211,'Taylan.Yücel@hotmail.com');

insert into Veli values(261,'Sena','Güler',5574901009,'Sena.Güler@hotmail.com');

insert into Veli values(262,'Ferdi','Ayhan',5433299261,'Ferdi.Ayhan@hotmail.com');

insert into Veli values(263,'Selva','Yalın',5928182417,'Selva.Yalın@hotmail.com');

insert into Veli values(264,'Kaan','Yavuz',5767527635,'Kaan.Yavuz@hotmail.com');

insert into Veli values(265,'Serap','Kuru',5797518933,'Serap.Kuru@hotmail.com');

insert into Veli values(266,'Ege','Yaman',5574221499,'Ege.Yaman@hotmail.com');

insert into Veli values(267,'Sibel','Çetin',5251707023,'Sibel.Çetin@hotmail.com');

insert into Veli values(268,'Umut','Alp',5121330067,'Umut.Alp@hotmail.com');

insert into Veli values(269,'Selin','Yılmazer',5647623849,'Selin.Yılmazer@hotmail.com');

insert into Veli values(270,'Mustafa','Bulut',5107437937,'Mustafa.Bulut@hotmail.com');

insert into Veli values(271,'Yasemin','Aktaş',5377138863,'Yasemin.Aktaş@hotmail.com');

insert into Veli values(272,'Ahmet','Koç',5723282537,'Ahmet.Koç@hotmail.com');

insert into Veli values(273,'Duygu','Yıldırım',5629501155,'Duygu.Yıldırım@hotmail.com');

insert into Veli values(274,'Burak','Tanrıverdi',5470494909,'Burak.Tanrıverdi@hotmail.com');

insert into Veli values(275,'İnci','Yücel',5304134745,'İnci.Yücel@hotmail.com');

insert into Veli values(276,'Cihan','Güler',5977596119,'Cihan.Güler@hotmail.com');

insert into Veli values(277,'Gülçin','Ayhan',5162950941,'Gülçin.Ayhan@hotmail.com');

insert into Veli values(278,'Alp','Yalın',5890046703,'Alp.Yalın@hotmail.com');

insert into Veli values(279,'Elif','Yavuz',5150570935,'Elif.Yavuz@hotmail.com');

insert into Veli values(280,'Kaya','Kuru',5139050531,'Kaya.Kuru@hotmail.com');

insert into Veli values(281,'Zara','Yaman',5425469555,'Zara.Yaman@hotmail.com');

insert into Veli values(282,'Berk','Çetin',5793706753,'Berk.Çetin@hotmail.com');

insert into Veli values(283,'Bengü','Alp',5341767113,'Bengü.Alp@hotmail.com');

insert into Veli values(284,'Onur','Yılmazer',5283336751,'Onur.Yılmazer@hotmail.com');

insert into Veli values(285,'Ece','Bulut',5542448241,'Ece.Bulut@hotmail.com');

insert into Veli values(286,'Mehmet','Aktaş',5810271855,'Mehmet.Aktaş@hotmail.com');

insert into Veli values(287,'Gülşah','Koç',5525438405,'Gülşah.Koç@hotmail.com');

insert into Veli values(288,'Can','Yıldırım',5340408673,'Can.Yıldırım@hotmail.com');

insert into Veli values(289,'Damla','Tanrıverdi',5725197341,'Damla.Tanrıverdi@hotmail.com');

insert into Veli values(290,'Özkan','Yücel',5843054839,'Özkan.Yücel@hotmail.com');

insert into Veli values(291,'Betül','Güler',5742631671,'Betül.Güler@hotmail.com');

insert into Veli values(292,'Ferit','Ayhan',5200271631,'Ferit.Ayhan@hotmail.com');

insert into Veli values(293,'Nurgül','Yalın',5104947691,'Nurgül.Yalın@hotmail.com');

insert into Veli values(294,'Emrah','Yavuz',5757930175,'Emrah.Yavuz@hotmail.com');

insert into Veli values(295,'Elifnaz','Kuru',5278528219,'Elifnaz.Kuru@hotmail.com');

insert into Veli values(296,'Alper','Yaman',5151094725,'Alper.Yaman@hotmail.com');

insert into Veli values(297,'Eylül','Çetin',5900164873,'Eylül.Çetin@hotmail.com');

insert into Veli values(298,'Denizhan','Alp',5704744663,'Denizhan.Alp@hotmail.com');

insert into Veli values(299,'Meltem','Yılmazer',5684347293,'Meltem.Yılmazer@hotmail.com');

insert into Veli values(300,'Caner','Bulut',5172162413,'Caner.Bulut@hotmail.com');

insert into Veli values(301,'Zara','Aktaş',5886824941,'Zara.Aktaş@hotmail.com');

insert into Veli values(302,'Bora','Koç',5105745433,'Bora.Koç@hotmail.com');

insert into Veli values(303,'Merve','Yıldırım',5281347169,'Merve.Yıldırım@hotmail.com');

insert into Veli values(304,'Emrullah','Tanrıverdi',5208263383,'Emrullah.Tanrıverdi@hotmail.com');

insert into Veli values(305,'Ceren','Yücel',5286099779,'Ceren.Yücel@hotmail.com');

insert into Veli values(306,'Burcu','Güler',5115754789,'Burcu.Güler@hotmail.com');

insert into Veli values(307,'Kuzey','Ayhan',5843705489,'Kuzey.Ayhan@hotmail.com');

insert into Veli values(308,'Ayça','Yalın',5859932773,'Ayça.Yalın@hotmail.com');

insert into Veli values(309,'Yasin','Yavuz',5768649313,'Yasin.Tanrıverdi@hotmail.com');

insert into Veli values(310,'Simge','Kuru',5180265271,'Simge.Kuru@hotmail.com');

insert into Veli values(311,'Vedat','Yaman',5472180241,'Vedat.Yaman@hotmail.com');

insert into Veli values(312,'Elvan','Çetin',5120527777,'Elvan.Çetin@hotmail.com');

insert into Veli values(313,'Tolga','Alp',5745985829,'Tolga.Alp@hotmail.com');

insert into Veli values(314,'Gamze','Yılmazer',5290636327,'Gamze.Yılmazer@hotmail.com');

insert into Veli values(315,'Yusufcan','Bulut',5394458187,'Yusufcan.Bulut@hotmail.com');

insert into Veli values(316,'Beyza','Aktaş',5108460121,'Beyza.Aktaş@hotmail.com');

insert into Veli values(317,'Cenk','Koç',5951499873,'Cenk.Koç@hotmail.com');

insert into Veli values(318,'Elifnur','Yıldırım',5816273469,'Elifnur.Yıldırım@hotmail.com');

insert into Veli values(319,'Görkem','Tanrıverdi',5481320603,'Görkem.Tanrıverdi@hotmail.com');

insert into Veli values(320,'Selcan','Yücel',5208629161,'Selcan.Yücel@hotmail.com');

insert into Veli values(321,'Alp','Güler',5907182803,'Alp.Güler@hotmail.com');

insert into Veli values(322,'Beril','Ayhan',5618603361,'Beril.Ayhan@hotmail.com');

insert into Veli values(323,'Uğur','Yalın',5321430813,'Uğur.Yalın@hotmail.com');

insert into Veli values(324,'Yağmur','Yavuz',5798529367,'Yağmur.Yavuz@hotmail.com');

insert into Veli values(325,'Alperen','Kuru',5616776823,'Alperen.Kuru@hotmail.com');

insert into Veli values(326,'Hazal','Yaman',5135606795,'Hazal.Yaman@hotmail.com');

insert into Veli values(327,'Erkan','Çetin',5534560553,'Erkan.Çetin@hotmail.com');

insert into Veli values(328,'Naz','Alp',5756805399,'Naz.Alp@hotmail.com');

insert into Veli values(329,'Ercan','Yılmazer',5389175271,'Ercan.Yılmazer@hotmail.com');

insert into Veli values(330,'Yasmin','Bulut',5410330329,'Yasmin.Bulut@hotmail.com');

insert into Veli values(331,'Koray','Aktaş',5210342815,'Koray.Aktaş@hotmail.com');

insert into Veli values(332,'Aybüke','Koç',5142954035,'Aybüke.Koç@hotmail.com');

insert into Veli values(333,'Fatih','Yıldırım',5876651783,'Fatih.Yıldırım@hotmail.com');

insert into Veli values(334,'Sevil','Tanrıverdi',5693929029,'Sevil.Tanrıverdi@hotmail.com');

insert into Veli values(335,'Çağlar','Yücel',5285718713,'Çağlar.Yücel@hotmail.com');

insert into Veli values(336,'Damla','Güler',5765444895,'Damla.Güler@hotmail.com');

insert into Veli values(337,'Burçin','Ayhan',5156518921,'Burçin.Ayhan@hotmail.com');

insert into Veli values(338,'Yunus','Yalın',5245975559,'Yunus.Alp@hotmail.com');

insert into Veli values(339,'Melek','Yavuz',5685098135,'Melek.Yavuz@hotmail.com');

insert into Veli values(340,'Oğuz','Kuru',5803647713,'Oğuz.Kuru@hotmail.com');

insert into Veli values(341,'Beyzanur','Yaman',5537537283,'Beyzanur.Yaman@hotmail.com');

insert into Veli values(342,'Volkan','Çetin',5233124285,'Volkan.Çetin@hotmail.com');

insert into Veli values(343,'Büşra','Alp',5400147921,'Büşra.Alp@hotmail.com');

insert into Veli values(344,'Canan','Yılmazer',5995979953,'Canan.Yılmazer@hotmail.com');

insert into Veli values(345,'Halit','Bulut',5430609841,'Halit.Bulut@hotmail.com');

insert into Veli values(346,'Zeliha','Aktaş',5997940083,'Zeliha.Aktaş@hotmail.com');

insert into Veli values(347,'Kağan','Koç',5927804687,'Kağan.Koç@hotmail.com');

insert into Veli values(348,'Derya','Yıldırım',5334508299,'Derya.Yıldırım@hotmail.com');

insert into Veli values(349,'Kaan','Tanrıverdi',5392748155,'Kaan.Tanrıverdi@hotmail.com');

insert into Veli values(350,'Cemile','Yücel',5375422841,'Cemile.Yücel@hotmail.com');

insert into Veli values(351,'Halilİbrahim','Güler',5644406747,'Halilİbrahim.Güler@hotmail.com');

insert into Veli values(352,'Gözde','Ayhan',5890980701,'Gözde.Ayhan@hotmail.com');

insert into Veli values(353,'Mert','Yalın',5946367399,'Mert.Yalın@hotmail.com');

insert into Veli values(354,'Aydan','Yavuz',5297803225,'Aydan.Yavuz@hotmail.com');

insert into Veli values(355,'Ufuk','Kuru',5340778723,'Ufuk.Kuru@hotmail.com');

insert into Veli values(356,'Eda','Yaman',5569618833,'Eda.Yaman@hotmail.com');

insert into Veli values(357,'Yusuf','Çetin',5785111247,'Yusuf.Çetin@hotmail.com');

insert into Veli values(358,'Yaren','Alp',5333675069,'Yaren.Alp@hotmail.com');

insert into Veli values(359,'Bilge','Yılmazer',5319674065,'Bilge.Yılmazer@hotmail.com');

insert into Veli values(360,'Taylan','Bulut',5339166143,'Taylan.Bulut@hotmail.com');

insert into Veli values(361,'Sena','Aktaş',5740578343,'Sena.Aktaş@hotmail.com');

insert into Veli values(362,'Ferdi','Koç',5616054267,'Ferdi.Koç@hotmail.com');

insert into Veli values(363,'Selva','Yıldırım',5581525345,'Selva.Yıldırım@hotmail.com');

insert into Veli values(364,'Kaan','Tanrıverdi',5312989611,'Kaan.Tanrıverdi@hotmail.com');

insert into Veli values(365,'Serap','Yücel',5655505173,'Serap.Yücel@hotmail.com');

insert into Veli values(366,'Ege','Güler',5722797713,'Ege.Güler@hotmail.com');

insert into Veli values(367,'Sibel','Ayhan',5407242501,'Sibel.Ayhan@hotmail.com');

insert into Veli values(368,'Umut','Yalın',5371239223,'Umut.Yalın@hotmail.com');

insert into Veli values(369,'Selin','Yavuz',5796376615,'Selin.Yavuz@hotmail.com');

insert into Veli values(370,'Mustafa','Kuru',5552763863,'Mustafa.Kuru@hotmail.com');

insert into Veli values(371,'Yasemin','Yaman',5815966907,'Yasemin.Yaman@hotmail.com');

insert into Veli values(372,'Ahmet','Çetin',5479908363,'Ahmet.Çetin@hotmail.com');

insert into Veli values(373,'Duygu','Alp',5896633741,'Duygu.Alp@hotmail.com');

insert into Veli values(374,'Burak','Yılmazer',5514619809,'Burak.Yılmazer@hotmail.com');

insert into Veli values(375,'İnci','Bulut',5581748741,'İnci.Bulut@hotmail.com');

insert into Veli values(376,'Cihan','Aktaş',5555939129,'Cihan.Aktaş@hotmail.com');

insert into Veli values(377,'Gülçin','Koç',5544677561,'Gülçin.Koç@hotmail.com');

insert into Veli values(378,'Alp','Yıldırım',5784905979,'Alp.Yıldırım@hotmail.com');

insert into Veli values(379,'Elif','Tanrıverdi',5244731305,'Elif.Tanrıverdi@hotmail.com');

insert into Veli values(380,'Kaya','Yücel',5791552153,'Kaya.Yücel@hotmail.com');

insert into Veli values(381,'Zara','Güler',5688429599,'Zara.Güler@hotmail.com');

insert into Veli values(382,'Berk','Ayhan',5837697675,'Berk.Ayhan@hotmail.com');

insert into Veli values(383,'Bengü','Yalın',5415326415,'Bengü.Yalın@hotmail.com');

insert into Veli values(384,'Onur','Yavuz',5840941863,'Onur.Yavuz@hotmail.com');

insert into Veli values(385,'Ece','Kuru',5290420817,'Ece.Kuru@hotmail.com');

insert into Veli values(386,'Mehmet','Yaman',5332355093,'Mehmet.Yaman@hotmail.com');

insert into Veli values(387,'Gülşah','Çetin',5298833179,'Gülşah.Çetin@hotmail.com');

insert into Veli values(388,'Can','Alp',5205509175,'Can.Alp@hotmail.com');

insert into Veli values(389,'Damla','Yılmazer',5803923507,'Damla.Yılmazer@hotmail.com');

insert into Veli values(390,'Özkan','Bulut',5753568135,'Özkan.Bulut@hotmail.com');

insert into Veli values(391,'Betül','Aktaş',5156978469,'Betül.Aktaş@hotmail.com');

insert into Veli values(392,'Ferit','Koç',5878625655,'Ferit.Koç@hotmail.com');

insert into Veli values(393,'Nurgül','Yıldırım',5837161853,'Nurgül.Yıldırım@hotmail.com');

insert into Veli values(394,'Emrah','Tanrıverdi',5640088355,'Emrah.Tanrıverdi@hotmail.com');

insert into Veli values(395,'Elifnaz','Yücel',5550922499,'Elifnaz.Yücel@hotmail.com');

insert into Veli values(396,'Alper','Güler',5932337815,'Alper.Güler@hotmail.com');

insert into Veli values(397,'Eylül','Ayhan',5171524923,'Eylül.Ayhan@hotmail.com');

insert into Veli values(398,'Denizhan','Yalın',5961962789,'Denizhan.Yalın@hotmail.com');

insert into Veli values(399,'Meltem','Yavuz',5581509047,'Meltem.Tanrıverdi@hotmail.com');

insert into Veli values(400,'Caner','Kuru',5679677971,'Caner.Yücel@hotmail.com');

insert into Veli values(401,'Zara','Yaman',5557225657,'Zara.Yaman@hotmail.com');

insert into Veli values(402,'Bora','Çetin',5839954539,'Bora.Çetin@hotmail.com');

insert into Veli values(403,'Merve','Alp',5108468593,'Merve.Alp@hotmail.com');

insert into Veli values(404,'Emrullah','Yılmazer',5168723721,'Emrullah.Yılmazer@hotmail.com');

insert into Veli values(405,'Ceren','Bulut',5193758167,'Ceren.Bulut@hotmail.com');

insert into Veli values(406,'Burcu','Aktaş',5121713077,'Burcu.Aktaş@hotmail.com');

insert into Veli values(407,'Kuzey','Koç',5451286395,'Kuzey.Koç@hotmail.com');

insert into Veli values(408,'Ayça','Yıldırım',5854939223,'Ayça.Yıldırım@hotmail.com');

insert into Veli values(409,'Yasin','Tanrıverdi',5143935641,'Yasin.Tanrıverdi@hotmail.com');

insert into Veli values(410,'Simge','Yücel',5967749981,'Simge.Yücel@hotmail.com');

insert into Veli values(411,'Vedat','Güler',5432248871,'Vedat.Güler@hotmail.com');

insert into Veli values(412,'Elvan','Ayhan',5251305725,'Elvan.Ayhan@hotmail.com');

insert into Veli values(413,'Tolga','Yalın',5965390037,'Tolga.Yalın@hotmail.com');

insert into Veli values(414,'Gamze','Yavuz',5690103351,'Gamze.Yavuz@hotmail.com');

insert into Veli values(415,'Yusufcan','Kuru',5285226145,'Yusufcan.Kuru@hotmail.com');

insert into Veli values(416,'Beyza','Yaman',5992230527,'Beyza.Yaman@hotmail.com');

insert into Veli values(417,'Cenk','Çetin',5494623885,'Cenk.Çetin@hotmail.com');

insert into Veli values(418,'Elifnur','Alp',5104608909,'Elifnur.Alp@hotmail.com');

insert into Veli values(419,'Görkem','Yılmazer',5554396013,'Görkem.Yılmazer@hotmail.com');

insert into Veli values(420,'Selcan','Bulut',5660576027,'Selcan.Bulut@hotmail.com');

insert into Veli values(421,'Alp','Aktaş',5504981331,'Alp.Aktaş@hotmail.com');

insert into Veli values(422,'Beril','Koç',5964517045,'Beril.Koç@hotmail.com');

insert into Veli values(423,'Uğur','Yıldırım',5202163017,'Uğur.Yıldırım@hotmail.com');

insert into Veli values(424,'Yağmur','Tanrıverdi',5186470907,'Yağmur.Tanrıverdi@hotmail.com');

insert into Veli values(425,'Alperen','Yücel',5912387933,'Alperen.Yücel@hotmail.com');

insert into Veli values(426,'Hazal','Güler',5403666939,'Hazal.Güler@hotmail.com');

insert into Veli values(427,'Erkan','Ayhan',5405297137,'Erkan.Ayhan@hotmail.com');

insert into Veli values(428,'Naz','Yalın',5336019789,'Naz.Yalın@hotmail.com');

insert into Veli values(429,'Ercan','Yavuz',5355980455,'Ercan.Yavuz@hotmail.com');

insert into Veli values(430,'Yasmin','Kuru',5562438053,'Yasmin.Kuru@hotmail.com');

insert into Veli values(431,'Koray','Yaman',5151114583,'Koray.Yaman@hotmail.com');

insert into Veli values(432,'Aybüke','Çetin',5215401893,'Aybüke.Çetin@hotmail.com');

insert into Veli values(433,'Fatih','Alp',5395124593,'Fatih.Alp@hotmail.com');

insert into Veli values(434,'Sevil','Yılmazer',5279358841,'Sevil.Yılmazer@hotmail.com');

insert into Veli values(435,'Çağlar','Bulut',5255982663,'Çağlar.Bulut@hotmail.com');

insert into Veli values(436,'Damla','Aktaş',5874721635,'Damla.Aktaş@hotmail.com');

insert into Veli values(437,'Burçin','Koç',5162628613,'Burçin.Koç@hotmail.com');

insert into Veli values(438,'Yunus','Yıldırım',5738050627,'Yunus.Yıldırım@hotmail.com');

insert into Veli values(439,'Melek','Tanrıverdi',5741294291,'Melek.Tanrıverdi@hotmail.com');

insert into Veli values(440,'Oğuz','Yücel',5182845837,'Oğuz.Yücel@hotmail.com');

insert into Veli values(441,'Beyzanur','Güler',5916191665,'Beyzanur.Güler@hotmail.com');

insert into Veli values(442,'Volkan','Ayhan',5702559541,'Volkan.Ayhan@hotmail.com');

insert into Veli values(443,'Büşra','Yalın',5766745069,'Büşra.Yalın@hotmail.com');

insert into Veli values(444,'Canan','Yavuz',5958270961,'Canan.Yavuz@hotmail.com');

insert into Veli values(445,'Halit','Kuru',5679137939,'Halit.Kuru@hotmail.com');

insert into Veli values(446,'Zeliha','Yaman',5820485659,'Zeliha.Yaman@hotmail.com');

insert into Veli values(447,'Kağan','Çetin',5261607523,'Kağan.Çetin@hotmail.com');

insert into Veli values(448,'Derya','Alp',5422775189,'Derya.Alp@hotmail.com');

insert into Veli values(449,'Kaan','Yılmazer',5353291033,'Kaan.Yılmazer@hotmail.com');

insert into Veli values(450,'Cemile','Bulut',5450341937,'Cemile.Bulut@hotmail.com');

insert into Veli values(451,'Halilİbrahim','Aktaş',5995389437,'Halilİbrahim.Aktaş@hotmail.com');

insert into Veli values(452,'Gözde','Koç',5579092297,'Gözde.Koç@hotmail.com');

insert into Veli values(453,'Mert','Yıldırım',5397911307,'Mert.Yıldırım@hotmail.com');

insert into Veli values(454,'Aydan','Tanrıverdi',5804762969,'Aydan.Tanrıverdi@hotmail.com');

insert into Veli values(455,'Ufuk','Yücel',5166074245,'Ufuk.Yücel@hotmail.com');

insert into Veli values(456,'Eda','Güler',5508302321,'Eda.Güler@hotmail.com');

insert into Veli values(457,'Yusuf','Ayhan',5959305073,'Yusuf.Ayhan@hotmail.com');

insert into Veli values(458,'Yaren','Yalın',5201171821,'Yaren.Yalın@hotmail.com');

insert into Veli values(459,'Bilge','Yavuz',5871291823,'Bilge.Yavuz@hotmail.com');

insert into Veli values(460,'Taylan','Kuru',5611699833,'Taylan.Kuru@hotmail.com');

insert into Veli values(461,'Sena','Yaman',5847843419,'Sena.Yaman@hotmail.com');

insert into Veli values(462,'Ferdi','Çetin',5827837505,'Ferdi.Çetin@hotmail.com');

insert into Veli values(463,'Selva','Alp',5565128577,'Selva.Alp@hotmail.com');

insert into Veli values(464,'Kaan','Yılmazer',5360498563,'Kaan.Yılmazer@hotmail.com');

insert into Veli values(465,'Serap','Bulut',5664911821,'Serap.Bulut@hotmail.com');

insert into Veli values(466,'Ege','Aktaş',5973704499,'Ege.Aktaş@hotmail.com');

insert into Veli values(467,'Sibel','Koç',5408551037,'Sibel.Koç@hotmail.com');

insert into Veli values(468,'Umut','Yıldırım',5926278393,'Umut.Yıldırım@hotmail.com');

insert into Veli values(469,'Selin','Tanrıverdi',5303196651,'Selin.Tanrıverdi@hotmail.com');

insert into Veli values(470,'Mustafa','Yücel',5373593467,'Mustafa.Yücel@hotmail.com');

insert into Veli values(471,'Yasemin','Güler',5411056867,'Yasemin.Güler@hotmail.com');

insert into Veli values(472,'Ahmet','Ayhan',5452867801,'Ahmet.Ayhan@hotmail.com');

insert into Veli values(473,'Duygu','Yalın',5917553829,'Duygu.Yalın@hotmail.com');

insert into Veli values(474,'Burak','Yavuz',5320007311,'Burak.Yavuz@hotmail.com');

insert into Veli values(475,'İnci','Kuru',5888203453,'İnci.Kuru@hotmail.com');

insert into Veli values(476,'Cihan','Yaman',5745345881,'Cihan.Yaman@hotmail.com');

insert into Veli values(477,'Gülçin','Çetin',5636734665,'Gülçin.Çetin@hotmail.com');

insert into Veli values(478,'Alp','Alp',5742755389,'Alp.Alp@hotmail.com');

insert into Veli values(479,'Elif','Yılmazer',5497823579,'Elif.Yılmazer@hotmail.com');

insert into Veli values(480,'Kaya','Bulut',5412193619,'Kaya.Bulut@hotmail.com');

insert into Veli values(481,'Zara','Aktaş',5965350271,'Zara.Aktaş@hotmail.com');

insert into Veli values(482,'Berk','Koç',5831599797,'Berk.Koç@hotmail.com');

insert into Veli values(483,'Bengü','Yıldırım',5441921229,'Bengü.Yıldırım@hotmail.com');

insert into Veli values(484,'Onur','Tanrıverdi',5261002349,'Onur.Tanrıverdi@hotmail.com');

insert into Veli values(485,'Ece','Yücel',5842527367,'Ece.Yücel@hotmail.com');

insert into Veli values(486,'Mehmet','Güler',5978508809,'Mehmet.Güler@hotmail.com');

insert into Veli values(487,'Gülşah','Ayhan',5788166863,'Gülşah.Ayhan@hotmail.com');

insert into Veli values(488,'Can','Yalın',5507533175,'Can.Yalın@hotmail.com');

insert into Veli values(489,'Damla','Yavuz',5468133519,'Damla.Yavuz@hotmail.com');

insert into Veli values(490,'Özkan','Kuru',5420774739,'Özkan.Kuru@hotmail.com');

insert into Veli values(491,'Betül','Yaman',5675119437,'Betül.Yaman@hotmail.com');

insert into Veli values(492,'Ferit','Çetin',5662581255,'Ferit.Çetin@hotmail.com');

insert into Veli values(493,'Nurgül','Alp',5932031967,'Nurgül.Alp@hotmail.com');

insert into Veli values(494,'Emrah','Yılmazer',5561869651,'Emrah.Yılmazer@hotmail.com');

insert into Veli values(495,'Elifnaz','Bulut',5586559073,'Elifnaz.Bulut@hotmail.com');

insert into Veli values(496,'Alper','Aktaş',5520570403,'Alper.Aktaş@hotmail.com');

insert into Veli values(497,'Eylül','Koç',5777158459,'Eylül.Koç@hotmail.com');

insert into Veli values(498,'Denizhan','Yıldırım',5446231669,'Denizhan.Yıldırım@hotmail.com');

insert into Veli values(499,'Meltem','Tanrıverdi',5190870989,'Meltem.Tanrıverdi@hotmail.com');

insert into Veli values(500,'Caner','Yücel',5473569835,'Caner.Yücel@hotmail.com');
insert into Stok values(3000,'Matematikİhtiyaç',52418,6530);

insert into Stok values(3001,'ingilizceİhtiyaç',77177,6530);

insert into Stok values(3002,'almancaihtiyaç',55683,6530);

insert into Stok values(3003,'satrançihtiyaç',62942,6530);

insert into Stok values(3004,'webtasarımihtiyaç',62486,6530);

insert into Stok values(3005,'robotikproglamlamaihtiyaç',57859,6530);
insert into Kullanır values(1001,3000);

insert into Kullanır values(1002,3001);

insert into Kullanır values(1003,3002);

insert into Kullanır values(1004,3003);

insert into Kullanır values(1005,3004);

insert into Kullanır values(1006,3005);
insert into AçılanDers values(1001,100,100);

insert into AçılanDers values(1002,200,200);

insert into AçılanDers values(1003,300,300);

insert into AçılanDers values(1004,50,50);

insert into AçılanDers values(1005,250,250);

insert into AçılanDers values(1006,75,75);
insert into AçılanDersGünleri values(56341,'Pazartesi');

insert into AçılanDersGünleri values(53643,'Çarşamba');

insert into AçılanDersGünleri values(56344,'Perşembe');

insert into AçılanDersGünleri values(56344,'Perşembe');

insert into AçılanDersGünleri values(56342,'Salı');

insert into AçılanDersGünleri values(56345,'Cuma');
insert into AçılanDersZamanları values(1001,56341,'10:00:00');

insert into AçılanDersZamanları values(1002,53643,'12:00:00');

insert into AçılanDersZamanları values(1003,56344,'14:00:00');

insert into AçılanDersZamanları values(1005,56342,'18:00:00');

insert into AçılanDersZamanları values(1006,56345,'08:00:00');
insert into Personel values(501,'Ahmet','YÄ±lmaz',11667123006,5742865739,'ahmet.yilmaz.2023@gmail.com','Ä°stanbul/BeÅiktaÅ/Levent',16020,6530);

insert into Personel values(502,'AyÅe','Kaya',45413488030,5597151357,'ayse.kaya.2023@gmail.com','Ankara/Ãankaya/Kocatepe',22737,6530);

insert into Personel values(503,'Mehmet','Demir',69396445288,5799898861,'mehmet.demir.2023@gmail.com','Ä°zmir/Konak/Alsancak',22620,6530);

insert into Personel values(504,'Fatma','Ãelik',20793325586,5926457155,'fatma.celik.2023@gmail.com','Bursa/NilÃ¼fer/Ãekirge',20981,6530);

insert into Personel values(505,'Mustafa','ErdoÄan',94815332048,5649644427,'mustafa.erdogan.2023@gmail.com','Antalya/MuratpaÅa/KonyaaltÄ±',20159,6530);

insert into Personel values(506,'Zeynep','Åahin',56213242526,5133405335,'zeynep.sahin.2023@gmail.com','Adana/Seyhan/YÃ¼reÄir',12561,6530);

insert into Personel values(507,'Ali','YÄ±ldÄ±z',92551251569,5906924987,'ali.yildiz.2023@gmail.com','Konya/Meram/YenidoÄan',18598,6530);

insert into Personel values(508,'HÃ¼seyin','ÃztÃ¼rk',92883062794,5248106843,'huseyin.ozturk.2023@gmail.com','Gaziantep/Åahinbey/OÄuzeli',14190,6530);

insert into Personel values(509,'Hatice','Arslan',96958441956,5751641921,'hatice.arslan.2023@gmail.com','DiyarbakÄ±r/BaÄlar/Ofis',14843,6530);

insert into Personel values(510,'Ä°smail','Aksoy',20427046501,5314543785,'ismail.aksoy.2023@gmail.com','Mersin/Akdeniz/Mezitli',18333,6530);

insert into Personel values(511,'Emine','Korkmaz',29672551301,5121098955,'emine.korkmaz.2023@gmail.com','Kayseri/Melikgazi/Talas',14357,6530);

insert into Personel values(512,'Burak','AydÄ±n',26442394670,5659666877,'burak.aydin.2023@gmail.com','EskiÅehir/TepebaÅÄ±/OdunpazarÄ±',12668,6530);

insert into Personel values(513,'Esra','KaradaÄ',61808391273,5187831793,'esra.karadag.2023@gmail.com','Samsun/Ä°lkadÄ±m/Atakum',15797,6530);

insert into Personel values(514,'Yusuf','DoÄan',58415651641,5249465807,'yusuf.dogan.2023@gmail.com','Denizli/Merkezefendi/Pamukkale',13847,6530);

insert into Personel values(515,'Rabia','Ãzdemir',55937586301,5680782507,'rabia.ozdemir.2023@gmail.com','Sakarya/Serdivan/Erenler',21763,6530);

insert into Personel values(516,'Selim','YalÃ§Ä±n',82511344412,5671762145,'selim.yalcin.2023@gmail.com','Erzurum/Yakutiye/PalandÃ¶ken',22009,6530);

insert into Personel values(517,'Aysel','TaÅkÄ±n',53495950214,5437325315,'aysel.taskin.2023@gmail.com','Trabzon/Ortahisar/AkÃ§aabat',16011,6530);

insert into Personel values(518,'Onur','Altun',20995134209,5382885459,'onur.altun.2023@gmail.com','Malatya/YeÅilyurt/Battalgazi',15081,6530);

insert into Personel values(519,'Elif','TÃ¼rk',29091658160,5784769377,'elif.turk.2023@gmail.com','Manisa/Åehzadeler/Yunusemre',12521,6530);

insert into Personel values(520,'Furkan','GÃ¼rbÃ¼z',23728101113,5429055603,'furkan.gurbuz.2023@gmail.com','Hatay/Antakya/Defne',15568,6530);

insert into Personel values(521,'Dilara','Ayhan',55340182991,5764234389,'dilara.ayhan.2023@gmail.com','BalÄ±kesir/Karesi/AltÄ±eylÃ¼l',14506,6530);

insert into Personel values(522,'Cem','Ãetin',41935569967,5950602321,'cem.cetin.2023@gmail.com','KahramanmaraÅ/OnikiÅubat/DulkadiroÄlu',16286,6530);

insert into Personel values(523,'Åeyma','GÃ¼ler',55272119205,5773434253,'seyma.guler.2023@gmail.com','Van/Ä°pekyolu/Edremit',20705,6530);

insert into Personel values(524,'Berk','AydÄ±n',47135284716,5105357907,'berk.aydin.2023@gmail.com','AydÄ±n/Efeler/Nazilli',15422,6530);

insert into Personel values(525,'Sibel','YÃ¼ksel',25383282586,5389458799,'sibel.yuksel.2023@gmail.com','Ordu/AltÄ±nordu/Fatsa',19558,6530);

insert into Personel values(526,'GÃ¶khan','KarakuÅ',10184431749,5104403373,'gokhan.karakus.2023@gmail.com','TekirdaÄ/Merkez/SÃ¼leymanpaÅa',21329,6530);

insert into Personel values(527,'AslÄ±','CoÅkun',51267077426,5144687497,'asli.coskun.2023@gmail.com','AdÄ±yaman/Merkez/GÃ¶lbaÅÄ±',13455,6530);

insert into Personel values(528,'Baran','ÃiÃ§ek',35507466516,5714099365,'baran.cicek.2023@gmail.com','Edirne/Merkez/KeÅan',13191,6530);

insert into Personel values(529,'Gamze','AvcÄ±',91137388198,5451655639,'gamze.avci.2023@gmail.com','Kocaeli/Ä°zmit/Gebze',19734,6530);

insert into Personel values(530,'Serkan','Keskin',51988395599,5951110159,'serkan.keskin.2023@gmail.com','BalÄ±kesir/BandÄ±rma/Erdek',14545,6530);

insert into Personel values(531,'Merve','Oktay',45972802637,5326359553,'merve.oktay.2023@gmail.com','MuÄla/Bodrum/Marmaris',21446,6530);

insert into Personel values(532,'Halil','Toprak',23198823307,5773665441,'halil.toprak.2023@gmail.com','Aksaray/Merkez/GÃ¼laÄaÃ§',16153,6530);

insert into Personel values(533,'NazlÄ±','AkgÃ¼l',50452843021,5841374197,'nazli.akgul.2023@gmail.com','KÃ¼tahya/Merkez/TavÅanlÄ±',18152,6530);

insert into Personel values(534,'Ahmetcan','GÃ¼ndÃ¼z',66690672294,5887594511,'ahmetcan.gunduz.2023@gmail.com','NiÄde/Merkez/Bor',17101,6530);

insert into Personel values(535,'Melis','KÄ±lÄ±Ã§',57182929868,5511747491,'melis.kilic.2023@gmail.com','Zonguldak/Merkez/EreÄli',22946,6530);

insert into Personel values(536,'Onurcan','YÄ±lmazer',41269523936,5274952023,'onurcan.yilmazer.2023@gmail.com','Ãorum/Merkez/Sungurlu',19677,6530);

insert into Personel values(537,'Deniz','Yavuz',20192792833,5458627831,'deniz.yavuz.2023@gmail.com','Osmaniye/Merkez/Kadirli',12389,6530);

insert into Personel values(538,'Ä°rem','UÃ§ar',56397080271,5660039955,'irem.ucar.2023@gmail.com','DÃ¼zce/Merkez/AkÃ§akoca',13224,6530);

insert into Personel values(539,'Burakcan','GÃ¼ven',88524250150,5241577791,'burakcan.guven.2023@gmail.com','KÄ±rÄ±kkale/Merkez/Delice',22143,6530);

insert into Personel values(540,'Damla','Atalay',23221695639,5633166153,'damla.atalay.2023@gmail.com','Amasya/Merkez/Merzifon',17885,6530);

insert into Personel values(541,'Ferhat','Aslan',69486868434,5594194183,'ferhat.aslan.2023@gmail.com','Karaman/Merkez/Ermenek',19299,6530);

insert into Personel values(542,'Gizem','GÃ¼ngÃ¶r',28932514661,5374115451,'gizem.gungor.2023@gmail.com','Siirt/Merkez/Åirvan',13314,6530);

insert into Personel values(543,'OÄuzhan','Tuncer',95347957203,5581281359,'oguzhan.tuncer.2023@gmail.com','Isparta/Merkez/EÄirdir',13855,6530);

insert into Personel values(544,'Ece','KarataÅ',47060645216,5874229733,'ece.karatas.2023@gmail.com','Afyonkarahisar/Merkez/SandÄ±klÄ±',21031,6530);

insert into Personel values(545,'Kaan','Toker',29737134144,5117717199,'kaan.toker.2023@gmail.com','Tokat/Merkez/Zile',15872,6530);

insert into Personel values(546,'Aylin','KÄ±lÄ±Ã§aslan',65550556684,5598134323,'aylin.kilicaslan.2023@gmail.com','Yozgat/Merkez/Sorgun',21867,6530);

insert into Personel values(547,'Emir','Tezcan',87691910386,5692508571,'emir.tezcan.2023@gmail.com','BartÄ±n/Merkez/Amasra',22335,6530);

insert into Personel values(548,'Nihan','TaÅdemir',21594206200,5474365577,'nihan.tasdemir.2023@gmail.com','KarabÃ¼k/Merkez/Safranbolu',14193,6530);

insert into Personel values(549,'Umut','Keser',49262319513,5143811471,'umut.keser.2023@gmail.com','ÃankÄ±rÄ±/Merkez/Eldivan',17819,6530);

insert into Personel values(550,'Cansu','YÄ±ldÄ±rÄ±m',79712419528,5220325259,'cansu.yildirim.2023@gmail.com','NevÅehir/Merkez/Avanos',20361,6530);

insert into Personel values(551,'Serdar','Durmaz',73048585246,5591952251,'serdar.durmaz.2023@gmail.com','ÅÄ±rnak/Merkez/Cizre',22274,6530);

insert into Personel values(552,'Yasemin','Uysal',44892893157,5148099095,'yasemin.uysal.2023@gmail.com','KÄ±rÅehir/Merkez/Kaman',21431,6530);

insert into Personel values(553,'Ä°brahim','AtaÅ',16491813809,5187589065,'ibrahim.atas.2023@gmail.com','Kastamonu/Merkez/Ä°nebolu',16981,6530);

insert into Personel values(554,'Duygu','GÃ¼neÅ',70917471855,5636709845,'duygu.gunes.2023@gmail.com','Kilis/Merkez/Elbeyli',16322,6530);

insert into Personel values(555,'Kadir','KÄ±lÄ±Ã§oÄlu',91605028343,5465666839,'kadir.kilicoglu.2023@gmail.com','AÄrÄ±/Merkez/Diyadin',13212,6530);

insert into Personel values(556,'BengÃ¼','Karahan',60655801769,5574911695,'bengu.karahan.2023@gmail.com','Ãanakkale/Merkez/Biga',16660,6530);

insert into Personel values(557,'Murat','Ãnal',81958697923,5398665595,'murat.unal.2023@gmail.com','Yalova/Merkez/AltÄ±nova',15355,6530);

insert into Personel values(558,'Berfin','AkbaÅ',78046116189,5317430069,'berfin.akbas.2023@gmail.com','Batman/Merkez/BeÅiri',16084,6530);

insert into Personel values(559,'Levent','ÅimÅek',91865291346,5594679191,'levent.simsek.2023@gmail.com','IÄdÄ±r/Merkez/AralÄ±k',22535,6530);

insert into Personel values(560,'Zehra','Erdem',13861952145,5598045247,'zehra.erdem.2023@gmail.com','Ardahan/Merkez/GÃ¶le',21302,6530);

insert into Personel values(561,'Can','Cengiz',45991587447,5135055441,'can.cengiz.2023@gmail.com','Artvin/Merkez/Hopa',14898,6530);

insert into Personel values(562,'Sude','Can',49966762414,5959881821,'sude.can.2023@gmail.com','Tunceli/Merkez/PÃ¼lÃ¼mÃ¼r',19746,6530);

insert into Personel values(563,'Cemre','Karaman',85122432968,5730503689,'cemre.karaman.2023@gmail.com','Bayburt/Merkez/DemirÃ¶zÃ¼',21866,6530);

insert into Personel values(564,'Orhan','ÃalÄ±Åkan',10534026046,5249378905,'orhan.caliskan.2023@gmail.com','BartÄ±n/Merkez/Ulus',22890,6530);

insert into Personel values(565,'BÃ¼Åra','Aksu',75967846723,5851768319,'busra.aksu.2023@gmail.com','Sinop/Merkez/Boyabat',12058,6530);

insert into Personel values(566,'Ãmer','ErtÃ¼rk',57262203304,5744732885,'omer.erturk.2023@gmail.com','Giresun/Merkez/Bulancak',12459,6530);

insert into Personel values(567,'Selin','Ersoy',23116337397,5739401621,'selin.ersoy.2023@gmail.com','GÃ¼mÃ¼Åhane/Merkez/Kelkit',19371,6530);

insert into Personel values(568,'Ahu','Ayvaz',47701250153,5444896813,'ahu.ayvaz.2023@gmail.com','Rize/Merkez/Ãayeli',17651,6530);

insert into Personel values(569,'Oktay','ÃakÄ±r',84266226500,5252057911,'oktay.cakir.2023@gmail.com','Trabzon/Merkez/AraklÄ±',15052,6530);

insert into Personel values(570,'Buse','Ãnver',37846679160,5569772301,'buse.unver.2023@gmail.com','Erzincan/Merkez/Kemaliye',20516,6530);

insert into Personel values(571,'Efe','Alkan',34395236007,5435466059,'efe.alkan.2023@gmail.com','KÄ±rklareli/Merkez/LÃ¼leburgaz',16375,6530);

insert into Personel values(572,'TuÄba','ÃiÃ§ek',68720407708,5724047527,'tugba.cicek.2023@gmail.com','ÃankÄ±rÄ±/Merkez/Atkaracalar',20285,6530);

insert into Personel values(573,'Kaan','AygÃ¼n',25644769719,5121445107,'kaan.aygun.2023@gmail.com','GÃ¼mÃ¼Åhane/Merkez/Tirebolu',22740,6530);

insert into Personel values(574,'Åule','Kayaalp',10973459615,5214060311,'sule.kayaalp.2023@gmail.com','Giresun/Merkez/Eynesil',21826,6530);

insert into Personel values(575,'Tuncay','Koca',81392940743,5880862721,'tuncay.koca.2023@gmail.com','Trabzon/Merkez/Yomra',18031,6530);

insert into Personel values(576,'Åebnem','KoÃ§ak',85998758012,5700430725,'sebnem.kocak.2023@gmail.com','Rize/Merkez/Ä°yidere',19837,6530);

insert into Personel values(577,'Eray','GÃ¼zel',90670286909,5510518643,'eray.guzel.2023@gmail.com','Ardahan/Merkez/Hanak',14652,6530);

insert into Personel values(578,'GÃ¼lÅen','Yavuzer',18673771984,5874041059,'gulsen.yavuzer.2023@gmail.com','Aksaray/Merkez/OrtakÃ¶y',18808,6530);

insert into Personel values(579,'Alp','Åen',62040484415,5872033139,'alp.sen.2023@gmail.com','Karaman/Merkez/AyrancÄ±',22515,6530);

insert into Personel values(580,'Beste','GenÃ§',47859857147,5743555163,'beste.genc.2023@gmail.com','IÄdÄ±r/Merkez/Karakoyunlu',16087,6530);

insert into Personel values(581,'Serdar','Bilgin',70038582214,5393856917,'serdar.bilgin.2023@gmail.com','ÅÄ±rnak/Merkez/Silopi',13738,6530);

insert into Personel values(582,'Ä°layda','SarÄ±',81021415473,5409567215,'ilayda.sari.2023@gmail.com','Batman/Merkez/GercÃ¼Å',19344,6530);

insert into Personel values(583,'Burhan','Bayraktar',36849927480,5772943999,'burhan.bayraktar.2023@gmail.com','Hakkari/Merkez/Ãukurca',15770,6530);

insert into Personel values(584,'Sinem','YÄ±ldÄ±zoÄlu',98803114421,5883461055,'sinem.yildizoglu.2023@gmail.com','Siirt/Merkez/Pervari',17643,6530);

insert into Personel values(585,'Batuhan','YÃ¼cel',53149981255,5287214117,'batuhan.yucel.2023@gmail.com','Bitlis/Merkez/Adilcevaz',19343,6530);

insert into Personel values(586,'Ayten','Cankurtaran',41783441822,5115895367,'ayten.cankurtaran.2023@gmail.com','BingÃ¶l/Merkez/GenÃ§',16777,6530);

insert into Personel values(587,'Hakan','DemirtaÅ',24839835824,5246204871,'hakan.demirtas.2023@gmail.com','MuÅ/Merkez/BulanÄ±k',15612,6530);

insert into Personel values(588,'Ezgi','GÃ¼llÃ¼',22730117925,5953517213,'ezgi.gullu.2023@gmail.com','Tunceli/Merkez/Mazgirt',17687,6530);

insert into Personel values(589,'Cihan','Erkan',23142608084,5381448439,'cihan.erkan.2023@gmail.com','AÄrÄ±/Merkez/TaÅlÄ±Ã§ay',21747,6530);

insert into Personel values(590,'Ãzge','YÄ±ldÄ±rÄ±mer',33995759135,5577254215,'ozge.yildirimer.2023@gmail.com','Kars/Merkez/KaÄÄ±zman',18686,6530);

insert into Personel values(591,'Tarkan','GÃ¼r',39415950557,5671634197,'tarkan.gur.2023@gmail.com','Van/Merkez/Ãatak',17479,6530);

insert into Personel values(592,'RÃ¼ya','Kaplan',66845557881,5231792635,'ruya.kaplan.2023@gmail.com','Ardahan/Merkez/Posof',18016,6530);

insert into Personel values(593,'Tamer','EroÄlu',19736273361,5450699643,'tamer.eroglu.2023@gmail.com','Artvin/Merkez/ÅavÅat',17206,6530);

insert into Personel values(594,'Sema','KarakoÃ§',90793584816,5613815211,'sema.karakoc.2023@gmail.com','GÃ¼mÃ¼Åhane/Merkez/Åiran',22917,6530);

insert into Personel values(595,'Emre','GÃ¶ktÃ¼rk',38377330904,5686547995,'emre.gokturk.2023@gmail.com','Giresun/Merkez/DoÄankent',21853,6530);

insert into Personel values(596,'TuÄÃ§e','Budak',69887851531,5381780357,'tugce.budak.2023@gmail.com','Trabzon/Merkez/Ãaykara',15619,6530);

insert into Personel values(597,'Arda','AteÅ',60702700126,5925970601,'arda.ates.2023@gmail.com','Erzincan/Merkez/Otlukbeli',13681,6530);

insert into Personel values(598,'AysegÃ¼l','SarÄ±kaya',85430125315,5261554411,'aysegul.sarikaya.2023@gmail.com','KÄ±rklareli/Merkez/DemirkÃ¶y',12454,6530);

insert into Personel values(599,'YiÄit','Bilici',20587316505,5145359731,'yigit.bilici.2023@gmail.com','ÃankÄ±rÄ±/Merkez/Ä°skilip',18924,6530);

insert into Personel values(600,'Feride','Ãolak',22104294592,5398018135,'feride.colak.2023@gmail.com','Aksaray/Merkez/GÃ¼laÄaÃ§',19252,6530);

insert into Personel values(601,'Ãzkan','Korkut',22553207444,5708849247,'ozkan.korkut.2023@gmail.com','Karaman/Merkez/SarÄ±veliler',12322,6530);

insert into Personel values(602,'BetÃ¼l','Uzun',65832931990,5744409245,'betul.uzun.2023@gmail.com','IÄdÄ±r/Merkez/Tuzluca',20629,6530);

insert into Personel values(603,'Ferit','Canpolat',95530303267,5197298953,'ferit.canpolat.2023@gmail.com','ÅÄ±rnak/Merkez/Ä°dil',17708,6530);

insert into Personel values(604,'NurgÃ¼l','Serin',95957908877,5604199815,'nurgul.serin.2023@gmail.com','Batman/Merkez/Kozluk',15342,6530);

insert into Personel values(605,'Emrah','Akman',41122868986,5334330511,'emrah.akman.2023@gmail.com','Hakkari/Merkez/YÃ¼ksekova',19214,6530);

insert into Personel values(606,'Elifnaz','TÃ¼fekÃ§i',23275856720,5948338163,'elifnaz.tufekci.2023@gmail.com','Siirt/Merkez/Åirvan',16332,6530);

insert into Personel values(607,'Alper','AÄca',60969510559,5720409505,'alper.agca.2023@gmail.com','Bitlis/Merkez/Ahlat',22269,6530);

insert into Personel values(608,'EylÃ¼l','PektaÅ',75937816342,5838237929,'eylul.pektas.2023@gmail.com','BingÃ¶l/Merkez/Yedisu',20235,6530);

insert into Personel values(609,'Denizhan','YaÄcÄ±',83130575391,5221302143,'denizhan.yagci.2023@gmail.com','MuÅ/Merkez/HaskÃ¶y',12733,6530);

insert into Personel values(610,'Meltem','AktaÅ',81785596887,5597361735,'meltem.aktas.2023@gmail.com','Tunceli/Merkez/ÃemiÅgezek',12278,6530);

insert into Personel values(611,'Caner','YÄ±ldÄ±rÄ±moz',98227506800,5832107401,'caner.yildirimoz.2023@gmail.com','AÄrÄ±/Merkez/Hamur',22180,6530);

insert into Personel values(612,'Zara','SaygÄ±',53042348998,5844804293,'zara.saygi.2023@gmail.com','Kars/Merkez/Akyaka',17040,6530);

insert into Personel values(613,'Bora','Alp',90507251366,5955866793,'bora.alp.2023@gmail.com','Van/Merkez/BaÅkale',20954,6530);

insert into Personel values(614,'Merve','Efe',84755255878,5739324555,'merve.efe.2023@gmail.com','Ardahan/Merkez/GÃ¶le',16955,6530);

insert into Personel values(615,'Emrullah','BÃ¼yÃ¼kkaya',84230440542,5627890305,'emrullah.buyukkaya.2023@gmail.com','Artvin/Merkez/BorÃ§ka',21058,6530);

insert into Personel values(616,'Ceren','Karadeniz',24513761894,5628263147,'ceren.karadeniz.2023@gmail.com','GÃ¼mÃ¼Åhane/Merkez/KÃ¼rtÃ¼n',13555,6530);

insert into Personel values(617,'Burcu','AkÄ±ncÄ±',60309968448,5840186679,'burcu.akinci.2023@gmail.com','Giresun/Merkez/Åebinkarahisar',12024,6530);

insert into Personel values(618,'Kuzey','Selvi',47903449886,5502236037,'kuzey.selvi.2023@gmail.com','Trabzon/Merkez/BeÅikdÃ¼zÃ¼',20694,6530);

insert into Personel values(619,'AyÃ§a','Er',24388524524,5651039835,'ayca.er.2023@gmail.com','Erzincan/Merkez/Kemah',18711,6530);

insert into Personel values(620,'Yasin','Ãoban',52225775148,5251779403,'yasin.coban.2023@gmail.com','KÄ±rklareli/Merkez/PehlivankÃ¶y',21341,6530);

insert into Personel values(621,'Simge','YalÄ±n',64377492757,5456862753,'simge.yalin.2023@gmail.com','ÃankÄ±rÄ±/Merkez/KÄ±zÄ±lÄ±rmak',16756,6530);

insert into Personel values(622,'Vedat','KÄ±zÄ±ltan',43195938772,5920268811,'vedat.kiziltan.2023@gmail.com','GÃ¼mÃ¼Åhane/Merkez/Kelkit',21989,6530);

insert into Personel values(623,'Elvan','Cemre',50629510062,5151235525,'elvan.cemre.2023@gmail.com','Giresun/Merkez/GÃ¶rele',21457,6530);

insert into Personel values(624,'Tolga','YÄ±ldÄ±ran',33759867418,5774988157,'tolga.yildiran.2023@gmail.com','Trabzon/Merkez/VakfÄ±kebir',15794,6530);

insert into Personel values(625,'Gamze','Teke',24533258561,5514825615,'gamze.teke.2023@gmail.com','Rize/Merkez/ÃamlÄ±hemÅin',21497,6530);

insert into Personel values(626,'Yusufcan','SaÄlam',36637824279,5212348831,'yusufcan.saglam.2023@gmail.com','Ardahan/Merkez/Damal',17039,6530);

insert into Personel values(627,'Beyza','Bayram',64458493953,5972067277,'beyza.bayram.2023@gmail.com','Aksaray/Merkez/SultanhanÄ±',22991,6530);

insert into Personel values(628,'Cenk','GÃ¼rsoy',88653546770,5499544243,'cenk.gursoy.2023@gmail.com','Karaman/Merkez/BaÅyayla',15440,6530);

insert into Personel values(629,'Elifnur','Kayaalp',21104614948,5181835053,'elifnur.kayaalp.2023@gmail.com','IÄdÄ±r/Merkez/AralÄ±k',15069,6530);

insert into Personel values(630,'GÃ¶rkem','ÃiftÃ§i',93947820331,5683023275,'gorkem.ciftci.2023@gmail.com','ÅÄ±rnak/Merkez/BeytÃ¼ÅÅebap',19722,6530);

insert into Personel values(631,'Selcan','AÅÄ±k',45786540726,5734683603,'selcan.asik.2023@gmail.com','Batman/Merkez/Sason',19374,6530);

insert into Personel values(632,'Alp','YenigÃ¼n',58563580023,5961188153,'alp.yenigun.2023@gmail.com','Hakkari/Merkez/Åemdinli',20770,6530);

insert into Personel values(633,'Beril','GenÃ§er',64802607286,5953073899,'beril.gencer.2023@gmail.com','Siirt/Merkez/Eruh',18542,6530);

insert into Personel values(634,'UÄur','TanrÄ±verdi',92042173498,5205019793,'ugur.tanriverdi.2023@gmail.com','Bitlis/Merkez/Mutki',15961,6530);

insert into Personel values(635,'YaÄmur','Kayaer',44452260668,5379512839,'yagmur.kayaer.2023@gmail.com','BingÃ¶l/Merkez/GenÃ§',17416,6530);

insert into Personel values(636,'Alperen','GÃ¶ren',14159426117,5193676667,'alperen.goren.2023@gmail.com','MuÅ/Merkez/Malazgirt',17331,6530);

insert into Personel values(637,'Hazal','Tuncay',84594418751,5354193341,'hazal.tuncay.2023@gmail.com','Tunceli/Merkez/OvacÄ±k',12625,6530);

insert into Personel values(638,'Erkan','AÅÄ±k',40984298371,5430382991,'erkan.asik.2023@gmail.com','AÄrÄ±/Merkez/DoÄubayazÄ±t',16677,6530);

insert into Personel values(639,'Naz','Uyar',42854634460,5759037227,'naz.uyar.2023@gmail.com','Kars/Merkez/Digor',16314,6530);

insert into Personel values(640,'Ercan','Ayaz',83446880606,5422709959,'ercan.ayaz.2023@gmail.com','Van/Merkez/GevaÅ',15339,6530);

insert into Personel values(641,'Yasmin','GenÃ§tÃ¼rk',77101032083,5949527655,'yasmin.gencturk.2023@gmail.com','Ardahan/Merkez/Hanak',17215,6530);

insert into Personel values(642,'Koray','Ãetinkaya',40597189251,5373266261,'koray.cetinkaya.2023@gmail.com','Artvin/Merkez/Arhavi',22713,6530);

insert into Personel values(643,'AybÃ¼ke','ArÄ±kan',84921963543,5393513767,'aybuke.arikan.2023@gmail.com','GÃ¼mÃ¼Åhane/Merkez/Torul',21233,6530);

insert into Personel values(644,'Fatih','KurtoÄlu',55919226715,5714204007,'fatih.kurtoglu.2023@gmail.com','Giresun/Merkez/Tirebolu',22382,6530);

insert into Personel values(645,'Sevil','KurtuluÅ',76265490197,5313252177,'sevil.kurtulus.2023@gmail.com','Trabzon/Merkez/MaÃ§ka',17275,6530);

insert into Personel values(646,'ÃaÄlar','BaÅaran',58289224359,5694982333,'caglar.basaran.2023@gmail.com','Erzincan/Merkez/Refahiye',15306,6530);

insert into Personel values(647,'Damla','Ãzmen',38761033876,5569692807,'damla.ozmen.2023@gmail.com','KÄ±rklareli/Merkez/Babaeski',14895,6530);

insert into Personel values(648,'BurÃ§in','TÃ¼fekÃ§i',54442904160,5375910625,'burcin.tufekci.2023@gmail.com','ÃankÄ±rÄ±/Merkez/BayramÃ¶ren',13803,6530);

insert into Personel values(649,'Yunus','KaygÄ±sÄ±z',15562617854,5491830181,'yunus.kaygisiz.2023@gmail.com','Aksaray/Merkez/OrtakÃ¶y',16772,6530);

insert into Personel values(650,'Melek','KarataÅ',69809981873,5368999693,'melek.karatas.2023@gmail.com','Karaman/Merkez/Ermenek',17634,6530);

insert into Personel values(651,'OÄuz','Alpsoy',57762172062,5910094629,'oguz.alpsoy.2023@gmail.com','IÄdÄ±r/Merkez/Karakoyunlu',14593,6530);

insert into Personel values(652,'Beyzanur','Ãelik',42107039216,5622513133,'beyzanur.celik.2023@gmail.com','ÅÄ±rnak/Merkez/Cizre',17162,6530);

insert into Personel values(653,'Volkan','EkmekÃ§i',38858870682,5969139221,'volkan.ekmekci.2023@gmail.com','Batman/Merkez/BeÅiri',12015,6530);

insert into Personel values(654,'BÃ¼Åra','Uzuner',22631173295,5358622285,'busra.uzuner.2023@gmail.com','Hakkari/Merkez/Ãukurca',19710,6530);

insert into Personel values(655,'Canan','ÅengÃ¼l',27680028189,5516014199,'canan.sengul.2023@gmail.com','Siirt/Merkez/Åirvan',15311,6530);

insert into Personel values(656,'Halit','Temel',14400888339,5400369713,'halit.temel.2023@gmail.com','Bitlis/Merkez/Adilcevaz',22691,6530);

insert into Personel values(657,'Zeliha','Yalman',30181420316,5653792253,'zeliha.yalman.2023@gmail.com','BingÃ¶l/Merkez/GenÃ§',17959,6530);

insert into Personel values(658,'KaÄan','DaÄlÄ±',72438866831,5477962611,'kagan.dagli.2023@gmail.com','MuÅ/Merkez/BulanÄ±k',20568,6530);

insert into Personel values(659,'Derya','Kocaman',15266583868,5680936859,'derya.kocaman.2023@gmail.com','Tunceli/Merkez/Mazgirt',16669,6530);

insert into Personel values(660,'Kaan','Kayaalp',18030552889,5991425985,'kaan.kayaalp.2023@gmail.com','AÄrÄ±/Merkez/TaÅlÄ±Ã§ay',22805,6530);

insert into Personel values(661,'Cemile','Kanat',97118459986,5721654777,'cemile.kanat.2023@gmail.com','Kars/Merkez/KaÄÄ±zman',19446,6530);

insert into Personel values(662,'HalilÄ°brahim','Kavak',16826633935,5276662097,'halil.ibrahim.kavak.2023@gmail.com','Van/Merkez/Ãatak',19186,6530);

insert into Personel values(663,'GÃ¶zde','Erkan',17401975351,5587652777,'gozde.erkan.2023@gmail.com','Ardahan/Merkez/Posof',13090,6530);

insert into Personel values(664,'Mert','GÃ¶ktaÅ',76446044440,5634491253,'mert.goktas.2023@gmail.com','Artvin/Merkez/ÅavÅat',21668,6530);

insert into Personel values(665,'Aydan','Baykara',27348117529,5304397393,'aydan.baykara.2023@gmail.com','GÃ¼mÃ¼Åhane/Merkez/Åiran',22287,6530);

insert into Personel values(666,'Ufuk','YÄ±lmazsoy',96695325841,5652562611,'ufuk.yilmazsoy.2023@gmail.com','Giresun/Merkez/DoÄankent',20407,6530);

insert into Personel values(667,'Eda','BayÄ±ndÄ±r',98350399620,5109141083,'eda.bayindir.2023@gmail.com','Trabzon/Merkez/Ãaykara',12359,6530);

insert into Personel values(668,'Yusuf','Aslan',98722099919,5494264903,'yusuf.aslan.2023@gmail.com','Erzincan/Merkez/Otlukbeli',12694,6530);

insert into Personel values(669,'Yaren','KaragÃ¶z',12881201271,5581003811,'yaren.karagoz.2023@gmail.com','KÄ±rklareli/Merkez/DemirkÃ¶y',13983,6530);

insert into Personel values(670,'Bilge','Karademir',35093636339,5779823317,'bilge.karademir.2023@gmail.com','ÃankÄ±rÄ±/Merkez/Ä°skilip',13185,6530);

insert into Personel values(671,'Taylan','BaÅar',46762520771,5385198991,'taylan.basar.2023@gmail.com','Aksaray/Merkez/GÃ¼laÄaÃ§',15598,6530);

insert into Personel values(672,'Sena','YalÃ§Ä±ner',72820879600,5472551909,'sena.yalciner.2023@gmail.com','Karaman/Merkez/SarÄ±veliler',15931,6530);

insert into Personel values(673,'Ferdi','YÄ±ldÄ±rÄ±moÄlu',12003502459,5270059677,'ferdi.yildirimoglu.2023@gmail.com','IÄdÄ±r/Merkez/Tuzluca',21435,6530);

insert into Personel values(674,'Selva','Yaman',35274699287,5730821603,'selva.yaman.2023@gmail.com','ÅÄ±rnak/Merkez/Ä°dil',14375,6530);

insert into Personel values(675,'Kaan','KaragÃ¶z',73352385315,5789428751,'kaan.karagoz.2023@gmail.com','Batman/Merkez/Kozluk',12730,6530);

insert into Personel values(676,'Serap','Kara',36461923989,5181711059,'serap.kara.2023@gmail.com','Hakkari/Merkez/YÃ¼ksekova',13362,6530);

insert into Personel values(677,'Ege','Aslan',74616124328,5237899929,'ege.aslan.2023@gmail.com','Siirt/Merkez/Åirvan',14031,6530);

insert into Personel values(678,'Sibel','BaÅak',94597398415,5506247943,'sibel.basak.2023@gmail.com','Bitlis/Merkez/Ahlat',17014,6530);

insert into Personel values(679,'Umut','GÃ¼rler',94796047761,5473417499,'umut.gurler.2023@gmail.com','BingÃ¶l/Merkez/Yedisu',12365,6530);

insert into Personel values(680,'Selin','Tiryaki',88834575774,5412747405,'selin.tiryaki.2023@gmail.com','MuÅ/Merkez/HaskÃ¶y',13522,6530);

insert into Personel values(681,'Mustafa','GÃ¼rpÄ±nar',72697846733,5253080117,'mustafa.gurpinar.2023@gmail.com','Tunceli/Merkez/ÃemiÅgezek',18165,6530);

insert into Personel values(682,'Yasemin','YÄ±ldÄ±rÄ±mlar',38567177699,5990295205,'yasemin.yildirimlar.2023@gmail.com','AÄrÄ±/Merkez/Hamur',13241,6530);

insert into Personel values(683,'Ahmet','Aslan',19330722386,5207864659,'ahmet.aslan.2023@gmail.com','Kars/Merkez/Akyaka',14470,6530);

insert into Personel values(684,'Duygu','CoÅar',84210276869,5830936471,'duygu.cosar.2023@gmail.com','Van/Merkez/BaÅkale',19070,6530);

insert into Personel values(685,'Burak','Ersoy',33951299545,5372308745,'burak.ersoy.2023@gmail.com','Ardahan/Merkez/GÃ¶le',20126,6530);

insert into Personel values(686,'Ä°nci','Korkut',89789556039,5304914001,'inci.korkut.2023@gmail.com','Artvin/Merkez/BorÃ§ka',13540,6530);

insert into Personel values(687,'Cihan','Arslan',64777423291,5110121641,'cihan.arslan.2023@gmail.com','GÃ¼mÃ¼Åhane/Merkez/KÃ¼rtÃ¼n',20025,6530);

insert into Personel values(688,'GÃ¼lÃ§in','ÃakÄ±r',54146944223,5663069289,'gulcin.cakir.2023@gmail.com','Giresun/Merkez/Åebinkarahisar',19454,6530);

insert into Personel values(689,'Alp','Erat',63345209023,5857203747,'alp.erat.2023@gmail.com','Trabzon/Merkez/BeÅikdÃ¼zÃ¼',17362,6530);

insert into Personel values(690,'Elif','Kuzu',99900661745,5243976021,'elif.kuzu.2023@gmail.com','Erzincan/Merkez/Kemah',20947,6530);

insert into Personel values(691,'Kaya','TopÃ§u',20266691269,5575086033,'kaya.topcu.2023@gmail.com','KÄ±rklareli/Merkez/PehlivankÃ¶y',14807,6530);

insert into Personel values(692,'Zara','Ãetin',78424892086,5404524763,'zara.cetin.2023@gmail.com','ÃankÄ±rÄ±/Merkez/KÄ±zÄ±lÄ±rmak',18994,6530);

insert into Personel values(693,'Berk','AvcÄ±',24227776854,5450355175,'berk.avci.2023@gmail.com','GÃ¼mÃ¼Åhane/Merkez/Kelkit',16067,6530);

insert into Personel values(694,'BengÃ¼','YÄ±ldÄ±zer',98642536316,5113403885,'bengu.yildizer.2023@gmail.com','Giresun/Merkez/GÃ¶rele',15528,6530);

insert into Personel values(695,'Onur','TaÅ',48816143265,5425132279,'onur.tas.2023@gmail.com','Trabzon/Merkez/VakfÄ±kebir',21780,6530);

insert into Personel values(696,'Ece','TanrÄ±sever',96113538947,5591156329,'ece.tanrisever.2023@gmail.com','Siirt/Merkez/Pervari',15941,6530);

insert into Personel values(697,'Mehmet','BÃ¼yÃ¼k',47961757788,5641271071,'mehmet.buyuk.2023@gmail.com','Bitlis/Merkez/Adilcevaz',16083,6530);

insert into Personel values(698,'GÃ¼lÅah','Ãetinkaya',73167031008,5566367115,'gulsah.cetinkaya.2023@gmail.com','BingÃ¶l/Merkez/GenÃ§',22630,6530);

insert into Personel values(699,'Can','Akbulut',69090257238,5613062189,'can.akbulut.2023@gmail.com','MuÅ/Merkez/BulanÄ±k',14993,6530);

insert into Personel values(700,'Damla','DoÄanay',77240379712,5202319607,'damla.doganay.2023@gmail.com','Tunceli/Merkez/Mazgirt',21632,6530);
insert into DersiVerir values(1004,630);

insert into DersiVerir values(1002,630);

insert into DersiVerir values(1005,630);

insert into DersiVerir values(1001,630);

insert into DersiVerir values(1006,631);

insert into DersiVerir values(1002,631);

insert into DersiVerir values(1004,632);

insert into DersiVerir values(1002,632);

insert into DersiVerir values(1002,633);

insert into DersiVerir values(1004,633);

insert into DersiVerir values(1003,633);

insert into DersiVerir values(1005,633);

insert into DersiVerir values(1005,634);

insert into DersiVerir values(1004,634);

insert into DersiVerir values(1003,634);

insert into DersiVerir values(1001,634);

insert into DersiVerir values(1002,635);

insert into DersiVerir values(1003,635);

insert into DersiVerir values(1004,636);

insert into DersiVerir values(1004,637);

insert into DersiVerir values(1006,637);

insert into DersiVerir values(1003,637);

insert into DersiVerir values(1002,637);

insert into DersiVerir values(1001,637);

insert into DersiVerir values(1006,638);

insert into DersiVerir values(1002,639);

insert into DersiVerir values(1003,640);

insert into DersiVerir values(1004,640);

insert into DersiVerir values(1002,640);

insert into DersiVerir values(1001,640);

insert into DersiVerir values(1005,641);

insert into DersiVerir values(1004,641);

insert into DersiVerir values(1002,641);

insert into DersiVerir values(1003,641);

insert into DersiVerir values(1006,642);

insert into DersiVerir values(1004,642);

insert into DersiVerir values(1003,642);

insert into DersiVerir values(1002,642);

insert into DersiVerir values(1004,643);

insert into DersiVerir values(1003,643);

insert into DersiVerir values(1005,643);

insert into DersiVerir values(1001,643);

insert into DersiVerir values(1006,643);

insert into DersiVerir values(1001,644);

insert into DersiVerir values(1002,644);

insert into DersiVerir values(1005,644);

insert into DersiVerir values(1004,645);

insert into DersiVerir values(1006,645);

insert into DersiVerir values(1005,645);

insert into DersiVerir values(1002,646);

insert into DersiVerir values(1002,647);

insert into DersiVerir values(1004,648);

insert into DersiVerir values(1001,648);

insert into DersiVerir values(1003,648);

insert into DersiVerir values(1005,648);

insert into DersiVerir values(1003,649);

insert into DersiVerir values(1002,649);

insert into DersiVerir values(1005,649);

insert into DersiVerir values(1002,650);

insert into DersiVerir values(1001,650);

insert into DersiVerir values(1003,650);

insert into DersiVerir values(1006,650);

insert into DersiVerir values(1005,651);

insert into DersiVerir values(1006,651);

insert into DersiVerir values(1001,651);

insert into DersiVerir values(1003,651);

insert into DersiVerir values(1002,652);

insert into DersiVerir values(1004,652);

insert into DersiVerir values(1003,652);

insert into DersiVerir values(1002,653);

insert into DersiVerir values(1004,654);

insert into DersiVerir values(1001,654);

insert into DersiVerir values(1002,654);

insert into DersiVerir values(1002,655);

insert into DersiVerir values(1004,655);

insert into DersiVerir values(1001,655);

insert into DersiVerir values(1006,655);

insert into DersiVerir values(1002,656);

insert into DersiVerir values(1004,656);

insert into DersiVerir values(1006,656);

insert into DersiVerir values(1003,656);

insert into DersiVerir values(1003,657);

insert into DersiVerir values(1001,657);

insert into DersiVerir values(1005,658);

insert into DersiVerir values(1002,658);

insert into DersiVerir values(1001,659);

insert into DersiVerir values(1004,659);

insert into DersiVerir values(1005,659);

insert into DersiVerir values(1006,660);

insert into DersiVerir values(1003,660);

insert into DersiVerir values(1001,661);

insert into DersiVerir values(1004,661);

insert into DersiVerir values(1006,661);

insert into DersiVerir values(1001,662);

insert into DersiVerir values(1006,662);

insert into DersiVerir values(1004,662);

insert into DersiVerir values(1002,663);

insert into DersiVerir values(1001,663);

insert into DersiVerir values(1004,663);

insert into DersiVerir values(1003,663);

insert into DersiVerir values(1005,663);

insert into DersiVerir values(1001,664);

insert into DersiVerir values(1006,664);

insert into DersiVerir values(1003,665);

insert into DersiVerir values(1001,665);

insert into DersiVerir values(1006,665);

insert into DersiVerir values(1005,665);

insert into DersiVerir values(1004,665);

insert into DersiVerir values(1001,666);

insert into DersiVerir values(1006,666);

insert into DersiVerir values(1003,666);

insert into DersiVerir values(1002,667);

insert into DersiVerir values(1004,668);

insert into DersiVerir values(1006,668);

insert into DersiVerir values(1005,669);

insert into DersiVerir values(1003,669);

insert into DersiVerir values(1006,669);

insert into DersiVerir values(1006,670);

insert into DersiVerir values(1003,670);

insert into DersiVerir values(1002,670);

insert into DersiVerir values(1001,670);

insert into DersiVerir values(1002,671);

insert into DersiVerir values(1001,671);

insert into DersiVerir values(1006,671);

insert into DersiVerir values(1005,671);

insert into DersiVerir values(1002,672);

insert into DersiVerir values(1003,672);

insert into DersiVerir values(1001,672);

insert into DersiVerir values(1006,672);

insert into DersiVerir values(1005,672);

insert into DersiVerir values(1001,673);

insert into DersiVerir values(1003,673);

insert into DersiVerir values(1002,673);

insert into DersiVerir values(1005,674);

insert into DersiVerir values(1003,675);

insert into DersiVerir values(1005,675);

insert into DersiVerir values(1006,675);

insert into DersiVerir values(1001,675);

insert into DersiVerir values(1002,676);

insert into DersiVerir values(1005,676);

insert into DersiVerir values(1004,676);

insert into DersiVerir values(1004,677);

insert into DersiVerir values(1002,677);

insert into DersiVerir values(1006,677);

insert into DersiVerir values(1001,677);

insert into DersiVerir values(1003,677);

insert into DersiVerir values(1003,678);

insert into DersiVerir values(1006,678);

insert into DersiVerir values(1002,679);

insert into DersiVerir values(1006,679);

insert into DersiVerir values(1005,679);

insert into DersiVerir values(1003,679);

insert into DersiVerir values(1004,679);

insert into DersiVerir values(1002,680);

insert into DersiVerir values(1006,680);

insert into DersiVerir values(1001,680);

insert into DersiVerir values(1003,680);

insert into DersiVerir values(1005,680);

insert into DersiVerir values(1002,681);

insert into DersiVerir values(1005,682);

insert into DersiVerir values(1004,682);

insert into DersiVerir values(1003,682);

insert into DersiVerir values(1006,682);

insert into DersiVerir values(1006,683);

insert into DersiVerir values(1005,683);

insert into DersiVerir values(1002,683);

insert into DersiVerir values(1004,683);

insert into DersiVerir values(1005,684);

insert into DersiVerir values(1001,684);

insert into DersiVerir values(1006,684);

insert into DersiVerir values(1003,684);

insert into DersiVerir values(1002,684);

insert into DersiVerir values(1003,685);

insert into DersiVerir values(1006,685);

insert into DersiVerir values(1005,685);

insert into DersiVerir values(1001,685);

insert into DersiVerir values(1004,685);

insert into DersiVerir values(1005,686);

insert into DersiVerir values(1001,686);

insert into DersiVerir values(1002,686);

insert into DersiVerir values(1003,686);

insert into DersiVerir values(1004,686);

insert into DersiVerir values(1005,687);

insert into DersiVerir values(1001,688);

insert into DersiVerir values(1002,688);

insert into DersiVerir values(1004,688);

insert into DersiVerir values(1006,688);

insert into DersiVerir values(1005,688);

insert into DersiVerir values(1001,689);

insert into DersiVerir values(1003,689);

insert into DersiVerir values(1005,689);

insert into DersiVerir values(1005,690);

insert into DersiVerir values(1001,690);

insert into DersiVerir values(1006,690);

insert into DersiVerir values(1003,690);

insert into DersiVerir values(1004,690);

insert into DersiVerir values(1004,691);

insert into DersiVerir values(1004,692);

insert into DersiVerir values(1002,692);

insert into DersiVerir values(1003,692);

insert into DersiVerir values(1004,693);

insert into DersiVerir values(1002,693);

insert into DersiVerir values(1005,693);

insert into DersiVerir values(1003,694);

insert into DersiVerir values(1001,694);

insert into DersiVerir values(1006,694);

insert into DersiVerir values(1004,694);

insert into DersiVerir values(1003,695);

insert into DersiVerir values(1005,695);

insert into DersiVerir values(1002,695);

insert into DersiVerir values(1006,695);

insert into DersiVerir values(1004,696);

insert into DersiVerir values(1006,696);

insert into DersiVerir values(1002,697);

insert into DersiVerir values(1004,697);

insert into DersiVerir values(1002,698);

insert into DersiVerir values(1001,698);

insert into DersiVerir values(1004,698);

insert into DersiVerir values(1005,698);

insert into DersiVerir values(1003,698);

insert into DersiVerir values(1002,699);

insert into DersiVerir values(1001,699);

insert into DersiVerir values(1004,699);

insert into DersiVerir values(1005,699);

insert into DersiVerir values(1005,700);

insert into DersiVerir values(1002,700);

insert into DersiVerir values(1006,700);

insert into DersiVerir values(1004,700);

insert into DersiVerir values(1001,700);
insert into KurumGiderleri values(5000,'Kira',38619,6530);

insert into KurumGiderleri values(5001,'temizlik',72381,6530);

insert into KurumGiderleri values(5002,'maaş',1000000,6530);

insert into KurumGiderleri values(5003,'kırtasiye',21166,6530);
insert into İdariPersonel values(539);

insert into İdariPersonel values(540);

insert into İdariPersonel values(541);

insert into İdariPersonel values(542);

insert into İdariPersonel values(543);

insert into İdariPersonel values(544);

insert into İdariPersonel values(545);

insert into İdariPersonel values(546);

insert into İdariPersonel values(547);

insert into İdariPersonel values(548);

insert into İdariPersonel values(549);

insert into İdariPersonel values(550);

insert into İdariPersonel values(551);

insert into İdariPersonel values(552);

insert into İdariPersonel values(553);

insert into İdariPersonel values(554);

insert into İdariPersonel values(555);

insert into İdariPersonel values(556);

insert into İdariPersonel values(557);

insert into İdariPersonel values(558);

insert into İdariPersonel values(559);

insert into İdariPersonel values(560);
insert into TemizlikPersoneli values(593);

insert into TemizlikPersoneli values(594);

insert into TemizlikPersoneli values(595);

insert into TemizlikPersoneli values(596);

insert into TemizlikPersoneli values(597);

insert into TemizlikPersoneli values(598);

insert into TemizlikPersoneli values(599);

insert into TemizlikPersoneli values(600);

insert into TemizlikPersoneli values(601);

insert into TemizlikPersoneli values(602);

insert into TemizlikPersoneli values(603);

insert into TemizlikPersoneli values(604);

insert into TemizlikPersoneli values(605);

insert into TemizlikPersoneli values(606);

insert into TemizlikPersoneli values(607);

insert into TemizlikPersoneli values(608);

insert into TemizlikPersoneli values(609);

insert into TemizlikPersoneli values(610);

insert into TemizlikPersoneli values(611);

insert into TemizlikPersoneli values(612);

insert into TemizlikPersoneli values(613);

insert into TemizlikPersoneli values(614);

insert into TemizlikPersoneli values(615);

insert into TemizlikPersoneli values(616);

insert into TemizlikPersoneli values(617);

insert into TemizlikPersoneli values(618);

insert into TemizlikPersoneli values(619);

insert into TemizlikPersoneli values(620);

insert into TemizlikPersoneli values(621);

insert into TemizlikPersoneli values(622);

insert into TemizlikPersoneli values(623);

insert into TemizlikPersoneli values(624);

insert into TemizlikPersoneli values(625);

insert into TemizlikPersoneli values(626);

insert into TemizlikPersoneli values(627);

insert into TemizlikPersoneli values(628);

insert into TemizlikPersoneli values(629);
insert into Öğretmen values(655);

insert into Öğretmen values(656);

insert into Öğretmen values(657);

insert into Öğretmen values(658);

insert into Öğretmen values(659);

insert into Öğretmen values(660);

insert into Öğretmen values(661);

insert into Öğretmen values(662);

insert into Öğretmen values(663);

insert into Öğretmen values(664);

insert into Öğretmen values(665);

insert into Öğretmen values(666);

insert into Öğretmen values(667);

insert into Öğretmen values(668);

insert into Öğretmen values(669);

insert into Öğretmen values(670);

insert into Öğretmen values(671);

insert into Öğretmen values(672);

insert into Öğretmen values(673);

insert into Öğretmen values(674);

insert into Öğretmen values(675);

insert into Öğretmen values(676);

insert into Öğretmen values(677);

insert into Öğretmen values(678);

insert into Öğretmen values(679);

insert into Öğretmen values(680);

insert into Öğretmen values(681);

insert into Öğretmen values(682);

insert into Öğretmen values(683);

insert into Öğretmen values(684);

insert into Öğretmen values(685);

insert into Öğretmen values(686);

insert into Öğretmen values(687);

insert into Öğretmen values(688);

insert into Öğretmen values(689);

insert into Öğretmen values(690);

insert into Öğretmen values(691);

insert into Öğretmen values(692);

insert into Öğretmen values(693);

insert into Öğretmen values(694);

insert into Öğretmen values(695);

insert into Öğretmen values(696);

insert into Öğretmen values(697);

insert into Öğretmen values(698);

insert into Öğretmen values(699);

insert into Öğretmen values(700);
insert into FullTimeÇalışan values(501);

insert into FullTimeÇalışan values(502);

insert into FullTimeÇalışan values(503);

insert into FullTimeÇalışan values(504);

insert into FullTimeÇalışan values(505);

insert into FullTimeÇalışan values(506);

insert into FullTimeÇalışan values(507);

insert into FullTimeÇalışan values(508);

insert into FullTimeÇalışan values(509);

insert into FullTimeÇalışan values(510);

insert into FullTimeÇalışan values(511);

insert into FullTimeÇalışan values(512);

insert into FullTimeÇalışan values(513);

insert into FullTimeÇalışan values(514);

insert into FullTimeÇalışan values(515);

insert into FullTimeÇalışan values(516);

insert into FullTimeÇalışan values(517);

insert into FullTimeÇalışan values(518);

insert into FullTimeÇalışan values(519);

insert into FullTimeÇalışan values(520);

insert into FullTimeÇalışan values(521);

insert into FullTimeÇalışan values(522);

insert into FullTimeÇalışan values(523);

insert into FullTimeÇalışan values(524);

insert into FullTimeÇalışan values(525);

insert into FullTimeÇalışan values(526);

insert into FullTimeÇalışan values(527);

insert into FullTimeÇalışan values(528);

insert into FullTimeÇalışan values(529);

insert into FullTimeÇalışan values(530);

insert into FullTimeÇalışan values(531);

insert into FullTimeÇalışan values(532);

insert into FullTimeÇalışan values(533);

insert into FullTimeÇalışan values(534);

insert into FullTimeÇalışan values(535);

insert into FullTimeÇalışan values(536);

insert into FullTimeÇalışan values(537);

insert into FullTimeÇalışan values(538);

insert into FullTimeÇalışan values(539);

insert into FullTimeÇalışan values(540);

insert into FullTimeÇalışan values(541);

insert into FullTimeÇalışan values(542);

insert into FullTimeÇalışan values(543);

insert into FullTimeÇalışan values(544);

insert into FullTimeÇalışan values(545);

insert into FullTimeÇalışan values(546);

insert into FullTimeÇalışan values(547);

insert into FullTimeÇalışan values(548);

insert into FullTimeÇalışan values(549);

insert into FullTimeÇalışan values(550);

insert into FullTimeÇalışan values(551);

insert into FullTimeÇalışan values(552);

insert into FullTimeÇalışan values(553);

insert into FullTimeÇalışan values(554);

insert into FullTimeÇalışan values(555);

insert into FullTimeÇalışan values(556);

insert into FullTimeÇalışan values(557);

insert into FullTimeÇalışan values(558);

insert into FullTimeÇalışan values(559);

insert into FullTimeÇalışan values(560);

insert into FullTimeÇalışan values(561);

insert into FullTimeÇalışan values(562);

insert into FullTimeÇalışan values(563);

insert into FullTimeÇalışan values(564);

insert into FullTimeÇalışan values(565);

insert into FullTimeÇalışan values(566);

insert into FullTimeÇalışan values(567);

insert into FullTimeÇalışan values(568);

insert into FullTimeÇalışan values(569);

insert into FullTimeÇalışan values(570);

insert into FullTimeÇalışan values(571);

insert into FullTimeÇalışan values(572);

insert into FullTimeÇalışan values(573);

insert into FullTimeÇalışan values(574);

insert into FullTimeÇalışan values(575);

insert into FullTimeÇalışan values(576);

insert into FullTimeÇalışan values(577);

insert into FullTimeÇalışan values(578);

insert into FullTimeÇalışan values(579);

insert into FullTimeÇalışan values(580);

insert into FullTimeÇalışan values(581);

insert into FullTimeÇalışan values(582);

insert into FullTimeÇalışan values(583);

insert into FullTimeÇalışan values(584);

insert into FullTimeÇalışan values(585);

insert into FullTimeÇalışan values(586);

insert into FullTimeÇalışan values(587);

insert into FullTimeÇalışan values(588);

insert into FullTimeÇalışan values(589);

insert into FullTimeÇalışan values(590);

insert into FullTimeÇalışan values(591);

insert into FullTimeÇalışan values(592);

insert into FullTimeÇalışan values(593);

insert into FullTimeÇalışan values(594);

insert into FullTimeÇalışan values(595);

insert into FullTimeÇalışan values(596);

insert into FullTimeÇalışan values(597);

insert into FullTimeÇalışan values(598);

insert into FullTimeÇalışan values(599);

insert into FullTimeÇalışan values(600);

insert into FullTimeÇalışan values(601);

insert into FullTimeÇalışan values(602);

insert into FullTimeÇalışan values(603);

insert into FullTimeÇalışan values(604);

insert into FullTimeÇalışan values(605);

insert into FullTimeÇalışan values(606);

insert into FullTimeÇalışan values(607);

insert into FullTimeÇalışan values(608);

insert into FullTimeÇalışan values(609);

insert into FullTimeÇalışan values(610);

insert into FullTimeÇalışan values(611);

insert into FullTimeÇalışan values(612);

insert into FullTimeÇalışan values(613);

insert into FullTimeÇalışan values(614);

insert into FullTimeÇalışan values(615);

insert into FullTimeÇalışan values(616);

insert into FullTimeÇalışan values(617);

insert into FullTimeÇalışan values(618);

insert into FullTimeÇalışan values(619);

insert into FullTimeÇalışan values(620);

insert into FullTimeÇalışan values(621);

insert into FullTimeÇalışan values(622);

insert into FullTimeÇalışan values(623);

insert into FullTimeÇalışan values(624);

insert into FullTimeÇalışan values(625);

insert into FullTimeÇalışan values(626);

insert into FullTimeÇalışan values(627);

insert into FullTimeÇalışan values(628);

insert into FullTimeÇalışan values(629);

insert into FullTimeÇalışan values(630);

insert into FullTimeÇalışan values(631);

insert into FullTimeÇalışan values(632);

insert into FullTimeÇalışan values(633);

insert into FullTimeÇalışan values(634);

insert into FullTimeÇalışan values(635);

insert into FullTimeÇalışan values(636);

insert into FullTimeÇalışan values(637);

insert into FullTimeÇalışan values(638);

insert into FullTimeÇalışan values(639);

insert into FullTimeÇalışan values(640);

insert into FullTimeÇalışan values(641);

insert into FullTimeÇalışan values(642);

insert into FullTimeÇalışan values(643);

insert into FullTimeÇalışan values(644);

insert into FullTimeÇalışan values(645);

insert into FullTimeÇalışan values(646);

insert into FullTimeÇalışan values(647);

insert into FullTimeÇalışan values(648);

insert into FullTimeÇalışan values(649);

insert into FullTimeÇalışan values(650);

insert into FullTimeÇalışan values(651);

insert into FullTimeÇalışan values(652);

insert into FullTimeÇalışan values(653);

insert into FullTimeÇalışan values(654);

insert into FullTimeÇalışan values(655);

insert into FullTimeÇalışan values(656);

insert into FullTimeÇalışan values(657);

insert into FullTimeÇalışan values(658);

insert into FullTimeÇalışan values(659);

insert into FullTimeÇalışan values(660);

insert into FullTimeÇalışan values(661);

insert into FullTimeÇalışan values(662);

insert into FullTimeÇalışan values(663);

insert into FullTimeÇalışan values(664);

insert into FullTimeÇalışan values(665);

insert into FullTimeÇalışan values(666);

insert into FullTimeÇalışan values(667);

insert into FullTimeÇalışan values(668);

insert into FullTimeÇalışan values(669);

insert into FullTimeÇalışan values(670);

insert into FullTimeÇalışan values(671);

insert into FullTimeÇalışan values(672);

insert into FullTimeÇalışan values(673);

insert into FullTimeÇalışan values(674);

insert into FullTimeÇalışan values(675);

insert into FullTimeÇalışan values(676);

insert into FullTimeÇalışan values(677);

insert into FullTimeÇalışan values(678);

insert into FullTimeÇalışan values(679);

insert into FullTimeÇalışan values(680);

insert into FullTimeÇalışan values(681);
insert into PartTimeÇalışan values(682);

insert into PartTimeÇalışan values(683);

insert into PartTimeÇalışan values(684);

insert into PartTimeÇalışan values(685);

insert into PartTimeÇalışan values(686);

insert into PartTimeÇalışan values(687);

insert into PartTimeÇalışan values(688);

insert into PartTimeÇalışan values(689);

insert into PartTimeÇalışan values(690);

insert into PartTimeÇalışan values(691);

insert into PartTimeÇalışan values(692);

insert into PartTimeÇalışan values(693);

insert into PartTimeÇalışan values(694);

insert into PartTimeÇalışan values(695);

insert into PartTimeÇalışan values(696);

insert into PartTimeÇalışan values(697);

insert into PartTimeÇalışan values(698);

insert into PartTimeÇalışan values(699);

insert into PartTimeÇalışan values(700);
insert into PartTimeMüsaitSaatler values(7000,'14:00:00');

insert into PartTimeMüsaitSaatler values(7001,'12:00:00');

insert into PartTimeMüsaitSaatler values(7002,'14:00:00');

insert into PartTimeMüsaitSaatler values(7003,'08:00:00');

insert into PartTimeMüsaitSaatler values(7004,'14:00:00');

insert into PartTimeMüsaitSaatler values(7005,'08:00:00');

insert into PartTimeMüsaitSaatler values(7006,'16:00:00');

insert into PartTimeMüsaitSaatler values(7007,'14:00:00');

insert into PartTimeMüsaitSaatler values(7008,'12:00:00');

insert into PartTimeMüsaitSaatler values(7009,'16:00:00');

insert into PartTimeMüsaitSaatler values(7010,'16:00:00');

insert into PartTimeMüsaitSaatler values(7011,'12:00:00');

insert into PartTimeMüsaitSaatler values(7012,'16:00:00');

insert into PartTimeMüsaitSaatler values(7013,'10:00:00');

insert into PartTimeMüsaitSaatler values(7014,'08:00:00');

insert into PartTimeMüsaitSaatler values(7015,'12:00:00');

insert into PartTimeMüsaitSaatler values(7016,'14:00:00');

insert into PartTimeMüsaitSaatler values(7017,'14:00:00');

insert into PartTimeMüsaitSaatler values(7018,'10:00:00');
insert into PartTimeMüsaitlikDurumu values(682,'perşembe',7000);

insert into PartTimeMüsaitlikDurumu values(683,'cuma',7001);

insert into PartTimeMüsaitlikDurumu values(684,'cuma',7002);

insert into PartTimeMüsaitlikDurumu values(685,'salı',7003);

insert into PartTimeMüsaitlikDurumu values(686,'pazartesi',7004);

insert into PartTimeMüsaitlikDurumu values(687,'cuma',7005);

insert into PartTimeMüsaitlikDurumu values(688,'çarşamba',7006);

insert into PartTimeMüsaitlikDurumu values(689,'pazartesi',7007);

insert into PartTimeMüsaitlikDurumu values(690,'perşembe',7008);

insert into PartTimeMüsaitlikDurumu values(691,'salı',7009);

insert into PartTimeMüsaitlikDurumu values(692,'cuma',7010);

insert into PartTimeMüsaitlikDurumu values(693,'salı',7011);

insert into PartTimeMüsaitlikDurumu values(694,'perşembe',7012);

insert into PartTimeMüsaitlikDurumu values(695,'perşembe',7013);

insert into PartTimeMüsaitlikDurumu values(696,'perşembe',7014);

insert into PartTimeMüsaitlikDurumu values(697,'salı',7015);

insert into PartTimeMüsaitlikDurumu values(698,'çarşamba',7016);

insert into PartTimeMüsaitlikDurumu values(699,'pazartesi',7017);

insert into PartTimeMüsaitlikDurumu values(700,'cuma',7018);


select *from Öğrenci;
