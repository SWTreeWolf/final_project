package dto;

import java.util.List;

public class cartViewDTO {
	private int goods_code;
	private String goods_name;
	private String id;
	private int goods_price;
	private String goods_main;
	////////////////////////////////////////

	private List<Integer> goods_code2;
	private List<Integer> cart_num;
	private List<Integer> prod_count;
	private List<OptionsDTO> odto;
	
	public int getGoods_code() {
		return goods_code;
	}
	public void setGoods_code(int goods_code) {
		this.goods_code = goods_code;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_main() {
		return goods_main;
	}
	public void setGoods_main(String goods_main) {
		this.goods_main = goods_main;
	}
	
	public List<Integer> getGoods_code2() {
		return goods_code2;
	}
	public void setGoods_code2(List<Integer> goods_code2) {
		this.goods_code2 = goods_code2;
	}
	
	public List<Integer> getCart_num() {
		return cart_num;
	}
	public void setCart_num(List<Integer> cart_num) {
		this.cart_num = cart_num;
	}

	public List<Integer> getProd_count() {
		return prod_count;
	}
	public void setProd_count(List<Integer> prod_count) {
		this.prod_count = prod_count;
	}
	public List<OptionsDTO> getOdto() {
		return odto;
	}
	public void setOdto(List<OptionsDTO> odto) {
		this.odto = odto;
	}
	
}
