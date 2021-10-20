package date.dto;

import java.sql.Timestamp;

public class myAllPlanDto {

  private int num;
  private String userId;
  private Timestamp  writeDay;
  private int readCnt;
  private int goodCnt;
  private String planStartDay;
  private String planEndDay;
  private String plantitle;
  private boolean openPlan;
  public int getNum() {
    return num;
  }
  public void setNum(int num) {
    this.num = num;
  }
  public String getUserId() {
    return userId;
  }
  public void setUserId(String userId) {
    this.userId = userId;
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
  public String getPlanStartDay() {
    return planStartDay;
  }
  public void setPlanStartDay(String planStartDay) {
    this.planStartDay = planStartDay;
  }
  public String getPlanEndDay() {
    return planEndDay;
  }
  public void setPlanEndDay(String planEndDay) {
    this.planEndDay = planEndDay;
  }
  public String getPlantitle() {
    return plantitle;
  }
  public void setPlantitle(String plantitle) {
    this.plantitle = plantitle;
  }
  public boolean isOpenPlan() {
    return openPlan;
  }
  public void setOpenPlan(boolean openPlan) {
    this.openPlan = openPlan;
  }
  
}
