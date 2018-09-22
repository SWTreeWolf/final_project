package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.CommuDTO;
import dto.EmailDTO;
import dto.PageDTO;
import dto.PayDTO;
import dto.ReviewDTO;

public class MypageDAOImp implements MypageDAO{
	private SqlSessionTemplate sqlSession;
	
	public MypageDAOImp() {
		
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int myReviewListCount(String id) {
		return sqlSession.selectOne("mypage.reviewCount",id);
	}

	@Override
	public List<ReviewDTO> myReviewList(ReviewDTO rdto) {
		return sqlSession.selectList("mypage.reviewList",rdto);
	}

	@Override
	public int myCommuListCount(String id) {
		return sqlSession.selectOne("mypage.commuCount",id);
	}

	@Override
	public List<CommuDTO> myCommuList(CommuDTO cdto) {
		return sqlSession.selectList("mypage.commuList",cdto);
	}

	@Override
	public List<PayDTO> myOrderList(PayDTO paydto) {
		return sqlSession.selectList("mypage.orderList",paydto);
	}

	@Override
	public int myOrderListCount(String id) {
		return sqlSession.selectOne("mypage.orderListCount",id);
	}

	@Override
	public List<PayDTO> myOrderView(int pay_num) {
		return sqlSession.selectList("mypage.orderView", pay_num);
	}


	@Override
	public int emailCount(String id) {
		return sqlSession.selectOne("mypage.emailCount",id);
	}

	@Override
	public int deliveryChk(int pay_num) {
		return sqlSession.update("mypage.deliveryChk",pay_num);
	}

	@Override
	public int returnChk(int pay_num) {
		return sqlSession.update("mypage.returnChk",pay_num);
	}
	
	@Override
	public int cartCount(String id) {
		return sqlSession.selectOne("mypage.cartCount",id);
	}

	@Override
	public int cart1(String id) {
		int res=0;
		try {
		res=sqlSession.selectOne("mypage.cart1",id);
		}catch(NullPointerException e) {
			res=0;
		}
		return res;
	}

	@Override
	public int cart2(String id) {
		int res=0;
		try {
		res=sqlSession.selectOne("mypage.cart2",id);
		}catch(NullPointerException e) {
			res=0;
		}
		return res;
	}

	@Override
	public int cart3(String id) {
		int res=0;
		try {
		res=sqlSession.selectOne("mypage.cart3",id);
		}catch(NullPointerException e) {
			res=0;
		}
		return res;
	}

	@Override
	public int point(String id) {
		return sqlSession.selectOne("mypage.point",id);
	}

	@Override
	public List<EmailDTO> emailList(HashMap<String, Object> emailmap) {

		return sqlSession.selectList("mypage.emailList",emailmap);
	}
}
