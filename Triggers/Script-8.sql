-- Trigger 1:
CREATE TRIGGER before_delete_dersialir
BEFORE DELETE ON Öğrenci
FOR EACH ROW
DELETE FROM dersialır WHERE okul_no = OLD.okul_no;
-- Trigger 2:
CREATE TRIGGER before_delete_veli
BEFORE DELETE ON Öğrenci
FOR EACH ROW
DELETE FROM Veli WHERE okul_no = OLD.okul_no;
-- Trigger 3:
CREATE TRIGGER before_delete_ogrencimusa
BEFORE DELETE ON Öğrenci
FOR EACH ROW
DELETE FROM öğrencimüsaitlikdurumu WHERE okul_no = OLD.okul_no;