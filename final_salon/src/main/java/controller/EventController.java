package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView; 

import dao.EventBoardDAO;
import dto.EventBoardDTO;
import dto.PageDTO;

@Controller
public class EventController {
	private EventBoardDAO dao;
	private int currentPage=1;
	private PageDTO pdto;
 
	public void setDao(EventBoardDAO dao) {
		this.dao = dao;
	}

/* 
	@RequestMapping("event.do")
	public String process() {
		return "event";
	}// end process()

*/	
	@RequestMapping("eventWrite.do")
	public String processEventWrite() {
		return "eventWrite";
	}// end process()
	
/*	
	@RequestMapping("eventPage.do")
	public String processEventPage() {
		return "eventPage";
	}// end process()
*/
 /*
	@RequestMapping(value = "/imagein.do", method = RequestMethod.POST)
	public @ResponseBody String imagein(@RequestParam("file") MultipartFile multi, HttpServletRequest req)
			throws IllegalStateException, IOException {
		String name = multi.getOriginalFilename();
		System.out.println("파일이름:" + name);
		String root = req.getSession().getServletContext().getRealPath("/");
		root += "temp" + File.separator;
		System.out.println("루트이름:" + root);
		File fe = new File(root);
		System.out.println(root);
		if (!fe.exists()) {
			fe.mkdirs();
			System.out.println("후");
		}
		
		File file = new File(root, name);
		multi.transferTo(file);
		FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(file));
		//EventBoardDTO dto = new EventBoardDTO();
		System.out.println(root + name);
		return "temp/" + name;
	}
*/ 
	@RequestMapping("eventPage.do")
	public ModelAndView viewMethod(int num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dao.content(num));
		mav.setViewName("eventPage");
		return mav;
	}
  
	@RequestMapping(value = "evimgwrite.do", method = RequestMethod.POST)
	public ModelAndView insertimg(EventBoardDTO dto,HttpServletRequest req) throws IllegalStateException, IOException {
		System.out.println("ㅇㅇㅇㅇㅇ");
		
		/*System.out.println(dto.getEvent_num());
		System.out.println(dto.getEvent_name());
		System.out.println(dto.getEvent_content());*/
		  String test1 = req.getParameter("start_date");
	       String test2 = req.getParameter("end_date"); 
		
	       System.out.println(test1 + "///" + test2);
		
		
	    MultipartFile multi=dto.getEvent_mainpic_file();
		
		String name = multi.getOriginalFilename();
		
		System.out.println(name);
		String root = req.getSession().getServletContext().getRealPath("/");
		root += "temp" + File.separator;
		File fe = new File(root);
		if (!fe.exists()) {
			fe.mkdirs();
		}
		File file = new File(root, name);
		multi.transferTo(file);
		
		dto.setEvent_mainpic("temp/"+name);
		
		dao.save(dto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/event.do");
		return mav;
	}
	
	/*
	@RequestMapping("event.do") 
	public ModelAndView thumbnailList() {
		ModelAndView mav = new ModelAndView();
			List<EventBoardDTO> eventList = dao.eventList();	
			
			mav.addObject("eventList", eventList); 
			//mav.addObject("eventLength", eventList.size());
			mav.setViewName("event");
			return mav;
		}// end process()
	*/
	
	@RequestMapping("event.do") 
	public ModelAndView listthumb(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int totalRecord = dao.countdata();
		if(totalRecord>=1) { 
			if(pv.getCurrentPage()==0) {
				
				currentPage=1;
			}else {   
				currentPage=pv.getCurrentPage();
			}
			System.out.println(currentPage);
			System.out.println(totalRecord);
			
			
		 pdto = new PageDTO(currentPage, totalRecord);	
		 
		 mav.addObject("eventList", dao.eventListb(pdto));  
		 mav.addObject("pv", pdto);  
		}
		mav.setViewName("event");
		return mav;
		
	}//end listMethod()////
	
	
	@RequestMapping("eventup.do")
	public ModelAndView upMethod(int num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dao.content(num));
		mav.setViewName("eventupdate"); 
		return mav;
	}
	
	
	
	@RequestMapping("elist.do") 
	public @ResponseBody List<EventBoardDTO>  eList() {
		    
			List<EventBoardDTO> eventList = dao.eventList();
			
			
			return eventList;
			
		}// end process()	
	
	

	
 
	@RequestMapping(value="eventup.do", method=RequestMethod.POST)
    public ModelAndView updateProc(EventBoardDTO dto)
    {  
    	 ModelAndView mav = new ModelAndView();
    	 dao.update(dto);
    	 mav.setViewName("redirect:/event.do");  
    	 return mav;
    }//end upadateMethod
  	
	
	@RequestMapping(value="eventdel.do") 
    public ModelAndView deleteMethod(int num)
    {   
    	 ModelAndView mav = new ModelAndView();
    	 dao.delete(num);
    	 PageDTO pv = new PageDTO(currentPage, dao.countdata());
    	 if(pv.getTotalPage()<=currentPage)
    		 mav.addObject("currentPage",pv.getTotalPage());
    	 else
    		 mav.addObject("currentPage",currentPage);
    	    mav.setViewName("redirect:/event.do");
     	 return mav;
    }//end deleteMethod 
	
	

}// end class
