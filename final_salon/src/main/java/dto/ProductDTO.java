package dto;

import java.util.List;

public class ProductDTO {
	private int goods_code;
	private String goods_name;
	private int goods_price;
	private String goods_group1;
	private String goods_group2;
	private String goods_content;
	private int total_count;
	private PictureDTO picture;
	private int reviewCount;
	private List<OptionsDTO> odto;
	private int odtosize;
	private int sel_count;
	
	public int getSel_count() {
		return sel_count;
	}

	public void setSel_count(int sel_count) {
		this.sel_count = sel_count;
	}

	public List<OptionsDTO> getOdto() {
		return odto;
	}

	public void setOdto(List<OptionsDTO> odto) {
		this.odto = odto;
	}

	public int getOdtosize() {
		return odtosize;
	}

	public void setOdtosize(int odtosize) {
		this.odtosize = odtosize;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public PictureDTO getPicture() {
		return picture;
	}

	public void setPicture(PictureDTO picture) {
		this.picture = picture;
	}

	public ProductDTO() {

	}

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

	public int getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}

	public String getGoods_group1() {
		return goods_group1;
	}

	public void setGoods_group1(String goods_group1) {
		this.goods_group1 = goods_group1;
	}

	public String getGoods_group2() {
		return goods_group2;
	}

	public void setGoods_group2(String goods_group2) {
		this.goods_group2 = goods_group2;
	}

	public String getGoods_content() {
		return goods_content;
	}

	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}

	public int getTotal_count() {
		return total_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}

} // end class
