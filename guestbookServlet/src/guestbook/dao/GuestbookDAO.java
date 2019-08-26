package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import guestbook.bean.GuestbookDTO;

public class GuestbookDAO {
	private static GuestbookDAO instance;

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "java";
	private String password = "dkdlxl";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public GuestbookDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static GuestbookDAO getInstance() {
		if (instance == null) {
			synchronized (GuestbookDAO.class) {
				instance = new GuestbookDAO();
			}
		}
		return instance;
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void write(GuestbookDTO guestbookDTO) {
		String sql = "insert into guestbook values(seq_guestbook.nextval,?,?,?,?,?,sysdate)";
		getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, guestbookDTO.getName());
			pstmt.setString(2, guestbookDTO.getEmail());
			pstmt.setString(3, guestbookDTO.getHomepage());
			pstmt.setString(4, guestbookDTO.getSubject());
			pstmt.setString(5, guestbookDTO.getContent());
			
			pstmt.executeUpdate();//실행
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
	}
	
	public ArrayList<GuestbookDTO> getGuestbookList(int startNum, int endNum) {
		ArrayList<GuestbookDTO> arrayList = new ArrayList<GuestbookDTO>();
		//부모 = 자식
		getConnection();
		String sql = "select * from " + 
				"(select rownum rn, tt.* from " + 
				"(select seq, name, email, homepage, subject, content, to_char(logtime, 'YYYY-MM-DD') as logtime " + 
				"from guestbook order by seq desc) tt)" + 
				"where rn>=? and rn<=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GuestbookDTO dto = new GuestbookDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setLogtime(rs.getString("logtime"));
				
				arrayList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			arrayList = null;	//에러 발생 했을때 ar rayList를 null 해줘야됨. 
		} finally {
			try { // 종료
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return arrayList;
	}

	public int getTotalA() {
		int totalA = 0;
		String sql = "select count(*) from guestbook";
		getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) totalA = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try { // 종료
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return totalA;
	}
}
