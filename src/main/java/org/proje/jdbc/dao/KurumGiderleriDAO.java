package org.proje.jdbc.dao;

import org.proje.jdbc.model.*;
import org.proje.jdbc.model.AylikGider;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class KurumGiderleriDAO extends DAO{

    public KurumGiderleriDAO() throws Exception {
    }

    public KurumGiderleri rowToKurumGiderleri(ResultSet resultSet) throws Exception{
        KurumGiderleri kurumGiderleri = new KurumGiderleri();
        kurumGiderleri.setKurumId(resultSet.getString("kurum_id"));
        kurumGiderleri.setGider(resultSet.getString("gider"));
        kurumGiderleri.setTutar(resultSet.getString("tutar"));
        kurumGiderleri.setGiderId(resultSet.getString("gider_id"));
        kurumGiderleri.setTarih(resultSet.getString("tarih"));
        return kurumGiderleri;
    }


    public void addGider(KurumGiderleri theGider) throws Exception{

        PreparedStatement statement = null;

        try {
            statement = super.con.prepareStatement("insert into kurumgiderleri" + " (gider_id, gider, tutar, kurum_id, tarih)" + " values (?, ?, ?, ?, ?)");

            statement.setString(1, theGider.getGiderId());
            statement.setString(2, theGider.getGider());
            statement.setString(3, theGider.getTutar());
            statement.setString(4, theGider.getKurumId());
            statement.setString(5, theGider.getTarih());

            statement.executeUpdate();
        }
        catch (Exception e){
            throw new Exception(e);
        }

    }
    public HaftalikGider rowToHaftalikGider(ResultSet r) throws Exception{
        HaftalikGider h=new HaftalikGider();
        h.setWeekStart(r.getString("week_start"));
        h.setWeekEnd(r.getString("week_end"));
        h.setTotalTutar(r.getString("total_tutar"));
        return h;
    }
    public AylikGider rowToAylikGider(ResultSet r) throws Exception{
        AylikGider a = new AylikGider();
        a.setMonthStart(r.getString("month_start"));
        a.setMonthEnd(r.getString("month_end"));
        a.setTotalTutar(r.getString("total_tutar"));
        return a;
    }

    public List<KurumGiderleri> getAllKurumGiderleri() throws Exception {

        List<KurumGiderleri> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM kurumgiderleri");

            while (resultSet.next()){
                KurumGiderleri kurumGiderleri = rowToKurumGiderleri(resultSet);
                list.add(kurumGiderleri);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }
    public List<AylikGider> getAylikDokum() throws Exception {

        List<AylikGider> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT \n" +
                    "  all_months.month_start,\n" +
                    "  LAST_DAY(all_months.month_start) AS month_end,\n" +
                    "  COALESCE(SUM(kg.tutar) , 0) AS total_tutar\n" +
                    "FROM (\n" +
                    "  SELECT \n" +
                    "    DATE_FORMAT(DATE_ADD('2023-01-01', INTERVAL n MONTH), '%Y-%m-01') AS month_start\n" +
                    "  FROM (\n" +
                    "  SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL\n" +
                    "  SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL\n" +
                    "  SELECT 10 UNION ALL SELECT 11\n" +
                    "  ) AS numbers \n" +
                    "  ) AS all_months\n" +
                    "  LEFT JOIN KurumGiderleri kg ON all_months.month_start = DATE_FORMAT(kg.tarih, '%Y-%m-01')\n" +
                    "  GROUP BY all_months.month_start \n" +
                    "  ORDER BY all_months.month_start;\n");


            while (resultSet.next()){
                AylikGider kurumGiderleri = rowToAylikGider(resultSet);
                list.add(kurumGiderleri);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }

    public List<HaftalikGider> getHaftalikDokum() throws Exception {

        List<HaftalikGider> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT \n" +
                    "  all_weeks.week_start,\n" +
                    "  all_weeks.week_end,\n" +
                    "  COALESCE(SUM(kg.tutar), 0) AS total_tutar\n" +
                    "FROM (\n" +
                    "  SELECT \n" +
                    "    start_of_week AS week_start,\n" +
                    "    DATE_ADD(start_of_week, INTERVAL 6 DAY) AS week_end\n" +
                    "  FROM (\n" +
                    "    SELECT \n" +
                    "      MIN(tarih) AS start_of_week\n" +
                    "    FROM KurumGiderleri\n" +
                    "    GROUP BY YEAR(tarih), MONTH(tarih), FLOOR(DAY(tarih) / 7)\n" +
                    "  ) Weeks\n" +
                    "  UNION ALL\n" +
                    "  SELECT \n" +
                    "    DATE_ADD(MAX(week_start), INTERVAL 7 DAY) AS week_start,\n" +
                    "    DATE_ADD(MAX(DATE_ADD(week_start, INTERVAL 6 DAY)), INTERVAL 7 DAY) AS week_end\n" +
                    "  FROM (\n" +
                    "    SELECT \n" +
                    "      MIN(tarih) AS week_start\n" +
                    "    FROM KurumGiderleri\n" +
                    "    GROUP BY YEAR(tarih), MONTH(tarih), FLOOR(DAY(tarih) / 7)\n" +
                    "  ) Weeks\n" +
                    ") all_weeks\n" +
                    "LEFT JOIN KurumGiderleri kg ON all_weeks.week_start <= kg.tarih AND kg.tarih <= all_weeks.week_end\n" +
                    "GROUP BY all_weeks.week_start, all_weeks.week_end \n" +
                    "ORDER BY all_weeks.week_start;");


            while (resultSet.next()){
                HaftalikGider kurumGiderleri = rowToHaftalikGider(resultSet);
                list.add(kurumGiderleri);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }

    public List<KurumGiderleri> searchForGider(String attrb, String val) throws Exception {

        List<KurumGiderleri> list = new ArrayList<>();

        Statement statement = null;
        ResultSet resultSet = null;

        String value="'";
        value=value.concat(val).concat("'");

        try {

            statement = super.con.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM KurumGiderleri WHERE KurumGiderleri." + attrb +" = "+value);
            //resultSet = statement.executeQuery("SELECT * FROM öğrenci WHERE öğrenci.ad='Efe'");

            while (resultSet.next()){
                KurumGiderleri gider = rowToKurumGiderleri(resultSet);
                list.add(gider);

            }

        } catch (Exception e) {
            throw new Exception(e);
        }

        return  list;
    }

}
