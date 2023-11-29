package org.proje.gui.tableModels;

import org.proje.jdbc.model.KurumGiderleri;

import javax.swing.table.AbstractTableModel;
import java.util.List;

public class GiderTableModel extends AbstractTableModel {
    private static final int GIDER_NUMARASI=0;
    private static final int GIDER=1;
    private static final int TUTAR=2;
    private static final int KURUM=3;
    private static final int TARIH=4;

    private String[] col_names = {"Gider Numarası","Gider Adı","Gider Tutarı","Kurum Adı", "Gider Tarihi"};
    private List<KurumGiderleri> giderler;

    public GiderTableModel(List<KurumGiderleri> ogrenciler) {
        this.giderler = ogrenciler;
    }

    @Override
    public int getRowCount() {
        return giderler.size();
    }

    @Override
    public int getColumnCount() {
        return col_names.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        KurumGiderleri gider = giderler.get(rowIndex);
        switch (columnIndex){
            case GIDER_NUMARASI :
                return gider.getGiderId();
            case GIDER:
                return gider.getGider();
            case TUTAR:
                return gider.getTutar();
            case KURUM://direk kurum adını getirmek lazım!!
                return gider.getKurumId();
            case TARIH:
                return gider.getTarih();
        }
        return null;
    }

    @Override
    public String getColumnName(int column) {
        return col_names[column];
    }
}
