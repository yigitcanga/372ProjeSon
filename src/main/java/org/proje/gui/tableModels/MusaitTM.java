package org.proje.gui.tableModels;

import org.proje.jdbc.model.GunSaat;
import org.proje.jdbc.model.Ogrenci;

import javax.swing.table.AbstractTableModel;
import java.util.List;

public class MusaitTM extends AbstractTableModel {
    private static final int GUN=0;
    private static final int SAAT=1;
    private String[] col_names = {"Gün", "Saat"};
    private List<GunSaat> gsl;

    public MusaitTM(List<GunSaat> gs) {
        this.gsl = gs;
    }

    @Override
    public int getRowCount() {
        return gsl.size();
    }

    @Override
    public int getColumnCount() {
        return col_names.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        GunSaat gs= gsl.get(rowIndex);
        switch (columnIndex){
            case GUN :
                return gs.getGun();
            case SAAT:
                return gs.getSaat();
        }
        return null;
    }
    @Override
    public String getColumnName(int column) {
        return col_names[column];
    }
}
