package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.ProdcutDAO;
import dao.ProductDaoImp;
import dao.ReviewDAO;
import dto.OptionsDTO;
import dto.PageDTO;
import dto.ProductDTO;
import dto.ReviewDTO;

@Controller
public class ReviewController {
	private ReviewDAO dao;
	private ProdcutDAO proddao;
	private int currentPage = 1;
	private PageDTO pdto;
	
	public void setDao(ReviewDAO dao) {
		this.dao = dao;
	}
	
	public void setProddao(ProdcutDAO proddao) {
		this.proddao = proddao;
	}
	
	/*@RequestMapping("table.do")
	public ModelAndView table(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int totalcount = dao.count();
		
		if(totalcount >= 1) {
			if(pv.getCurrentPage() == 0) { // 현재페이지는 처음실행시 0으로 들어오기때문에
				currentPage = 1; // 1로 바꿔준다.
			} else { 
				currentPage = pv.getCurrentPage();
			}
			
			pdto = new PageDTO(currentPage,totalcount);	
			//mav.addObject("list",dao.list(pdto));
			mav.addObject("pv",pdto);
		}
			
		
		mav.setViewName("table");
		return mav;
	}*/
	
	@RequestMapping(value="reviewWrite.do",method=RequestMethod.GET)
	public ModelAndView reviewWrite(ProductDTO prod) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("prod",prod);
		System.out.println(prod.getGoods_code());
		mav.addObject("odto",proddao.optionsDetail(prod.getGoods_code()));
		/*mav.addObject("odto",proddao.optionColor(prod.getGoods_code()));*/
		System.out.println(proddao.optionsDetail(prod.getGoods_code()).size());
		mav.setViewName("reviewWrite"); 
		return mav; 
	}
	
	
	//등록누르면 게시물 등록되고 리스트페이지로 넘어가게
	@RequestMapping(value="WritePro.do",method=RequestMethod.POST)
	public ModelAndView insert(ReviewDTO dto) {
		System.out.println(dto.getGoods_code()+"확인중");
		System.out.println(dto.getGoods_option());
		System.out.println(dto.getId());
		System.out.println(dto.getReview_content());
		dao.insert(dto); //.................... 받아서 리턴해주는게 없기때문에 그냥 메소드만 호출해서 값을 넣어주면 된다,,,
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/detail.do?code="+dto.getGoods_code());
		return mav;
	}
	
	@RequestMapping("revView.do")
	public ModelAndView revView(int num) { // (int num)
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dao.content(num));
		mav.setViewName("revView");
		return mav;
	}

	@RequestMapping("revUpt.do")
	public ModelAndView revUpt(ProductDTO prod, int review_num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("prod", prod);
		mav.addObject("odto", proddao.optionsDetail(prod.getGoods_code()));
		mav.addObject("odto", proddao.optionColor(prod.getGoods_code()));
		System.out.println(proddao.optionsDetail(prod.getGoods_code()).size());
		mav.addObject("rdto", dao.content(review_num));
		mav.setViewName("reviewUpdate");
		return mav;
	}
	
	@RequestMapping(value="updatePro.do", method=RequestMethod.POST)
	public ModelAndView update(ReviewDTO dto) {
		System.out.println(dto.getGoods_code() + "업데이트중");
		System.out.println(dto.getReview_num());
		System.out.println(dto.getGoods_option());
		System.out.println(dto.getNickname());
		System.out.println(dto.getReview_content());
		System.out.println(dto.getRate());
		dao.update(dto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/detail.do?code=" + dto.getGoods_code());
		return mav;
	}
	
}//end class
