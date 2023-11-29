package org.proje.jdbc.dao;

import org.proje.jdbc.model.AcilanDers;
import org.proje.jdbc.model.Ders;
import org.proje.jdbc.model.TemizlikPersoneli;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TemizlikPersoneliDAO extends DAO{

    public TemizlikPersoneliDAO() throws Exception {
    }

    public TemizlikPersoneli rowToTemizlikPersoneli(ResultSet resultSet) throws Exception{
        TemizlikPersoneli temizlikPersoneli = new TemizlikPersoneli();
        temizlikPersoneli.setPersonelId(resultSet.getString("personel_id"));
        return temizlikPersoneli;
    }

    public List<TemizlikPersoneli> getAllTemizlikPersoneli() throws Exception {

        List<TemizlikPersoneli> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM temizlikpersoneli");

            while (resultSet.next()){
                TemizlikPersoneli temizlikPersoneli = rowToTemizlikPersoneli(resultSet);
                list.add(temizlikPersoneli);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }
}
