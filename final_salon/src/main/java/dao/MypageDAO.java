package dao;

import java.util.HashMap;
import java.util.List;

import dto.CommuDTO;
import dto.EmailDTO;
import dto.PageDTO;
import dto.PayDTO;
import dto.ReviewDTO;

public interface MypageDAO {
	public int myReviewListCount(String id);
	public List<ReviewDTO> myReviewList(ReviewDTO rdto);
	public int myCommuListCount(String id);
	public List<CommuDTO> myCommuList(CommuDTO cdto);
	public List<PayDTO> myOrderList(PayDTO paydto);
	public int myOrderListCount(String id);
	public List<PayDTO> myOrderView(int pay_num);
	public int emailCount(String id);
	public int deliveryChk(int pay_num);
	public int returnChk(int pay_num);
	public int cartCount(String id);
	public int cart1(String id);
	public int cart2(String id);
	public int cart3(String id);
	public int point(String id);
	public List<EmailDTO> emailList(HashMap<String, Object> emailmap);
}
