create TRIGGER after_insert_ogrenci 
AFTER INSERT ON Öğrenci 
FOR EACH ROW INSERT INTO Veli (okul_no, ad, soyad, tel_no, mail)
VALUES (NEW.okul_no, CONCAT('Veli_', NEW.ad), CONCAT('Veli_', NEW.soyad), NEW.tel_no, NEW.mail)