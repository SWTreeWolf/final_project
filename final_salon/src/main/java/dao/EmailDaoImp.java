package dao;

import org.mybatis.spring.SqlSessionTemplate;

import dto.EmailDTO;

public class EmailDaoImp implements EmailDAO {

	private SqlSessionTemplate sqlSession;

	public EmailDaoImp() {

	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insert(EmailDTO dto) {
		sqlSession.insert("email.insert", dto);
	}

}
