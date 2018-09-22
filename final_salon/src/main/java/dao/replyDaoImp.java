package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.commureplyDTO;

public class replyDaoImp implements replyDAO{
	private SqlSessionTemplate sqlSession;

	public replyDaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertreply(commureplyDTO rdto) {
		sqlSession.insert("reply.replyinsert",rdto);
	}//end insertreply()//

	@Override
	public List<commureplyDTO> commureplylist(int commuNum) {
		System.out.println(commuNum+"여기확인중");
		return sqlSession.selectList("reply.replylist",commuNum);
	}//end commureplylist()//

}//end class()//
