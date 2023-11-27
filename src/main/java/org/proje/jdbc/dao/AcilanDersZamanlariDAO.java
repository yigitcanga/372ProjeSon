package org.proje.jdbc.dao;

import org.proje.jdbc.model.AcilanDersZamanlari;
import org.proje.jdbc.model.AcilanDersZamanlari;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AcilanDersZamanlariDAO extends DAO{

    public AcilanDersZamanlariDAO() throws Exception {
    }

    public AcilanDersZamanlari rowToAcilanDersZamanlari(ResultSet resultSet) throws Exception{

        AcilanDersZamanlari acilanDersZamanlari = new AcilanDersZamanlari();

        acilanDersZamanlari.setDersKodu(resultSet.getString("ders_kodu"));
        acilanDersZamanlari.setGunId(resultSet.getString("gün_id"));
        acilanDersZamanlari.setSaat(resultSet.getString("saat"));
        return acilanDersZamanlari;
    }

    public List<AcilanDersZamanlari> getAllAcilanDersZamanlari() throws Exception {

        List<AcilanDersZamanlari> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM açılanderszamanları");

            while (resultSet.next()){
                AcilanDersZamanlari acilanDersZamanlari = rowToAcilanDersZamanlari(resultSet);
                list.add(acilanDersZamanlari);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }
}
