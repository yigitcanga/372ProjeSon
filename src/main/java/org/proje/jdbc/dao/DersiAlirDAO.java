package org.proje.jdbc.dao;

import org.proje.jdbc.model.Ders;
import org.proje.jdbc.model.DersiAlir;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DersiAlirDAO extends DAO{

    public DersiAlirDAO() throws Exception {
    }

    public DersiAlir rowToDersiAlir(ResultSet resultSet) throws Exception{
        DersiAlir dersiAlir = new DersiAlir();
        dersiAlir.setDersKodu(resultSet.getString("ders_kodu"));
        dersiAlir.setOkulNo(resultSet.getString("okul_no"));
        return dersiAlir;
    }

    public List<DersiAlir> getAllDersiAlir() throws Exception {

        List<DersiAlir> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM dersialır");

            while (resultSet.next()){
                DersiAlir dersiAlir = rowToDersiAlir(resultSet);
                list.add(dersiAlir);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }
}
