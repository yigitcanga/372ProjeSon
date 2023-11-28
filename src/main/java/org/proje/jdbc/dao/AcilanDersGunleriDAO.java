package org.proje.jdbc.dao;

import org.proje.jdbc.model.AcilanDersGunleri;
import org.proje.jdbc.model.Ogrenci;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AcilanDersGunleriDAO extends DAO{

    public AcilanDersGunleriDAO() throws Exception {
    }

    public AcilanDersGunleri rowToAcilanDersGunleri(ResultSet resultSet) throws Exception {
        AcilanDersGunleri acilanDersGunleri = new AcilanDersGunleri();

        acilanDersGunleri.setGunId(resultSet.getString("gün_id"));
        acilanDersGunleri.setGun(resultSet.getString("gün"));

        return acilanDersGunleri;
    }

    public List<AcilanDersGunleri> getAllAcilanDersGunleri() throws Exception {

        List<AcilanDersGunleri> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM açılandersgünleri");

            while (resultSet.next()){
                AcilanDersGunleri acilanDersGunleri = rowToAcilanDersGunleri(resultSet);
                list.add(acilanDersGunleri);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }
}
