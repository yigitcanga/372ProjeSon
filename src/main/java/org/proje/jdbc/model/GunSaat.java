package org.proje.jdbc.model;

public class GunSaat {
    String gun,saat;

    public GunSaat() {
    }

    public GunSaat(String gun, String saat) {
        this.gun = gun;
        this.saat = saat;
    }

    public String getGun() {
        return gun;
    }

    public void setGun(String gun) {
        this.gun = gun;
    }

    public String getSaat() {
        return saat;
    }

    public void setSaat(String saat) {
        this.saat = saat;
    }
}
