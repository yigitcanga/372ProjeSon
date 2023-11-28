package org.proje.jdbc.model;

public class DersiVerir {

    String  dersKodu,
            personelId;

    public DersiVerir(String dersKodu, String personelId) {
        this.dersKodu = dersKodu;
        this.personelId = personelId;
    }

    public DersiVerir() {
    }

    public String getDersKodu() {
        return dersKodu;
    }

    public void setDersKodu(String dersKodu) {
        this.dersKodu = dersKodu;
    }

    public String getPersonelId() {
        return personelId;
    }

    public void setPersonelId(String personelId) {
        this.personelId = personelId;
    }

    @Override
    public String toString() {
        return "DersiVerir{" +
                "dersKodu='" + dersKodu + '\'' +
                ", personelId='" + personelId + '\'' +
                '}';
    }
}
