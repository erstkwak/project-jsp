package guest.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import guest.db.DBCon;
import guest.vo.GuestbookVo;
import oracle.jdbc.internal.OracleCallableStatement;

public class GuestbookDao {
	public void guestbookInsert(GuestbookVo guestbookVo) {
		// 방명록 추가
		Connection        conn  = null;
		CallableStatement cstmt = null;

		String guestbook_id       = guestbookVo.getGb_id();
		String guestbook_password = guestbookVo.getGb_pass();
		String guestbook_content  = guestbookVo.getGb_con();
		int group = guestbookVo.getGb_group(); 	  // 그룹번호
		int parent = guestbookVo.getGb_parent();  // 부모글번호

		DBCon db = null;
		try {
			db = new DBCon();
			conn = db.getConnection();
			String sql = "{CALL PKG_GUESTBOOK.PROC_GB_INSERT(?, ?, ?, ?, ?) }";
			cstmt = conn.prepareCall(sql);

			cstmt.setString(1, guestbook_id);
			cstmt.setString(2, guestbook_password);
			cstmt.setString(3, guestbook_content);
			cstmt.setInt(4, group);		
			cstmt.setInt(5, parent);		
			cstmt.executeUpdate();

			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			try {
				if(cstmt != null) cstmt.close();
				if(conn  != null) conn.close();
			} catch (SQLException e) {				
				e.printStackTrace();
			}
		}
		
	}

	public List<GuestbookVo> getGuestbookList() {
		List<GuestbookVo> gbList = new ArrayList<GuestbookVo>();
		
		Connection        conn  = null;
		CallableStatement cstmt = null;
		ResultSet         rs    = null;
		
		DBCon db = null;
		try {
			db   = new DBCon();
			conn = db.getConnection();
			String sql = "{CALL PKG_GUESTBOOK.PROC_GB_LIST(?)}";
			cstmt = conn.prepareCall(sql);
			
			cstmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
			cstmt.execute();
		
			OracleCallableStatement ocstmt = (OracleCallableStatement)cstmt;
			rs = ocstmt.getCursor(1);
			
			while(rs.next()) {
				GuestbookVo vo = new GuestbookVo();
				vo.setGb_no(rs.getInt("gb_no"));
				vo.setGb_id(rs.getString("gb_id"));
				vo.setGb_pass(rs.getString("gb_pass"));
				vo.setGb_con(rs.getString("gb_con"));
				vo.setGb_group(rs.getInt("gb_group"));
				vo.setGb_parent(rs.getInt("gb_parent"));
				vo.setGb_date(rs.getString("gb_date"));
				//vo.setGb_level(rs.getInt("gb_level"));
				
				gbList.add(vo);
			}
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(rs != null) rs.close();
			if(cstmt != null) cstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {				
			e.printStackTrace();
		}
	}
	
	return gbList;
	}
}
