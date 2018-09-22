package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class cateDaoImp implements cateDAO{
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public cateDaoImp() {
	// TODO Auto-generated constructor stub
	}
	 
	@Override 
	public List<String> cateGroup1() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cate.cateGroup1");
	} 

	@Override
	public List<String> cateGroup2(String goods_group1) {
		return sqlSession.selectList("cate.cateGroup2",goods_group1);
	}

}
