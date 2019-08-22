package com.calc;

import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalcServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, java.io.IOException{
		
		//데이터
		int x = Integer.parseInt(request.getParameter("x"));
		int y = Integer.parseInt(request.getParameter("y"));

		//응답
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<head>");
			out.print("<style>");
			out.print("body{color: red; font-weight: bold;}");
			out.print(".box{color: red; border: 1px solid blue;}");
			out.print("</style>");
		out.print("</head>");

		out.print("<body>");
			out.print("<div class='box'>");
				out.println(x+ "+" +y+ "=" +(x+y));
				out.print("<br>");
				out.println(x+ "-" +y+ "=" +(x-y));
				out.print("<br>");
				out.println(x+ "x" +y+ "=" +(x*y));
				out.print("<br>");
				out.println(x+ "/" +y+ "=" +((double)x/y));
			out.print("</div>");
		out.print("</body>");
		out.print("</html>");
	}
}
