package dto;

import java.util.List;

//바로구매시 담을 DTO
public class ordertransDTO {
	private String id;
	private String goods_name;
	private int goods_price;
	private int goods_code;
	private String goods_main;
	private List<Integer> goods_code2;
	private List<String> goods_color;
	private List<Integer> option_count;
	private List<String> option_color_img;
	
	public ordertransDTO() {
		
	}

	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
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

	public List<String> getOption_color_img() {
		return option_color_img;
	}

	public void setOption_color_img(List<String> option_color_img) {
		this.option_color_img = option_color_img;
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
