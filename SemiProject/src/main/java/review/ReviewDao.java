package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import connection.DBConnect;

public class ReviewDao {
  DBConnect db = new DBConnect();

  // insert
  public void insertReview(ReviewDto dto) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql =
        "insert into maria_study.treview (userID,subject,content,thumbnail,writeday) values (?,?,?,?,now())";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getUserID());
      pstmt.setString(2, dto.getSubject());
      pstmt.setString(3, dto.getContent());
      pstmt.setString(4, dto.getThumbnail());
      pstmt.execute();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(pstmt, conn);
    }
  }

  // 전체 게시물 갯수
  public int getTotalCount() {
    int n = 0;
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select count(*) from maria_study.treview";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      if (rs.next())
        n = rs.getInt(1);
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return n;
  }

  // 최신순
  public List<ReviewDto> getLatestList(int start, int perpage) {
    List<ReviewDto> list = new Vector<ReviewDto>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from maria_study.treview order by writeday desc limit ?,?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, perpage);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        ReviewDto dto = new ReviewDto();
        dto.setNum(rs.getString("num"));
        dto.setUserID(rs.getString("userID"));
        dto.setSubject(rs.getString("subject"));
        dto.setContent(rs.getString("content"));
        dto.setThumbnail(rs.getString("thumbnail"));
        dto.setGood(rs.getInt("good"));
        dto.setReadcount(rs.getInt("readcount"));
        dto.setWriteday(rs.getTimestamp("writeday"));
        list.add(dto);
      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }

    return list;
  }

  // 조회순
  public List<ReviewDto> getWatchedList(int start, int perpage) {
    List<ReviewDto> list = new Vector<ReviewDto>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from maria_study.treview order by readcount desc limit ?,?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, perpage);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        ReviewDto dto = new ReviewDto();
        dto.setNum(rs.getString("num"));
        dto.setUserID(rs.getString("userID"));
        dto.setSubject(rs.getString("subject"));
        dto.setContent(rs.getString("content"));
        dto.setThumbnail(rs.getString("thumbnail"));
        dto.setGood(rs.getInt("good"));
        dto.setReadcount(rs.getInt("readcount"));
        dto.setWriteday(rs.getTimestamp("writeday"));
        list.add(dto);
      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return list;
  }

  // 추천순
  public List<ReviewDto> getGoodList(int start, int perpage) {
    List<ReviewDto> list = new Vector<ReviewDto>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from maria_study.treview order by good desc limit ?,?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, perpage);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        ReviewDto dto = new ReviewDto();
        dto.setNum(rs.getString("num"));
        dto.setUserID(rs.getString("userID"));
        dto.setSubject(rs.getString("subject"));
        dto.setContent(rs.getString("content"));
        dto.setThumbnail(rs.getString("thumbnail"));
        dto.setGood(rs.getInt("good"));
        dto.setReadcount(rs.getInt("readcount"));
        dto.setWriteday(rs.getTimestamp("writeday"));
        list.add(dto);
      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return list;
  }

  // num에 해당하는 dto 반환
  public ReviewDto getData(String num) {
    ReviewDto dto = new ReviewDto();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from maria_study.treview where num=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, num);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        dto.setNum(rs.getString("num"));
        dto.setUserID(rs.getString("userID"));
        dto.setSubject(rs.getString("subject"));
        dto.setContent(rs.getString("content"));
        dto.setReadcount(rs.getInt("readcount"));
        dto.setGood(rs.getInt("good"));
        dto.setWriteday(rs.getTimestamp("writeday"));
      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return dto;
  }

  // 조회수 증가
  public void updateReadcount(String num) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "update maria_study.treview set readcount=readcount+1 where num=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, num);
      pstmt.execute();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(pstmt, conn);
    }
  }

  // 추천수 증가
  public void updateGood(String num) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "update maria_study.treview set good=good+1 where num=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, num);
      pstmt.execute();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(pstmt, conn);
    }
  }

  // 최종 시퀀스 num 값 리턴
  public String getMaxNum() {
    String num = "";
    ReviewDto dto = new ReviewDto();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select max(num) from maria_study.treview";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        num = rs.getString(1);
      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return num;
  }

  // 삭제
  public void deleteReview(String num) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "delete from maria_study.treview where num=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, num);
      pstmt.execute();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(pstmt, conn);
    }
  }

  // 수정
  public void updateReview(ReviewDto dto) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "update maria_study.treview set subject=?, content=?, thumbnail=? where num=?";
    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getSubject());
      pstmt.setString(2, dto.getContent());
      pstmt.setString(3, dto.getThumbnail());
      pstmt.setString(4, dto.getNum());

      pstmt.execute();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(pstmt, conn);
    }
  }
}
