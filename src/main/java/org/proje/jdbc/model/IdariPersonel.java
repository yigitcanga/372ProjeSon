package org.proje.jdbc.model;

public class IdariPersonel {
    String  personelId;

    public IdariPersonel(String personelId) {
        this.personelId = personelId;
    }

    public IdariPersonel() {
    }

    public String getPersonelId() {
        return personelId;
    }

    public void setPersonelId(String personelId) {
        this.personelId = personelId;
    }

    @Override
    public String toString() {
        return "IdariPersonel{" +
                "personelId='" + personelId + '\'' +
                '}';
    }
}
