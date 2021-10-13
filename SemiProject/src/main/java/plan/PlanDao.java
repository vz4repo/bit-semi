package plan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import mysql.db.DbConnect;

public class PlanDao {
  DbConnect db = new DbConnect();

  // insert
  public void insertPlan(PlanDto dto) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql =
        "insert into test (userId,plantitle,planDate,content,writeday) values (?,?,?,?,now())";

    try {
      pstmt = conn.prepareStatement(sql);
      // 바인딩
      pstmt.setString(1, dto.getUserId());
      pstmt.setString(2, dto.getPlantitle());
      pstmt.setString(3, dto.getPlanDate());
      pstmt.setString(4, dto.getContent());
      // 실행
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
        // num,userId,plantitle,planDate,content,readCNT,good,writeday
        dto.setNum(rs.getString("num"));
        dto.setUserId(rs.getString("userId"));
        dto.setPlantitle(rs.getString("plantitle"));
        dto.setPlanDate(rs.getString("planDate"));
        dto.setContent(rs.getString("content"));
        dto.setReadCNT(rs.getInt("readCNT"));
        dto.setGood(rs.getInt("good"));
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
  public List<PlanDto> getPlan2(int start, int perpage) {
    List<PlanDto> list = new Vector<PlanDto>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from test order by good desc limit ?,?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, perpage);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        PlanDto dto = new PlanDto();
        dto.setNum(rs.getString("num"));
        dto.setUserId(rs.getString("userId"));
        dto.setPlantitle(rs.getString("plantitle"));
        dto.setPlanDate(rs.getString("planDate"));
        dto.setContent(rs.getString("content"));
        dto.setReadCNT(rs.getInt("readCNT"));
        dto.setGood(rs.getInt("good"));
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

  // 좋아요순
  public List<PlanDto> getPlan3(int start, int perpage) {
    List<PlanDto> list = new Vector<PlanDto>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from test order by readCNT desc limit ?,?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, perpage);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        PlanDto dto = new PlanDto();
        dto.setNum(rs.getString("num"));
        dto.setUserId(rs.getString("userId"));
        dto.setPlantitle(rs.getString("plantitle"));
        dto.setPlanDate(rs.getString("planDate"));
        dto.setContent(rs.getString("content"));
        dto.setReadCNT(rs.getInt("readCNT"));
        dto.setGood(rs.getInt("good"));
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
}

