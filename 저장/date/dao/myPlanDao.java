package date.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import date.dto.myAllPlanDto;
import date.dto.myPlanDto;
import mysql.db.DbConnect;

public class myPlanDao {
  DbConnect db = new DbConnect();

  

  myAllPlanDto cdto = new myAllPlanDto();
  public void insertPlan(myAllPlanDto dto) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "insert into myPlan(userID ,writeDay ,readCnt ,goodCnt ,plantitle,"
        + "planStartDay,planEndDay,openPlan) values(?,now(),?,?,?,?,?,?)";

    try {
        pstmt=conn.prepareStatement(sql);
        
        pstmt.setString(1, dto.getUserId());
        pstmt.setInt(2, dto.getReadCnt());
        pstmt.setInt(3, dto.getGoodCnt());
        pstmt.setString(4, dto.getPlantitle());
        pstmt.setString(5, dto.getPlanStartDay());
        pstmt.setString(6  , dto.getPlanEndDay());
        pstmt.setBoolean(7, dto.isOpenPlan());
        
        pstmt.execute();
    } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }finally {
        db.dbClose(pstmt, conn);
    }
    
}
 
  public void insertPlanContent(myPlanDto dto) {
    Connection conn = db.getConnection();
    PreparedStatement pstmt = null;
    String sql = "insert into myContent(num ,plantitle ,planDate ,planTime  ,mapPlan ,contentPlan) values(?,?,?,?,?,?)";

    try {
        pstmt=conn.prepareStatement(sql);
        
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
    }finally {
        db.dbClose(pstmt, conn);
    }
    
}
  
}
