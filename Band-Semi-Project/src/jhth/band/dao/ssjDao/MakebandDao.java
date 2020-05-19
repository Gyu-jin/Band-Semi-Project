package jhth.band.dao.ssjDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jhta.band.db.JDBCUtil;
import jhth.band.vo.ssjVo.MakebandVo;
import oracle.jdbc.OracleConnection.CommitOption;

public class MakebandDao {
	public int makeband(MakebandVo vo) {
		Connection con=null;
		PreparedStatement pstmt=null;

		int f=0;
		int num=1;
		long loginNum=0;

		
		try {
			con=JDBCUtil.getConn();
			
			pstmt=con.prepareStatement("INSERT INTO BAND VALUES(?,?,?,?,?,?,SYSDATE,1)");
			pstmt.setLong(1, num);
			pstmt.setInt(2, vo.getScategoryNum());
			pstmt.setInt(3, vo.getBand_imgNum());
			pstmt.setString(4, vo.getBand_name());
			pstmt.setInt(5, vo.getBand_publicwhe());
			pstmt.setString(6,vo.getBand_introductio());
			
			int n=pstmt.executeUpdate();
			
			if(n>0) {
				f=bandinfo(num,loginNum);
			}
			
			return f;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JDBCUtil.close(null , pstmt, con);
		}
	}
	
	public int bandinfo(int num,long loginNum) {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		String bandleader="�����";
		
		try {
			con=JDBCUtil.getConn();
			pstmt=con.prepareStatement("INSERT INTO BAND_USERINFO VALUES(1,?,?,?,1,SYSDATE)");
			pstmt.setLong(1, num);
			pstmt.setLong(2, loginNum);
			pstmt.setString(3, bandleader);
			int n=pstmt.executeUpdate();
			return n;
		} catch (SQLException se) {
			System.out.println(se.getMessage());
			return -1;
		}finally {
			JDBCUtil.close(null, pstmt, con);
		}
	}
}
