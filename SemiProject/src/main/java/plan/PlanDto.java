package plan;

import java.sql.Timestamp;

public class PlanDto {
  private String num;
  private String userId;
  private String plantitle;
  private String planDate;
  private String content;
  private int readCNT;
  private int good;
  private Timestamp writeday;

  public String getNum() {
    return num;
  }

  public void setNum(String num) {
    this.num = num;
  }

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getPlantitle() {
    return plantitle;
  }

  public void setPlantitle(String plantitle) {
    this.plantitle = plantitle;
  }

  public String getPlanDate() {
    return planDate;
  }

  public void setPlanDate(String planDate) {
    this.planDate = planDate;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public int getReadCNT() {
    return readCNT;
  }

  public void setReadCNT(int readCNT) {
    this.readCNT = readCNT;
  }

  public int getGood() {
    return good;
  }

  public void setGood(int good) {
    this.good = good;
  }

  public Timestamp getWriteday() {
    return writeday;
  }

  public void setWriteday(Timestamp writeday) {
    this.writeday = writeday;
  }


}
