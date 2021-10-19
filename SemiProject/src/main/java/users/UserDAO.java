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

  private Connection conn = dbConnect.getConnection();
  private PreparedStatement pstmt;
  private ResultSet rs;

  public static void main(String[] args) {
    UserDAO dao = new UserDAO();

    // System.out.println(dao.login("test01", "1234"));
    System.out.println(dao.hasID("test02"));
  }

  // 1:성공 0:비밀번호 틀림 1:ID없음 -2:서버 오류 -
  public int login(String userID, String userPassword) {
    String sql = "select userPassword from bit_semi.user where userID = ?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userID);
      rs = pstmt.executeQuery();
      System.out.println(sql);
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
      dbConnect.dbClose(rs, pstmt, conn);
    }
    return -2; // -2: 서버오류
  }


  // 중복여부 확인: 1: 있다 0: 없다 -2: DB오류
  public int hasID(String userID) {
    String sql = "SELECT count(*) FROM bit_semi.user WHERE userID = ?";
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
      dbConnect.dbClose(rs, pstmt, conn);
    }
    return -2; // -2: 서버 오류
  }


  // 회원가입
  public void join(UserDTO dto) {
    // 회원가입여부 체크, 없으면 콘솔에 0 출력
    if (hasID(dto.getUserID()) == 0) {

      Connection conn = dbConnect.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      String sql =
          "insert into bit_semi.user (userID,userPassword,userName,userPhone,userMail,userAddr,userGender,userDate) values (?,?,?,?,?,?,?,?)";
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

        System.out.println(sql);

        pstmt.execute();
        System.out.println("user inserted");
      } catch (SQLException e) {
        e.printStackTrace();
        System.out.println(dto.getUserName() + ": FAIL");
      } finally {
        dbConnect.dbClose(pstmt, conn);
      }
      // TODO 가입 실패 경우도 체크
    }
  }

  // 회원 dto 반환
  /*
   * public UserDTO getMember(String num) {
   *
   * UserDTO dto = new UserDTO(); Connection conn = dbConnect.getConnectionCloud();
   * PreparedStatement pstmt = null; ResultSet rs = null;
   *
   * String sql = "select * from tuser where num=?";
   *
   * try { pstmt = conn.prepareStatement(sql); // 바인딩 pstmt.setString(1, num); // 실행 rs =
   * pstmt.executeQuery();
   *
   * if (rs.next()) { dto.setNum(rs.getString("num")); dto.setUserID(rs.getString("userID"));
   * dto.setUserPassword(rs.getString("userPassword")); dto.setUserName(rs.getString("userName"));
   * dto.setUserPhone(rs.getString("userPhone")); dto.setUserMail(rs.getString("userMail"));
   * dto.setUserAddr(rs.getString("userAddr")); dto.setUserGender(rs.getString("userGender"));
   * dto.setUserDate(rs.getString("userDate")); }
   *
   * } catch (SQLException e) { e.printStackTrace(); } finally { dbConnect.resourceClose(pstmt,
   * conn); }
   *
   * return dto; }
   */

  // TODO refactoring: 유저 데이터 가져오기
  public UserDTO getUser(String userID) {
    UserDTO dto = new UserDTO();
    Connection conn = dbConnect.getConnection();
    try {
      PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM bit_semi.user WHERE userID = ?");
      pstmt.setString(1, userID);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        dto.setUserID(rs.getString(1));
        dto.setUserPassword(rs.getString(2));
        dto.setUserName(rs.getString(3));
        dto.setUserPhone(rs.getString(4));
        dto.setUserMail(rs.getString(5));
        dto.setUserAddr(rs.getString(6));
        dto.setUserGender(rs.getString(7));
        dto.setUserDate(rs.getString(8));

      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      dbConnect.dbClose(rs, pstmt, conn);
    }
    return dto;
  }
}
