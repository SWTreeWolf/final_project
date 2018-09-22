package dto;

import org.springframework.web.multipart.MultipartFile;

public class OptDTO {
	private String goods_color;
	private int goods_count;
	private String goods_color_img;
	private MultipartFile goods_color_file;
	private int goods_code;
	private int goods_code2;
	private int opt_sel_count;
	
	public int getOpt_sel_count() {
		return opt_sel_count;
	}

	public void setOpt_sel_count(int opt_sel_count) {
		this.opt_sel_count = opt_sel_count;
	}

	public OptDTO() {
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

	public String getGoods_color_img() {
		return goods_color_img;
	}

	public void setGoods_color_img(String goods_color_img) {
		this.goods_color_img = goods_color_img;
	}

	public MultipartFile getGoods_color_file() {
		return goods_color_file;
	}

	public void setGoods_color_file(MultipartFile goods_color_file) {
		this.goods_color_file = goods_color_file;
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
	
	
}
