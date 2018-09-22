package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.PageDTO;
import dto.ReviewDTO;

public class ReviewDaoImp implements ReviewDAO{
	private SqlSessionTemplate sqlSession;
	HashMap<String, Object> map = new HashMap<String, Object>();

	public ReviewDaoImp() {
		
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ReviewDTO> list(int goods_code,PageDTO pdto) { //맵퍼불러오기  
		map.put("code",goods_code);
		map.put("pdto",pdto);
		return sqlSession.selectList("review.list",map);
	}//end list()//

	@Override
	public ReviewDTO content(int num) {
		return sqlSession.selectOne("review.content",num);
	}//end content

	@Override //rate 추가해야됨 insert에 
	public void insert(ReviewDTO dto) {
		sqlSession.insert("review.insert",dto);
	}//end insert

	@Override
	public int count(int goods_code) {
		System.out.println("접근여부");
		return sqlSession.selectOne("review.count",goods_code);
	}

	@Override
	public void delete(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		sqlSession.delete("review.rev_delete", map);
	}

	@Override
	public void update(ReviewDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("review.rev_update", dto);
	}
	
	
}//end class
