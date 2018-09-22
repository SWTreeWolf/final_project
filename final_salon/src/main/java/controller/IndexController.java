package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.EventBoardDAO;
import dao.NoBoardDAO;
import dao.ProdcutDAO;
import dao.cateDAO;
import dto.EventBoardDTO;
import dto.PageDTO;
import dto.ProductDTO;
import dto.cateDTO;

@Controller
public class IndexController {
 
	private ProdcutDAO dao;
	private cateDAO cdao;
	private NoBoardDAO ndao;
	private EventBoardDAO edao;
	private int currentPage = 1;
	private PageDTO pdto;

	public IndexController() {
               
	}

	public void setDao(ProdcutDAO dao) {
		this.dao = dao;
	}

	public void setCdao(cateDAO cdao) {
		this.cdao = cdao;
	}

	public void setNdao(NoBoardDAO ndao) {
		this.ndao = ndao;
	}

	public void setEdao(EventBoardDAO edao) {
		this.edao = edao;
	}

	@RequestMapping("index.do")
	public ModelAndView process() {
		ModelAndView mav = new ModelAndView();
		List<ProductDTO> prodList = dao.newlist();
		List<ProductDTO> bestList = dao.bestlist();
		List<EventBoardDTO> eventlist = edao.eventList();

		for (int i = 0; i < prodList.size(); i++) {
			prodList.get(i).setPicture(dao.picture(prodList.get(i).getGoods_code()));
			bestList.get(i).setPicture(dao.picture(bestList.get(i).getGoods_code()));
		}

		mav.addObject("eventlist", eventlist);
		mav.addObject("newList", prodList);
		mav.addObject("bestList", bestList);
		mav.addObject("newLength", prodList.size());
		mav.addObject("eventlist", eventlist);
		mav.addObject("eventLength", eventlist.size());
		mav.setViewName("index");
		return mav;
	}// end process()

	@RequestMapping("head.do")
	public ModelAndView headprocess() {
		ModelAndView mav = new ModelAndView();
		List<cateDTO> list = new ArrayList<cateDTO>();
		List<String> group1 = cdao.cateGroup1();
		for (int i = 0; i < group1.size(); i++) {
			cateDTO dto = new cateDTO();
			dto.setGoods_group1(group1.get(i));
			dto.setGoods_group2(cdao.cateGroup2(group1.get(i)));
			list.add(dto);
		}
		mav.addObject("list", list);
		mav.setViewName("cate");
		return mav;
	}// end process()

	@RequestMapping("not.do")
	public ModelAndView notprocess(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		////////////
		int totalRecord = ndao.countdata();

		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0) {

				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			pdto = new PageDTO(currentPage, totalRecord);

			mav.addObject("noBaord", ndao.listNo(pdto));
			mav.addObject("pv", pdto);
		}

		//////////////////////
		mav.setViewName("noti");
		return mav;
	}// end process()

	@RequestMapping("gmd.do")
	public ModelAndView gg() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("gmap");
		return mav;
	}

	@RequestMapping("eve.do")
	public @ResponseBody List<EventBoardDTO> eList() {
		List<EventBoardDTO> eventst = edao.eventList();
		return eventst;

	}// end process()

}// end class
