package org.proje.jdbc.dao;

import org.proje.jdbc.model.Ders;
import org.proje.jdbc.model.Ogrenci;
import org.proje.jdbc.model.OgrenciMusaitlikDurumu;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OgrenciMusaitlikDurumuDAO extends DAO{

    public OgrenciMusaitlikDurumuDAO() throws Exception {
    }

    public OgrenciMusaitlikDurumu rowToOgrenciMusaitlikDurumu(ResultSet resultSet) throws Exception{
        OgrenciMusaitlikDurumu ogrenciMusaitlikDurumu = new OgrenciMusaitlikDurumu();
        ogrenciMusaitlikDurumu.setGun(resultSet.getString("gün"));
        ogrenciMusaitlikDurumu.setOkulNo(resultSet.getString("okul_no"));
        ogrenciMusaitlikDurumu.setSaatId(resultSet.getString("saat_id"));
        return ogrenciMusaitlikDurumu;
    }

    public List<OgrenciMusaitlikDurumu> getAllDers() throws Exception {

        List<OgrenciMusaitlikDurumu> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM öğrencimüsaitlikdurumu");

            while (resultSet.next()){
                OgrenciMusaitlikDurumu ogrenciMusaitlikDurumu = rowToOgrenciMusaitlikDurumu(resultSet);
                list.add(ogrenciMusaitlikDurumu);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }
}
