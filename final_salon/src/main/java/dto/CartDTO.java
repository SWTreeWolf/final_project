package dto;

public class CartDTO {
	private int cart_num;
	private int goods_code;
	private int goods_code2;
	private String goods_name;
	private String id;
	private int prod_count;
	private int goods_price;
	////////////////////////
	private String goods_color_img;//options
	private int goods_count;//options
	private String goods_color;//options
	private int total_count;//product
	private String goods_main;//product
	
	public CartDTO() {
		
	}
	
	public int getCart_num() {
		return cart_num;
	}

	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}



	public String getGoods_color() {
		return goods_color;
	}


	public void setGoods_color(String goods_color) {
		this.goods_color = goods_color;
	}


	public String getGoods_color_img() {
		return goods_color_img;
	}

	public void setGoods_color_img(String goods_color_img) {
		this.goods_color_img = goods_color_img;
	}

	public int getGoods_count() {
		return goods_count;
	}

	public void setGoods_count(int goods_count) {
		this.goods_count = goods_count;
	}

	public int getTotal_count() {
		return total_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}

	public String getGoods_main() {
		return goods_main;
	}

	public void setGoods_main(String goods_main) {
		this.goods_main = goods_main;
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

	public int getProd_count() {
		return prod_count;
	}

	public void setProd_count(int prod_count) {
		this.prod_count = prod_count;
	}

	public int getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	
	
}
