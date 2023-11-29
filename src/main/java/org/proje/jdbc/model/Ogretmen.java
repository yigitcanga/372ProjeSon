package org.proje.jdbc.model;

public class Ogretmen {
    String personel_id;

    public Ogretmen(String personel_id) {
        this.personel_id = personel_id;
    }

    public Ogretmen() {
    }

    public String getPersonel_id() {
        return personel_id;
    }

    public void setPersonel_id(String personel_id) {
        this.personel_id = personel_id;
    }

    @Override
    public String toString() {
        return "Ogretmen{" +
                "personel_id='" + personel_id + '\'' +
                '}';
    }
}
