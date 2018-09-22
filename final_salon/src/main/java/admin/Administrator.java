package admin;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import api.excel.ListExcelDownload;
import dao.MemDAO;
import dao.ProdcutDAO;
import dao.payDAO;
import dto.MemDTO;
import dto.OptDTO;
import dto.PageDTO;
import dto.PayDTO;
import dto.RegiDTO;

@Controller
public class Administrator {
	private ProdcutDAO dao;
	private payDAO p_dao;
	private MemDAO m_dao;

	public void setM_dao(MemDAO m_dao) {
		this.m_dao = m_dao;
	}

	public void setDao(ProdcutDAO dao) {
		this.dao = dao;
	}

	public void setP_dao(payDAO p_dao) {
		this.p_dao = p_dao;
	}

	@RequestMapping("/ad_register.do")
	public String admin() {
		return "ad_register";
	}

	// 상품삭제
	@RequestMapping("/ad_delete.do")
	public String delete(int goods_code) {
		dao.proDel(goods_code);
		dao.optDel(goods_code);
		dao.picDel(goods_code);
		return "redirect:/ad_proList.do";
	}

	// 상품상세보기에서 수정
	@RequestMapping(value = "/ad_proSet.do", method = RequestMethod.POST)
	public String proSet(RegiDTO dto, HttpServletRequest req) throws IllegalStateException, IOException {
		// 수량번경
		if (dto.getOptList().size() > 0) {
			System.out.println("옵션이있다.");
			for (OptDTO toto : dto.getOptList()) {
				dao.option_product_set(dto);
				dao.optSet(toto);
			}

		} else {
			dao.proSet(dto);
		}
		// 색상추가
		String root = req.getSession().getServletContext().getRealPath("/");
		root += "salon" + File.separator;
		UUID random_color = UUID.randomUUID();

		// options테이블 저장

		int proCode = dto.getGoods_code();
		List<OptDTO> OptListAdd = dto.getOptListAdd();
		if (OptListAdd.size() > 0) {
			for (OptDTO dtoo : OptListAdd) {

				String goods_color_name = dtoo.getGoods_color_file().getOriginalFilename();
				if (goods_color_name != null && goods_color_name != "" && dtoo.getGoods_color() != "") {
					System.out.println("옵션이있구만");
					File fo = new File(root + "colors\\", random_color + "_" + goods_color_name);
					dtoo.getGoods_color_file().transferTo(fo);
					dtoo.setGoods_color_img("salon/colors/" + random_color + "_" + goods_color_name);
					dtoo.setGoods_code(proCode);
					dtoo.setGoods_code2(gen());
					dao.optIns(dtoo);
				}
			}
		} // end if

		return "redirect:/ad_proList.do";
	}// end proset

	@RequestMapping("/ad_removeColor.do")
	@ResponseBody
	public int proListView(int goods_code2) {
		return dao.adminDelOptColor(goods_code2);
	}

	// 상품상세보기
	@RequestMapping("/ad_proListView.do")
	public String proListView(Model model, int goods_code) {
		RegiDTO rdto = dao.adminProListView(goods_code);
		rdto.setOptList(dao.adminProListViewOpt(goods_code));
		model.addAttribute("rdto", rdto);
		return "ad_proListView";
	}

	// 상품 검색하기
	@RequestMapping("/ad_proListSearch.do")
	public String proListSearch(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, RegiDTO rdto,
			Model model) {
		System.out.println(rdto.getGoods_group1() + "23423");
		int totalPage = dao.adminProListSearchTotal(rdto).getTotalPage();
		PageDTO pdto = new PageDTO(currentPage, totalPage);
		rdto.setTotalPage(totalPage);
		rdto.setEndRow(pdto.getEndRow());
		rdto.setStartRow(pdto.getStartRow());
		List<RegiDTO> rlist = dao.adminProListSearch(rdto);
		model.addAttribute("pdto", pdto);
		model.addAttribute("rlist", rlist);
		model.addAttribute("searchChk", "search");
		return "ad_proList";
	}

	// 상품목록 불러오기
	@RequestMapping("/ad_proList.do")
	public String proList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		PageDTO pdto = new PageDTO(currentPage, dao.adminProductCount());
		List<RegiDTO> rlist = dao.adminProList(pdto);
		model.addAttribute("pdto", pdto);
		model.addAttribute("rlist", rlist);
		return "ad_proList";
	}

	// 상품등록
	@RequestMapping(value = "form_sub.do", method = RequestMethod.POST)
	public String proRegister(RegiDTO dto, HttpServletRequest req) throws IllegalStateException, IOException {
		// 서버에 메인,디테일 이미지 저장하기

		String goods_detail_name = dto.getGoods_detail_file().getOriginalFilename();
		String goods_main_name = dto.getGoods_main_file().getOriginalFilename();
		String root = req.getSession().getServletContext().getRealPath("/");
		root += "salon" + File.separator;
		File fe = new File(root + "detail\\");
		File fe2 = new File(root + "main\\");
		File fe3 = new File(root + "colors\\");
		if (!fe.exists()) {
			fe.mkdirs();
			System.out.println("없으니까 만든다");
		}
		if (!fe2.exists()) {
			fe2.mkdirs();
			System.out.println("없으니까 만든다");
		}
		if (!fe3.exists()) {
			fe3.mkdirs();
			System.out.println("없으니까 만든다");
		}
		UUID random_detail = UUID.randomUUID();
		UUID random_main = UUID.randomUUID();
		UUID random_color = UUID.randomUUID();
		File ff = new File(root + "detail\\", random_detail + "_" + goods_detail_name);
		File ff1 = new File(root + "main\\", random_main + "_" + goods_main_name);
		dto.getGoods_detail_file().transferTo(ff);
		dto.getGoods_main_file().transferTo(ff1);
		//////////////////////////////////////////////////////////////////////////

		// 상품코드
		int proCode = gen();
		dto.setGoods_code(proCode);
		System.out.println("gen : " + proCode);

		// img태그에서 쓸 url을 저장함
		dto.setGoods_detail("salon/detail/" + random_detail + "_" + goods_detail_name);
		dto.setGoods_main("salon/main/" + random_main + "_" + goods_main_name);

		// options테이블 저장

		List<OptDTO> list = dto.getOptList();
		int total = 0;
		if (list.size() > 0) {
			for (OptDTO dtoo : list) {
				total += dtoo.getGoods_count();
				dto.setTotal_count(total);
			}
		} else {
			total = dto.getTotal_count();
			dto.setTotal_count(total);
		}
		// product,picture 테이블에 저장
		if (list.size() > 0) {
			dto.setTotal_count(0); // 처음등록시 토탈카운트 0으로 만들기
			dao.regiIns(dto);
			for (OptDTO dtoo : list) {
				String goods_color_name = dtoo.getGoods_color_file().getOriginalFilename();
				if (goods_color_name != null && goods_color_name != "" && dtoo.getGoods_color() != "") {
					File fo = new File(root + "colors\\", random_color + "_" + goods_color_name);
					dtoo.getGoods_color_file().transferTo(fo);
					dtoo.setGoods_color_img("salon/colors/" + random_color + "_" + goods_color_name);
					dtoo.setGoods_code(proCode);
					dtoo.setGoods_code2(gen());

					dao.optIns(dtoo);
				}
			}
		} else {
			dao.regiIns(dto);
		}

		return "redirect:/ad_proList.do";
	}// end proRegister

	@RequestMapping("/order.do")
	public String order() {
		return "order";
	}

	public int gen() {
		if (dao.maxcode() == 0) {
			return 1;
		} else {
			return dao.maxcode() + 1;
		}
	}// end gen();

	@RequestMapping(value = "excelDownload.do")
	public ListExcelDownload excelDownload(@RequestParam("from") String from, @RequestParam("to") String to,
			Model model, PayDTO dto) throws Exception {
		HashMap<String, String> map = new HashMap<>();
		map.put("start_day", from);
		map.put("end_day", to);

		List<PayDTO> list = p_dao.recode_pay(map);
		model.addAttribute("list", list);

		return new api.excel.ListExcelDownload();
	}// end test()

	@RequestMapping("ad_searchpay.do")
	public String ad_searchPay() {
		return "ad_searchpay";
	}

	@RequestMapping(value = "payListShow.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView payList(@RequestParam("from") String from, @RequestParam("to") String to,
			@RequestParam(value = "keyword", defaultValue = "all") String keyword,
			@RequestParam(value = "keyword_txt", defaultValue = "") String keyword_txt, PageDTO pv)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		HashMap<String, String> start_map = new HashMap<String, String>();
		if (keyword.equals("all")) {
			start_map.put("start_day", from);
			start_map.put("end_day", to);
			start_map.put("id", "");
			start_map.put("rec_name", "");
			System.out.println("keyword_txt" + keyword_txt);
			if (keyword_txt != "") {
				System.out.println("test");
				start_map.put("id", keyword_txt);
				start_map.put("rec_name", keyword_txt);
			}

		} else if (keyword.equals("id")) {
			System.out.println("id : " + keyword_txt);
			start_map.put("start_day", from);
			start_map.put("end_day", to);
			start_map.put("id", keyword_txt);
			start_map.put("rec_name", "");
		} else if (keyword.equals("rec_name")) {
			System.out.println("rec_name : " + keyword_txt);
			start_map.put("start_day", from);
			start_map.put("end_day", to);
			start_map.put("id", "");
			start_map.put("rec_name", keyword_txt);
		}

		int totalRecord = p_dao.recode_num(start_map);
		System.out.println(totalRecord);
		PageDTO pdto;
		int currentPage;

		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0) {
				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}

			pdto = new PageDTO(currentPage, totalRecord);

			HashMap<String, Object> map = new HashMap<>();
			map.put("start_day", from);
			map.put("end_day", to);
			map.put("startRow", pdto.getStartRow());
			map.put("endRow", pdto.getEndRow());
			map.put("id", "");
			map.put("rec_name", "");
			if (keyword.equals("id")) {
				map.put("id", keyword_txt);
			} else if (keyword.equals("rec_name")) {
				map.put("rec_name", keyword_txt);
			} else if (keyword_txt != "" && keyword.equals("all")) {
				System.out.println("확인");
				map.put("id", keyword_txt);
				map.put("rec_name", keyword_txt);
			}

			mav.addObject("payList", p_dao.recode_pay_list(map));
			mav.addObject("list_pay", map);
			mav.addObject("pv", pdto);
		}

		mav.setViewName("payList");
		return mav;
	}// end payList()

	@RequestMapping(value = "payStateUpdate.do", method = RequestMethod.POST)
	public String pay_update(PayDTO paydto) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("pay_num", paydto.getPay_num());
		map.put("prod_name", paydto.getProd_name());
		if (paydto.getGoods_color().equals("")) {
			paydto.setGoods_color(null);
		}
		map.put("goods_color", paydto.getGoods_color());
		map.put("pay_state", paydto.getPay_state());
		p_dao.update_pay_list(map);

		return "payList";
	}

	// 회원리스트
	@RequestMapping("/ad_memList.do")
	public String memListProcess() {
		return "ad_memList";
	}

	// 포인트증정-ajax
	@RequestMapping("/ad_addPoint.do")
	public @ResponseBody int addPoint(MemDTO dto) {
		m_dao.addPoint(dto);
		return dto.getPoint();
	}

	@RequestMapping("/ad_memList_table.do")
	public String memTableProcess(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "standard", defaultValue = "no") String standard, Model model) {

		PageDTO pdto = new PageDTO(currentPage, m_dao.MemCount());
		HashMap<String, Object> hash = new HashMap<>();
		hash.put("pdto", pdto);
		hash.put("standard", standard);
		model.addAttribute("memList", m_dao.memList(hash));
		model.addAttribute("pdto", pdto);
		model.addAttribute("standard", standard);

		return "ad_memtable";
	}

}// end class