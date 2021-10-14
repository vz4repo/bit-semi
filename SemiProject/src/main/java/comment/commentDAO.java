package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import mysql.db.DbConnect;

public class commentDAO {
  DbConnect db = new DbConnect();

  // 댓글 추가
  public void commentInsert(commentDTO dto) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "insert into comment (name,contents,writeday) values (?,?,now())";

    try {
      pstmt = conn.prepareStatement(sql);

      // 바인딩
      pstmt.setString(1, dto.getName());
      pstmt.setString(2, dto.getContents());

      // 실행
      pstmt.execute();


    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      db.dbClose(pstmt, conn);
    }

  }
}
