package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect {
  // ORA_CLOUD: 클라우드에서 쓰일 설정
  // private static final String DB_DRIVER = "oracle.jdbc.driver.OracleDriver";
  // private static final String DB_URL =
  // "jdbc:oracle:thin:@oradb_high?TNS_ADMIN=D:/java/Wallet_oradb";
  // // "jdbc:oracle:thin:@oradb_high?TNS_ADMIN=/Users/rk/Documents/java/Wallet_oradb";
  // private static final String DB_USER = "admin";
  // private static final String DB_PWD = "1234qwer";

   // MARIA_BIT_AWS: 클라우드에서 쓰일 설정
   private static final String DB_DRIVER = "org.mariadb.jdbc.Driver";
   private static final String DB_URL =
   "jdbc:mariadb://maria-bit.cy2ifmxzl5mi.ap-northeast-2.rds.amazonaws.com:3306";
   private static final String DB_USER = "guest";
   private static final String DB_PWD = "1234qwer";
//
//  // MYSQL_LOCAL: 로컬에서 쓰일 설정
//  private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
//  private static final String DB_URL = "jdbc:mysql://localhost:3306/test?serverTimezone=Asia/Seoul";
//  private static final String DB_USER = "root";
//  private static final String DB_PWD = "1234";

  // DBConnect test
  public static void main(String[] args) {
    DBConnect conn = new DBConnect();
    conn.getConnection();
  }

  public DBConnect() {
    if (DB_DRIVER != null) {
      try {
        Class.forName(DB_DRIVER);
        System.out.println("Driver load success>>" + Thread.currentThread().getName());
      } catch (ClassNotFoundException e) {
        System.out.println("Driver load failed " + e.getLocalizedMessage());
      }

      // driver 값, name 확인
      // Enumeration<Driver> driverList = DriverManager.getDrivers();
      // while (driverList.hasMoreElements()) {
      // Driver driver = (Driver) driverList.nextElement();
      // System.out.println(driver.getClass().getName());
      // }
    }
  }

  public Connection getConnection() {
    Connection conn = null;
    try {
      conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
      if (DB_DRIVER == "org.mariadb.jdbc.Driver")
        System.out.println("AWS:mariaDB getConnection");
      else
        System.out.println("DB getConnection");
    } catch (SQLException e) {
      System.out.println("connection error" + e.getLocalizedMessage());
    }
    return conn;

  }


  // 3개 close(), 각각+디폴트>오버로딩 4개
  public void dbClose(ResultSet rs, Statement stmt, Connection conn) {
    try {
      if (rs != null)
        rs.close();
      if (stmt != null)
        stmt.close();
      if (conn != null)
        conn.close();
    } catch (Exception e) {
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
    } catch (Exception e) {
    }
  }

  public void dbClose(Statement stmt, Connection conn) {
    try {
      if (stmt != null)
        stmt.close();
      if (conn != null)
        conn.close();
    } catch (Exception e) {
    }
  }

  public void dbClose(PreparedStatement pstmt, Connection conn) {
    try {
      if (pstmt != null)
        pstmt.close();
      if (conn != null)
        conn.close();
    } catch (Exception e) {
    }
  }

}
