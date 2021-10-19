package date.dto;

public class PlanDTO {

  private int num;
  private String plantitle;
  private String planDate;

  private String planTime;
  private String mapPlan;
  private String contentPlan;
  public int getNum() {
    return num;
  }
  public void setNum(int num) {
    this.num = num;
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
  public String getPlanTime() {
    return planTime;
  }
  public void setPlanTime(String planTime) {
    this.planTime = planTime;
  }
  public String getMapPlan() {
    return mapPlan;
  }
  public void setMapPlan(String mapPlan) {
    this.mapPlan = mapPlan;
  }
  public String getContentPlan() {
    return contentPlan;
  }
  public void setContentPlan(String contentPlan) {
    this.contentPlan = contentPlan;
  }
}
