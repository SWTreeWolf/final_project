package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;


import dto.EventBoardDTO;
import dto.PageDTO;

public class EventBoardDaoImp implements EventBoardDAO {

	private SqlSessionTemplate sqlSession;

	public EventBoardDaoImp() {
		
	}	
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public EventBoardDTO content(int Event_Num) {
		return sqlSession.selectOne("EventBoard.content", Event_Num);
	}

	@Override
	public void save(EventBoardDTO dto) {
		sqlSession.insert("EventBoard.save", dto);
	}

	@Override
	public List<EventBoardDTO> eventList() { 
		return sqlSession.selectList("EventBoard.lista");
	}

	@Override
	public List<EventBoardDTO> eventListb(PageDTO pv) {
		return sqlSession.selectList("EventBoard.listb",pv);
	} 

	@Override
	public int countdata() {   
		return sqlSession.selectOne("EventBoard.count");
	}

	@Override
	public void update(EventBoardDTO dto) {
		sqlSession.update("EventBoard.update", dto);  
	}

	@Override
	public void delete(int num) {
		sqlSession.delete("EventBoard.delete",num); 
	}
	
	
}
