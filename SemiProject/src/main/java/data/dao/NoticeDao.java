package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import data.dto.NoticeDto;
import connection.DBConnect;

public class NoticeDao {
  DBConnect db = new DBConnect();

  // insert
  public void insertNotice(NoticeDto dto) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "insert into bit_semi.notice (title,content) values (?,?)";

    try {
      pstmt = conn.prepareStatement(sql);


      pstmt.setString(1, dto.getTitle());
      pstmt.setString(2, dto.getContent());

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
    String sql = "select count(*) from bit_semi.notice";


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

  public List<NoticeDto> getNotice(int start, int perpage) {
    List<NoticeDto> list = new Vector<NoticeDto>();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from bit_semi.notice order by num asc limit ?,?";

    try {
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, start);
      pstmt.setInt(2, perpage);
      rs = pstmt.executeQuery();

      while (rs.next()) {
        NoticeDto dto = new NoticeDto();
        dto.setNum(rs.getString("num"));
        dto.setName(rs.getString("name"));
        dto.setTitle(rs.getString("title"));
        dto.setContent(rs.getString("content"));
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

  public NoticeDto getNot(String num) {
    NoticeDto dto = new NoticeDto();
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from bit_semi.notice where num=?";

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, num);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        dto.setNum(rs.getString("num"));
        dto.setName(rs.getString("name"));
        dto.setTitle(rs.getString("title"));
        dto.setContent(rs.getString("content"));
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

  public void updateNotice(NoticeDto dto) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "update bit_semi.notice set title=?,content=? where num=?";

    try {
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, dto.getTitle());
      pstmt.setString(2, dto.getContent());
      pstmt.setString(3, dto.getNum());

      pstmt.execute();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } finally {
      db.dbClose(pstmt, conn);
    }

  }

  public void deleteNotice(String num) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "delete from bit_semi.notice where num=?";

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

  public void updateReadCount(String num) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "update bit_semi.notice set readcount=readcount+1 where num=?";

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
