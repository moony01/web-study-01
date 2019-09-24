package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardReplyAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터-답글(원글 밑, 원글 페이지)
		int pseq = Integer.parseInt(request.getParameter("pseq"));//원글번호
		int pg = Integer.parseInt(request.getParameter("pg"));//원글이 있는 페이지
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		String name = (String)session.getAttribute("memName");
		String email = (String)session.getAttribute("memEmail");
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setId(id);
		boardDTO.setName(name);
		boardDTO.setEmail(email);
		boardDTO.setSubject(subject);
		boardDTO.setContent(content);
		boardDTO.setPseq(pseq);//원글번호
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.boardReply(boardDTO);
		
		request.setAttribute("pg", pg);
		request.setAttribute("display", "/board/boardReply.jsp");
		return "/main/index.jsp";
	}

}

























