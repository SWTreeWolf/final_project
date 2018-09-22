package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.PayDTO;

public class payDaoImp implements payDAO {
	private SqlSessionTemplate sqlSession;

	public payDaoImp() {
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int payNum() {
		System.out.println("order.paynum : "+sqlSession.selectOne("order.paynum"));
		if (sqlSession.selectOne("order.paynum") == null) {
			System.out.println("위");
			return 0;
			}
		else {
			System.out.println("아래");
			return sqlSession.selectOne("order.paynum");
		}
	}// end payNum()

	@Override
	public void payAdd(PayDTO dto) {
		//옵션있는 상품
		if (dto.getGoods_color() != null) {
			System.out.println("payDaoImp 옵션 있을때");
			sqlSession.insert("order.option_payAdd", dto);
		}else {//옵션 없는 상품
			System.out.println("payDaoImp 옵션 없을때");
			sqlSession.insert("order.no_option_payAdd",dto);
		}
	}// end payAdd()

	@Override
	public void cartDelete(int cart_num) {
		sqlSession.delete("order.cart_delete",cart_num);
	}
    //////////////////////////////////////////////////////
	@Override
	public void opt_Del(PayDTO dto) {
		sqlSession.update("order.option_pay_del",dto);
		
	}

	@Override
	public void no_Opt_Del(PayDTO dto) {
		sqlSession.update("order.pay_del",dto);
		
	}

	@Override
	public void opt_sel_up(PayDTO dto) {
		sqlSession.update("order.option_paycount_up",dto);
		
	}

	@Override
	public void prod_sel_up(PayDTO dto) {
		sqlSession.update("order.paycount_up",dto);
	}
	
	// members 테이블에 누적금액을 위해서 사용하는 것들 ///////////////////////////
	@Override
	public void mem_tot_price(PayDTO dto) {
		sqlSession.update("mem.mem_tot_pirce",dto);
		
	}
	@Override
	public int mem_tot(PayDTO dto) {
		return sqlSession.selectOne("mem.mem_tot",dto);
	}

	@Override
	public void mem_grade(HashMap<String,String> map) {
		sqlSession.update("mem.mem_grade",map);
	}

	@Override
	public void add_point(HashMap<Object,Object> map) {
		System.out.println(map.get("point")+"point몇 넘어오는지");
		sqlSession.update("mem.add_point",map);
	}
	
	////////////////////////////////////////////////////////////////
	@Override
	public int recode_num(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("order.payrecordcount",map);
	}

	@Override
	public List<PayDTO> recode_pay_list(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("order.payrecodelist", map);
	}

	@Override
	public void update_pay_list(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.update("order.payrecodeupdate",map);
	}

	@Override
	public List<PayDTO> recode_pay(HashMap<String, String> map) {
		return sqlSession.selectList("order.payrecord",map);
	}
}
