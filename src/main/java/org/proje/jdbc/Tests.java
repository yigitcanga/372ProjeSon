package org.proje.jdbc;

import org.proje.jdbc.dao.AcilanDersDAO;
import org.proje.jdbc.dao.DersDAO;
import org.proje.jdbc.dao.OgrenciDAO;
import org.proje.jdbc.dao.StokDAO;
import org.proje.jdbc.model.*;

import java.io.IOException;
import java.util.List;

public class Tests {
    public static void main(String[] args) throws Exception {


        try {
            StokDAO sdao = new StokDAO();
            List<StokWithErr> list11 =sdao.getAllStokWithErr();
            for (StokWithErr ders : list11) {
                System.out.println(ders);
            }
            /*OgrenciDAO odao = new OgrenciDAO();
            List< Ogrenci > list =odao.getAllOgrenci();
            for (Ogrenci ogrenci : list) {
                System.out.println(ogrenci);
            }
            List<Ogrenci> search = odao.searchForOgrenci("okul_no", "500");
            for (Ogrenci ogrenci : search) {
                System.out.println(ogrenci);
            }*/

            AcilanDersDAO acilanDersDAO = new AcilanDersDAO();
            List<AcilanDers> list1 = acilanDersDAO.getAllAcilanDers();
            for(AcilanDers acilanDers: list1){
                System.out.println(acilanDers);
            }

            DersDAO dersDAO = new DersDAO();
            List<Ders> list2 = dersDAO.getAllDers();
            for(Ders ders: list2){
                System.out.println(ders);
            }

        }catch (Exception e) {
            System.out.println(e.getMessage());
        }

        /*
        String url = "jdbc:mysql://localhost:3306/test_db";
        String username = "root";
        String password = "1234";

        try (Connection connection = DriverManager.getConnection(url, username, password)) {
            System.out.println("Connected");



            Statement st = connection.createStatement();
            /*
            ResultSet res = st.executeQuery("SELECT y.isim AS Yolcuİsmi, \n" +
                    "COUNT(ys.otobus_seyahati_id) AS SeyahatSayısı\n" +
                    "FROM yolcu as y\n" +
                    "\tINNER JOIN yolcuseyahati AS ys\n" +
                    "\t\tON y.id = ys.yolcu_id\n" +
                    "GROUP BY y.isim ;");
            while (res.next()) {
                System.out.println(res.getString("Yolcuİsmi")+" "+res.getDate("SeyahatSayısı"));
            }

            ResultSet resultSet = st.executeQuery("SELECT * FROM öğrenci");
            while (resultSet.next()) {
                System.out.println(resultSet.getDate("doğum_tarihi"));
            }


        } catch (SQLException e) {
            throw new IllegalStateException("Cannot connect the database!", e);
        }*/


    }
}