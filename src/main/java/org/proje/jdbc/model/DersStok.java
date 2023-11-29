package org.proje.jdbc.model;

public class DersStok {
    String dersKodu,dersAdi,stokTuru,miktar;

    public DersStok() {
    }

    public DersStok(String dersKodu, String dersAdi, String stokTuru, String miktar) {
        this.dersKodu = dersKodu;
        this.dersAdi = dersAdi;
        this.stokTuru = stokTuru;
        this.miktar = miktar;
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

    @Override
    public String toString() {
        return "DersStok{" +
                "dersKodu='" + dersKodu + '\'' +
                ", dersAdi='" + dersAdi + '\'' +
                ", stokTuru='" + stokTuru + '\'' +
                ", miktar='" + miktar + '\'' +
                '}';
    }
}
