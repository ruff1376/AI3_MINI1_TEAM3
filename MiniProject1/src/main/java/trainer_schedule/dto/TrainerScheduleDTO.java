package trainer_schedule.dto;

public class TrainerScheduleDTO {
    private String scheduleDate;  // ← 추가
    private String trainer;
    private String time;
    private String memo;
    private boolean checked;

    public TrainerScheduleDTO() {}

    public TrainerScheduleDTO(String scheduleDate, String trainer, String time, String memo, boolean checked) {
        this.scheduleDate = scheduleDate;
        this.trainer = trainer;
        this.time = time;
        this.memo = memo;
        this.checked = checked;
    }

    public String getScheduleDate() {
        return scheduleDate;
    }

    public void setScheduleDate(String scheduleDate) {
        this.scheduleDate = scheduleDate;
    }

    public String getTrainer() {
        return trainer;
    }

    public void setTrainer(String trainer) {
        this.trainer = trainer;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    @Override
    public String toString() {
        return "TrainerScheduleDTO{" +
                "scheduleDate='" + scheduleDate + '\'' +
                ", trainer='" + trainer + '\'' +
                ", time='" + time + '\'' +
                ", memo='" + memo + '\'' +
                ", checked=" + checked +
                '}';
    }
}
