package friend.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import friend.bean.FriendDTO;

public class FriendDAO {
	private static FriendDAO instance;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "java";
	private String password = "dkdlxl";
		
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public static FriendDAO getInstance() {
		if(instance==null) {
			synchronized (FriendDAO.class) {
				instance = new FriendDAO();
			}
		}
		return instance;
	}
	
	public FriendDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int insertFriend(FriendDTO dto) {
		int su=0;
		getConnection();//접속
		String sql = "insert into friend values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);//생성
			pstmt.setInt(1, dto.getSeq());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getTel1());
			pstmt.setString(4, dto.getTel2());
			pstmt.setString(5, dto.getTel3());
			pstmt.setInt(6, dto.getGender());
			pstmt.setInt(7, dto.getRead());
			pstmt.setInt(8, dto.getMovie());
			pstmt.setInt(9, dto.getMusic());
			pstmt.setInt(10, dto.getGame());
			pstmt.setInt(11, dto.getShopping());
			
			su = pstmt.executeUpdate();//실행-개수 리턴
			
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
		
		return su;
	}

	public int getSeq() {
		int seq=0;
		getConnection();//접속
		String sql = "select seq_friend.nextval from dual";
		try {
			pstmt = conn.prepareStatement(sql);//생성
			rs = pstmt.executeQuery();//실행-
			
			if(rs.next()) seq = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return seq;
	}

	public ArrayList<FriendDTO> getFriendList() {
		ArrayList<FriendDTO> arrayList = new ArrayList<FriendDTO>();
		
		String sql = "select * from friend";
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);//생성
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FriendDTO dto = new FriendDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setName(rs.getString("name"));
				dto.setTel1(rs.getString("tel1"));
				dto.setTel2(rs.getString("tel2"));
				dto.setTel3(rs.getString("tel3"));
				dto.setGender(rs.getInt("gender"));
				dto.setRead(rs.getInt("read"));
				dto.setMovie(rs.getInt("movie"));
				dto.setMusic(rs.getInt("music"));
				dto.setGame(rs.getInt("game"));
				dto.setShopping(rs.getInt("shopping"));
				
				arrayList.add(dto);
			}//while
			
		} catch (SQLException e) {
			e.printStackTrace();
			arrayList = null;
			
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return arrayList;
	}

	public int updateFriend(FriendDTO dto) {
		int su=0;
		getConnection();
		String sql = "update friend set name=?,"
									+ "tel1=?,"
									+ "tel2=?,"
									+ "tel3=?,"
									+ "gender=?,"
									+ "read=?,"
									+ "movie=?,"
									+ "music=?,"
									+ "game=?,"
									+ "shopping=? where seq=?";
		
		try {
			pstmt = conn.prepareStatement(sql);//생성
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTel1());
			pstmt.setString(3, dto.getTel2());
			pstmt.setString(4, dto.getTel3());
			pstmt.setInt(5, dto.getGender());
			pstmt.setInt(6, dto.getRead());
			pstmt.setInt(7, dto.getMovie());
			pstmt.setInt(8, dto.getMusic());
			pstmt.setInt(9, dto.getGame());
			pstmt.setInt(10, dto.getShopping());
			pstmt.setInt(11, dto.getSeq());
			
			su = pstmt.executeUpdate();//실행
			
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
		
		return su;
	}

	public int deleteFriend(int seq) {
		int su=0;
		getConnection();
		String sql = "delete friend where seq=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			
			su = pstmt.executeUpdate();
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
		
		return su;
	}
}



















