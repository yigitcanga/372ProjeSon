package org.proje.gui.tableModels;

import org.proje.jdbc.model.Personel;

import javax.swing.table.AbstractTableModel;
import java.util.List;

public class PersonelTableModel extends AbstractTableModel {
    private static final int PERSONEL_NUMARASI=0;
    private static final int AD=1;
    private static final int SOYAD=2;
    private static final int TC=3;
    private static final int TELEFON_NUMARASI=4;
    private static final int MAIL=5;
    private static final int ADRES=6;
    private static final int MAAŞ=7;
    private static final int KURUM=8;


    private String[] col_names = {"Personel Numarası", "Ad", "Soyad","TC Kimlik Numarası","Telefon Numarası","Mail", "Adres","Maaş","Kurum Adı"};
    private List<Personel> personeller;

    public PersonelTableModel(List<Personel> personeller) {
        this.personeller = personeller;
    }

    @Override
    public int getRowCount() {
        return personeller.size();
    }

    @Override
    public int getColumnCount() {
        return col_names.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        Personel personel = personeller.get(rowIndex);
        switch (columnIndex){
            case PERSONEL_NUMARASI :
                return personel.getPersonelId();
            case AD:
                return personel.getAd();
            case SOYAD:
                return personel.getSoyad();
            case TC:
                return personel.getTcKimlik();
            case TELEFON_NUMARASI:
                return personel.getTelNo();
            case MAIL:
                return personel.getMail();
            case ADRES:
                return personel.getAdres();
            case MAAŞ:
                return personel.getMaas();
            case KURUM://direk kurum adını getirmek lazım!!
                return personel.getKurumId();
        }
        return null;
    }

    @Override
    public String getColumnName(int column) {
        return col_names[column];
    }
}
