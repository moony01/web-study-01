package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertTest {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "java";
	private String password = "dkdlxl";
		
	private Connection conn;
	private PreparedStatement pstmt;
	
	public InsertTest() {
		try {
			Class.forName(driver);
			System.out.println("드라이버 로딩 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("접속 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void insertArticle() {
		try {
			//데이터
			Scanner scan = new Scanner(System.in);
			System.out.print("이름 입력 : ");
			String name = scan.next();
			System.out.print("나이 입력 : ");
			int age = scan.nextInt();
			System.out.print("키 입력 : ");
			double height = scan.nextDouble();
			
			this.getConnection();//접속
			String sql = "insert into dbtest values(?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);//생성
			pstmt.setString(1, name);
			pstmt.setInt(2, age);
			pstmt.setDouble(3, height);
			int su = pstmt.executeUpdate();//실행-개수 리턴
			
			System.out.println(su+" row created");			
			
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

	public static void main(String[] args) {
		InsertTest it = new InsertTest();
		it.insertArticle();
	}

}












