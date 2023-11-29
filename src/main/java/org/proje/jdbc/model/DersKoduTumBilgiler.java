package org.proje.jdbc.model;

public class DersKoduTumBilgiler {
    String dersAdı,kontenjan,talep,saat,gun;

    public DersKoduTumBilgiler() {
    }

    public DersKoduTumBilgiler(String dersAdı, String kontenjan, String talep, String saat, String gun) {
        this.dersAdı = dersAdı;
        this.kontenjan = kontenjan;
        this.talep = talep;
        this.saat = saat;
        this.gun = gun;
    }

    public String getDersAdı() {
        return dersAdı;
    }

    public void setDersAdı(String dersAdı) {
        this.dersAdı = dersAdı;
    }

    public String getKontenjan() {
        return kontenjan;
    }

    public void setKontenjan(String kontenjan) {
        this.kontenjan = kontenjan;
    }

    public String getTalep() {
        return talep;
    }

    public void setTalep(String talep) {
        this.talep = talep;
    }

    public String getSaat() {
        return saat;
    }

    public void setSaat(String saat) {
        this.saat = saat;
    }

    public String getGun() {
        return gun;
    }

    public void setGun(String gun) {
        this.gun = gun;
    }

    @Override
    public String toString() {
        return "DersKoduTumBilgiler{" +
                "dersAdı='" + dersAdı + '\'' +
                ", kontenjan='" + kontenjan + '\'' +
                ", talep='" + talep + '\'' +
                ", saat='" + saat + '\'' +
                ", gun='" + gun + '\'' +
                '}';
    }
}
