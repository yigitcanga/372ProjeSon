package org.proje.jdbc.dao;

import org.proje.jdbc.model.Dersler;
import org.proje.jdbc.model.Ogrenci;

import java.sql.*;
import java.util.*;

public class OgrenciDAO extends DAO{

    public OgrenciDAO() throws Exception {
        super();
    }

    public Ogrenci rowToOgrenci(ResultSet resultSet) throws Exception {
        Ogrenci ogrenci = new Ogrenci();

        ogrenci.setOkulNo(resultSet.getString("okul_no"));
        ogrenci.setAd(resultSet.getString("ad"));
        ogrenci.setSoyad(resultSet.getString("soyad"));
        ogrenci.setDogumTarihi(resultSet.getDate("doğum_tarihi"));
        ogrenci.setMail(resultSet.getString("mail"));
        ogrenci.setTelNo(resultSet.getString("tel_no"));
        ogrenci.setSinif(resultSet.getString("sınıf"));
        ogrenci.setAdres(resultSet.getString("adres"));
        ogrenci.setMezunMu(resultSet.getBoolean("mezun_mu"));
        ogrenci.setKurumId(resultSet.getString("kurum_id"));
        ogrenci.setTcKimlik(resultSet.getString("tc_kimlik"));

        return ogrenci;
    }
    public Dersler rowToDersler(ResultSet resultSet) throws Exception{
        Dersler dersler = new Dersler();
        dersler.setDers_adi(resultSet.getString("aldığı_ders"));
        dersler.setZaman(resultSet.getString("saat"));
        dersler.setGun(resultSet.getString("gün"));
        return dersler;
    }

    public List<Ogrenci> getAllOgrenci() throws Exception {

        List<Ogrenci> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM öğrenci");

            while (resultSet.next()){
                Ogrenci ogrenci = rowToOgrenci(resultSet);
                list.add(ogrenci);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }
    //attrb could be okul_no ad soyad , value is what is the exact value you are searching for
    public List<Ogrenci> searchForOgrenci(String attrb,String val) throws Exception {

        List<Ogrenci> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        String value="'";
        value=value.concat(val).concat("'");

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM öğrenci WHERE öğrenci." + attrb +" = "+value);
            //resultSet = statement.executeQuery("SELECT * FROM öğrenci WHERE öğrenci.ad='Efe'");

            while (resultSet.next()){
                Ogrenci ogrenci = rowToOgrenci(resultSet);
                list.add(ogrenci);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }

    public List<Dersler> getDersler(String okul_no) throws Exception {

        List<Dersler> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT\t\t\n" +
                    "\tders.ders_adı AS aldığı_ders,\t\t\n" +
                    "\tzaman.saat,\t\t\n" +
                    "\tgün.gün\t\t\n" +
                    "\tFROM\t\t\n" +
                    "\tÖğrenci öğrenci\t\t\n" +
                    "\tJOIN\t\t\n" +
                    "\tDersiAlır alır ON öğrenci.okul_no = alır.okul_no\t\t\n" +
                    "\tJOIN\t\t\n" +
                    "\tAçılanDers ad ON alır.ders_kodu = ad.ders_kodu\t\t\n" +
                    "\tJOIN\t\t\n" +
                    "\tAçılanDersZamanları zaman ON ad.ders_kodu = zaman.ders_kodu\t\t\n" +
                    "\tJOIN\t\t\n" +
                    "\tAçılanDersGünleri gün ON zaman.gün_id = gün.gün_id\t\t\n" +
                    "\tJOIN\t\t\n" +
                    "\tDers ders ON ad.ders_kodu = ders.ders_kodu\t\t\n" +
                    "\tWHERE\t\t\n" +
                    "\töğrenci.okul_no = "+okul_no);

            while (resultSet.next()){
                Dersler dersler = rowToDersler(resultSet);
                list.add(dersler);

            }

        }catch (Exception e){
            throw new Exception(e);
        }
        return list;
    }
}
