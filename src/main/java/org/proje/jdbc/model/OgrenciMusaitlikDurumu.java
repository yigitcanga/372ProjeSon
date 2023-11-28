package org.proje.jdbc.model;

import java.util.Calendar;

public class OgrenciMusaitlikDurumu {
    String okulNo;
    String gun;
    String saatId;

    public OgrenciMusaitlikDurumu(String okulNo, String gun, String saatId) {
        this.okulNo = okulNo;
        this.gun = gun;
        this.saatId = saatId;
    }

    public OgrenciMusaitlikDurumu() {
    }

    public String getOkulNo() {
        return okulNo;
    }

    public void setOkulNo(String okulNo) {
        this.okulNo = okulNo;
    }

    public String getGun() {
        return gun;
    }

    public void setGun(String gun) {
        this.gun = gun;
    }

    public String getSaatId() {
        return saatId;
    }

    public void setSaatId(String saatId) {
        this.saatId = saatId;
    }

    @Override
    public String toString() {
        return "OgrenciMusaitlikDurumu{" +
                "okulNo='" + okulNo + '\'' +
                ", gun='" + gun + '\'' +
                ", saatId='" + saatId + '\'' +
                '}';
    }
}
