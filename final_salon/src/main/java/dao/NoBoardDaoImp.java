package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.NoBoardDTO;
import dto.PageDTO;

public class NoBoardDaoImp implements NoBoardDAO{

	private SqlSessionTemplate sqlSession;
	
	public NoBoardDaoImp() {
		
	}
	
	
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insert(NoBoardDTO dto) {
		System.out.println(dto.getNoContent()); 
		sqlSession.insert("noboard.insert",dto);		
	}
 
	@Override
	public List<NoBoardDTO> listNo(PageDTO pv) {
		return sqlSession.selectList("noboard.list",pv);  
	}



	@Override
	public int countdata() {  
		System.out.println("들어왓습니다.");
		return sqlSession.selectOne("noboard.count");
	}


 
	@Override
	public NoBoardDTO content(int num) { 
		return sqlSession.selectOne("noboard.content",num);
	}

	@Override
	public void readCounter(int num) {   
		 sqlSession.update("noboard.readCount",num);
	}

	@Override
	public void update(NoBoardDTO dto) {
		sqlSession.update("noboard.update", dto); 
		
	}

	@Override
	public void delete(int num) { 
		sqlSession.delete("noboard.delete",num);
	}

}
