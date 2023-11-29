package org.proje.jdbc.dao;

import org.proje.jdbc.model.Dersler;
import org.proje.jdbc.model.Ogretmen;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OgretmenDAO extends DAO{
    public OgretmenDAO() throws Exception {
    }
    public Ogretmen rowToOgretmen(ResultSet resultSet) throws Exception{
        Ogretmen ogretmen = new Ogretmen();
        ogretmen.setPersonel_id(resultSet.getString("personel_id"));
        return ogretmen;
    }
    public Dersler rowToDersler(ResultSet resultSet) throws Exception{
        Dersler dersler = new Dersler();
        dersler.setDers_adi(resultSet.getString("verdiği_ders"));
        dersler.setZaman(resultSet.getString("saat"));
        dersler.setGun(resultSet.getString("gün"));
        return dersler;
    }
    public List<Ogretmen> getAllOgretmen() throws Exception {

        List<Ogretmen> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM öğretmen");

            while (resultSet.next()){
                Ogretmen ogretmen = rowToOgretmen(resultSet);
                list.add(ogretmen);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }
    public List<Dersler> getDersler(String personel_id) throws Exception {

        List<Dersler> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT " +
                    "ders.ders_adı AS verdiği_ders," +
                    "zaman.saat," +
                    "gün.gün" +
                    " FROM " +
                    "Öğretmen öğretmen" +
                    " JOIN " +
                    "DersiVerir ders_verir ON öğretmen.personel_id = ders_verir.personel_id" +
                    " JOIN " +
                    "AçılanDers ad ON ders_verir.ders_kodu = ad.ders_kodu" +
                    " JOIN "  +
                    "AçılanDersZamanları zaman ON ad.ders_kodu = zaman.ders_kodu" +
                    " JOIN " +
                    "AçılanDersGünleri gün ON zaman.gün_id = gün.gün_id" +
                    " JOIN " +
                    "Ders ders ON ad.ders_kodu = ders.ders_kodu" +
                    " WHERE " +
                    "öğretmen.personel_id = "+personel_id);

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
