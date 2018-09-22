package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.MemDAO;
import dto.MemDTO;

@Controller
public class MemberController {
   private MemDAO dao;
   
   public void setDao(MemDAO dao) {
      this.dao = dao;
   }
   
   @RequestMapping("searchMember.do")
   public ModelAndView searchIDProcess(HttpServletRequest req) {   
      ModelAndView mav = new ModelAndView();
      mav.addObject("division", req.getParameter("division"));
      mav.setViewName("searchMember");
      return mav;
   }//end searchProcess()
   
   @RequestMapping("resultsearch.do")
   public @ResponseBody MemDTO resultProcess(MemDTO dto) {
      System.out.println(dto.getId());
      if(dto.getId().equals("undefined")) {
         System.out.println("test");
         dto.setId("");
      }
      return dao.referenceMem(dto);
   }//end resultProcess()
   
   @RequestMapping("resultmove.do")
   public ModelAndView Process(MemDTO dto) {
      ModelAndView mav = new ModelAndView();
      
      mav.addObject("dto",dao.referenceMem(dto));
      mav.setViewName("searchresult");
      
      return mav;
   }
}//end class