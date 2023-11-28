package org.proje.jdbc.model;

public class AcilanDers {

    String  dersKodu,
            kontenjan,
            talep;

    public AcilanDers(String dersKodu, String kontenjan, String talep) {
        this.dersKodu = dersKodu;
        this.kontenjan = kontenjan;
        this.talep = talep;
    }

    public AcilanDers() {
    }

    public String getDersKodu() {
        return dersKodu;
    }

    public void setDersKodu(String dersKodu) {
        this.dersKodu = dersKodu;
    }

    public String getKontenjan() {
        return kontenjan;
    }

    public void setKontenjan(String kontenjan) {
        this.kontenjan = kontenjan;
    }

    public String getTalep() {
        return talep;
    }

    public void setTalep(String talep) {
        this.talep = talep;
    }

    @Override
    public String toString() {
        return "AcilanDers{" +
                "dersKodu='" + dersKodu + '\'' +
                ", kontenjan='" + kontenjan + '\'' +
                ", talep='" + talep + '\'' +
                '}';
    }
}
