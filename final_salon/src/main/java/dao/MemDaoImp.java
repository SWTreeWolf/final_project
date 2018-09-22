package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.MemDTO;

public class MemDaoImp implements MemDAO {
	private SqlSessionTemplate sqlSession;

	public MemDaoImp() {
		// TODO Auto-generated constructor stub
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public MemDTO searchMem(MemDTO dto) {
		return sqlSession.selectOne("mem.salonSelMem", dto);
	}

	@Override
	public void salonInsMem(MemDTO dto) {
		sqlSession.insert("mem.salonInsMem", dto);
	}

	@Override
	public List<MemDTO> overlapMem(MemDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mem.salonOverlapMem", dto);
	}

	@Override
	public MemDTO compareMem(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mem.salonCompareMem", map);
	}

	@Override
	public void deleteMem(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		sqlSession.delete("mem.salonDeleteMem", map);
	}

	@Override
	public void updateMem(MemDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("mem.salonUpdateMem", dto);
	}

	@Override
	public MemDTO referenceMem(MemDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mem.salonReferenceMem", dto);
	}

	@Override
	public MemDTO checkpassword(MemDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mem.saloncheckmem", dto);
	}

	@Override
	public int mypoint(String id) {
		return sqlSession.selectOne("mem.mypoint",id);
	}

	@Override
	public void decreasepoint(MemDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("mem.point_decrease",dto);
	}
	
	@Override
	public List<MemDTO> memList(HashMap<String, Object> hash) {
		return sqlSession.selectList("mem.memList",hash);
	}

	@Override
	public int MemCount() {
		return sqlSession.selectOne("mem.memCount");
	}

	@Override
	public void addPoint(MemDTO dto) {
		sqlSession.update("mem.addPoint",dto);
	}
	
}// end class
