package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import data.dto.PlanDto;
import mysql.db.DbConnect;

public class PlanDao {
  DbConnect db = new DbConnect();

  // insert
  public void insertPlan(PlanDto dto) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "insert into test (name,content,chu,jo,writeday) values (?,?,?,?,now())";

    try {
      pstmt = conn.prepareStatement(sql);
      // 바인딩
      pstmt.setString(1, dto.getName());
      pstmt.setString(2, dto.getContent());
      pstmt.setInt(3, dto.getChu());
      pstmt.setInt(4, dto.getJo());
      // 실행
      pstmt.execute();
    } catch (SQLException e) {
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
    String sql = "select count(*) from test";


    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      if (rs.next())
        n = rs.getInt(1);

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return n;
  }

  // 게시판,페이징 처리
  // 최신순
  public List<PlanDto> getPlan(int start, int perpage) {
    List<PlanDto> list = new Vector<PlanDto>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from test order by num desc limit ?,?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, perpage);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        PlanDto dto = new PlanDto();
        dto.setNum(rs.getString("num"));
        dto.setName(rs.getString("name"));
        dto.setContent(rs.getString("content"));
        dto.setChu(rs.getInt("chu"));
        dto.setJo(rs.getInt("jo"));
        dto.setWriteday(rs.getTimestamp("writeday"));

        list.add(dto);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return list;

  }

  // 추천순
  public List<PlanDto> getPlan2(int start, int perpage) {
    List<PlanDto> list = new Vector<PlanDto>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from test order by chu desc limit ?,?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, perpage);
      rs = pstmt.executeQuery();


      while (rs.next()) {
        PlanDto dto = new PlanDto();
        dto.setNum(rs.getString("num"));
        dto.setName(rs.getString("name"));
        dto.setContent(rs.getString("content"));
        dto.setChu(rs.getInt("chu"));
        dto.setJo(rs.getInt("jo"));
        dto.setWriteday(rs.getTimestamp("writeday"));

        list.add(dto);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return list;
  }

  // 좋아요순
  public List<PlanDto> getPlan3(int start, int perpage) {
    List<PlanDto> list = new Vector<PlanDto>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from test order by jo desc limit ?,?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, perpage);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        PlanDto dto = new PlanDto();
        dto.setNum(rs.getString("num"));
        dto.setName(rs.getString("name"));
        dto.setContent(rs.getString("content"));
        dto.setChu(rs.getInt("chu"));
        dto.setJo(rs.getInt("jo"));
        dto.setWriteday(rs.getTimestamp("writeday"));

        list.add(dto);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return list;
  }



}

