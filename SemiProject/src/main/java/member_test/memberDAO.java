package member_test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import mysql.db.DbConnect;

public class memberDAO {
  DbConnect db = new DbConnect();

  // 회원 추가
  public void insertMember(memberDTO dto) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql =
        "insert into going_member (name,id,pw,hp,email,addr,gender,birth,gaipday) values (?,?,?,?,?,?,?,?,now())";

    try {
      pstmt = conn.prepareStatement(sql);

      // 바인딩!
      pstmt.setString(1, dto.getName());
      pstmt.setString(2, dto.getId());
      pstmt.setString(3, dto.getPw());
      pstmt.setString(4, dto.getHp());
      pstmt.setString(5, dto.getEmail());
      pstmt.setString(6, dto.getAddr());
      pstmt.setString(7, dto.getGender());
      pstmt.setString(8, dto.getBirth());

      // 실행
      pstmt.execute();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      db.dbClose(pstmt, conn);
    }
  }

  // 로그인시 회원 아이디,비번 체크
  public boolean loginPass(String id, String pw) {
    boolean b = false;
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from going_member where id=? and pw=?";

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, id);
      pstmt.setString(2, pw);

      rs = pstmt.executeQuery();

      if (rs.next()) {
        b = true;
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      db.dbClose(pstmt, conn);
    }
    return b;
  }
}
