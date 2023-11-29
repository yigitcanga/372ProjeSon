package org.proje.jdbc.model;

public class Veli {

    String  okulNo,
            ad,
            soyad,
            telNo,
            mail;

    public Veli(String okulNo, String ad, String soyad, String telNo, String mail) {
        this.okulNo = okulNo;
        this.ad = ad;
        this.soyad = soyad;
        this.telNo = telNo;
        this.mail = mail;
    }

    public Veli() {
    }

    public String getOkulNo() {
        return okulNo;
    }

    public void setOkulNo(String okulNo) {
        this.okulNo = okulNo;
    }

    public String getAd() {
        return ad;
    }

    public void setAd(String ad) {
        this.ad = ad;
    }

    public String getSoyad() {
        return soyad;
    }

    public void setSoyad(String soyad) {
        this.soyad = soyad;
    }

    public String getTelNo() {
        return telNo;
    }

    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    @Override
    public String toString() {
        return "Veli{" +
                "okulNo='" + okulNo + '\'' +
                ", ad='" + ad + '\'' +
                ", soyad='" + soyad + '\'' +
                ", telNo='" + telNo + '\'' +
                ", mail='" + mail + '\'' +
                '}';
    }
}
