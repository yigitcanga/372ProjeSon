package org.proje.jdbc.model;

import org.proje.jdbc.dao.OgrenciDAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class Ogrenci {
    String okulNo;
    String ad;
    String soyad;
    Date dogumTarihi;
    String mail;
    String telNo;
    String sinif;
    String adres;
    Boolean mezunMu;
    String kurumId;
    String tcKimlik;


    public Ogrenci(String okulNo, String ad, String soyad, Date dogumTarihi, String mail, String telNo, String sinif, String adres, Boolean mezunMu, String kurumId, String tcKimlik) {
        this.okulNo = okulNo;
        this.ad = ad;
        this.soyad = soyad;
        this.dogumTarihi = dogumTarihi;
        this.mail = mail;
        this.telNo = telNo;
        this.sinif = sinif;
        this.adres = adres;
        this.mezunMu = mezunMu;
        this.kurumId = kurumId;
        this.tcKimlik = tcKimlik;
    }

    public Ogrenci(String okulNo, String ad, String soyad) {
        this.okulNo = okulNo;
        this.ad = ad;
        this.soyad = soyad;
    }

    public Ogrenci() {
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

    public Date getDogumTarihi() {
        return dogumTarihi;
    }

    public void setDogumTarihi(Date dogumTarihi) {
        this.dogumTarihi = dogumTarihi;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getTelNo() {
        return telNo;
    }

    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    public String getSinif() {
        return sinif;
    }

    public void setSinif(String sinif) {
        this.sinif = sinif;
    }

    public String getAdres() {
        return adres;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

    public Boolean getMezunMu() {
        return mezunMu;
    }

    public void setMezunMu(Boolean mezunMu) {
        this.mezunMu = mezunMu;
    }

    public String getKurumId() {
        return kurumId;
    }

    public void setKurumId(String kurumId) {
        this.kurumId = kurumId;
    }

    public String getTcKimlik() {
        return tcKimlik;
    }

    public void setTcKimlik(String tcKimlik) {
        this.tcKimlik = tcKimlik;
    }

    @Override
    public String toString() {
        return "Ogrenci{" +
                "okulNo='" + okulNo + '\'' +
                ", ad='" + ad + '\'' +
                ", soyad='" + soyad + '\'' +
                ", dogumTarihi=" + dogumTarihi +
                ", mail='" + mail + '\'' +
                ", telNo='" + telNo + '\'' +
                ", sinif='" + sinif + '\'' +
                ", adres='" + adres + '\'' +
                ", mezunMu=" + mezunMu +
                ", kurumId='" + kurumId + '\'' +
                ", tcKimlik='" + tcKimlik + '\'' +
                '}';
    }
}
