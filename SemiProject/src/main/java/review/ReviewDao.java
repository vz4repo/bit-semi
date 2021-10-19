package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
<<<<<<< HEAD
import mysql.db.DbConnect;

public class ReviewDao {
  DbConnect db = new DbConnect();
=======
import connection.DBConnect;

public class ReviewDao {
  DBConnect db = new DBConnect();
>>>>>>> c2e0fab29322c66c883cbb89ad7b2bdef923ea60

  // insert
  public void insertReview(ReviewDto dto) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql =
<<<<<<< HEAD
        "insert into treview (userID,subject,content,thumbnail,writeday) values (?,?,?,?,now())";
=======
        "insert into maria_study.treview (userID,subject,content,thumbnail,writeday) values (?,?,?,?,now())";
>>>>>>> c2e0fab29322c66c883cbb89ad7b2bdef923ea60

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
<<<<<<< HEAD
    String sql = "select count(*) from treview";
=======
    String sql = "select count(*) from maria_study.treview";
>>>>>>> c2e0fab29322c66c883cbb89ad7b2bdef923ea60

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
<<<<<<< HEAD
    String sql = "select * from treview order by writeday desc limit ?,?";
=======
    String sql = "select * from maria_study.treview order by writeday desc limit ?,?";
>>>>>>> c2e0fab29322c66c883cbb89ad7b2bdef923ea60

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
<<<<<<< HEAD
    String sql = "select * from treview order by readcount desc limit ?,?";
=======
    String sql = "select * from maria_study.treview order by readcount desc limit ?,?";
>>>>>>> c2e0fab29322c66c883cbb89ad7b2bdef923ea60

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
<<<<<<< HEAD
    String sql = "select * from treview order by good desc limit ?,?";
=======
    String sql = "select * from maria_study.treview order by good desc limit ?,?";
>>>>>>> c2e0fab29322c66c883cbb89ad7b2bdef923ea60

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
<<<<<<< HEAD
    String sql = "select * from treview where num=?";
=======
    String sql = "select * from maria_study.treview where num=?";
>>>>>>> c2e0fab29322c66c883cbb89ad7b2bdef923ea60

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
<<<<<<< HEAD
    String sql = "update treview set readcount=readcount+1 where num=?";
=======
    String sql = "update maria_study.treview set readcount=readcount+1 where num=?";
>>>>>>> c2e0fab29322c66c883cbb89ad7b2bdef923ea60

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
<<<<<<< HEAD
    String sql = "update treview set good=good+1 where num=?";
=======
    String sql = "update maria_study.treview set good=good+1 where num=?";
>>>>>>> c2e0fab29322c66c883cbb89ad7b2bdef923ea60

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
<<<<<<< HEAD
    String sql = "select max(num) from treview";
=======
    String sql = "select max(num) from maria_study.treview";
>>>>>>> c2e0fab29322c66c883cbb89ad7b2bdef923ea60

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
<<<<<<< HEAD
    String sql = "delete from treview where num=?";
=======
    String sql = "delete from maria_study.treview where num=?";
>>>>>>> c2e0fab29322c66c883cbb89ad7b2bdef923ea60
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
<<<<<<< HEAD
    String sql = "update treview set subject=?, content=?, thumbnail=? where num=?";
=======
    String sql = "update maria_study.treview set subject=?, content=?, thumbnail=? where num=?";
>>>>>>> c2e0fab29322c66c883cbb89ad7b2bdef923ea60
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
