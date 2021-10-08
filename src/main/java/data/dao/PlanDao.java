package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(pstmt, conn);
    }

  }

  // 모든 게시판 불러오기
  public ArrayList<PlanDto> getAllPlans() {
    ArrayList<PlanDto> list = new ArrayList<PlanDto>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from test order by num desc";
    try {
      pstmt = conn.prepareStatement(sql);
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
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return list;


  }

  public ArrayList<PlanDto> getAllPlans2() {
    ArrayList<PlanDto> list2 = new ArrayList<PlanDto>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from test order by chu desc";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        PlanDto dto = new PlanDto();
        dto.setNum(rs.getString("num"));
        dto.setName(rs.getString("name"));
        dto.setContent(rs.getString("content"));
        dto.setChu(rs.getInt("chu"));
        dto.setJo(rs.getInt("jo"));
        dto.setWriteday(rs.getTimestamp("writeday"));
        list2.add(dto);
      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return list2;


  }

  public ArrayList<PlanDto> getAllPlans3() {
    ArrayList<PlanDto> list3 = new ArrayList<PlanDto>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from test order by jo desc";
    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        PlanDto dto = new PlanDto();
        dto.setNum(rs.getString("num"));
        dto.setName(rs.getString("name"));
        dto.setContent(rs.getString("content"));
        dto.setChu(rs.getInt("chu"));
        dto.setJo(rs.getInt("jo"));
        dto.setWriteday(rs.getTimestamp("writeday"));
        list3.add(dto);
      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return list3;


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
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return n;
  }

  // 페이징 처리
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
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return list;

    // 전체 게시물 갯수

  }
}

