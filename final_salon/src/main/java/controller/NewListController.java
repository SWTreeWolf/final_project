package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.ProdcutDAO;
import dao.ReviewDAO;
import dto.ProductDTO;

@Controller
public class NewListController {
	private ProdcutDAO dao;
	private ReviewDAO rdao;

	public NewListController() {
		// TODO Auto-generated constructor stub
	}

	public void setDao(ProdcutDAO dao) {
		this.dao = dao;
	}

	public void setRdao(ReviewDAO rdao) {
		this.rdao = rdao;
	}

	@RequestMapping("newpage.do")
	public ModelAndView newPage() {
		ModelAndView mav = new ModelAndView();
		List<ProductDTO> prodList = dao.newlist();
		if (prodList.size() > 20) {
			for (int i = 0; i < 20; i++) {
				prodList.get(i).setPicture(dao.picture(prodList.get(i).getGoods_code()));
				prodList.get(i).setReviewCount(rdao.count(prodList.get(i).getGoods_code()));
				prodList.get(i).setOdto(dao.optionColor(prodList.get(i).getGoods_code()));
				prodList.get(i).setOdtosize(dao.optionColor(prodList.get(i).getGoods_code()).size());
			}
			mav.addObject("newList", prodList);
			mav.addObject("productSize", 20);
		} else {
			for (int i = 0; i < prodList.size(); i++) {
				prodList.get(i).setPicture(dao.picture(prodList.get(i).getGoods_code()));
				prodList.get(i).setReviewCount(rdao.count(prodList.get(i).getGoods_code()));
				prodList.get(i).setOdto(dao.optionColor(prodList.get(i).getGoods_code()));
				prodList.get(i).setOdtosize(dao.optionColor(prodList.get(i).getGoods_code()).size());
			}
			mav.addObject("newList", prodList);
			mav.addObject("productSize", prodList.size());
		}
		mav.addObject("newLength", dao.newlist().size());
		mav.setViewName("newPage");
		return mav;
	}

	@RequestMapping("bestpage.do")
	public ModelAndView bestPage() {
		ModelAndView mav = new ModelAndView();
		List<ProductDTO> bestList = dao.bestlist();
		if (bestList.size() > 20) {
			for (int i = 0; i < 20; i++) {
				bestList.get(i).setPicture(dao.picture(bestList.get(i).getGoods_code()));
				bestList.get(i).setReviewCount(rdao.count(bestList.get(i).getGoods_code()));
				bestList.get(i).setOdto(dao.optionColor(bestList.get(i).getGoods_code()));
				bestList.get(i).setOdtosize(dao.optionColor(bestList.get(i).getGoods_code()).size());
			}
			mav.addObject("bestList", bestList);
			mav.addObject("bestSize", 20);
		} else {
			for (int i = 0; i < bestList.size(); i++) {
				bestList.get(i).setPicture(dao.picture(bestList.get(i).getGoods_code()));
				bestList.get(i).setReviewCount(rdao.count(bestList.get(i).getGoods_code()));
				bestList.get(i).setOdto(dao.optionColor(bestList.get(i).getGoods_code()));
				bestList.get(i).setOdtosize(dao.optionColor(bestList.get(i).getGoods_code()).size());
			}
			mav.addObject("bestList", bestList);
			mav.addObject("bestSize", bestList.size());
		}
		mav.setViewName("bestPage");
		return mav;
	}

}