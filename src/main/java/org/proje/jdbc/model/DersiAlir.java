package org.proje.jdbc.model;

public class DersiAlir {

    String okulNo;
    String dersKodu;

    public DersiAlir(String okulNo, String dersKodu) {
        this.okulNo = okulNo;
        this.dersKodu = dersKodu;
    }

    public DersiAlir() {
    }

    public String getOkulNo() {
        return okulNo;
    }

    public void setOkulNo(String okulNo) {
        this.okulNo = okulNo;
    }

    public String getDersKodu() {
        return dersKodu;
    }

    public void setDersKodu(String dersKodu) {
        this.dersKodu = dersKodu;
    }

    @Override
    public String toString() {
        return "DersiAlir{" +
                "okulNo='" + okulNo + '\'' +
                ", dersKodu='" + dersKodu + '\'' +
                '}';
    }
}
