package org.proje.jdbc.model;

public class AcilanDersZamanlari {

    String  dersKodu,
            gunId,
            saat;

    public AcilanDersZamanlari(String dersKodu, String gunId, String saat) {
        this.dersKodu = dersKodu;
        this.gunId = gunId;
        this.saat = saat;
    }

    public AcilanDersZamanlari() {
    }

    public String getDersKodu() {
        return dersKodu;
    }

    public void setDersKodu(String dersKodu) {
        this.dersKodu = dersKodu;
    }

    public String getGunId() {
        return gunId;
    }

    public void setGunId(String gunId) {
        this.gunId = gunId;
    }

    public String getSaat() {
        return saat;
    }

    public void setSaat(String saat) {
        this.saat = saat;
    }

    @Override
    public String toString() {
        return "AcilanDersZamanlari{" +
                "dersKodu='" + dersKodu + '\'' +
                ", gunId='" + gunId + '\'' +
                ", saat='" + saat + '\'' +
                '}';
    }
}
