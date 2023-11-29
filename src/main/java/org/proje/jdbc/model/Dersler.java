package org.proje.jdbc.model;

public class Dersler {
    String  ders_adi,zaman,gun;

    public Dersler() {
    }

    public Dersler(String ders_adi, String zaman, String gun) {
        this.ders_adi = ders_adi;
        this.zaman = zaman;
        this.gun = gun;
    }

    public String getDers_adi() {
        return ders_adi;
    }

    public void setDers_adi(String ders_adi) {
        this.ders_adi = ders_adi;
    }

    public String getZaman() {
        return zaman;
    }

    public void setZaman(String zaman) {
        this.zaman = zaman;
    }

    public String getGun() {
        return gun;
    }

    public void setGun(String gun) {
        this.gun = gun;
    }
}
