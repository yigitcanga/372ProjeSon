package org.proje.gui.tableModels;

import org.proje.jdbc.model.HaftalikGider;
import org.proje.jdbc.model.KurumGiderleri;

import javax.swing.table.AbstractTableModel;
import java.util.List;

public class HaftalikDokumTableModel extends AbstractTableModel {
    private final int START=0;
    private final int END=1;
    private final int TOTAL=2;
    private String[] col_names={"Hafta Başlangıç Tarihi"," Hafta Bitiş Tarihi","Toplam Tutar"};
    private List<HaftalikGider> giderler;

    public HaftalikDokumTableModel(List<HaftalikGider> giderler) {
        this.giderler = giderler;
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
        HaftalikGider gider = giderler.get(rowIndex);
        switch (columnIndex){
            case START :
                return gider.getWeekStart();
            case END:
                return gider.getWeekEnd();
            case TOTAL:
                return gider.getTotalTutar();
        }
        return null;
    }
    @Override
    public String getColumnName(int column) {
        return col_names[column];
    }
}
