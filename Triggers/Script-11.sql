CREATE TRIGGER before_delete_personel
BEFORE DELETE ON Personel
FOR EACH ROW
DELETE FROM temizlikpersoneli t WHERE personel_id = OLD.personel_id;

CREATE TRIGGER before_delete_personelfull
BEFORE DELETE ON Personel
FOR EACH ROW
DELETE FROM fulltimeçalışan t WHERE personel_id = OLD.personel_id;

CREATE TRIGGER before_delete_personelpart
BEFORE DELETE ON Personel
FOR EACH ROW
DELETE FROM parttimeçalışan t WHERE personel_id = OLD.personel_id;

CREATE TRIGGER before_delete_partmusaitlik
BEFORE DELETE ON ParttimeÇalışan
FOR EACH ROW
DELETE FROM parttimemüsaitlikdurumu p WHERE personel_id = OLD.personel_id;

CREATE TRIGGER before_delete_dersiverir
BEFORE DELETE ON Personel
FOR EACH ROW
DELETE FROM dersiverir d WHERE personel_id = OLD.personel_id;

CREATE TRIGGER before_delete_öğretmen
BEFORE DELETE ON Personel
FOR EACH ROW
DELETE FROM öğretmen d WHERE personel_id = OLD.personel_id;