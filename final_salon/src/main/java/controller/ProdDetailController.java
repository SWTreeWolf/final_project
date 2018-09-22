package controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.ProdcutDAO;
import dao.ReviewDAO;
import dto.PageDTO;

@Controller
public class ProdDetailController {
	private ProdcutDAO dao;
	private ReviewDAO rdao; 
	private int currentPage = 1;
	private PageDTO pdto;
	
	public void setDao(ProdcutDAO dao) {
		this.dao = dao;
	}		 
	
	public void setRdao(ReviewDAO rdao) {
		this.rdao = rdao;
	}

	@RequestMapping("detail.do") 
	   public ModelAndView process(int code) {
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("dto",dao.prodDetail(code));
	      mav.addObject("odto",dao.optionsDetail(code));
	      mav.addObject("pdto",dao.pictureDetail(code));
	      mav.setViewName("detail");
	      return mav;
	   }// end process()
	
	
	// 옵션테스트
	@RequestMapping(value="test.do",method=RequestMethod.GET)
	public @ResponseBody String optionsCount(int goods_code2) {
		String color = String.valueOf(dao.optionCount(goods_code2));
		return color;
	}
	
	// 옵션없는거
	@RequestMapping(value="nocolor.do",method=RequestMethod.GET)
	public @ResponseBody String nocolorCount(int goods_code) {
		String name = String.valueOf(dao.nocolorCount(goods_code));
		return name;
	}
	
	@RequestMapping(value="table.do",method=RequestMethod.POST)
	public ModelAndView reviewProcess(int code,PageDTO pv){ 
		ModelAndView mav = new ModelAndView();
		int totalRecord = rdao.count(code);
		if (pv.getCurrentPage() == 0) {
			currentPage = 1;
		} else {
			currentPage = pv.getCurrentPage();
		}
		pdto = new PageDTO(currentPage, totalRecord);
		mav.addObject("rdto",rdao.list(code,pdto));
		mav.addObject("pv",pdto);
		mav.setViewName("table");
		return mav;
	}
	
	@RequestMapping(value="revDel.do", method=RequestMethod.POST)
	public ModelAndView revDel(int review_num, int code, PageDTO pv, String location) {
		ModelAndView mav = new ModelAndView();
		//삭제 부분
		location = location.substring(location.lastIndexOf('/'));
		System.out.println(location);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("review_num", review_num);
		map.put("goods_code", code);
		rdao.delete(map);
		/////////////////
		if (location.contains("code")) { //ajax
			int totalRecord = rdao.count(code);
			if (pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			pdto = new PageDTO(currentPage, totalRecord);
			mav.addObject("rdto",rdao.list(code,pdto));
			mav.addObject("pv",pdto);
			mav.setViewName("table");
			return mav;
		}else { //redirect
			return null;
		}
	}
	
}// end class
