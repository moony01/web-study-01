package guestbook.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.bean.GuestbookDTO;
import guestbook.dao.GuestbookDAO;

//@WebServlet("/GuestbookListServlet")
public class GuestbookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//데이터
		
		// DB에서 모든 레코드를 꺼내서 JList에 뿌리기
		GuestbookDAO dao = GuestbookDAO.getInstance();
		ArrayList<GuestbookDTO> arrayList = dao.getGuestbookList();
		
		//응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		
		for (GuestbookDTO dto : arrayList) {
			out.println("<form name='bookForm'>");
			out.println("<table border='1' cellspacing='0' cellpadding='5' width='450'>");
			out.println("<tr>");
			out.println("<th>작성자</th>");
			out.println("<td>"+dto.getName()+"</td>");
			out.println("<th>작성일</th>");
			out.println("<td>"+dto.getLogtime()+"</td>");
			out.println("</tr>");
			
			out.println("<tr>");
			out.println("<th>이메일</th>");
			out.println("<td colspan='3'>"+dto.getEmail()+"</td>");
			out.println("</tr>");
			
			out.println("<tr>");
			out.println("<th>홈페이지</th>");
			out.println("<td colspan='3'>"+dto.getHomepage()+"</td>");
			out.println("</tr>");
			
			out.println("<tr>");
			out.println("<th>제목</th>");
			out.println("<td colspan='3'>"+dto.getSubject()+"</td>");
			out.println("</tr>");
			
			out.println("<tr>");
			out.println("<td colspan='4'>");
			out.println("<pre style='white-space: pre-wrap;'>");
			out.println(dto.getContent());
			out.println("</pre>");
			out.println("</td>");
			out.println("</tr>");
			
			out.println("</table>");
			out.println("</form>");
		}
		
		out.println("</body>");
		out.println("</html>");
	}

}
