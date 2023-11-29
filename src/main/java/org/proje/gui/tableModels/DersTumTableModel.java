package org.proje.gui.tableModels;

import org.proje.jdbc.model.Ders;
import org.proje.jdbc.model.DersKoduTumBilgiler;

import javax.swing.table.AbstractTableModel;
import java.util.List;

public class DersTumTableModel extends AbstractTableModel {
    private final int DERS_ADI=0;
    private final int KONTENJAN=1;
    private final int TALEP =2;
    private final int SAAT =3;
    private final int GUN =4;
    private String[] col_names = {"Ders Adı","Kontenjan", "Talep","Saat","Gün"};
    private List<DersKoduTumBilgiler> dersler;

    public DersTumTableModel(List<DersKoduTumBilgiler> dersler) {
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
        DersKoduTumBilgiler ders = dersler.get(rowIndex);
        switch (columnIndex){
            case DERS_ADI:
                return ders.getDersAdı();
            case KONTENJAN:
                return ders.getKontenjan();
            case TALEP:
                return ders.getTalep();
            case SAAT:
                return ders.getSaat();
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
