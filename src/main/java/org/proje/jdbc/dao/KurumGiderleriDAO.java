package org.proje.jdbc.dao;

import org.proje.jdbc.model.KurumGiderleri;
import org.proje.jdbc.model.Ogrenci;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class KurumGiderleriDAO extends DAO{

    public KurumGiderleriDAO() throws Exception {
    }

    public KurumGiderleri rowToKurumGiderleri(ResultSet resultSet) throws Exception{
        KurumGiderleri kurumGiderleri = new KurumGiderleri();
        kurumGiderleri.setKurumId(resultSet.getString("kurum_id"));
        kurumGiderleri.setGider(resultSet.getString("gider"));
        kurumGiderleri.setTutar(resultSet.getString("tutar"));
        kurumGiderleri.setGiderId(resultSet.getString("gider_id"));
        kurumGiderleri.setTarih(resultSet.getString("tarih"));
        return kurumGiderleri;
    }

    public List<KurumGiderleri> getAllKurumGiderleri() throws Exception {

        List<KurumGiderleri> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM kurumgiderleri");

            while (resultSet.next()){
                KurumGiderleri kurumGiderleri = rowToKurumGiderleri(resultSet);
                list.add(kurumGiderleri);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }

    public List<KurumGiderleri> searchForGider(String attrb, String val) throws Exception {

        List<KurumGiderleri> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        String value="'";
        value=value.concat(val).concat("'");

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM KurumGiderleri WHERE KurumGiderleri." + attrb +" = "+value);
            //resultSet = statement.executeQuery("SELECT * FROM öğrenci WHERE öğrenci.ad='Efe'");

            while (resultSet.next()){
                KurumGiderleri gider = rowToKurumGiderleri(resultSet);
                list.add(gider);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }

}
