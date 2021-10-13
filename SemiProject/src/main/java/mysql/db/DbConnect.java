<<<<<<< HEAD
package mysql.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
	static final String MYSQLDRIVER="com.mysql.jdbc.Driver";

	static final String MYSQL_URL="jdbc:mysql://localhost:3306/test?serverTimezone=Asia/Seoul";
	
	//»ı¼ºÀÚ
	public DbConnect() {
		// TODO Auto-generated constructor stub
		try {
			Class.forName(MYSQLDRIVER);
		} catch (ClassNotFoundException e) {
			System.out.println("Mysql µå¶óÀÌ¹ö ½ÇÆĞ:"+e.getMessage());
		}
	}
	
	public Connection getConnection()
	{
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(MYSQL_URL, "root", "1234");
		} catch (SQLException e) {
			System.out.println("Mysql ¿¬°á ½ÇÆĞ:"+e.getMessage());
		}
		return conn;
	}
	
	//close ¸Ş¼­µå´Â ÃÑ 4°³, ¿À¹ö·Îµù ¸Ş¼­µå
	public void dbClose(ResultSet rs,Statement stmt,Connection conn)
	{
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {}
	}
	
	public void dbClose(ResultSet rs,PreparedStatement pstmt,Connection conn)
	{
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {}
	}
	public void dbClose(Statement stmt,Connection conn)
	{
		try {			
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {}
	}
	
	public void dbClose(PreparedStatement pstmt,Connection conn)
	{
		try {			
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch(SQLException e) {}
	}
}













=======
package mysql.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
  static final String MYSQLDRIVER = "com.mysql.jdbc.Driver";

  static final String MYSQL_URL = "jdbc:mysql://localhost:3306/test";

  // ìƒì„±ì
  public DbConnect() {
    // TODO Auto-generated constructor stub
    try {
      Class.forName(MYSQLDRIVER);
    } catch (ClassNotFoundException e) {
      // TODO Auto-generated catch block
      System.out.println("Mysql ë“œë¼ì´ë²„ ì‹¤íŒ¨:" + e.getMessage());
    }
  }

  public Connection getConnection() {
    Connection conn = null;
    try {
      conn = DriverManager.getConnection(MYSQL_URL, "root", "1234");
      // System.out.println("ì„±ê³µ");

    } catch (SQLException e) {
      // TODO Auto-generated catch block
      System.out.println("Mysql ì—°ê²° ì‹¤íŒ¨ : " + e.getMessage());
    }
    return conn;

  }

  // close ë©”ì„œë“œëŠ” ì´ 4ê°œ, ì˜¤ë²„ë¡œë”© ë©”ì„œë“œ
  public void dbClose(ResultSet rs, Statement stmt, Connection conn) {
    try {
      if (rs != null)
        rs.close();
      if (stmt != null)
        stmt.close();
      if (conn != null)
        conn.close();
    } catch (SQLException e) {
    }
  }

  public void dbClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
    try {
      if (rs != null)
        rs.close();
      if (pstmt != null)
        pstmt.close();
      if (conn != null)
        conn.close();
    } catch (SQLException e) {
    }
  }

  public void dbClose(Statement stmt, Connection conn) {
    try {
      if (stmt != null)
        stmt.close();
      if (conn != null)
        conn.close();
    } catch (SQLException e) {
    }
  }

  public void dbClose(PreparedStatement pstmt, Connection conn) {
    try {
      if (pstmt != null)
        pstmt.close();
      if (conn != null)
        conn.close();
    } catch (SQLException e) {
    }
  }


}
>>>>>>> a50d283356c25e5fd3de198e87a4dc6f81e9ef1b
