package org.proje.jdbc.model;

public class Kullanir {

    String  dersKodu,
            stokId;

    public Kullanir(String dersKodu, String stokId) {
        this.dersKodu = dersKodu;
        this.stokId = stokId;
    }

    public Kullanir() {
    }

    public String getDersKodu() {
        return dersKodu;
    }

    public void setDersKodu(String dersKodu) {
        this.dersKodu = dersKodu;
    }

    public String getStokId() {
        return stokId;
    }

    public void setStokId(String stokId) {
        this.stokId = stokId;
    }

    @Override
    public String toString() {
        return "Kullanir{" +
                "dersKodu='" + dersKodu + '\'' +
                ", stokId='" + stokId + '\'' +
                '}';
    }
}
