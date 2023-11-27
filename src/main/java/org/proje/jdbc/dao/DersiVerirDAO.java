package org.proje.jdbc.dao;

import org.proje.jdbc.model.Ders;
import org.proje.jdbc.model.DersiAlir;
import org.proje.jdbc.model.DersiVerir;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DersiVerirDAO extends DAO{

    public DersiVerirDAO() throws Exception {
    }

    public DersiVerir rowToDersiVerir(ResultSet resultSet) throws Exception{
        DersiVerir dersiVerir = new DersiVerir();
        dersiVerir.setDersKodu(resultSet.getString("ders_kodu"));
        dersiVerir.setPersonelId(resultSet.getString("personel_id"));
        return dersiVerir;
    }

    public List<DersiVerir> getAllDersiVerir() throws Exception {

        List<DersiVerir> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM dersiverir");

            while (resultSet.next()){
                DersiVerir dersiVerir = rowToDersiVerir(resultSet);
                list.add(dersiVerir);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }
}
