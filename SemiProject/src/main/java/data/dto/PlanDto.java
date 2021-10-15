package data.dto;

import java.sql.Timestamp;

public class PlanDto {
  private String num;
  private String name;
  private String content;
  private int chu;
  private int jo;
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

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public int getChu() {
    return chu;
  }

  public void setChu(int chu) {
    this.chu = chu;
  }

  public int getJo() {
    return jo;
  }

  public void setJo(int jo) {
    this.jo = jo;
  }

  public Timestamp getWriteday() {
    return writeday;
  }

  public void setWriteday(Timestamp writeday) {
    this.writeday = writeday;
  }

}
