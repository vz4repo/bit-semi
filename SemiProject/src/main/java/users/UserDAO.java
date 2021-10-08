package users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;
import connection.DBConnect;

public class UserDAO {
  private DBConnect dbConnect = new DBConnect();

  // private String userID;
  // private String userPassword;
  // private String userName;
  // private int userPhone;
  // private String userMail;
  // private String userAddr;
  // private String userGender;
  // private String userDate;
  private Connection con;
  private ResultSet rs;



  // 로그인
  // -2:아이디없음 -1:서버오류 0:비밀번호 틀림 1:성공
  public int login(UserDTO dto) {
    try {
      PreparedStatement pstmt = con.prepareStatement("SELECT userPassword FROM user WHERE userID = ?");
      pstmt.setString(1, dto.getUserID());
      rs = pstmt.executeQuery();
      if (rs.next()) {
        return rs.getString(1).equals(dto.getUserPassword()) ? 1 : 0;
      } else {
        return -2;
      }
    } catch (Exception e) {
      e.printStackTrace();
      return -1;
    }
  }


  // 중복여부 확인
  public boolean ID_Check(String userID) {
    try {
      PreparedStatement pstmt = con.prepareStatement("SELECT * FROM user WHERE userID = ?");
      pstmt.setString(1, userID);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        return false;
      } else {
        return true;
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return false;
  }


  // 회원가입 -1:서버오류 0:이미 존재하는 아이디 1:성공
  public int join(UserDTO dto) {
    if (!ID_Check(dto.getUserID()))
      return 0;
    try {
      PreparedStatement pstmt = con.prepareStatement("INSERT INTO user VALUES (?,?,?,?,?)");
      pstmt.setString(1, dto.getUserID());
      pstmt.setString(2, dto.getUserPassword());
      pstmt.setString(3, dto.getUserName());
      pstmt.setString(4, dto.getUserGender());
      pstmt.setString(5, dto.getUserDate());
      return pstmt.executeUpdate();
    } catch (Exception e) {
      e.printStackTrace();
      return -1;
    }
  }



  // 유저 데이터 가져오기
  public UserDAO getUser(String userID) {
    try {
      PreparedStatement pstmt = con.prepareStatement("SELECT * FROM user WHERE userID = ?");
      pstmt.setString(1, userID);
      rs = pstmt.executeQuery();
      List<UserDTO> list = new Vector<>();
      if (rs.next()) {
        UserDTO dto = new UserDTO();
        dto.setUserID(rs.getString(1));
        dto.setUserPassword(rs.getString(2));
        dto.setUserName(rs.getString(3));
        dto.setUserGender(rs.getString(4));
        dto.setUserDate(rs.getString(5));

        list.add(dto);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }


}
