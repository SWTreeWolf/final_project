package dto;

import java.util.Date;

public class PayDTO {
	private int pay_num;
	private String prod_name;
	private int goods_code;
	private int goods_code2;
	private String goods_color;
	private int pay_count;
	private int goods_price;
	private int total_price;
	private String id;
	private String rec_name;
	private String rec_phone;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String del_sub;
	private Date pay_date;
	private String pay_datet;
	private String pay_state;
	private String order_name;

	private int pay_total_count;
	private String goods_main;
	private PageDTO pagedto;
	
	public PayDTO() {
	
	}
	
	

	public String getOrder_name() {
		return order_name;
	}



	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}



	public String getPay_datet() {
		return pay_datet;
	}

	public void setPay_datet(String pay_datet) {
		this.pay_datet = pay_datet;
	}




	public String getGoods_main() {
		return goods_main;
	}




	public void setGoods_main(String goods_main) {
		this.goods_main = goods_main;
	}




	public int getPay_total_count() {
		return pay_total_count;
	}


	public void setPay_total_count(int pay_total_count) {
		this.pay_total_count = pay_total_count;
	}

	public PageDTO getPagedto() {
		return pagedto;
	}



	public void setPagedto(PageDTO pagedto) {
		this.pagedto = pagedto;
	}



	public int getPay_num() {
		return pay_num;
	}

	public int getGoods_code() {
		return goods_code;
	}

	public void setGoods_code(int goods_code) {
		this.goods_code = goods_code;
	}

	public int getGoods_code2() {
		return goods_code2;
	}

	public void setGoods_code2(int goods_code2) {
		this.goods_code2 = goods_code2;
	}

	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public String getGoods_color() {
		return goods_color;
	}

	public void setGoods_color(String goods_color) {
		this.goods_color = goods_color;
	}

	public int getPay_count() {
		return pay_count;
	}

	public void setPay_count(int pay_count) {
		this.pay_count = pay_count;
	}

	public int getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRec_name() {
		return rec_name;
	}

	public void setRec_name(String rec_name) {
		this.rec_name = rec_name;
	}

	public String getRec_phone() {
		return rec_phone;
	}

	public void setRec_phone(String rec_phone) {
		this.rec_phone = rec_phone;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getDel_sub() {
		return del_sub;
	}

	public void setDel_sub(String del_sub) {
		this.del_sub = del_sub;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public String getPay_state() {
		return pay_state;
	}

	public void setPay_state(String pay_state) {
		this.pay_state = pay_state;
	}
	
}
