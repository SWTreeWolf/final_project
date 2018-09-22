package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.CommuDTO;
import dto.PageDTO;

public class commuDaoImp implements commuDAO{
	SqlSessionTemplate sqlSession;
	
	public commuDaoImp() {
		// TODO Auto-generated constructor stub
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<CommuDTO> toplist() {
		return sqlSession.selectList("commu.toplist");
	}//end commulist()//

	@Override
	public CommuDTO numcontent(int commuNum) {
		return sqlSession.selectOne("commu.listnum",commuNum);
	}

	@Override
	public void insert(CommuDTO dto) {
		sqlSession.insert("commu.insert",dto);
	}

	@Override
	public List<CommuDTO> commulist(PageDTO pdto) {
		return sqlSession.selectList("commu.list",pdto);
	}

	@Override
	public void delete(int commuNum) {
		sqlSession.delete("commu.delete",commuNum);
	}//end delete()//

	@Override
	public int replycnt(int commuNum) {
		return sqlSession.selectOne("commu.replycnt",commuNum);
	}//end replycnt()//

	@Override
	public void readcount(int commuNum) {
		sqlSession.update("commu.readcnt",commuNum);
	}//end readcount()//

	@Override
	public int count() {
		return sqlSession.selectOne("commu.recordcount");
	}

	@Override
	public void update(CommuDTO cdto) {
		sqlSession.update("commu.update",cdto);
	}

	@Override
	public List<CommuDTO> search(String subject) {
		return sqlSession.selectList("commu.searchlist",subject);
	}

	@Override
	public int searchlistCnt(String subject) {
		return sqlSession.selectOne("commu.searchCnt",subject);
	}

	@Override
	public List<CommuDTO> skin(PageDTO pdto) {
		return sqlSession.selectList("commu.skin",pdto);
	}

	@Override
	public List<CommuDTO> makeUp(PageDTO pdto) {
		return sqlSession.selectList("commu.makeUp",pdto);
	}

	@Override
	public List<CommuDTO> Product(PageDTO pdto) {
		return sqlSession.selectList("commu.product",pdto);
	}

	@Override
	public List<CommuDTO> etc(PageDTO pdto) {
		return sqlSession.selectList("commu.etc",pdto);
	}

	@Override
	public int skincnt() {
		return sqlSession.selectOne("commu.skincnt");
	}

	@Override
	public int makeupcnt() {
		return sqlSession.selectOne("commu.makeupcnt");
	}

	@Override
	public int productcnt() {
		return sqlSession.selectOne("commu.productcnt");
	}

	@Override
	public int etccnt() {
		return sqlSession.selectOne("commu.etccnt");
	}
	
}//end class//
