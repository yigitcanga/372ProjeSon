package org.proje.jdbc.dao;

import org.proje.jdbc.model.Personel;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PersonelDAO extends DAO{

    public PersonelDAO() throws Exception {
    }

    public Personel rowToPersonel(ResultSet resultSet) throws Exception{
        Personel personel = new Personel();
        personel.setPersonelId(resultSet.getString("personel_id"));
        personel.setAd(resultSet.getString("ad"));
        personel.setAdres(resultSet.getString("adres"));
        personel.setMail(resultSet.getString("mail"));
        personel.setSoyad(resultSet.getString("soyad"));
        personel.setKurumId(resultSet.getString("kurum_id"));
        personel.setMaas(resultSet.getString("maaş"));
        personel.setTcKimlik(resultSet.getString("tc_limlik"));
        personel.setTelNo(resultSet.getString("tel_no"));
        return personel;
    }

    public List<Personel> getAllPersonel() throws Exception {

        List<Personel> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM personel");

            while (resultSet.next()){
                Personel personel = rowToPersonel(resultSet);
                list.add(personel);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }
}
