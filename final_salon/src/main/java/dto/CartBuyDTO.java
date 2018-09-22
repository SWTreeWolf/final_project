package dto;

import java.util.ArrayList;
import java.util.List;

public class CartBuyDTO {
	private String goods_name;
	private String goods_main;
	private int goods_price;
	private int goods_code;
	private List<Integer> cart_num = new ArrayList<>();
	private List<Integer> goods_code2 = new ArrayList<>();
	private List<String> goods_color_img = new ArrayList<>();
	private List<String> goods_color = new ArrayList<>();
	private List<Integer> option_count = new ArrayList<>();

	
	public CartBuyDTO() { }

	public int getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}


	public String getGoods_main() {
		return goods_main;
	}


	public void setGoods_main(String goods_main) {
		this.goods_main = goods_main;
	}


	public List<Integer> getCart_num() {
		return cart_num;
	}


	public void setCart_num(List<Integer> cart_num) {
		this.cart_num = cart_num;
	}


	public List<String> getGoods_color_img() {
		return goods_color_img;
	}


	public void setGoods_color_img(List<String> goods_color_img) {
		this.goods_color_img = goods_color_img;
	}


	public List<String> getGoods_color() {
		return goods_color;
	}


	public void setGoods_color(List<String> goods_color) {
		this.goods_color = goods_color;
	}


	public List<Integer> getOption_count() {
		return option_count;
	}


	public void setOption_count(List<Integer> option_count) {
		this.option_count = option_count;
	}

	public int getGoods_code() {
		return goods_code;
	}

	public void setGoods_code(int goods_code) {
		this.goods_code = goods_code;
	}

	public List<Integer> getGoods_code2() {
		return goods_code2;
	}

	public void setGoods_code2(List<Integer> goods_code2) {
		this.goods_code2 = goods_code2;
	}
	
}
