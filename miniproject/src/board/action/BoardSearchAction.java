package board.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardSearchAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		String searchOption = request.getParameter("searchOption");
		String keyword = request.getParameter("keyword");
		
		//1페이지당 5개씩
		int endNum = pg*5;
		int startNum = endNum-4;
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		List<BoardDTO> list = boardDAO.boardSearch(map);
		
		BoardPaging boardPaging = new BoardPaging();
		int totalA = boardDAO.getSearchTotalA(map);//총글수
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makeSearchPagingHTML();
				
		request.setAttribute("pg", pg);
		request.setAttribute("searchOption", searchOption);
		request.setAttribute("keyword", keyword);
		request.setAttribute("list", list);
		request.setAttribute("boardPaging", boardPaging);
		request.setAttribute("display", "/board/boardList.jsp");
		return "/main/index.jsp";
	}

}










