package users;

public class UserDTO {

  private String userID;
  private String userPassword;
  private String userName;
  private String userGender;
  private String userDate;

  public String getUserID() {
    return userID;
  }

  public void setUserID(String userID) {
    this.userID = userID;
  }

  public String getUserPassword() {
    return userPassword;
  }

  public void setUserPassword(String userPassword) {
    this.userPassword = userPassword;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getUserGender() {
    return userGender;
  }

  public void setUserGender(String userGender) {
    this.userGender = userGender;
  }

  public String getUserDate() {
    return userDate;
  }

  public void setUserDate(String userDate) {
    this.userDate = userDate;
  }

}
