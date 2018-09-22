package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.ProdcutDAO;
import dao.ReviewDAO;
import dao.cateDAO;
import dto.CateSearchDTO;
import dto.PageDTO;
import dto.ProductDTO;

@Controller
public class ListPageController {

	private ProdcutDAO dao;
	private cateDAO cdao;
	private int currentPage = 1;
	private PageDTO pdto;
	private ReviewDAO rdao;

	public ReviewDAO getRdao() {
		return rdao;
	}

	public void setRdao(ReviewDAO rdao) {
		this.rdao = rdao;
	}

	public ListPageController() {

	}

	public void setCdao(cateDAO cdao) {
		this.cdao = cdao;
	}

	public void setDao(ProdcutDAO dao) {
		this.dao = dao;
	}

	@RequestMapping("listPage.do")
	public ModelAndView process(PageDTO pv, CateSearchDTO cdto, String order) {
		ModelAndView mav = new ModelAndView();
		if (cdto.getGoods_group2() != null) {
			mav.addObject("title", cdto.getGoods_group2());
			if (cdto.getGoods_group2() == "") {
				mav.addObject("title", cdto.getGoods_group1());
			}
		} else {
			mav.addObject("title", cdto.getGoods_group1());
		}
		int totalRecord = dao.productCount(cdto);
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			pdto = new PageDTO(currentPage, totalRecord);
			if (order==null || order.equals("")) {
				List<ProductDTO> prodList = dao.productlist(pdto, cdto);
				for (int i = 0; i < prodList.size(); i++) {
					prodList.get(i).setPicture(dao.picture(prodList.get(i).getGoods_code()));
					prodList.get(i).setReviewCount(rdao.count(prodList.get(i).getGoods_code()));
					prodList.get(i).setOdto(dao.optionColor(prodList.get(i).getGoods_code()));
					prodList.get(i).setOdtosize(dao.optionColor(prodList.get(i).getGoods_code()).size());
					System.out.println(prodList.get(i).getReviewCount());
				}
				mav.addObject("product", prodList);
				mav.addObject("productSize",prodList.size());
			} else if (order.equals("row")) {//rowpricelist
				List<ProductDTO> prodList = dao.rowpricelist(pdto, cdto);
				for (int i = 0; i < prodList.size(); i++) {
					prodList.get(i).setPicture(dao.picture(prodList.get(i).getGoods_code()));
					prodList.get(i).setReviewCount(rdao.count(prodList.get(i).getGoods_code()));
					prodList.get(i).setOdto(dao.optionColor(prodList.get(i).getGoods_code()));
					prodList.get(i).setOdtosize(dao.optionColor(prodList.get(i).getGoods_code()).size());
				}
				mav.addObject("product", prodList);
				mav.addObject("productSize",prodList.size());
			} else if (order.equals("high")) {
				List<ProductDTO> prodList = dao.highpricelist(pdto, cdto);
				for (int i = 0; i < prodList.size(); i++) {
					prodList.get(i).setPicture(dao.picture(prodList.get(i).getGoods_code()));
					prodList.get(i).setReviewCount(rdao.count(prodList.get(i).getGoods_code()));
					prodList.get(i).setOdto(dao.optionColor(prodList.get(i).getGoods_code()));
					prodList.get(i).setOdtosize(dao.optionColor(prodList.get(i).getGoods_code()).size());
				}
				mav.addObject("product", prodList);
				mav.addObject("productSize",prodList.size());
			} else if (order.equals("new")) {
				List<ProductDTO> prodList = dao.newnumlist(pdto, cdto);
				for (int i = 0; i < prodList.size(); i++) {
					prodList.get(i).setPicture(dao.picture(prodList.get(i).getGoods_code()));
					prodList.get(i).setReviewCount(rdao.count(prodList.get(i).getGoods_code()));
					prodList.get(i).setOdto(dao.optionColor(prodList.get(i).getGoods_code()));
					prodList.get(i).setOdtosize(dao.optionColor(prodList.get(i).getGoods_code()).size());
				}
				mav.addObject("product", prodList);
				mav.addObject("productSize",prodList.size());
			}
			mav.addObject("productcount", totalRecord);
			mav.addObject("pv", pdto);
		}

		mav.setViewName("listpage");
		return mav;
	}// end process()

	@RequestMapping("search.do")
	   public ModelAndView search(String data, PageDTO pv, String order) {
	      ModelAndView mav = new ModelAndView();
	      int totalRecord = dao.searchCount(data);

	      mav.addObject("data", data);

	      if (totalRecord >= 1) {
	         if (pv.getCurrentPage() == 0) {
	            currentPage = 1;
	         } else {
	            currentPage = pv.getCurrentPage();
	         }
	         pdto = new PageDTO(currentPage, totalRecord);

	         // mav.addObject("dto", dao.search(pdto, data)); // list(search)

	         ////////////////

	         if (order == null || order.equals("")) {
	            List<ProductDTO> prodList = dao.search(pdto, data);
	            for (int i = 0; i < prodList.size(); i++) {
	               prodList.get(i).setPicture(dao.picture(prodList.get(i).getGoods_code()));
	               prodList.get(i).setReviewCount(rdao.count(prodList.get(i).getGoods_code()));
	               prodList.get(i).setOdto(dao.optionColor(prodList.get(i).getGoods_code()));
	               prodList.get(i).setOdtosize(dao.optionColor(prodList.get(i).getGoods_code()).size());
	            }
	            mav.addObject("dto", prodList);// list(search)
	            mav.addObject("productSize",prodList.size());
	         } else if (order.equals("row")) {
	            List<ProductDTO> prodList = dao.rowpricelistse(pdto, data);
	            for (int i = 0; i < prodList.size(); i++) {
	               prodList.get(i).setPicture(dao.picture(prodList.get(i).getGoods_code()));
	               prodList.get(i).setReviewCount(rdao.count(prodList.get(i).getGoods_code()));
	               prodList.get(i).setOdto(dao.optionColor(prodList.get(i).getGoods_code()));
	               prodList.get(i).setOdtosize(dao.optionColor(prodList.get(i).getGoods_code()).size());
	            }
	            mav.addObject("dto", prodList);
	            mav.addObject("productSize",prodList.size());
	         } else if (order.equals("high")) {
	            List<ProductDTO> prodList = dao.highpricelistse(pdto, data);
	            for (int i = 0; i < prodList.size(); i++) {
	               prodList.get(i).setPicture(dao.picture(prodList.get(i).getGoods_code()));
	               prodList.get(i).setReviewCount(rdao.count(prodList.get(i).getGoods_code()));
	               prodList.get(i).setOdto(dao.optionColor(prodList.get(i).getGoods_code()));
	               prodList.get(i).setOdtosize(dao.optionColor(prodList.get(i).getGoods_code()).size());
	            }
	            mav.addObject("dto", prodList);
	            mav.addObject("productSize",prodList.size());
	         } else if (order.equals("new")) {
	            List<ProductDTO> prodList = dao.newnumlistse(pdto, data);
	            for (int i = 0; i < prodList.size(); i++) {
	               prodList.get(i).setPicture(dao.picture(prodList.get(i).getGoods_code()));
	               prodList.get(i).setReviewCount(rdao.count(prodList.get(i).getGoods_code()));
	               prodList.get(i).setOdto(dao.optionColor(prodList.get(i).getGoods_code()));
	               prodList.get(i).setOdtosize(dao.optionColor(prodList.get(i).getGoods_code()).size());
	            }
	            mav.addObject("dto", prodList);
	            mav.addObject("productSize",prodList.size()); 
	         }

	         ///////////////

	         mav.addObject("productcount", totalRecord); // search_total_record
	         mav.addObject("pv", pdto);

	         mav.setViewName("searchpage");
	      }else {
	         mav.setViewName("nosearchpage");
	      }
	      return mav;
	   }// end search()

}// end class