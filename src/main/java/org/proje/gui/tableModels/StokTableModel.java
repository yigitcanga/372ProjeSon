package org.proje.gui.tableModels;

import org.proje.jdbc.model.Stok;

import javax.swing.table.AbstractTableModel;
import java.util.List;

public class StokTableModel extends AbstractTableModel {
    private static final int STOK_NUMARASI=0;
    private static final int STOK_TURU=1;
    private static final int MIKTAR=2;
    private static final int KURUM=3;

    private String[] col_names = {"Stok Numarası", "Stok Türü", "Miktar","Kurum Adı"};
    private List<Stok> stoklar;

    public StokTableModel(List<Stok> ogrenciler) {
        this.stoklar = ogrenciler;
    }

    @Override
    public int getRowCount() {
        return stoklar.size();
    }

    @Override
    public int getColumnCount() {
        return col_names.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        Stok stok = stoklar.get(rowIndex);
        switch (columnIndex){
            case STOK_NUMARASI :
                return stok.getStokId();
            case STOK_TURU:
                return stok.getStokTuru();
            case MIKTAR:
                return stok.getMiktar();
            case KURUM://direk kurum adını getirmek lazım!!
                return stok.getKurumId();
        }
        return null;
    }

    @Override
    public String getColumnName(int column) {
        return col_names[column];
    }
}
