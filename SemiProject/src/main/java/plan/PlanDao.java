package plan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import connection.DBConnect;

public class PlanDao {
  DBConnect db = new DBConnect();

  // insert
  public void insertPlan(PlanDto dto) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql =
        "insert into bit_semi.postinfo (userId,plantitle,planDate,content) values (?,?,?,?)";

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

  // num에 해당하는 dto 반환
  public PlanDto getData(String num) {
    PlanDto dto = new PlanDto();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from bit_semi.postinfo where num=?";

    try {
      pstmt = conn.prepareStatement(sql);

      // 바인딩
      pstmt.setString(1, num);

      // 실행
      rs = pstmt.executeQuery();

      if (rs.next()) {
        dto.setNum(rs.getString("num"));
        dto.setUserId(rs.getString("userId"));
        dto.setPlantitle(rs.getString("plantitle"));
        dto.setPlanDate(rs.getString("planDate"));
        dto.setContent(rs.getString("content"));
        dto.setReadCNT(rs.getInt("readCNT"));
        dto.setGood(rs.getInt("good"));
        dto.setWriteday(rs.getTimestamp("writeday"));
      }
    } catch (SQLException e) {
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
    String sql = "update bit_semi.postinfo set readCNT=readCNT+1 where num=?";

    try {
      pstmt = conn.prepareStatement(sql);

      // 바인딩
      pstmt.setString(1, num);

      // 실행
      pstmt.execute();

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      db.dbClose(pstmt, conn);
    }
  }

  // 방금 추가된 최종 시퀀스 num 값 리턴
  public String getMaxNum() {
    PlanDto dto = new PlanDto();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select max(num) from bit_semi.postinfo";
    String num = "";

    try {
      pstmt = conn.prepareStatement(sql);

      // 실행
      rs = pstmt.executeQuery();

      if (rs.next()) {
        num = rs.getString(1);
      }

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      db.dbClose(rs, pstmt, conn);
    }
    return num;
  }

  // 게시판,페이징 처리
  // 최신순
  public List<PlanDto> getPlan(int start, int perpage) {
    List<PlanDto> list = new Vector<PlanDto>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from bit_semi.postinfo order by num desc limit ?,?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, perpage);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        PlanDto dto = new PlanDto();
        // num,userId,plantitle,planDate,content,readCNT,good
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

  // 메인 화면에 6개 게시판 출력!
  public List<PlanDto> getMainPlan() {
    List<PlanDto> list = new Vector<PlanDto>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from bit_semi.postinfo order by readCNT desc limit 6";

    try {
      pstmt = conn.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        PlanDto dto = new PlanDto();
        // num,userId,plantitle,planDate,content,readCNT,good
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
    String sql = "select * from bit_semi.postinfo order by good desc limit ?,?";

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
    String sql = "select * from bit_semi.postinfo order by readCNT desc limit ?,?";

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

  // 추천수 증가
  public void updateGood(String num) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "update bit_semi.postinfo set good=good+1 where num=?";

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
