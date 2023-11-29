package org.proje.jdbc.dao;

import org.proje.jdbc.model.Ders;
import org.proje.jdbc.model.DersKoduTumBilgiler;
import org.proje.jdbc.model.Ogrenci;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DersDAO extends DAO{

    public DersDAO() throws Exception {
    }

    public Ders rowToDers(ResultSet resultSet) throws Exception{
        Ders ders = new Ders();

        ders.setDersKodu(resultSet.getString("ders_kodu"));
        ders.setDersAdi(resultSet.getString("ders_adı"));
        return ders;
    }

    private DersKoduTumBilgiler rowToDersTumBilgiler(ResultSet resultSet) throws Exception{
        DersKoduTumBilgiler ders = new DersKoduTumBilgiler();
        ders.setDersAdı(resultSet.getString("ders_adı"));
        ders.setKontenjan(resultSet.getString("kontenjan"));
        ders.setTalep(resultSet.getString("talep"));
        ders.setSaat(resultSet.getString("saat"));
        ders.setGun(resultSet.getString("gün"));
        return ders;
    }

    public List<Ders> getAllDers() throws Exception {

        List<Ders> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM ders");

            while (resultSet.next()){
                Ders ders = rowToDers(resultSet);
                list.add(ders);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }

    public List<Ders> searchForDers(String attrb,String val) throws Exception {

        List<Ders> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        String value="'";
        value=value.concat(val).concat("'");

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM ders WHERE ders." + attrb +" = "+value);
            //resultSet = statement.executeQuery("SELECT * FROM öğrenci WHERE öğrenci.ad='Efe'");

            while (resultSet.next()){
                Ders ders = rowToDers(resultSet);
                list.add(ders);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }

    public List<DersKoduTumBilgiler> searchForDersAllAttrb(String val) throws Exception {

        List<DersKoduTumBilgiler> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        String value="'";
        value=value.concat(val).concat("'");

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT\t\t\n" +
                    "\tders.ders_adı,\t\t\n" +
                    "\tad.kontenjan,\t\t\n" +
                    "\tad.talep,\t\t\n" +
                    "\tzaman.saat,\t\t\n" +
                    "\tgun.gün\t\t\n" +
                    "\tFROM\t\t\n" +
                    "\tDers ders\t\t\n" +
                    "\tJOIN\t\t\n" +
                    "\tAçılanDers ad ON ders.ders_kodu = ad.ders_kodu\t\t\n" +
                    "\tJOIN\t\t\n" +
                    "\tAçılanDersZamanları zaman ON ad.ders_kodu = zaman.ders_kodu\t\t\n" +
                    "\tJOIN\t\t\n" +
                    "\tAçılanDersGünleri gun ON zaman.gün_id = gun.gün_id\t\t\n" +
                    "\tWHERE\t\t\n" +
                    "\tders.ders_kodu = "+val);
            //resultSet = statement.executeQuery("SELECT * FROM öğrenci WHERE öğrenci.ad='Efe'");

            while (resultSet.next()){
                DersKoduTumBilgiler ders = rowToDersTumBilgiler(resultSet);
                list.add(ders);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }



}
