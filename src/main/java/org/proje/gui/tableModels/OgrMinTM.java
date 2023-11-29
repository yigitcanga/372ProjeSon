package org.proje.gui.tableModels;

import org.proje.jdbc.model.Ogrenci;

import javax.swing.table.AbstractTableModel;
import java.util.List;

public class OgrMinTM extends AbstractTableModel {
    private static final int OKUL_NUMARASI=0;
    private static final int AD=1;
    private static final int SOYAD=2;
    private String[] col_names = {"Okul Numarası", "Ad", "Soyad"};
    private List<Ogrenci> ogrenciler;

    public OgrMinTM(List<Ogrenci> ogrenciler) {
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
        }
        return null;
    }

    @Override
    public String getColumnName(int column) {
        return col_names[column];
    }
}
