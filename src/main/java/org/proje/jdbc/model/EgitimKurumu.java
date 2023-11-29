package org.proje.jdbc.model;

public class EgitimKurumu {
    String  kurumId,
            kurumAdi,
            adres;

    public EgitimKurumu(String kurumId, String kurumAdi, String adres) {
        this.kurumId = kurumId;
        this.kurumAdi = kurumAdi;
        this.adres = adres;
    }

    public EgitimKurumu() {
    }

    public String getKurumId() {
        return kurumId;
    }

    public void setKurumId(String kurumId) {
        this.kurumId = kurumId;
    }

    public String getKurumAdi() {
        return kurumAdi;
    }

    public void setKurumAdi(String kurumAdi) {
        this.kurumAdi = kurumAdi;
    }

    public String getAdres() {
        return adres;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

    @Override
    public String toString() {
        return "EgitimKurumu{" +
                "kurumId='" + kurumId + '\'' +
                ", kurumAdi='" + kurumAdi + '\'' +
                ", adres='" + adres + '\'' +
                '}';
    }
}
