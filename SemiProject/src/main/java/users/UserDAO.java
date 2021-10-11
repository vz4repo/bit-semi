package users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import connection.DBConnect;

public class UserDAO {

  private DBConnect dbConnect = new DBConnect();

  private Connection conn = dbConnect.getConnectionCloud();
  private PreparedStatement pstmt;
  private ResultSet rs;


  // 1:성공 0:비밀번호 틀림 1:ID없음 -2:서버 오류 -
  public int login(String userID, String userPassword) {
    String sql = "select userPassword from mariaStudy.tuser where userID = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userID);
      rs = pstmt.executeQuery();

      if (rs.next()) { // rs 로 받은 id가 있으면 true
        if (rs.getString(1).equals(userPassword)) {
          return 1; // 1:성공
        } else {
          return 0; // 0: 비밀번호 틀림
        }
      }
      return -1; // -1: ID 없음
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbConnect.resourceClose(rs, pstmt, conn);
    }
    return -2; // -2: 서버오류
  }


  // 중복여부 확인: 1: 있다  0: 없다  -2: DB오류
  public int hasID(String userID) {
    String sql = "SELECT count(*) FROM mariaStudy.tuser WHERE userID = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userID);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        System.out.println(rs.getInt(1));
        return (rs.getInt(1) == 1) ? 1 : 0; // 1: 있다 | 0: 없다
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbConnect.resourceClose(rs, pstmt, conn);
    }
    return -2; // -2: 서버 오류
  }


  // 회원가입
  public void join(UserDTO dto) {
    // 회원가입여부 체크
    if (hasID(dto.getUserID()) != 0) {
      String sql =
          "insert into mariaStudy.tuser (userID,userPassword,userName,userPhone,userMail,userAddr,userGender,userDate) values (?,?,?,?,?,?,?,?)";
      try {
        pstmt = conn.prepareStatement(sql);

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
        dbConnect.resourceClose(pstmt, conn);
      }
      // TODO 가입 실패 경우도 체크
    }
  }


  // TODO refactoring: 유저 데이터 가져오기
  public UserDAO getUser(String userID) {
    try {
      PreparedStatement pstmt =
          conn.prepareStatement("SELECT * FROM mariaStudy.tuser WHERE userID = ?");
      pstmt.setString(1, userID);
      rs = pstmt.executeQuery();
      List<UserDTO> list = new Vector<>();
      if (rs.next()) {
        UserDTO dto = new UserDTO();
        dto.setUserID(rs.getString(1));
        dto.setUserPassword(rs.getString(2));
        dto.setUserName(rs.getString(3));
        dto.setUserPhone(rs.getString(4));
        dto.setUserMail(rs.getString(5));
        dto.setUserAddr(rs.getString(6));
        dto.setUserGender(rs.getString(7));
        dto.setUserDate(rs.getString(8));

        list.add(dto);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }
}
