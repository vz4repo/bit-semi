package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import connection.DBConnect;

public class commentDAO {
  DBConnect db = new DBConnect();

  // 댓글 추가
  public void commentInsert(commentDTO dto) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "insert into bit_semi.comment (num,userId,contents) values (?,?,?)";

    try {
      pstmt = conn.prepareStatement(sql);

      // 바인딩
      pstmt.setString(1, dto.getNum());
      pstmt.setString(2, dto.getUserId());
      pstmt.setString(3, dto.getContents());

      // 실행
      pstmt.execute();


    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      db.dbClose(pstmt, conn);
    }
  }

  // 전체갯수
  public int getTotalCount() {
    int n = 0;
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select count(*) from bit_semi.comment";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();

      if (rs.next()) {
        n = rs.getInt(1);
      }

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return n;
  }

  // idx에 해당하는 dto 반환
  public commentDTO getData(String idx) {
    commentDTO dto = new commentDTO();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from bit_semi.comment where idx=?";

    try {
      pstmt = conn.prepareStatement(sql);

      // 바인딩
      pstmt.setString(1, idx);

      // 실행
      rs = pstmt.executeQuery();

      if (rs.next()) {
        dto.setIdx(rs.getString("idx"));
        dto.setNum(rs.getString("num"));
        dto.setUserId(rs.getString("userId"));
        dto.setContents(rs.getString("contents"));
        dto.setWriteday(rs.getTimestamp("writeday"));

      }

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return dto;
  }

  // 전체 댓글 출력
  public List<commentDTO> getAllAnswer(String num) {
    List<commentDTO> list = new Vector<commentDTO>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from bit_semi.comment where num=? order by idx DESC";

    try {
      pstmt = conn.prepareStatement(sql);

      // 바인딩
      pstmt.setString(1, num);

      // 실행
      rs = pstmt.executeQuery();

      while (rs.next()) {
        commentDTO dto = new commentDTO();
        dto.setIdx(rs.getString("idx"));
        dto.setNum(rs.getString("num"));
        dto.setUserId(rs.getString("userId"));
        dto.setContents(rs.getString("contents"));
        dto.setWriteday(rs.getTimestamp("writeday"));

        // list 추가
        list.add(dto);
      }

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return list;
  }

  // 페이지에서 필요한 만큼만 리턴
  public List<commentDTO> getcommentList(int start, int perpage) {
    List<commentDTO> list = new Vector<commentDTO>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from bit_semi.comment order by num desc limit ?,?";

    try {
      pstmt = conn.prepareStatement(sql);

      // 바인딩
      pstmt.setInt(1, start);
      pstmt.setInt(2, perpage);

      // 실행
      rs = pstmt.executeQuery();

      while (rs.next()) {
        commentDTO dto = new commentDTO();
        dto.setIdx(rs.getString("idx"));
        dto.setNum(rs.getString("num"));
        dto.setUserId(rs.getString("userId"));
        dto.setContents(rs.getString("contents"));
        dto.setWriteday(rs.getTimestamp("writeday"));

        // list에 추가
        list.add(dto);
      }

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return list;
  }

  // 삭제
  public void deleteAnswer(String idx) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "delete from bit_semi.comment where idx=?";

    try {
      pstmt = conn.prepareStatement(sql);

      // 바인딩
      pstmt.setString(1, idx);

      // 실행
      pstmt.execute();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      db.dbClose(pstmt, conn);
    }
  }

  // 수정(검색해서)
  public int update(int num, int idx, String comments) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "update bit_semi.comment set Contents=? where num=? and idx=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, comments);// 물음표의 순서
      pstmt.setInt(2, num);
      pstmt.setInt(3, idx);
      return pstmt.executeUpdate();// insert,delete,update
    } catch (Exception e) {
      e.printStackTrace();
    }
    return -1;// 데이터베이스 오류
  }

  // 수정 (우선 이걸로 사용하기!)
  public void updateComment(commentDTO dto) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "update bit_semi.comment set contents=? where idx=?";

    try {
      pstmt = conn.prepareStatement(sql);

      // 바인딩
      pstmt.setString(1, dto.getContents());
      pstmt.setString(2, dto.getIdx());

      // 실행
      pstmt.execute();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      db.dbClose(pstmt, conn);
    }
  }
}
