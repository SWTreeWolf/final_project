package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.MemDAO;
import dao.payDAO;
import dto.CartBuyDTO;
import dto.MemDTO;
import dto.PayDTO;
import dto.ordertransDTO;

@Controller
public class PayController {
	private payDAO dao;
	private MemDAO mdao;

	List<CartBuyDTO> cbDTOList = new ArrayList<CartBuyDTO>();
	int pay_num;

	public void setDao(payDAO dao) {
		this.dao = dao;
	}
	
	public void setMdao(MemDAO mdao) {
		this.mdao = mdao;
	}

	@RequestMapping("pay.do")
	public String process() {
		return "pay";
	}// end process()

	// 재고 체크후 기존 쌓여있던 리스트 초기화.
	@RequestMapping("listDelete.do")
	public void listDeleteProcess() {
		cbDTOList = new ArrayList<CartBuyDTO>();
		System.out.println("listDel() 실행후 사이즈 : " + cbDTOList.size());
	}

	@RequestMapping(value = "cartAdd.do", method = RequestMethod.POST)
	public void cartBuyProcess(CartBuyDTO dto) {
		cbDTOList.add(dto);
		System.out.println("cbDTOList 사이즈 : " + cbDTOList.size());

		for (int i = 0; i < cbDTOList.size(); i++) {
			System.out.println("i : " + i + ", 값 : " + cbDTOList.get(i).getOption_count().size());
		}
		System.out.println("=======================");
	}

	@RequestMapping(value = "cartBuy.do", method = RequestMethod.POST)
	public ModelAndView cartProcess(int total_price,String id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("aList", cbDTOList);
		mav.addObject("aListlength", cbDTOList.size());
		cbDTOList = new ArrayList<CartBuyDTO>();
		System.out.println(cbDTOList.size());
		mav.addObject("point", mdao.mypoint(id));
		mav.addObject("total_price", total_price);
		mav.setViewName("pay");
		return mav;
	}

	@RequestMapping("directBuy.do")
	public ModelAndView directBuyProcess(ordertransDTO dto) {
		ModelAndView mav = new ModelAndView();
		// System.out.println(dto.getGoods_color().get(0)+dto.getGoods_color().get(1));
		mav.addObject("point",mdao.mypoint(dto.getId()));
		mav.addObject("dto", dto);
		mav.setViewName("directPay");
		return mav;
	}// end directBuyProcess

	// pay_num
	@RequestMapping(value = "payNumSet.do", method = RequestMethod.POST)
	public void payNumSetProcess() {
		System.out.println(dao.payNum());
		pay_num = dao.payNum() + 1;

		System.out.println("pat_num : " + pay_num);
	}// end payNumSetProcess()

	@RequestMapping(value = "payAdd.do", method = RequestMethod.POST)
	public void payAddProcess(PayDTO dto, String cart_num) {
		System.out.println(dto.getOrder_name()+"order_name");
		System.out.println("set pay_num :" + pay_num);
		dto.setPay_num(pay_num);
		System.out.println("dto paynum : " + dto.getPay_num());
		System.out.println("들어는 오냐 ");
		dao.payAdd(dto);
		if (cart_num != null) {
			dao.cartDelete(Integer.parseInt(cart_num));
		}
		if (dto.getGoods_code2() == 0) {
			System.out.println("옵x");
			dao.no_Opt_Del(dto);
			dao.prod_sel_up(dto);
		} else {
			System.out.println("옵o");
			dao.opt_Del(dto);
			dao.opt_sel_up(dto);
		}
	}// end payNumSetProcess()

	@RequestMapping(value = "mem_tot_price.do", method = RequestMethod.POST)
	public void memTotalPrice(PayDTO dto, 
			@RequestParam(value="point",defaultValue="0")String point) {
		try {
			int real_point = Integer.parseInt(point);
			System.out.println("real_point" + real_point);
			MemDTO mdto = new MemDTO();
			mdto.setId(dto.getId());
			mdto.setPoint(real_point);
			mdao.decreasepoint(mdto);
		}catch(NumberFormatException e) {
			e.printStackTrace();
		}
		
		dao.mem_tot_price(dto);
		int tot_p = dao.mem_tot(dto);
		HashMap<String, String> map = new HashMap<String, String>();
		HashMap<Object, Object> pointMap = new HashMap<Object, Object>();
		System.out.println(dto.getTotal_price());
		map.put("id", dto.getId());
		pointMap.put("id", dto.getId());
		
		if (tot_p >= 500000) {
			map.put("grade", "VIP");
			pointMap.put("point",(dto.getTotal_price()*(0.05))-((dto.getTotal_price()*(0.05))%100));
			dao.add_point(pointMap);
			dao.mem_grade(map);
		} else if (tot_p >= 300000) {
			map.put("grade", "GOLD");
			pointMap.put("point",(dto.getTotal_price()*(0.04))-((dto.getTotal_price()*(0.04))%100));
			dao.add_point(pointMap);
			dao.mem_grade(map);
		} else if (tot_p >= 150000) {
			map.put("grade", "SILVER");
			pointMap.put("point",(dto.getTotal_price()*(0.03))-((dto.getTotal_price()*(0.03))%100));
			dao.add_point(pointMap);
			dao.mem_grade(map);
		}else {
			pointMap.put("point",(dto.getTotal_price()*(0.02))-((dto.getTotal_price()*(0.02))%100));
			dao.add_point(pointMap);
		}
	}
}
