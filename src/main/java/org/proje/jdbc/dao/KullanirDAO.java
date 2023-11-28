package org.proje.jdbc.dao;

import org.proje.jdbc.model.Ders;
import org.proje.jdbc.model.Kullanir;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class KullanirDAO extends DAO{
    public KullanirDAO() throws Exception {
    }

    public Kullanir rowToKullanir(ResultSet resultSet) throws Exception{
        Kullanir kullanir = new Kullanir();
        kullanir.setDersKodu(resultSet.getString("ders_kodu"));
        kullanir.setStokId(resultSet.getString("stok_id"));
        return kullanir;
    }

    public List<Kullanir> getAllKullanir() throws Exception {

        List<Kullanir> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM kullanır");

            while (resultSet.next()){
                Kullanir kullanir = rowToKullanir(resultSet);
                list.add(kullanir);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }
}
