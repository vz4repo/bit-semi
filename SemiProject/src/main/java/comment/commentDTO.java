package comment;

import java.sql.Timestamp;

public class commentDTO {
  private String idx;
  private String num;
  private String userId;
  private String contents;
  private Timestamp writeday;

  public String getIdx() {
    return idx;
  }

  public void setIdx(String idx) {
    this.idx = idx;
  }

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

  public String getContents() {
    return contents;
  }

  public void setContents(String contents) {
    this.contents = contents;
  }

  public Timestamp getWriteday() {
    return writeday;
  }

  public void setWriteday(Timestamp writeday) {
    this.writeday = writeday;
  }

}
