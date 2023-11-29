package org.proje.jdbc.dao;

import org.proje.jdbc.model.*;
import org.proje.jdbc.model.AylikGider;

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
                    "  month_start,\n" +
                    "  LAST_DAY(month_start) AS month_end,\n" +
                    "  COALESCE(SUM(tutar)/2, 0) AS total_tutar\n" +
                    "FROM (\n" +
                    "  SELECT \n" +
                    "    DATE_FORMAT(tarih, '%Y-%m-01') AS month_start\n" +
                    "  FROM KurumGiderleri\n" +
                    "  WHERE gider_id = 5003\n" +
                    "  GROUP BY month_start\n" +
                    "  UNION ALL\n" +
                    "  SELECT \n" +
                    "    DATE_FORMAT(MAX(month_start), '%Y-%m-01') AS month_start\n" +
                    "  FROM (\n" +
                    "    SELECT \n" +
                    "      DATE_FORMAT(tarih, '%Y-%m-01') AS month_start\n" +
                    "    FROM KurumGiderleri\n" +
                    "    WHERE gider_id = 5003\n" +
                    "    GROUP BY month_start\n" +
                    "  ) months\n" +
                    ") DateSequence\n" +
                    "LEFT JOIN KurumGiderleri ON DateSequence.month_start = DATE_FORMAT(KurumGiderleri.tarih, '%Y-%m-01')\n" +
                    "GROUP BY month_start\n" +
                    "ORDER BY month_start;");

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
                    "  week_start,\n" +
                    "  week_end,\n" +
                    "  COALESCE(SUM(tutar), 0) AS total_tutar\n" +
                    "FROM (\n" +
                    "  SELECT \n" +
                    "    start_of_week AS week_start,\n" +
                    "    DATE_ADD(start_of_week, INTERVAL 6 DAY) AS week_end\n" +
                    "  FROM (\n" +
                    "    SELECT \n" +
                    "      MIN(tarih) AS start_of_week,\n" +
                    "      FLOOR(DATEDIFF(tarih, (SELECT MIN(tarih) FROM KurumGiderleri WHERE gider_id = 5003)) / 7) AS week_number\n" +
                    "    FROM KurumGiderleri\n" +
                    "    WHERE gider_id = 5003\n" +
                    "    GROUP BY week_number\n" +
                    "  ) Weeks\n" +
                    "  UNION ALL\n" +
                    "  SELECT \n" +
                    "    DATE_ADD(MAX(week_start), INTERVAL 7 DAY) AS week_start,\n" +
                    "    DATE_ADD(MAX(DATE_ADD(week_start, INTERVAL 6 DAY)), INTERVAL 7 DAY) AS week_end\n" +
                    "  FROM (\n" +
                    "    SELECT \n" +
                    "      MIN(tarih) AS week_start,\n" +
                    "      FLOOR(DATEDIFF(tarih, (SELECT MIN(tarih) FROM KurumGiderleri WHERE gider_id = 5003)) / 7) AS week_number\n" +
                    "    FROM KurumGiderleri\n" +
                    "    WHERE gider_id = 5003\n" +
                    "    GROUP BY week_number\n" +
                    "  ) Weeks\n" +
                    ") DateSequence\n" +
                    "LEFT JOIN KurumGiderleri ON DateSequence.week_start <= KurumGiderleri.tarih AND KurumGiderleri.tarih <= DateSequence.week_end\n" +
                    "GROUP BY week_start, week_end \n" +
                    "ORDER BY week_start;");

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
