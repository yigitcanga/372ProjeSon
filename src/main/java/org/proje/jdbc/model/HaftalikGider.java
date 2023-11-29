package org.proje.jdbc.model;

public class HaftalikGider {
    String weekStart,weekEnd,totalTutar;

    public HaftalikGider() {
    }

    public HaftalikGider(String weekStart, String weekEnd, String totalTutar) {
        this.weekStart = weekStart;
        this.weekEnd = weekEnd;
        this.totalTutar = totalTutar;
    }

    public String getWeekStart() {
        return weekStart;
    }

    public void setWeekStart(String weekStart) {
        this.weekStart = weekStart;
    }

    public String getWeekEnd() {
        return weekEnd;
    }

    public void setWeekEnd(String weekEnd) {
        this.weekEnd = weekEnd;
    }

    public String getTotalTutar() {
        return totalTutar;
    }

    public void setTotalTutar(String totalTutar) {
        this.totalTutar = totalTutar;
    }

    @Override
    public String toString() {
        return "HaftalikGider{" +
                "weekStart='" + weekStart + '\'' +
                ", weekEnd='" + weekEnd + '\'' +
                ", totalTutar='" + totalTutar + '\'' +
                '}';
    }
}
