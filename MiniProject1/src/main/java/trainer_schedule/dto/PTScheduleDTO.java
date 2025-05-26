package trainer_schedule.dto;

public class PTScheduleDTO {
    private int trainerId;
    private int memberNo;
    private String bookDate; // "YYYY-MM-DD"
    private String bookTime; // "HH:mm"
    private String note;     // 선택 사항

    public PTScheduleDTO() {}

    public PTScheduleDTO(int trainerId, int memberNo, String bookDate, String bookTime, String note) {
        this.trainerId = trainerId;
        this.memberNo = memberNo;
        this.bookDate = bookDate;
        this.bookTime = bookTime;
        this.note = note;
    }

    public int getTrainerId() {
        return trainerId;
    }

    public void setTrainerId(int trainerId) {
        this.trainerId = trainerId;
    }

    public int getMemberNo() {
        return memberNo;
    }

    public void setMemberNo(int memberNo) {
        this.memberNo = memberNo;
    }

    public String getBookDate() {
        return bookDate;
    }

    public void setBookDate(String bookDate) {
        this.bookDate = bookDate;
    }

    public String getBookTime() {
        return bookTime;
    }

    public void setBookTime(String bookTime) {
        this.bookTime = bookTime;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "PTScheduleDTO{" +
                "trainerId=" + trainerId +
                ", memberNo=" + memberNo +
                ", bookDate='" + bookDate + '\'' +
                ", bookTime='" + bookTime + '\'' +
                ", note='" + note + '\'' +
                '}';
    }
}
