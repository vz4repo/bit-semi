package users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import connection.DBConnect;
import connection.DBConnectAWS;

public class UserDAO {

  DBConnect dbConnect = new DBConnect();

  private Connection con;
  private ResultSet rs;
  private DBConnectAWS conn;


  // TODO refactoring:-2:아이디없음 -1:서버오류 0:비밀번호 틀림 1:성공
  public int login(UserDTO dto) {
    try {
      PreparedStatement pstmt =
          con.prepareStatement("SELECT userPassword FROM user WHERE userID = ?");
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


  // 중복여부 확인:ID_Check:다른 방법 찾아보기
  public boolean hasID(String userID) {
    boolean hasID = false;
    Connection conn = dbConnect.getConnectionCloud();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "SELECT * FROM tuser WHERE userID = ?";
    // For aws cloud db
    // String sql = "SELECT * FROM maria_study.tuser WHERE userID = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userID);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        return true;
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbConnect.resourceClose(rs, pstmt, conn);
    }
    return hasID;
  }


  // 회원가입
  public void join(UserDTO dto) {
    // 회원가입여부 체크
    if (!hasID(dto.getUserID())) {
      con = dbConnect.getConnectionCloud();
      PreparedStatement pstmt = null;
      String sql =
          "insert into tuser (userID,userPassword,userName,userPhone,userMail,userAddr,userGender,userDate) values (?,?,?,?,?,?,?,?)";
      // For aws cloud DB
      // "insert into maria_study.tuser
      // (userID,userPassword,userName,userPhone,userMail,userAddr,userGender,userDate) values
      // (?,?,?,?,?,?,?,?)";
      try {
        pstmt = con.prepareStatement(sql);

        pstmt.setString(1, dto.getUserID());
        pstmt.setString(2, dto.getUserPassword());
        pstmt.setString(3, dto.getUserName());
        pstmt.setString(4, dto.getUserPhone());
        pstmt.setString(5, dto.getUserMail());
        pstmt.setString(6, dto.getUserAddr());
        pstmt.setString(7, dto.getUserGender());
        pstmt.setString(8, dto.getUserDate());

        pstmt.execute();
        System.out.println("user inserted");
      } catch (SQLException e) {
        e.printStackTrace();
        System.out.println(dto.getUserName() + ": FAIL");
      } finally {
        dbConnect.resourceClose(pstmt, con);
      }
      // TODO 가입 실패 경우도 체크
    }
  }

  // TODO refactoring: 유저 데이터 가져오기
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
