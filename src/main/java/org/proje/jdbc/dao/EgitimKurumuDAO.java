package org.proje.jdbc.dao;

import org.proje.jdbc.model.Ders;
import org.proje.jdbc.model.EgitimKurumu;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EgitimKurumuDAO extends DAO{

    public EgitimKurumuDAO() throws Exception {
    }

    public EgitimKurumu rowToEgitimKurumu(ResultSet resultSet) throws Exception{
        EgitimKurumu egitimKurumu = new EgitimKurumu();
        egitimKurumu.setAdres(resultSet.getString("adres"));
        egitimKurumu.setKurumId(resultSet.getString("kurum_id"));
        egitimKurumu.setKurumAdi(resultSet.getString("kurum_adi"));
        return egitimKurumu;
    }
    public List<EgitimKurumu> getAllEgitimKurumu() throws Exception {

        List<EgitimKurumu> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM eğitimkurumu");

            while (resultSet.next()){
                EgitimKurumu egitimKurumu = rowToEgitimKurumu(resultSet);
                list.add(egitimKurumu);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }

}
