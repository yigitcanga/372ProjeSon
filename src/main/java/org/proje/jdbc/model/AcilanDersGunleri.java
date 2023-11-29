package org.proje.jdbc.model;

public class AcilanDersGunleri {

    String  gunId,
            gun;

    public AcilanDersGunleri(String gunId, String gun) {
        this.gunId = gunId;
        this.gun = gun;
    }

    public AcilanDersGunleri() {
    }

    public String getGunId() {
        return gunId;
    }

    public void setGunId(String gunId) {
        this.gunId = gunId;
    }

    public String getGun() {
        return gun;
    }

    public void setGun(String gun) {
        this.gun = gun;
    }

    @Override
    public String toString() {
        return "AcilanDersGunleri{" +
                "gunId='" + gunId + '\'' +
                ", gun='" + gun + '\'' +
                '}';
    }
}
