package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	private static BoardDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public BoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static BoardDAO getInstance() { 
		if (instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO(); 
			}
		}
		return instance;
	}
		
	public void boardWrite(BoardDTO boardDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("boardSQL.boardWrite", boardDTO);
		sqlSession.commit();
		sqlSession.close();
	}

	public List<BoardDTO> boardList(Map<String,Integer> map){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = sqlSession.selectList("boardSQL.boardList", map);
		sqlSession.close();
		return list;
	}
	
	public BoardDTO getBoard(int seq){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.getBoard", seq);
		sqlSession.close();
		return boardDTO;
	}
	
	public int getTotalA(){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getTotalA");		
		sqlSession.close();
		return totalA;
	}
	
	public void boardHit(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.boardHit", seq);
		sqlSession.commit();
		sqlSession.close();
	}

	public void boardModify(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.boardModify", map);
		sqlSession.commit();
		sqlSession.close();
	}

	public void boardReply(BoardDTO boardDTO) {
		BoardDTO pDTO = getBoard(boardDTO.getPseq());//원글
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		//step update
		sqlSession.update("boardSQL.boardReply1", pDTO);
		
		//insert
		boardDTO.setRef(pDTO.getRef());//원글ref
		boardDTO.setLev(pDTO.getLev()+1);//원글lev+1
		boardDTO.setStep(pDTO.getStep()+1);//원글step+1
		sqlSession.insert("boardSQL.boardReply2", boardDTO);
		
		//reply update
		sqlSession.update("boardSQL.boardReply3", boardDTO.getPseq());
		
		sqlSession.commit();
		sqlSession.close();
	}

	public void boardDelete(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
//		sqlSession.update("boardSQL.boardDelete1", seq);
//		sqlSession.update("boardSQL.boardDelete2", seq);
//		sqlSession.delete("boardSQL.boardDelete3", seq);
		
		sqlSession.delete("boardSQL.boardDelete", seq);
		sqlSession.commit();
		sqlSession.close();
	}

	public List<BoardDTO> boardSearch(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = sqlSession.selectList("boardSQL.boardSearch", map);
		sqlSession.close();
		return list;
	}

	public int getSearchTotalA(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("boardSQL.getSearchTotalA", map);
		sqlSession.close();
		return totalA;
	}
	
}






































