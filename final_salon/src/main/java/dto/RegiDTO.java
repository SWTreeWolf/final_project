package dto;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class RegiDTO {
	private int goods_code;
	private String goods_name;
	private int goods_price;
	private String goods_group1;
	private String goods_group2;
	private String goods_content;
	private int total_count;
	private MultipartFile goods_main_file;
	private MultipartFile goods_detail_file;
	private String goods_main;
	private String goods_detail;
	private Boolean eventChk;
	private String searchBy;
	private String search;
	private int startRow;
	private int endRow;
	private int currentPage;
	private int totalPage;
	private String id;
	private List<OptDTO> optList=new ArrayList();
	private List<OptDTO> optListAdd=new ArrayList();
	private List<CartDTO> cartList=new ArrayList();
	private int sel_count;

	public RegiDTO() {
	
	}
	
	public int getSel_count() {
		return sel_count;
	}
	
	public void setSel_count(int sel_count) {
		this.sel_count = sel_count;
	}
	
	public List<OptDTO> getOptListAdd() {
		return optListAdd;
	}

	public void setOptListAdd(List<OptDTO> optListAdd) {
		optListAdd = optListAdd;
	}

	public Boolean getEventChk() {
		return eventChk;
	}

	public void setEventChk(Boolean eventChk) {
		this.eventChk = eventChk;
	}

	public List<OptDTO> getOptList() {
		return optList;
	}

	public void setOptList(List<OptDTO> optList) {
		this.optList = optList;
	}

	public List<CartDTO> getCartList() {
		return cartList;
	}

	public void setCartList(List<CartDTO> cartList) {
		this.cartList = cartList;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getTotalPage() {
		return totalPage;
	}



	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}



	public int getStartRow() {
		return startRow;
	}



	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}



	public int getEndRow() {
		return endRow;
	}



	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}



	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchBy() {
		return searchBy;
	}

	public void setSearchBy(String searchBy) {
		this.searchBy = searchBy;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public MultipartFile getGoods_main_file() {
		return goods_main_file;
	}

	public void setGoods_main_file(MultipartFile goods_main_file) {
		this.goods_main_file = goods_main_file;
	}

	public MultipartFile getGoods_detail_file() {
		return goods_detail_file;
	}

	public void setGoods_detail_file(MultipartFile goods_detail_file) {
		this.goods_detail_file = goods_detail_file;
	}

	public String getGoods_main() {
		return goods_main;
	}

	public void setGoods_main(String goods_main) {
		this.goods_main = goods_main;
	}

	public String getGoods_detail() {
		return goods_detail;
	}

	public void setGoods_detail(String goods_detail) {
		this.goods_detail = goods_detail;
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
}
