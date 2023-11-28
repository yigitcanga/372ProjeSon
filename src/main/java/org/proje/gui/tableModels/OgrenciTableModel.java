package org.proje.gui.tableModels;

import org.proje.jdbc.model.Ogrenci;

import javax.swing.table.AbstractTableModel;
import java.util.List;

public class OgrenciTableModel extends AbstractTableModel {
    private static final int OKUL_NUMARASI=0;
    private static final int AD=1;
    private static final int SOYAD=2;
    private static final int DOGUM_TARIHI=3;
    private static final int MAIL=4;
    private static final int TELEFON_NUMARASI=5;
    private static final int SINIF=6;
    private static final int MEZUN_MU=8;
    private static final int ADRES=7;
    private static final int KURUM=9;
    private static final int TC=10;

    private String[] col_names = {"Okul Numarası", "Ad", "Soyad","Doğum Traihi","Mail","Telefon Numarası","Sınıf", "Adres","Mezunluk Durumu","Kurum Adı", "TC Kimlik Numarası"};
    private List<Ogrenci> ogrenciler;

    public OgrenciTableModel(List<Ogrenci> ogrenciler) {
        this.ogrenciler = ogrenciler;
    }

    @Override
    public int getRowCount() {
        return ogrenciler.size();
    }

    @Override
    public int getColumnCount() {
        return col_names.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        Ogrenci ogrenci = ogrenciler.get(rowIndex);
        switch (columnIndex){
            case OKUL_NUMARASI :
                return ogrenci.getOkulNo();
            case AD:
                return ogrenci.getAd();
            case SOYAD:
                return ogrenci.getSoyad();
            case DOGUM_TARIHI:
                return ogrenci.getDogumTarihi();
            case MAIL:
                return ogrenci.getMail();
            case TELEFON_NUMARASI:
                return ogrenci.getTelNo();
            case SINIF:
                return ogrenci.getSinif();
            case ADRES:
                return ogrenci.getAdres();
            case MEZUN_MU:
                return ogrenci.getMezunMu() ? "Mezun":"Öğrenci";
            case KURUM://direk kurum adını getirmek lazım!!
                return ogrenci.getKurumId();
            case TC:
                return ogrenci.getTcKimlik();
        }
        return null;
    }

    @Override
    public String getColumnName(int column) {
        return col_names[column];
    }
}
