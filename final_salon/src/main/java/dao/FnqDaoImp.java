package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.FnqDTO;
import dto.PageDTO;

public class FnqDaoImp implements FnqDAO{
	
	private SqlSessionTemplate sqlSession;
	
	 public FnqDaoImp() {
	 }
	
	 public void setSqlSession(SqlSessionTemplate sqlSession) {
			this.sqlSession = sqlSession;
		}
	  
	@Override
	public void insert(FnqDTO dto) {
		sqlSession.insert("fnq.insert",dto);
	}

	@Override
	public FnqDTO content(int num) {
		return sqlSession.selectOne("fnq.content",num); 
	}

	@Override
	public List<FnqDTO> listfnq(PageDTO pv) {
	 	//System.out.println(sqlSession.selectList("fnq.list",pv).size());
		return sqlSession.selectList("fnq.list",pv); 
	}

	@Override 
	public int countdata() { 
		return sqlSession.selectOne("fnq.count");
	}

	@Override
	public void delete(int num) { 
		sqlSession.delete("fnq.delete",num);
	}

	@Override
	public FnqDTO updateNum(int fnqNum) { 
		System.out.println(fnqNum);
		return sqlSession.selectOne("fnq.content",fnqNum); 
	}

	@Override
	public void update(FnqDTO dto) {
		sqlSession.update("fnq.update", dto); 
		
	}


	



	

	 
	
}
 