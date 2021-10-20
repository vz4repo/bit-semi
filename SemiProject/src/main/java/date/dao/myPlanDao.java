package date.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import date.dto.myAllPlanDto;
import date.dto.myPlanDto;
import connection.DBConnect;

public class myPlanDao {
  DBConnect db = new DBConnect();



  myAllPlanDto cdto = new myAllPlanDto();

  public void insertPlan(myAllPlanDto dto) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "insert into bit_semi.postinfo (userID  ,readCnt ,goodCnt ,plantitle,"
        + "planStartDay,planEndDay,openPlan) values(?,?,?,?,?,?,?)";

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, dto.getUserId());
      pstmt.setInt(2, dto.getReadCnt());
      pstmt.setInt(3, dto.getGoodCnt());
      pstmt.setString(4, dto.getPlantitle());
      pstmt.setString(5, dto.getPlanStartDay());
      pstmt.setString(6, dto.getPlanEndDay());
      pstmt.setBoolean(7, dto.isOpenPlan());

      pstmt.execute();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(pstmt, conn);
    }

  }

  public void insertPlanContent(myPlanDto dto) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql =
        "insert into bit_semi.postinfo (num ,plantitle ,planDate ,planTime  ,mapPlan ,contentPlan) values(?,?,?,?,?,?)";

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, dto.getNum());
      pstmt.setString(2, dto.getPlantitle());
      pstmt.setString(3, dto.getPlanDate());
      pstmt.setString(4, dto.getPlanTime());
      pstmt.setString(5, dto.getMapPlan());
      pstmt.setString(6, dto.getContentPlan());

      pstmt.execute();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(pstmt, conn);
    }

  }

  public List<myAllPlanDto> getAllPlan(int start, int perpage) {
    List<myAllPlanDto> list = new Vector<myAllPlanDto>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from bit_semi.postinfo order by writeDay desc limit ?,?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, perpage);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        myAllPlanDto dto = new myAllPlanDto();
        // num,userId,plantitle,planDate,content,readCNT,good
        dto.setNum(rs.getInt("num"));
        dto.setUserId(rs.getString("userId"));
        dto.setPlantitle(rs.getString("plantitle"));
        dto.setPlanStartDay(rs.getString("planStartDay"));
        dto.setPlanEndDay(rs.getString("planEndDay"));
        dto.setReadCnt(rs.getInt("readCnt"));
        dto.setGoodCnt(rs.getInt("goodCnt"));
        dto.setWriteDay(rs.getTimestamp("writeDay"));

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

  public List<myAllPlanDto> getAllPlan2(int start, int perpage) {
    List<myAllPlanDto> list = new Vector<myAllPlanDto>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from bit_semi.postinfo order by readCnt desc limit ?,?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, perpage);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        myAllPlanDto dto = new myAllPlanDto();
        // num,userId,plantitle,planDate,content,readCNT,good
        dto.setNum(rs.getInt("num"));
        dto.setUserId(rs.getString("userId"));
        dto.setPlantitle(rs.getString("plantitle"));
        dto.setPlanStartDay(rs.getString("planStartDay"));
        dto.setPlanEndDay(rs.getString("planEndDay"));
        dto.setReadCnt(rs.getInt("readCnt"));
        dto.setGoodCnt(rs.getInt("goodCnt"));
        dto.setWriteDay(rs.getTimestamp("writeDay"));

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

  public List<myAllPlanDto> getAllPlan3(int start, int perpage) {
    List<myAllPlanDto> list = new Vector<myAllPlanDto>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from bit_semi.postinfo order by goodCnt desc limit ?,?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, perpage);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        myAllPlanDto dto = new myAllPlanDto();
        // num,userId,plantitle,planDate,content,readCNT,good
        dto.setNum(rs.getInt("num"));
        dto.setUserId(rs.getString("userId"));
        dto.setPlantitle(rs.getString("plantitle"));
        dto.setPlanStartDay(rs.getString("planStartDay"));
        dto.setPlanEndDay(rs.getString("planEndDay"));
        dto.setReadCnt(rs.getInt("readCnt"));
        dto.setGoodCnt(rs.getInt("goodCnt"));
        dto.setWriteDay(rs.getTimestamp("writeDay"));

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

  public int getTotalCount() {
    int n = 0;
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select count(*) from bit_semi.postinfo";


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

  public void updateReadcount(String num) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "update bit_semi.postinfo set readCnt=readCnt+1 where num=?";

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

  public myAllPlanDto getAll(String num) {
    myAllPlanDto dto = new myAllPlanDto();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from bit_semi.postinfo where num=?";

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, num);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        dto.setNum(rs.getInt("num"));
        dto.setUserId(rs.getString("userId"));
        dto.setPlantitle(rs.getString("plantitle"));
        dto.setPlanStartDay(rs.getString("planStartDay"));
        dto.setPlanEndDay(rs.getString("planEndDay"));
        dto.setReadCnt(rs.getInt("readCnt"));
        dto.setGoodCnt(rs.getInt("goodCnt"));
        dto.setWriteDay(rs.getTimestamp("writeDay"));

      }
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return dto;
  }

  public void updateGood(String num) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "update bit_semi.postinfo set goodCnt=goodCnt+1 where num=?";

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
}
