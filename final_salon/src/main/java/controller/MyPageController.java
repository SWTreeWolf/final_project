package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.EventBoardDAO;
import dao.MemDAO;
import dao.MypageDAO;
import dto.CommuDTO;
import dto.EventBoardDTO;
import dto.MemDTO;
import dto.MypageDTO;
import dto.PageDTO;
import dto.PayDTO;
import dto.ReviewDTO;

@Controller
public class MyPageController {
	MypageDAO dao;
	private MemDAO m_dao;
	private EventBoardDAO evedao;

	public void setM_dao(MemDAO m_dao) {
		this.m_dao = m_dao;
	}

	public void setDao(MypageDAO dao) {
		this.dao = dao;
	}

	public void setEvedao(EventBoardDAO evedao) {
		this.evedao = evedao;
	}

	@RequestMapping("mypage.do")
	public ModelAndView processa(PageDTO pv, HttpSession session) {
		MemDTO m_dto = (MemDTO) session.getAttribute("dto");
		String id = m_dto.getId();
		ModelAndView mav = new ModelAndView();
		List<EventBoardDTO> eventlist = evedao.eventList();

		// 갯수
		mav.addObject("commCount", dao.myCommuListCount(id));
		mav.addObject("reviewCount", dao.myReviewListCount(id));
		mav.addObject("emailCount", dao.emailCount(id));
		mav.addObject("orderCount", dao.myOrderListCount(id));
		mav.addObject("cartCount", dao.cartCount(id));
		mav.addObject("cart1", dao.cart1(id));
		mav.addObject("cart2", dao.cart2(id));
		mav.addObject("cart3", dao.cart3(id));
		mav.addObject("point", dao.point(id));

		mav.addObject("evelist", eventlist);
		mav.addObject("eveLength", eventlist.size());

		mav.setViewName("mypage");
		return mav;
	}// end process()

	// 마이페이지 나의 게시글
	@RequestMapping("my_post.do")
	public String mypost() {
		return "my_post";
	}// end process()

	// 리뷰 -에이젝스
	@RequestMapping("my_reviewList.do")
	public @ResponseBody MypageDTO reviewList(Model model,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, HttpSession session) {
		MypageDTO mdto = new MypageDTO();
		ReviewDTO dto = new ReviewDTO();
		MemDTO m_dto = (MemDTO) session.getAttribute("dto");
		String id = m_dto.getId();
		PageDTO pdto = new PageDTO(currentPage, dao.myReviewListCount(id));
		dto.setPagedto(pdto);
		dto.setId(id);
		mdto.setPdto(pdto);
		mdto.setRlist(dao.myReviewList(dto));
		return mdto;
	}// end

	// 커뮤니티 -에이젝스
	@RequestMapping("my_commuList.do")
	public @ResponseBody MypageDTO commuList(Model model,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, HttpSession session) {
		MypageDTO mdto = new MypageDTO();
		CommuDTO cdto = new CommuDTO();
		MemDTO m_dto = (MemDTO) session.getAttribute("dto");
		String id = m_dto.getId();
		PageDTO pdto = new PageDTO(currentPage, dao.myCommuListCount(id));
		cdto.setPagedto(pdto);
		cdto.setId(id);
		mdto.setPdto(pdto);
		mdto.setClist(dao.myCommuList(cdto));
		return mdto;
	}// end

	@RequestMapping("profile.do")
	public String profileprocess() {
		return "profile";
	}// end profileprocess()

	@RequestMapping(value = "updateProfile.do", method = RequestMethod.POST)
	public String updateprofile(MemDTO dto, HttpSession session, HttpServletRequest request) {
		MemDTO a_dto = (MemDTO) session.getAttribute("dto");
		a_dto.setNickname(dto.getNickname());
		a_dto.setEmail(request.getParameter("email1") + "@" + request.getParameter("email2"));
		a_dto.setPhone(request.getParameter("phone_first") + "-" + request.getParameter("phone_middle") + "-"
				+ request.getParameter("phone_last"));

		if (dto.getPassword() != null && dto.getPassword() != "") {
			a_dto.setPassword(dto.getPassword());
		}

		m_dao.updateMem(a_dto);
		return "redirect:/mypage.do";
	}// updateprofile()

	// 주문배송
	@RequestMapping("my_orderList.do")
	public String orderList(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			HttpSession session) {
		PayDTO paydto = new PayDTO();
		MemDTO m_dto = (MemDTO) session.getAttribute("dto");
		String id = m_dto.getId();
		// String id="admin";
		PageDTO pdto = new PageDTO(currentPage, dao.myOrderListCount(id));
		paydto.setPagedto(pdto);
		paydto.setId(id);
		System.out.println(paydto.getPagedto().getStartRow()+"start");
		System.out.println(paydto.getPagedto().getEndRow()+"end");
		model.addAttribute("orderList", dao.myOrderList(paydto));
		model.addAttribute("pdto", pdto);
		return "my_orderList";
	}// end

	// 주문상세
	@RequestMapping("my_orderView.do")
	public String orderListView(int pay_num, Model model, HttpSession session) {
		MemDTO m_dto = (MemDTO) session.getAttribute("dto");
		String id = m_dto.getId();
		// String id="admin";

		List<PayDTO> payList = dao.myOrderView(pay_num);
		model.addAttribute("payList", payList);

		return "my_orderView";
	}// end

	// 수령완료-에이젝스
	@RequestMapping("my_delivery_chk.do")
	public @ResponseBody int delivery(int pay_num) {

		return dao.deliveryChk(pay_num);
	}
	
	// 반품요청 - 에이젝스
	@RequestMapping("my_return_chk.do")
	public @ResponseBody int returns(int pay_num) {
		return dao.returnChk(pay_num);
	}

	@RequestMapping("my_email.do")
	public String email(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model,
			HttpSession session) {
		MemDTO m_dto = (MemDTO) session.getAttribute("dto");
		String id = m_dto.getId();
		PageDTO pdto = new PageDTO(currentPage, dao.emailCount(id));
		HashMap<String, Object> emailmap = new HashMap<>();
		emailmap.put("startRow", pdto.getStartRow());
		emailmap.put("endRow", pdto.getEndRow());
		emailmap.put("id", id);
		model.addAttribute("emailList", dao.emailList(emailmap));
		model.addAttribute("pdto", pdto);
		return "my_email";
	}
	
	@RequestMapping("member_unlink_site.do")
	public String comparepassword() {
		return "member_unlink_site";
	}
	
	@RequestMapping("passwordCheck.do")
	public @ResponseBody Boolean passwordCheck(MemDTO dto) {
		System.out.println(dto.getId() + "," + dto.getPassword());
		MemDTO resultdto = m_dao.checkpassword(dto);
		if(resultdto==null) {
			System.out.println("");
			return false;
		}
		return true;
	}
}// end class
