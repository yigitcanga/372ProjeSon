package org.proje.gui.tableModels;

import org.proje.jdbc.model.Ders;

import javax.swing.table.AbstractTableModel;
import java.util.List;

public class DersTableModel extends AbstractTableModel {

    private static final int DERS_KODU=0;
    private static final int DERS_ADI=1;

    private String[] col_names = {"Ders Kodu","Ders Adı"};
    private List<Ders> dersler;

    public DersTableModel(List<Ders> dersler) {
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
        Ders ders = dersler.get(rowIndex);
        switch (columnIndex){
            case DERS_KODU:
                return ders.getDersKodu();
            case DERS_ADI:
                return ders.getDersAdi();
        }
        return null;
    }

    @Override
    public String getColumnName(int column) {
        return col_names[column];
    }
}
