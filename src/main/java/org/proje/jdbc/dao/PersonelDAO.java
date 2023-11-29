package org.proje.jdbc.dao;

import org.proje.jdbc.model.GunSaat;
import org.proje.jdbc.model.Ogrenci;
import org.proje.jdbc.model.PTurCalisan;
import org.proje.jdbc.model.Personel;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PersonelDAO extends DAO{

    public PersonelDAO() throws Exception {
    }

    public Personel rowToPersonel(ResultSet resultSet) throws Exception{
        Personel personel = new Personel();
        personel.setPersonelId(resultSet.getString("personel_id"));
        personel.setAd(resultSet.getString("ad"));
        personel.setAdres(resultSet.getString("adres"));
        personel.setMail(resultSet.getString("mail"));
        personel.setSoyad(resultSet.getString("soyad"));
        personel.setKurumId(resultSet.getString("kurum_id"));
        personel.setMaas(resultSet.getString("maaş"));
        personel.setTcKimlik(resultSet.getString("tc_kimlik"));
        personel.setTelNo(resultSet.getString("tel_no"));
        return personel;
    }
    public GunSaat rowToGS(ResultSet r) throws Exception{
        GunSaat gs = new GunSaat();
        gs.setSaat(r.getString("saat"));
        gs.setGun(r.getString("gün"));
        return gs;
    }
    public List<GunSaat> getAllGS(String val) throws Exception {

        List<GunSaat> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        String value="'";
        value=value.concat(val).concat("'");

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT pm.gün, ms.saat\n" +
                    "\tFROM Personel p\n" +
                    "\tJOIN PartTimeMüsaitlikDurumu pm ON p.personel_id = pm.personel_id\n" +
                    "\tJOIN MüsaitSaatler ms ON pm.saat_id = ms.id\n" +
                    "\tWHERE p.personel_id  = "+value);

            while (resultSet.next()){
                GunSaat gs = rowToGS(resultSet);
                list.add(gs);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }

    public PTurCalisan rowToPTC(ResultSet r) throws Exception{
        PTurCalisan p = new PTurCalisan();
        p.setPersonel_id(r.getString("personel_id"));
        p.setAd(r.getString("ad"));
        p.setSoyad(r.getString("soyad"));
        p.setpTur(r.getString("personel_türü"));
        p.setcTur(r.getString("çalışan_türü"));
        return p;
    }
    public List<PTurCalisan> getPTC(String val) throws Exception {

        List<PTurCalisan> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        String value = "'";
        value = value.concat(val).concat("'");

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT -- Girilen personelin türünü getiriyor\n" +
                    "  p.personel_id,\n" +
                    "  p.ad, \n" +
                    "  p.soyad,\n" +
                    "  CASE\n" +
                    "    WHEN ip.personel_id IS NOT NULL THEN 'İdari Personel'\n" +
                    "    WHEN tp.personel_id IS NOT NULL THEN 'Temizlik Personeli'\n" +
                    "    WHEN og.personel_id IS NOT NULL THEN 'Öğretmen'\n" +
                    "    ELSE 'Bunlar dışında personel olamaz!'\n" +
                    "  END AS personel_türü,\n" +
                    "  CASE\n" +
                    "    WHEN ft.personel_id IS NOT NULL THEN 'Full Time Çalışan'\n" +
                    "    WHEN pt.personel_id IS NOT NULL THEN 'Part Time Çalışan'\n" +
                    "    ELSE 'Çalışan türü full time veya part time olmalıdır'\n" +
                    "  END AS çalışan_türü\n" +
                    "FROM Personel p\n" +
                    "LEFT JOIN İdariPersonel ip ON p.personel_id = ip.personel_id\n" +
                    "LEFT JOIN TemizlikPersoneli tp ON p.personel_id = tp.personel_id \n" +
                    "LEFT JOIN Öğretmen og ON p.personel_id = og.personel_id\n" +
                    "LEFT JOIN FullTimeÇalışan ft ON p.personel_id = ft.personel_id\n" +
                    "LEFT JOIN PartTimeÇalışan pt ON p.personel_id = pt.personel_id\n" +
                    "WHERE p.personel_id =" + value);

            while (resultSet.next()) {
                PTurCalisan p = rowToPTC(resultSet);
                list.add(p);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return list;
    }

    public List<Personel> getAllPersonel() throws Exception {

        List<Personel> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM personel");

            while (resultSet.next()){
                Personel personel = rowToPersonel(resultSet);
                list.add(personel);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return list;
    }

    public List<Personel> searchForPersonel(String attrb, String val) throws Exception {

        List<Personel> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        String value="'";
        value=value.concat(val).concat("'");

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM personel WHERE personel." + attrb +" = "+value);
            //resultSet = statement.executeQuery("SELECT * FROM personel WHERE personel.ad='Efe'");

            while (resultSet.next()){
                Personel personel = rowToPersonel(resultSet);
                list.add(personel);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }
}
