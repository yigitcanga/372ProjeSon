package org.proje.jdbc.model;

public class Personel {

    String  personelId,
            ad,
            soyad,
            tcKimlik,
            telNo,
            mail,
            adres,
            maas,
            kurumId;

    public Personel(String personelId, String ad, String soyad, String tcKimlik, String telNo, String mail, String adres, String maas, String kurumId) {
        this.personelId = personelId;
        this.ad = ad;
        this.soyad = soyad;
        this.tcKimlik = tcKimlik;
        this.telNo = telNo;
        this.mail = mail;
        this.adres = adres;
        this.maas = maas;
        this.kurumId = kurumId;
    }

    public Personel() {
    }

    public String getPersonelId() {
        return personelId;
    }

    public void setPersonelId(String personelId) {
        this.personelId = personelId;
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

    public String getTcKimlik() {
        return tcKimlik;
    }

    public void setTcKimlik(String tcKimlik) {
        this.tcKimlik = tcKimlik;
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

    public String getAdres() {
        return adres;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

    public String getMaas() {
        return maas;
    }

    public void setMaas(String maas) {
        this.maas = maas;
    }

    public String getKurumId() {
        return kurumId;
    }

    public void setKurumId(String kurumId) {
        this.kurumId = kurumId;
    }

    @Override
    public String toString() {
        return "Personel{" +
                "personelId='" + personelId + '\'' +
                ", ad='" + ad + '\'' +
                ", soyad='" + soyad + '\'' +
                ", tcKimlik='" + tcKimlik + '\'' +
                ", telNo='" + telNo + '\'' +
                ", mail='" + mail + '\'' +
                ", adres='" + adres + '\'' +
                ", maas='" + maas + '\'' +
                ", kurumId='" + kurumId + '\'' +
                '}';
    }
}
