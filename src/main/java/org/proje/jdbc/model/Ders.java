package org.proje.jdbc.model;

public class Ders {

    String  dersKodu,
            dersAdi;

    public Ders(String dersKodu, String dersAdi) {
        this.dersKodu = dersKodu;
        this.dersAdi = dersAdi;
    }

    public Ders() {
    }

    public String getDersKodu() {
        return dersKodu;
    }

    public void setDersKodu(String dersKodu) {
        this.dersKodu = dersKodu;
    }

    public String getDersAdi() {
        return dersAdi;
    }

    public void setDersAdi(String dersAdi) {
        this.dersAdi = dersAdi;
    }

    @Override
    public String toString() {
        return "Ders{" +
                "dersKodu='" + dersKodu + '\'' +
                ", dersAdi='" + dersAdi + '\'' +
                '}';
    }
}
