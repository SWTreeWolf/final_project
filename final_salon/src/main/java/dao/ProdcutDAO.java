package dao;

import java.util.List;

import dto.CartDTO;
import dto.CateSearchDTO;
import dto.OptDTO;
import dto.OptionsDTO;
import dto.PageDTO;
import dto.PictureDTO;
import dto.ProductDTO;
import dto.RegiDTO;
import dto.cartViewDTO;

public interface ProdcutDAO {
	public List<ProductDTO> productlist(PageDTO pdto, CateSearchDTO cdto);

	public int productCount(CateSearchDTO cdto);
	// 신상품
	public List<ProductDTO> newlist();
	// 베스트 상품
	public List<ProductDTO> bestlist();
	
	public ProductDTO prodDetail(int code);

	public List<ProductDTO> search(PageDTO pdto, String data);

	public int searchCount(String data);

	public List<OptionsDTO> optionsDetail(int code);

	public PictureDTO pictureDetail(int code);

	public PictureDTO picture(int code);

	public List<RegiDTO> adminProList(PageDTO pdto);

	public List<RegiDTO> adminProListSearch(RegiDTO rdto);

	public RegiDTO adminProListSearchTotal(RegiDTO rdto);

	public RegiDTO adminProListView(int goods_code);

	public List<OptDTO> adminProListViewOpt(int goods_code);

	public int adminProductCount();
	
	public int adminDelOptColor(int goods_code2);

	public List<ProductDTO> productlist(PageDTO dto);

	public void regiIns(RegiDTO rdto);

	public void optIns(OptDTO odto);

	public void proSet(RegiDTO rdto);

	public void optSet(OptDTO odto);

	public void proDel(int goods_code);

	public void optDel(int goods_code);

	public void picDel(int goods_code);

	public int maxcode();
	
	public void option_product_set(RegiDTO dto);
	
	//장바구니
	   public void cartIns(CartDTO cdto);
	   public List<CartDTO> cartSel(String id);
	   public CartDTO optImgCount(int goods_code2);
	   public CartDTO proImgCount(int goods_code);
	   public int cartChkCode(CartDTO dto);
	   public int cartChkCode2(CartDTO dto);
	   public void cartUpCode(CartDTO dto);
	   public void cartUpCode2(CartDTO dto);
	   public int cartEditCount(CartDTO dto);
	   public void cartDel(CartDTO dto);
	   public void optDel(CartDTO dto);

	// list select menu(row/high/new)
	public List<ProductDTO> rowpricelist(PageDTO pdto, CateSearchDTO cdto);

	public List<ProductDTO> highpricelist(PageDTO pdto, CateSearchDTO cdto);

	public List<ProductDTO> newnumlist(PageDTO pdto, CateSearchDTO cdto);

	// search select menu(row/high/new)
	public List<ProductDTO> rowpricelistse(PageDTO pdto, String data);

	public List<ProductDTO> highpricelistse(PageDTO pdto, String data);

	public List<ProductDTO> newnumlistse(PageDTO pdto, String data);
	
	// 옵션테스트
	public int optionCount(int goods_code2);
	
	// 색없는거
	public int nocolorCount(int goods_code);
	
	public List<OptionsDTO> optionColor(int goods_code);
	//장바구니 보여주기
	public List<cartViewDTO> cartView(String id);
	public OptionsDTO cartOptionView(int code);
	public List<Integer> cartCode2(cartViewDTO dto);
	public List<Integer> cartNumSel(cartViewDTO dto);
	public List<Integer> cartprod_count(cartViewDTO dto);
	public List<cartViewDTO> testcart(cartViewDTO cd);
}
