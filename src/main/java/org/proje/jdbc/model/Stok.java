package org.proje.jdbc.model;

public class Stok {

    String  stokId,
            stokTuru,
            miktar,
            kurumId;

    public Stok(String stokId, String stokTuru, String miktar, String kurumId) {
        this.stokId = stokId;
        this.stokTuru = stokTuru;
        this.miktar = miktar;
        this.kurumId = kurumId;
    }

    public Stok() {
    }

    public String getStokId() {
        return stokId;
    }

    public void setStokId(String stokId) {
        this.stokId = stokId;
    }

    public String getStokTuru() {
        return stokTuru;
    }

    public void setStokTuru(String stokTuru) {
        this.stokTuru = stokTuru;
    }

    public String getMiktar() {
        return miktar;
    }

    public void setMiktar(String miktar) {
        this.miktar = miktar;
    }

    public String getKurumId() {
        return kurumId;
    }

    public void setKurumId(String kurumId) {
        this.kurumId = kurumId;
    }

    @Override
    public String toString() {
        return "Stok{" +
                "stokId='" + stokId + '\'' +
                ", stokTuru='" + stokTuru + '\'' +
                ", miktar='" + miktar + '\'' +
                ", kurumId='" + kurumId + '\'' +
                '}';
    }
}
