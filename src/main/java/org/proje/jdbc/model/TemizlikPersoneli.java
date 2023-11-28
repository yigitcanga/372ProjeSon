package org.proje.jdbc.model;

public class TemizlikPersoneli {

    String personelId;

    public TemizlikPersoneli(String personelId) {
        this.personelId = personelId;
    }

    public TemizlikPersoneli() {
    }

    public String getPersonelId() {
        return personelId;
    }

    public void setPersonelId(String personelId) {
        this.personelId = personelId;
    }
}
