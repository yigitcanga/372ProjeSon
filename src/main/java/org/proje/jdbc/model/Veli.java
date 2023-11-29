package org.proje.jdbc.model;

public class Veli {

    String
            ad,
            soyad,
            telNo,
            mail;

    public Veli(String ad, String soyad, String telNo, String mail) {

        this.ad = ad;
        this.soyad = soyad;
        this.telNo = telNo;
        this.mail = mail;
    }

    public Veli() {
    }

    /*public String getOkulNo() {
        return okulNo;
    }*/

    /*public void setOkulNo(String okulNo) {
        this.okulNo = okulNo;
    }*/

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

}
