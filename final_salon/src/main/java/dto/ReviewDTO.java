package dto;

import java.util.Date;

public class ReviewDTO {
	private int review_num;
	private String id;
	private String nickname;
	private String review_content;
	private int read_count;
	private Date chk;
	private int rate;
	private String sub; 
	private String goods_option;
	private int goods_code;
	private PageDTO pagedto;
	
/*	Review_Num NUMBER NOT NULL,  글번호 
	Goods_Code NUMBER NOT NULL,  상품코드 
	Id VARCHAR2(20) NOT NULL,  아이디 
	Read_Count NUMBER,  조회수 
	Chk DATE,  날짜 
	Review_Content VARCHAR2(500),  내용 
	Rate NUMBER  평가 
	Goods_Name VARCHAR2(50) NOT NULL
	sub VARCHAR2(50) 제목*/
	
	public ReviewDTO() {
		
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public Date getChk() {
		return chk;
	}

	public void setChk(Date chk) {
		this.chk = chk;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public String getGoods_option() {
		return goods_option;
	}

	public void setGoods_option(String goods_option) {
		this.goods_option = goods_option;
	}

	public int getGoods_code() {
		return goods_code;
	}

	public void setGoods_code(int goods_code) {
		this.goods_code = goods_code;
	}

	public PageDTO getPagedto() {
		return pagedto;
	}

	public void setPagedto(PageDTO pagedto) {
		this.pagedto = pagedto;
	}
}//end class
