package date.dto;

import java.sql.Timestamp;

public class myContentDto {
  
  private String userId;
  private int num;
  private Timestamp  writeDay;
  private String planDateStart;
  private String planDateEnd;
  private int readCnt;
  private int goodCnt;
  private String plantitle;
  
  public String getPlanDateStart() {
    return planDateStart;
  }
  public void setPlanDateStart(String planDateStart) {
    this.planDateStart = planDateStart;
  }
  public String getPlanDateEnd() {
    return planDateEnd;
  }
  public void setPlanDateEnd(String planDateEnd) {
    this.planDateEnd = planDateEnd;
  }

  public String getUserId() {
    return userId;
  }
  public void setUserId(String userId) {
    this.userId = userId;
  }
  public int getNum() {
    return num;
  }
  public void setNum(int num) {
    this.num = num;
  }
  public Timestamp getWriteDay() {
    return writeDay;
  }
  public void setWriteDay(Timestamp writeDay) {
    this.writeDay = writeDay;
  }
  public int getReadCnt() {
    return readCnt;
  }
  public void setReadCnt(int readCnt) {
    this.readCnt = readCnt;
  }
  public int getGoodCnt() {
    return goodCnt;
  }
  public void setGoodCnt(int goodCnt) {
    this.goodCnt = goodCnt;
  }
  public String getPlantitle() {
    return plantitle;
  }
  public void setPlantitle(String plantitle) {
    this.plantitle = plantitle;
  }
  
}
