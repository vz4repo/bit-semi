package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import data.dto.ReviewDto;
import mysql.db.DbConnect;

public class ReviewDao {
  DbConnect db = new DbConnect();

  // insert
  public void insertReview(ReviewDto dto) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "insert into review (subject,content,thumbnail,writeday) values (?,?,?,now())";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getSubject());
      pstmt.setString(2, dto.getContent());
      pstmt.setString(3, dto.getThumbnail());
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
    String sql = "select count(*) from review";

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
    String sql = "select * from review order by num desc limit ?,?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, perpage);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        ReviewDto dto = new ReviewDto();
        dto.setNum(rs.getString("num"));
        dto.setSubject(rs.getString("subject"));
        dto.setContent(rs.getString("content"));
        dto.setThumbnail(rs.getString("thumbnail"));
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
  public List<ReviewDto> getWatchedList() {
    List<ReviewDto> list = new Vector<ReviewDto>();
    return list;
  }

  // 추천순
  public List<ReviewDto> getLikeList() {
    List<ReviewDto> list = new Vector<ReviewDto>();
    return list;
  }

  // num에 해당하는 dto 반환
  public ReviewDto getData(String num) {
    ReviewDto dto = new ReviewDto();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from review where num=?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, num);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        dto.setNum(rs.getString("num"));
        dto.setSubject(rs.getString("subject"));
        dto.setContent(rs.getString("content"));
        dto.setThumbnail(rs.getString("thumbnail"));
        dto.setReadcount(rs.getInt("readcount"));
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
    String sql = "update review set readcount=readcount+1 where num=?";

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
    String sql = "select max(num) from review";

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
}
