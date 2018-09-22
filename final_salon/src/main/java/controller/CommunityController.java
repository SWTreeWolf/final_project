package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.commuDAO;
import dao.replyDAO;
import dto.CommuDTO;
import dto.PageDTO;
import dto.commureplyDTO;
import dto.replypageDTO;

@Controller
public class CommunityController {
	 private commuDAO dao;
	 private replyDAO cdao;
	 private PageDTO pdto;
	 private int currentPage = 1;
	
	public CommunityController() {
		// TODO Auto-generated constructor stub
	}

	public void setDao(commuDAO dao) {
		this.dao = dao;
	}

	public void setCdao(replyDAO cdao) {
		this.cdao = cdao;
	}

	public void setPdto(PageDTO pdto) {
		this.pdto = pdto;
	}

	@RequestMapping("commu.do")
	public ModelAndView commu(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int totalRecord = dao.count(); //전체레코드수
		if(totalRecord >= 1) {
			if(pv.getCurrentPage() == 0 ) { //처음페이지는1로 들어간다. 
				currentPage =1; // 페이지를 1로 바꿔줌
			} else {
				currentPage = pv.getCurrentPage();
			}
			
			pdto = new PageDTO(currentPage,totalRecord);
			mav.addObject("comlist",dao.commulist(pdto));
			mav.addObject("pv",pdto);
		}
		
		mav.addObject("toplist",dao.toplist());
		mav.addObject("listcnt",dao.count());
		/*mav.addObject("replycnt",dao.replycnt(commuNum));*/
		/*System.out.println(dao.commulist().get(0).getReplycnt());*/
		mav.setViewName("community");
		return mav;
	}
	  
	@RequestMapping("commuwrite.do")
	public ModelAndView commuwrtie() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("commuwrite");
		return mav;
	}
	
	@RequestMapping(value="comm_writePro.do",method=RequestMethod.POST)
	public ModelAndView commuwritePro(CommuDTO dto) { // commuDTO 매핑에서 문제발생
		System.out.println("writePro.do 실행");
		System.out.println(dto.getNickname()+dto.getContent()+dto.getCategory()+dto.getSubject()+dto.getContent());
		ModelAndView mav = new ModelAndView();
		dao.insert(dto);
		mav.setViewName("redirect:/commu.do");
		return mav;
	}
	
	   @RequestMapping(value="/imageins.do",method=RequestMethod.POST)
	   public @ResponseBody String imagein(@RequestParam("file")MultipartFile multi,HttpServletRequest req) throws IllegalStateException, IOException {
	          String name=multi.getOriginalFilename();
	          String root=req.getSession().getServletContext().getRealPath("/");
	          root+="temp"+File.separator;
	          File fe=new File(root);
	          System.out.println(root);
	          if(!fe.exists()) {
	             fe.mkdirs();
	             System.out.println("없으니까 만든다");
	          }
	         File file=new File(root,name);
	         multi.transferTo(file);
	         //FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(file));
	         /*ImgcontentDTO dto=new ImgcontentDTO();
	         dto.setName(name);
	         dto.setNum(1);
	         dto.setUrl("notyet");
	         daoo.upload(dto);*/
	         System.out.println(root+name);
	         return "temp/"+name;
	    }
	
	//jsp페이지에서 파라미터 값으로 넘긴 값은 컨트롤러를 통해서 인자값으로 받아준다.
	@RequestMapping("commuview.do")
	public ModelAndView commuview(int commuNum) { //(int num) //이름이 dto랑 똑같아야 자동맵핑이 된다..
		ModelAndView mav = new ModelAndView();
		mav.addObject("comlist",dao.numcontent(commuNum));
		dao.readcount(commuNum);
		mav.setViewName("commuview");
		return mav;
	}//end commuview()//
	
	@RequestMapping("delete.do")
	public ModelAndView delete(int commuNum) {
		ModelAndView mav = new ModelAndView();
		dao.delete(commuNum);
		mav.setViewName("redirect:commu.do");
		return mav;
	}//end delete()//
	
	@RequestMapping(value="replyInsertList.do",method=RequestMethod.POST) //스트링으로 했을때  responseBody 해줘야 에러가 안뜸.
	public @ResponseBody int replyinsert(commureplyDTO cdto) {
		System.out.println(cdto.getReplyWriter()); 
		cdao.insertreply(cdto);
		return cdto.getCommuNum(); //리스폰스바디를 안하면 이 스트링값이 리턴하는 jsp주소로 넘어감.
	}//replyinsert()//
	
	@RequestMapping(value="replylist.do",method=RequestMethod.POST) 
	public @ResponseBody replypageDTO replylist(int commuNum, @RequestParam(value="currentPage",defaultValue="1")int currentPage) {
		int totalRecord = dao.count(); //전체의 레코드수
		pdto = new PageDTO(currentPage,totalRecord);
		replypageDTO rdto = new replypageDTO();
		rdto.setPdto(pdto);
		rdto.setCdto(cdao.commureplylist(commuNum));
		return rdto;
	}//end replylist()//
	
	@RequestMapping("update.do")
	public ModelAndView update(int commuNum) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("comlist",dao.numcontent(commuNum));
		mav.setViewName("commuUpdate");
		return mav;
	}//end update()//
	
	@RequestMapping("commu_updatePro.do")
	public ModelAndView updatePro(CommuDTO cdto) {
		ModelAndView mav = new ModelAndView();
		dao.update(cdto);
		mav.setViewName("redirect:commu.do");
		return mav;
	}//end updatePro()//
	
	//검색메소드
	@RequestMapping("searchPage.do")
	public ModelAndView searchpage(String subject) { //String data 
		ModelAndView mav = new ModelAndView();
		mav.addObject("searchlist",dao.search(subject));
		mav.addObject("key",subject);
		mav.addObject("listcnt",dao.searchlistCnt(subject));
		mav.setViewName("commuSearchPage");
		return mav;
	}//end searchpage()//
	
	@RequestMapping("skin.do")
	public ModelAndView skin(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int totalRecord = dao.skincnt(); //전체레코드수
		if(totalRecord >= 1) {
			if(pv.getCurrentPage() == 0 ) { //처음페이지는1로 들어간다. 
				currentPage =1; // 페이지를 1로 바꿔줌
			} else {
				currentPage = pv.getCurrentPage();
			}
			
			pdto = new PageDTO(currentPage,totalRecord);
			mav.addObject("skin",dao.skin(pdto));
			mav.addObject("pv",pdto);
		}
		mav.addObject("toplist",dao.toplist());
		mav.addObject("skincnt",dao.skincnt());
		mav.setViewName("commuSkin");
		return mav;
	}
	
	@RequestMapping("makeup.do")
	public ModelAndView makeup(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int totalRecord = dao.makeupcnt(); //전체레코드수
		if(totalRecord >= 1) {
			if(pv.getCurrentPage() == 0 ) { //처음페이지는1로 들어간다. 
				currentPage =1; // 페이지를 1로 바꿔줌
			} else {
				currentPage = pv.getCurrentPage();
			}
			
			pdto = new PageDTO(currentPage,totalRecord);
			mav.addObject("makeup",dao.makeUp(pdto));
			mav.addObject("pv",pdto);
		}
		mav.addObject("toplist",dao.toplist());
		mav.addObject("makeupcnt",dao.makeupcnt());
		mav.setViewName("commuMakeup");
		return mav;
	}
	
	@RequestMapping("product.do")
	public ModelAndView product(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int totalRecord = dao.productcnt(); //전체레코드수
		if(totalRecord >= 1) {
			if(pv.getCurrentPage() == 0 ) { //처음페이지는1로 들어간다. 
				currentPage =1; // 페이지를 1로 바꿔줌
			} else {
				currentPage = pv.getCurrentPage();
			}
			
			pdto = new PageDTO(currentPage,totalRecord);
			mav.addObject("product",dao.Product(pdto));
			mav.addObject("pv",pdto);
		}
		mav.addObject("toplist",dao.toplist());
		mav.addObject("productcnt",dao.productcnt());
		mav.setViewName("commuProduct");
		return mav;
	}
	  
	@RequestMapping("etc.do")
	public ModelAndView etc(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int totalRecord = dao.etccnt(); //전체레코드수
		if(totalRecord >= 1) {
			if(pv.getCurrentPage() == 0 ) { //처음페이지는1로 들어간다. 
				currentPage =1; // 페이지를 1로 바꿔줌
			} else {
				currentPage = pv.getCurrentPage();
			}
			
			pdto = new PageDTO(currentPage,totalRecord);
			mav.addObject("etc",dao.etc(pdto));
			mav.addObject("pv",pdto);
		}
		mav.addObject("toplist",dao.toplist());
		mav.addObject("etccnt",dao.etccnt());
		mav.setViewName("commuEtc");
		return mav;
	}

}//end class//
