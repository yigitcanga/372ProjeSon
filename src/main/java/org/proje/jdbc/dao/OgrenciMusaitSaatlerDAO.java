package org.proje.jdbc.dao;

import org.proje.jdbc.model.OgrenciMusaitSaatler;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OgrenciMusaitSaatlerDAO extends DAO{

    public OgrenciMusaitSaatlerDAO() throws Exception {
    }

    public OgrenciMusaitSaatler rowToOgrenciMusaitSaatler(ResultSet resultSet) throws Exception{
        OgrenciMusaitSaatler ogrenciMusaitSaatler = new OgrenciMusaitSaatler();
        ogrenciMusaitSaatler.setId(resultSet.getString("id"));
        ogrenciMusaitSaatler.setSaat(resultSet.getString("saat"));
        return ogrenciMusaitSaatler;
    }

    public List<OgrenciMusaitSaatler> getAllOgrenciMusaitSaatler() throws Exception {

        List<OgrenciMusaitSaatler> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM ders");

            while (resultSet.next()){
                OgrenciMusaitSaatler ogrenciMusaitSaatler = rowToOgrenciMusaitSaatler(resultSet);
                list.add(ogrenciMusaitSaatler);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }
}
