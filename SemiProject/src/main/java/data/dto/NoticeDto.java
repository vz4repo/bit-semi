package data.dto;

import java.sql.Timestamp;

public class NoticeDto {
  private String num;
  private String name;
  private String title;
  private String content;
  private int readcount;

  public int getReadcount() {
    return readcount;
  }

  public void setReadcount(int readcount) {
    this.readcount = readcount;
  }

  private Timestamp writeday;

  public String getNum() {
    return num;
  }

  public void setNum(String num) {
    this.num = num;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public Timestamp getWriteday() {
    return writeday;
  }

  public void setWriteday(Timestamp writeday) {
    this.writeday = writeday;
  }


}
