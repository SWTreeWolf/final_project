package dto;

public class OptionsDTO {
	private int goods_code;
	private String goods_color;
	private int goods_count;
	private int goods_code2;
	private String goods_color_img;
	
/*	Goods_Code NUMBER NOT NULL,  상품코드 
	Goods_Color VARCHAR2(1000),  상품컬러 
	Goods_Count NUMBER,  상품수량 
	Goods_Code2 NUMBER,  상품코드2 
	Goods_Color_Img VARCHAR2(1000)  상품이미지 */
	
	public OptionsDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getGoods_code() {
		return goods_code;
	} 

	public void setGoods_code(int goods_code) {
		this.goods_code = goods_code;
	}

	public String getGoods_color() {
		return goods_color;
	}

	public void setGoods_color(String goods_color) {
		this.goods_color = goods_color;
	}

	public int getGoods_count() {
		return goods_count;
	}

	public void setGoods_count(int goods_count) {
		this.goods_count = goods_count;
	}

	public int getGoods_code2() {
		return goods_code2;
	}

	public void setGoods_code2(int goods_code2) {
		this.goods_code2 = goods_code2;
	}

	public String getGoods_color_img() {
		return goods_color_img;
	}

	public void setGoods_color_img(String goods_color_img) {
		this.goods_color_img = goods_color_img;
	}
	

	
}
