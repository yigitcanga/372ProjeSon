package org.proje.jdbc.dao;

import org.proje.jdbc.model.AcilanDers;
import org.proje.jdbc.model.AcilanDers;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AcilanDersDAO extends DAO{
    public AcilanDersDAO() throws Exception {
        super();
    }

    public AcilanDers rowToAcilanDers(ResultSet resultSet) throws Exception {
        AcilanDers acilanDers = new AcilanDers();

        acilanDers.setDersKodu(resultSet.getString("ders_kodu"));
        acilanDers.setKontenjan(resultSet.getString("kontenjan"));
        acilanDers.setTalep(resultSet.getString("talep"));

        return acilanDers;
    }

    public List<AcilanDers> getAllAcilanDers() throws Exception {

        List<AcilanDers> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM açılanders");

            while (resultSet.next()){
                AcilanDers acilanDers = rowToAcilanDers(resultSet);
                list.add(acilanDers);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }
}
