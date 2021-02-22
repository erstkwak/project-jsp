package member.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import member.vo.MemberVO;

public class MemberDAO {
	
	private DataSource        dataFactory;
	private Connection        conn;
	private PreparedStatement pstmt;
	private ResultSet         rs;
	
	private String query = null;
	
	// DB 연결
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} 
		catch (Exception e) {e.printStackTrace();}
	}
	
	// listMembers()
	public List<MemberVO> listMembers() {
		List<MemberVO> membersList = new ArrayList<MemberVO>();
		
		try {
			conn = dataFactory.getConnection();
			
			query = "SELECT *"
				  + "  FROM MEMBER"
				  + " ORDER BY JOINDATE DESC";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				String id       = rs.getString("id"      );
				String pwd      = rs.getString("pwd"     );
				String nickname = rs.getString("nickname");
				String email    = rs.getString("email"   );
				Date   joinDate = rs.getDate  ("joinDate");
				
				MemberVO memberVO = new MemberVO(id, pwd, nickname, email, joinDate);
				membersList.add(memberVO);
			}
			
			rs   .close();
			pstmt.close();
			conn .close();
		} 
		catch (SQLException e) {e.printStackTrace();}
		
		return membersList;
	}
	
	// addMember
	public void addMember(MemberVO memberVO) {
		try {
			conn = dataFactory.getConnection();
			
			String id       = memberVO.getId      ();
			String pwd      = memberVO.getPwd     ();
			String nickname = memberVO.getNickname();
			String email    = memberVO.getEmail   ();
			
			query = "INSERT INTO MEMBER"
				  + "  (id, pwd, nickname, email)"
				  + "  VALUES"
				  + "  (?, ?, ?, ?)";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, nickname);
			pstmt.setString(4, email);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn .close();
		} 
		catch (SQLException e) {e.printStackTrace();}
	}
	
	// findMember
	public MemberVO findMember(String id_) {
		MemberVO memInfo = null;
		
		try {
			conn = dataFactory.getConnection();
			
			query = "SELECT *"
				  + "  FROM MEMBER"
				  + " WHERE id = ?";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id_);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String id       = rs.getString("id"      );
			String pwd      = rs.getString("pwd"     );
			String nickname = rs.getString("nickname");
			String email    = rs.getString("email"   );
			Date   joinDate = rs.getDate  ("joinDate");
			
			memInfo = new MemberVO(id, pwd, nickname, email, joinDate);
			
			pstmt.close();
			conn .close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memInfo;
	}
	
	// modMember
	public void modMember(MemberVO memberVO) {
		String id       = memberVO.getId      ();
		String pwd      = memberVO.getPwd     ();
		String nickname = memberVO.getNickname();
		String email    = memberVO.getEmail   ();
		try {
			conn = dataFactory.getConnection();
			
			query = "UPDATE MEMBER"
			      + "   SET pwd      = ?"
				  + "     , nickname = ?"
				  + "     , email    = ?"
				  + " WHERE id = ?";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, pwd);
			pstmt.setString(2, nickname);
			pstmt.setString(3, email);
			pstmt.setString(4, id);
			pstmt.executeUpdate();
			
			pstmt.close();
			conn .close();
		} 
		catch (Exception e) {e.printStackTrace();}
	}
	
	// delMember
	public void delMember(String id) {
		try {
			conn = dataFactory.getConnection();
			
			query = "DELETE"
		          + "  FROM MEMBER"
				  + " WHERE id = ?";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {e.printStackTrace();}
	}
	
}