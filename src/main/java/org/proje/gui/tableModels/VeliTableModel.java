package org.proje.gui.tableModels;

import org.proje.jdbc.model.Ogrenci;
import org.proje.jdbc.model.Veli;

import javax.swing.table.AbstractTableModel;
import java.util.List;

public class VeliTableModel extends AbstractTableModel {
    private static final int AD=0;
    private static final int SOYAD=1;
    private static final int TELEFON_NUMARASI=2;
    private static final int MAIL=3;
    private String[] col_names = {"Ad","Soyad","Telefon Numarası","Mail"};
    private List<Veli> veli ;

    public VeliTableModel(List<Veli> veli) {
        this.veli = veli;
    }

    @Override
    public int getRowCount() {
        return veli.size();
    }

    @Override
    public int getColumnCount() {
        return col_names.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        Veli veli1 = veli.get(rowIndex);
        switch (columnIndex){
            case AD:
                return veli1.getAd();
            case SOYAD:
                return veli1.getSoyad();
            case MAIL:
                return veli1.getMail();
            case TELEFON_NUMARASI:
                return veli1.getTelNo();
        }
        return null;
    }
    @Override
    public String getColumnName(int column) {
        return col_names[column];
    }
}
