package org.proje.jdbc.model;

public class AylikGider {
    String monthStart,monthEnd,totalTutar;

    public AylikGider() {
    }

    public AylikGider(String monthStart, String monthEnd, String totalTutar) {
        this.monthStart = monthStart;
        this.monthEnd = monthEnd;
        this.totalTutar = totalTutar;
    }

    public String getMonthStart() {
        return monthStart;
    }

    public void setMonthStart(String monthStart) {
        this.monthStart = monthStart;
    }

    public String getMonthEnd() {
        return monthEnd;
    }

    public void setMonthEnd(String monthEnd) {
        this.monthEnd = monthEnd;
    }

    public String getTotalTutar() {
        return totalTutar;
    }

    public void setTotalTutar(String totalTutar) {
        this.totalTutar = totalTutar;
    }

    @Override
    public String toString() {
        return "AylikGider{" +
                "monthStart='" + monthStart + '\'' +
                ", monthEnd='" + monthEnd + '\'' +
                ", totalTutar='" + totalTutar + '\'' +
                '}';
    }
}
