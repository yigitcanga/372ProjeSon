package org.proje.gui.tableModels;

import org.proje.jdbc.model.AylikGider;
import org.proje.jdbc.model.HaftalikGider;

import javax.swing.table.AbstractTableModel;
import java.util.List;

public class AylikDokumTableModel extends AbstractTableModel {
    private final int START=0;
    private final int END=1;
    private final int TOTAL=2;
    private String[] col_names={"Ay Başlangıç Tarihi"," Ay Bitiş Tarihi","Toplam Tutar"};
    private List<AylikGider> giderler;

    public AylikDokumTableModel(List<AylikGider> giderler) {
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
        AylikGider gider = giderler.get(rowIndex);
        switch (columnIndex){
            case START :
                return gider.getMonthStart();
            case END:
                return gider.getMonthEnd();
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
