package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.CartDTO;
import dto.CateSearchDTO;
import dto.OptDTO;
import dto.OptionsDTO;
import dto.PageDTO;
import dto.PictureDTO;
import dto.ProductDTO;
import dto.RegiDTO;
import dto.cartViewDTO;

public class ProductDaoImp implements ProdcutDAO {
	private SqlSessionTemplate sqlSession;
	private HashMap<String, Object> map = new HashMap<String, Object>();

	public ProductDaoImp() {

	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ProductDTO> productlist(PageDTO pdto, CateSearchDTO cdto) {
		map.put("pdto", pdto);
		map.put("cdto", cdto);
		return sqlSession.selectList("product.list", map);
	}

	@Override
	public int productCount(CateSearchDTO cdto) {
		return sqlSession.selectOne("product.listcount", cdto);
	}

	@Override
	public List<ProductDTO> newlist() {
		return sqlSession.selectList("product.new_list");
	}

	@Override
	public List<ProductDTO> bestlist() {
		return sqlSession.selectList("product.bestProduct");
	}
	
	@Override
	public ProductDTO prodDetail(int code) {
		return sqlSession.selectOne("product.prod_detail", code);
	}

	@Override
	public List<ProductDTO> search(PageDTO pdto, String data) {
		map.put("pdto", pdto);
		map.put("data", data);
		System.out.println(pdto.getStartRow() + ":" + pdto.getEndRow());
		return sqlSession.selectList("search.list", map);
	}

	@Override
	public int searchCount(String data) {
		return sqlSession.selectOne("search.list_count", data);
	}

	@Override
	public List<OptionsDTO> optionsDetail(int code) {
		return sqlSession.selectList("product.options_detail", code);
	}

	@Override
	public PictureDTO pictureDetail(int code) {
		return sqlSession.selectOne("product.picture_detail", code);
	}

	@Override
	public PictureDTO picture(int code) {
		return sqlSession.selectOne("product.piclist", code);
	}

	@Override
	public List<ProductDTO> productlist(PageDTO pdto) {
		return sqlSession.selectList("product.list", pdto);
	}

	@Override
	public List<RegiDTO> adminProList(PageDTO pdto) {
		return sqlSession.selectList("product.proSel", pdto);
	}

	@Override
	public void regiIns(RegiDTO rdto) {
		sqlSession.insert("product.proIns", rdto);
		sqlSession.insert("product.picIns", rdto);
	}

	@Override
	public void optIns(OptDTO odto) {

		sqlSession.insert("product.optIns", odto);

	}

	@Override
	public List<RegiDTO> adminProListSearch(RegiDTO rdto) {

		return sqlSession.selectList("product.searchSel", rdto);
	}

	@Override
	public RegiDTO adminProListSearchTotal(RegiDTO rdto) {
		return sqlSession.selectOne("product.searchSel", rdto);
	}

	@Override
	public RegiDTO adminProListView(int goods_code) {
		return sqlSession.selectOne("product.proSelOne", goods_code);
	}

	@Override
	public List<OptDTO> adminProListViewOpt(int goods_code) {
		return sqlSession.selectList("product.optSel", goods_code);
	}

	@Override
	public void proSet(RegiDTO rdto) {
		System.out.println("여기 들어오면 안되");
		sqlSession.update("product.proUp", rdto);

	}

	@Override
	public void optSet(OptDTO odto) {
		
		sqlSession.update("product.optUp", odto);

	}

	@Override
	public void proDel(int goods_code) {
		sqlSession.delete("product.proDel", goods_code);

	}
	
	@Override
	public int adminDelOptColor(int goods_code2) {
	
		return 	sqlSession.delete("product.optDelColor", goods_code2);
	}
	// 관리자페이지끝

	@Override
	public int adminProductCount() {
		return sqlSession.selectOne("product.procount");
	}

	@Override
	public int maxcode() {
		if (sqlSession.selectOne("product.maxcode") == null) {
			return 0;
		} else {
			return sqlSession.selectOne("product.maxcode");
		}
	}

	@Override
	public void optDel(int goods_code) {
		sqlSession.delete("product.optDel", goods_code);

	}

	@Override
	public void picDel(int goods_code) {
		sqlSession.delete("product.picDel", goods_code);

	}

	///////////////////////////listpage////////////////////////////////////////
	@Override
	public List<ProductDTO> rowpricelist(PageDTO pdto, CateSearchDTO cdto) {
		map.put("pdto", pdto);
		map.put("cdto", cdto);
		return sqlSession.selectList("product.lowlist", map);
	}

	@Override
	public List<ProductDTO> highpricelist(PageDTO pdto, CateSearchDTO cdto) {
		map.put("pdto", pdto);
		map.put("cdto", cdto);
		return sqlSession.selectList("product.highlist", map);
	}
///////////////////////////////////////////////////////////////////

	
	@Override
	public List<ProductDTO> newnumlist(PageDTO pdto, CateSearchDTO cdto) {
		map.put("pdto", pdto);
		map.put("cdto", cdto);
		return sqlSession.selectList("product.newitem", map);
	}

///////////////////////////////searchpage////////////////////////////////////
	@Override
	public List<ProductDTO> rowpricelistse(PageDTO pdto, String data) {
		map.put("pdto", pdto);
		map.put("data", data);
		return sqlSession.selectList("search.rowPrice", map);
	}

	@Override
	public List<ProductDTO> highpricelistse(PageDTO pdto, String data) {
		map.put("pdto", pdto);
		map.put("data", data);
		return sqlSession.selectList("search.highPrice", map);
	}

	@Override
	public List<ProductDTO> newnumlistse(PageDTO pdto, String data) {
		map.put("pdto", pdto);
		map.put("data", data);
		return sqlSession.selectList("search.newitem", map);
	}
///////////////////////////////////////////////////////////////////
	@Override
	public int optionCount(int goods_code2) {
		return sqlSession.selectOne("product.option_count", goods_code2);
	}

	@Override
	public List<OptionsDTO> optionColor(int goods_code) {
		return sqlSession.selectList("product.option_color", goods_code);
	}

	@Override
	public int nocolorCount(int goods_code) {
		return sqlSession.selectOne("product.no_color", goods_code);
	}
	
	//장바구니
    @Override
    public void cartIns(CartDTO cdto) {
       sqlSession.insert("product.cartIns",cdto);
    }

    @Override
    public List<CartDTO> cartSel(String id) {
       return sqlSession.selectList("product.cartSel",id);
    }

    @Override
    public CartDTO optImgCount(int goods_code2) { 
       return sqlSession.selectOne("product.optImgCount",goods_code2);
    }


    @Override
    public CartDTO proImgCount(int goods_code) {
       return sqlSession.selectOne("product.proImgCount",goods_code);
    }

    @Override
    public int cartChkCode(CartDTO 	dto) {
       // TODO Auto-generated method stub
       return sqlSession.selectOne("product.cartChkCode",dto);
    }

    @Override
    public int cartChkCode2(CartDTO dto) {
       // TODO Auto-generated method stub
       return sqlSession.selectOne("product.cartChkCode2",dto);
    }

    @Override
    public void cartUpCode(CartDTO dto) {
       sqlSession.update("product.cartUpCode",dto);
    }

    @Override
    public void cartUpCode2(CartDTO dto) {
       sqlSession.update("product.cartUpCode2",dto);
    }
    
    @Override
    public int cartEditCount(CartDTO dto) {
       return sqlSession.update("product.cartEditCount",dto); 
    }

    @Override
    public void cartDel(CartDTO dto) {
       sqlSession.delete("product.cartDel",dto);  
    } // 옵션 지우기
    
    @Override
    public void optDel(CartDTO dto) {
       sqlSession.delete("product.opt_Del",dto);  
    } // 옵션 지우기
    //장바구니끝

	@Override
	public List<cartViewDTO> cartView(String id) {
		System.out.println(id+"아이디확인중"); 
		return sqlSession.selectList("product.cartView",id);
	}

	@Override
	public OptionsDTO cartOptionView(int code) {
		return sqlSession.selectOne("product.cartOptionView",code);
	}

	@Override
	public List<Integer> cartCode2(cartViewDTO dto) {
		return sqlSession.selectList("product.cartgoods_code2",dto);
	}

	@Override
	public List<Integer> cartNumSel(cartViewDTO dto) {
		return sqlSession.selectList("product.cartNumSel",dto);
	}

	@Override 
	public List<Integer> cartprod_count(cartViewDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.cartprod_count",dto);
	}

	@Override
	public List<cartViewDTO> testcart(cartViewDTO cd) {
		return sqlSession.selectList("product.test_code2",cd);
	}

	@Override
	public void option_product_set(RegiDTO dto) {
		sqlSession.update("product.option_product_set",dto);
	}

} // end class
