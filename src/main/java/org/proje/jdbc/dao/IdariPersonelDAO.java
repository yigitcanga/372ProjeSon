package org.proje.jdbc.dao;

import org.proje.jdbc.model.Ders;
import org.proje.jdbc.model.IdariPersonel;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class IdariPersonelDAO extends DAO{

    public IdariPersonelDAO() throws Exception {
    }

    public IdariPersonel rowToIdariPersonel(ResultSet resultSet) throws Exception{
        IdariPersonel idariPersonel = new IdariPersonel();
        idariPersonel.setPersonelId(resultSet.getString("personel_id"));
        return idariPersonel;
    }

    public List<IdariPersonel> getAllIdariPersonel() throws Exception {

        List<IdariPersonel> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM idaripersonel");

            while (resultSet.next()){
                IdariPersonel idariPersonel = rowToIdariPersonel(resultSet);
                list.add(idariPersonel);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }
}
