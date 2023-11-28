package org.proje.jdbc.dao;

import org.proje.jdbc.model.Ders;
import org.proje.jdbc.model.Ogrenci;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Properties;

public class DAO {
    protected Connection con;

    public DAO() throws Exception {

        Properties p = new Properties();
        InputStream in = getClass().getResourceAsStream("/mysql.properties");
        p.load(in);

        String url = p.getProperty("url");
        String username = p.getProperty("username");
        String password = p.getProperty("password");

        con = DriverManager.getConnection(url, username, password);
        System.out.println("Connected");
    }

}
