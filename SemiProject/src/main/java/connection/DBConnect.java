package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect {
  // ORA_CLOUD
  private static final String ORA_DRIVER = "oracle.jdbc.driver.OracleDriver";
  private static final String ORA_URL =
      "jdbc:oracle:thin:@oradb_high?TNS_ADMIN=D:/java/Wallet_oradb";
  // "jdbc:oracle:thin:@oradb_high?TNS_ADMIN=/Users/rk/Documents/java/Wallet_oradb";
  private static final String ORA_USER = "admin";
  private static final String ORA_PWD = "1234qwer";

  // MARIA_BIT
  private static final String MARIA_DRIVER = "com.mysql.jdbc.Driver";
  private static final String MARIA_URL =
      "jdbc:mysql://localhost:3306/test?serverTimezone=Asia/Seoul";
  private static final String MARIA_USER = "root";
  private static final String MARIA_PWD = "1234";

  // DBConnect test
  public static void main(String[] args) {
    DBConnect conn = new DBConnect();
    conn.getConnectionCloud();
  }

  public DBConnect() {
    // if (ORA_DRIVER != null) {
    // try {
    // Class.forName(ORA_DRIVER);
    // System.out.println("Driver load success >>" + Thread.currentThread().getName());
    // } catch (ClassNotFoundException e) {
    // System.out.println("Driver load failed ");
    // e.getLocalizedMessage();
    // }

    if (MARIA_DRIVER != null) {
      try {
        Class.forName(MARIA_DRIVER);
        System.out.println("MARIA Driver load >>" + Thread.currentThread().getName());
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


  public Connection getConnectionCloud() {
    Connection conn = null;
    try {
      // conn = DriverManager.getConnection(ORA_URL, ORA_USER, ORA_PWD);
      conn = DriverManager.getConnection(MARIA_URL, MARIA_USER, MARIA_PWD);
      System.out.println("AWS:mariaDB getConnection");

    } catch (SQLException e) {
      System.out.println("connection error" + e.getLocalizedMessage());
    }
    return conn;

  }


  // 3개 close, 각각+디폴트>오버로딩 4개
  public void resourceClose(ResultSet rs, Statement stmt, Connection conn) {
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

  public void resourceClose(ResultSet rs, PreparedStatement ps, Connection conn) {
    try {
      if (rs != null)
        rs.close();
      if (ps != null)
        ps.close();
      if (conn != null)
        conn.close();
    } catch (Exception e) {
    }
  }

  public void resourceClose(Statement ps, Connection conn) {
    try {
      if (ps != null)
        ps.close();
      if (conn != null)
        conn.close();
    } catch (Exception e) {
    }
  }

  public void resourceClose(PreparedStatement ps, Connection conn) {
    try {
      if (ps != null)
        ps.close();
      if (conn != null)
        conn.close();
    } catch (Exception e) {
    }
  }

}
