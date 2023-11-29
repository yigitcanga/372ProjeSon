package org.proje.jdbc.dao;

import org.proje.jdbc.model.*;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class StokDAO extends DAO{

    public StokDAO() throws Exception {
    }

    public Stok rowToStok(ResultSet resultSet) throws Exception{
        Stok stok = new Stok();
        stok.setStokId(resultSet.getString("stok_id"));
        stok.setStokTuru(resultSet.getString("stok_türü"));
        stok.setKurumId(resultSet.getString("kurum_id"));
        stok.setMiktar(resultSet.getString("miktar"));
        return stok;
    }
    public StokWithErr rowToStokWithErr(ResultSet resultSet) throws Exception{
        StokWithErr stok = new StokWithErr();
        stok.setDersAdi(resultSet.getString("ders_adi"));
        stok.setStokTuru(resultSet.getString("stok_türü"));
        stok.setDersKodu(resultSet.getString("ders_kodu"));
        stok.setMiktar(resultSet.getString("miktar"));
        stok.setUyariMesaji(resultSet.getString("uyari_mesaji"));
        return stok;
    }
    public DersStok rowToDersStok(ResultSet resultSet) throws Exception{
        DersStok stok =new DersStok();
        stok.setDersKodu(resultSet.getString("ders_kodu"));
        stok.setDersAdi(resultSet.getString("ders_adı"));
        stok.setMiktar(resultSet.getString("miktar"));
        stok.setStokTuru(resultSet.getString("stok_türü"));
        return stok;
    }

    public List<Stok> getAllStok() throws Exception {

        List<Stok> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM stok");

            while (resultSet.next()){
                Stok stok = rowToStok(resultSet);
                list.add(stok);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }

    public List<StokWithErr> getAllStokWithErr() throws Exception {

        List<StokWithErr> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT\t\t\n" +
                    "\tad.ders_kodu,\t\t\n" +
                    "\tders.ders_adı AS ders_adi,\t\t\n" +
                    "\tstok.stok_türü,\t\t\n" +
                    "\tstok.miktar,\t\t\n" +
                    "\tCASE\t\t\n" +
                    "\tWHEN stok.miktar < 60000 THEN 'Uyarı: Stok miktarı 60000den küçük!'" +
                    "\tELSE NULL\t\t\n" +
                    "\tEND AS uyari_mesaji\t\t\n" +
                    "\tFROM\t\t\n" +
                    "\tAçılanDers ad\t\t\n" +
                    "\tJOIN\t\t\n" +
                    "\tDers ders ON ad.ders_kodu = ders.ders_kodu\t\t\n" +
                    "\tJOIN\t\t\n" +
                    "\tKullanır kullanır ON ad.ders_kodu = kullanır.ders_kodu\t\t\n" +
                    "\tJOIN\t\t\n" +
                    "\tStok stok ON kullanır.stok_id = stok.stok_id;");

            while (resultSet.next()){
                StokWithErr stok = rowToStokWithErr(resultSet);
                list.add(stok);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }

    public List<Stok> searchForStok(String attrb, String val) throws Exception {

        List<Stok> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        String value="'";
        value=value.concat(val).concat("'");

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM Stok WHERE stok." + attrb +" = "+value);
            //resultSet = statement.executeQuery("SELECT * FROM öğrenci WHERE öğrenci.ad='Efe'");

            while (resultSet.next()){
                Stok stok = rowToStok(resultSet);
                list.add(stok);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }

    public List<DersStok> getAllDersStok() throws Exception {

        List<DersStok> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;


        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT " +
                    " ad.ders_kodu, " +
                    " ders.ders_adı AS ders_adi, " +
                    " stok.stok_türü, " +
                    " stok.miktar " +
                    " FROM " +
                    " AçılanDers ad " +
                    " JOIN " +
                    " Ders ders ON ad.ders_kodu = ders.ders_kodu " +
                    " JOIN " +
                    " Kullanır kullanır ON ad.ders_kodu = kullanır.ders_kodu " +
                    " JOIN " +
                    " Stok stok ON kullanır.stok_id = stok.stok_id;");

            while (resultSet.next()){
                DersStok stok = rowToDersStok(resultSet);
                list.add(stok);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }

    public List<DersStok> searchForDersStok(String val) throws Exception {

        List<DersStok> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        String value="'";
        value=value.concat(val).concat("'");


        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT " +
                    " ad.ders_kodu, " +
                    " ders.ders_adı AS ders_adi, " +
                    " stok.stok_türü, " +
                    " stok.miktar " +
                    " FROM " +
                    " AçılanDers ad " +
                    " JOIN " +
                    " Ders ders ON ad.ders_kodu = ders.ders_kodu " +
                    " JOIN " +
                    " Kullanır kullanır ON ad.ders_kodu = kullanır.ders_kodu " +
                    " JOIN " +
                    " Stok stok ON kullanır.stok_id = stok.stok_id" +
                    " where ad.ders_kodu="+value);

            while (resultSet.next()){
                DersStok stok = rowToDersStok(resultSet);
                list.add(stok);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }
}
