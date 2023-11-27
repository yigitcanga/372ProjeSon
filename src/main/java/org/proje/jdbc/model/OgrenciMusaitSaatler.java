package org.proje.jdbc.model;

public class OgrenciMusaitSaatler {

    String id;
    String saat;

    public OgrenciMusaitSaatler(String id, String saat) {
        this.id = id;
        this.saat = saat;
    }

    public OgrenciMusaitSaatler() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSaat() {
        return saat;
    }

    public void setSaat(String saat) {
        this.saat = saat;
    }

    @Override
    public String toString() {
        return "OgrenciMusaitSaatler{" +
                "id='" + id + '\'' +
                ", saat='" + saat + '\'' +
                '}';
    }
}
