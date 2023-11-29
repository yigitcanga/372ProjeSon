package org.proje.gui.tableModels;

import org.proje.jdbc.model.Dersler;

import javax.swing.table.AbstractTableModel;
import java.util.List;

public class OgrDersTableModel extends AbstractTableModel {
    private final int DERS=0;
    private final int SAAT=1;
    private final int GUN=2;
    private String[] col_names = {"Verdiği Dersler","Saat","Gün"};
    private List<Dersler> dersler;
    public OgrDersTableModel(List<Dersler> dersler) {
        this.dersler = dersler;
    }
    @Override
    public int getRowCount() {
        return dersler.size();
    }

    @Override
    public int getColumnCount() {
        return col_names.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        Dersler ders = dersler.get(rowIndex);
        switch (columnIndex){
            case DERS:
                return ders.getDers_adi();
            case SAAT:
                return ders.getZaman();
            case GUN:
                return ders.getGun();
        }
        return null;
    }
    @Override
    public String getColumnName(int column) {
        return col_names[column];
    }
}
