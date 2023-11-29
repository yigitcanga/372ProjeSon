package org.proje.jdbc.model;

public class StokWithErr {
    String dersKodu,dersAdi,stokTuru,miktar,uyariMesaji;

    public StokWithErr() {
    }

    public StokWithErr(String dersKodu, String dersAdi, String stokTuru, String miktar, String uyariMesaji) {
        this.dersKodu = dersKodu;
        this.dersAdi = dersAdi;
        this.stokTuru = stokTuru;
        this.miktar = miktar;
        this.uyariMesaji = uyariMesaji;
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

    public String getUyariMesaji() {
        return uyariMesaji;
    }

    public void setUyariMesaji(String uyariMesaji) {
        this.uyariMesaji = uyariMesaji;
    }

    @Override
    public String toString() {
        return "StokWithErr{" +
                "dersKodu='" + dersKodu + '\'' +
                ", dersAdi='" + dersAdi + '\'' +
                ", stokTuru='" + stokTuru + '\'' +
                ", miktar='" + miktar + '\'' +
                ", uyariMesaji='" + uyariMesaji + '\'' +
                '}';
    }
}
