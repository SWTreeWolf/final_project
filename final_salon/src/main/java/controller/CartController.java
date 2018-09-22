package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.ProdcutDAO;
import dto.CartDTO;
import dto.OptionsDTO;
import dto.RegiDTO;
import dto.cartViewDTO;

@Controller
public class CartController {
   ProdcutDAO dao;

   public void setDao(ProdcutDAO dao) {
      this.dao = dao;
   }
   
   @RequestMapping("/cartDel.do") // 상품자체를 장바구니에서 지우기
   @ResponseBody
   public String cartDel(CartDTO dto) {
      System.out.println(dto.getGoods_code()+","+dto.getId());
	   dao.cartDel(dto);
      return null; 
   }
   
   @RequestMapping("/optDel.do") // 옵션이 있는거에서 옵션만 지우기 부분
   @ResponseBody
   public String optDel(CartDTO dto) {
      dao.optDel(dto);
      return null; 
   }
   
   @RequestMapping("/cartEditCount.do")//상품갯수 변경
   @ResponseBody
   public int cartEditCount(CartDTO dto) {
	   System.out.println(dto.getCart_num()+" : "+dto.getId()+" : "+dto.getProd_count());
      return dao.cartEditCount(dto);
   }
   
    
   @RequestMapping("/cart.do")//장바구니페이지
   public ModelAndView cart(String id) {
     ModelAndView mav = new ModelAndView();
     List<cartViewDTO> cList = dao.cartView(id);
     for(int i =0 ; i <cList.size(); i++) {
    	 List<OptionsDTO> oList = new ArrayList<OptionsDTO>();
    	 //System.out.println(dao.pictureDetail(cList.get(i).getGoods_code()).getGoods_main().length()+"ss");
    	 cList.get(i).setGoods_main(dao.pictureDetail(cList.get(i).getGoods_code()).getGoods_main());
    	 cList.get(i).setGoods_code2(dao.cartCode2(cList.get(i)));
    	 for(int j=0; j <cList.get(i).getGoods_code2().size(); j++) {
    		 oList.add(dao.cartOptionView(cList.get(i).getGoods_code2().get(j)));
    	 }
    	 cList.get(i).setOdto(oList);
    	 System.out.println(cList.get(i).getId()+" : "+cList.get(i).getGoods_code());
    	 cList.get(i).setCart_num(dao.cartNumSel(cList.get(i)));
    	 cList.get(i).setProd_count(dao.cartprod_count(cList.get(i))); 
     } 
    
     
     mav.addObject("cList",cList);
     mav.setViewName("cart");
     
     return mav;
   }

   @RequestMapping(value="/cartIns.do",method=RequestMethod.POST)//장바구니 추가
   @ResponseBody
   public String cartIns(RegiDTO rdto) {
      List<CartDTO> cList=rdto.getCartList();
      System.out.println("접근합니다.");
      if(cList.size()>0) {//옵션있는상품
    	  System.out.println("옵션있는상품.");
         for(CartDTO cdto : cList) {
            if(cdto.getGoods_code2()!=0&&cdto.getProd_count()!=0) {
               //지정안해줘도 되는거 goods_code2, prod_count
               cdto.setGoods_code(rdto.getGoods_code());
               cdto.setGoods_name(rdto.getGoods_name());
               cdto.setGoods_price(rdto.getGoods_price());
               cdto.setId(rdto.getId());
               System.out.println(dao.cartChkCode2(cdto));
               if(dao.cartChkCode2(cdto)>0) {//같은 상품이 있는지
                  dao.cartUpCode2(cdto);
                  break;
               }
            dao.cartIns(cdto);
            }//end if
            }//end for
      }else {//아닌상품\
    	  System.out.println("옵션 없는 상품");
         CartDTO cdto=new CartDTO();
         cdto.setGoods_code(rdto.getGoods_code());
         cdto.setGoods_name(rdto.getGoods_name());
         cdto.setGoods_price(rdto.getGoods_price());
         cdto.setProd_count(rdto.getTotal_count());//옵션없는 상품은 total_count로 갯수받아옴
         cdto.setId(rdto.getId());
         if(dao.cartChkCode(cdto)>0) {//같은 상품이 있는지
            dao.cartUpCode(cdto);
         }else {
            dao.cartIns(cdto);
         }
      }
      return "추가함";
   }// end cartIns()

   
}// end class