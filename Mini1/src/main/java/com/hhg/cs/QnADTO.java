package com.hhg.cs;

public class QnADTO {
    private int id;
    private String title;
    private String writer;
    private String date;
    private String answer;

    public QnADTO() {}

    public QnADTO(int id, String title, String writer, String date, String answer) {
        this.id = id; this.title = title; this.writer = writer; this.date = date; this.answer = answer;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getWriter() { return writer; }
    public void setWriter(String writer) { this.writer = writer; }
    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }
    public String getAnswer() { return answer; }
    public void setAnswer(String answer) { this.answer = answer; }
}
