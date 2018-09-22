package dao;

import org.mybatis.spring.SqlSessionTemplate;

import dto.ImgcontentDTO;

public class ImgDAOreal implements ImgDAO{
	SqlSessionTemplate session;

	public ImgDAOreal() {
		
	}
	
	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}
	@Override
	public void upload(ImgcontentDTO dto) {
		session.insert("img.ins",dto);
	}

	@Override
	public ImgcontentDTO content(int num) {
		// TODO Auto-generated method stub
		return session.selectOne("img.content",num);
	} 

}
