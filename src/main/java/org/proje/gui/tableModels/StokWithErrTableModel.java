package org.proje.gui.tableModels;

import org.proje.jdbc.model.DersStok;
import org.proje.jdbc.model.StokWithErr;

import javax.swing.table.AbstractTableModel;
import java.util.List;

public class StokWithErrTableModel extends AbstractTableModel {
    private final int DERS_KODU=0;
    private final int DERS_ADI=1;
    private final int STOK_TURU=2;
    private final int MIKTAR=3;
    private final int UYARI_MESAJI=4;
    String[] col_names ={"Ders Kodu","Ders Adı","Stok Türü","Miktar","Uyarı Mesajı"};
    private List<StokWithErr> stok ;

    public StokWithErrTableModel(List<StokWithErr> stok) {
        this.stok = stok;
    }

    @Override
    public int getRowCount() {
        return stok.size();

    }

    @Override
    public int getColumnCount() {
        return col_names.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        StokWithErr derss = stok.get(rowIndex);
        switch (columnIndex){
            case DERS_KODU:
                return derss.getDersKodu();
            case DERS_ADI:
                return derss.getDersAdi();
            case STOK_TURU:
                return derss.getStokTuru();
            case MIKTAR:
                return derss.getMiktar();
            case UYARI_MESAJI:
                return derss.getUyariMesaji();
        }
        return null;
    }

    @Override
    public String getColumnName(int column) {
        return col_names[column];
    }
}
