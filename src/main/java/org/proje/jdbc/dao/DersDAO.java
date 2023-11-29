package org.proje.jdbc.dao;

import org.proje.jdbc.model.Ders;
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

}
