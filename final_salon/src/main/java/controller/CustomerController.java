package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.EmailDAO;
import dao.FnqDAO;
import dao.ImgDAO;
import dao.NoBoardDAO;
import dto.EmailDTO;
import dto.FnqDTO;
import dto.ImgcontentDTO;
import dto.NoBoardDTO;
import dto.PageDTO;

@Controller
public class CustomerController {
	private FnqDAO dao;
	private int currentPage = 1;
	private PageDTO pdto;
	private NoBoardDAO dao2;
	private EmailDTO edto; 
	private EmailDAO dao3;
	private JavaMailSender mailSender;	

	public void setDao(FnqDAO dao) {
		this.dao = dao;
	}

	public void setDao2(NoBoardDAO dao2) {
		this.dao2 = dao2;
	}

	public void setDao3(EmailDAO dao3) {
		this.dao3 = dao3;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	@RequestMapping("register.do")
	public String process1() {
		return "fnqwrite";
	}// end writeMethod()////

	@RequestMapping(value = "write.do", method = RequestMethod.POST)
	public ModelAndView insert(FnqDTO dto) {
		System.out.println(dto.getFnqCate());
		System.out.println(dto.getFnqQuest());
		System.out.println(dto.getFnqContent());
		dao.insert(dto); //
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/customer.do");
		return mav;
	}

	@RequestMapping("customer.do")
	public ModelAndView listMethod(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int totalRecord = dao.countdata();
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0) {

				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			pdto = new PageDTO(currentPage, totalRecord);

			mav.addObject("aList", dao.listfnq(pdto));
			mav.addObject("pv", pdto);
		}
		mav.setViewName("customer");
		return mav;

	}// end listMethod()////

	@RequestMapping(value = "fnqdelete.do")
	public ModelAndView delete(int fnqNum, int currentPage) {
		System.out.println(fnqNum);
		System.out.println(currentPage);
		dao.delete(fnqNum);
		ModelAndView mav = new ModelAndView();

		PageDTO pv = new PageDTO(currentPage, dao.countdata());

		if (pv.getTotalPage() <= currentPage)
			mav.addObject("currentPage", pv.getTotalPage());
		else
			mav.addObject("currentPage", currentPage);

		mav.setViewName("redirect:/customer.do");
		return mav;
	}

	@RequestMapping(value = "fnqupdate.do", method = RequestMethod.GET)
	public ModelAndView fnqupdate(int fnqNum, int currentPage) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dao.updateNum(fnqNum));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("fnqupdate");
		return mav;
	}// end upadateMethod

	@RequestMapping(value = "fnqupdate.do", method = RequestMethod.POST)
	public ModelAndView updateProc(FnqDTO dto, int currentPage) {
		ModelAndView mav = new ModelAndView();
		dao.update(dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/customer.do");
		return mav;
	}// end upadateMethod


	@RequestMapping("noregister.do")
	public String process3() {
		return "nowrite";
	}// end writeMethod()////

	@RequestMapping(value = "imgwrite.do", method = RequestMethod.POST)
	public ModelAndView insertNo(NoBoardDTO dto) {
		System.out.println(dto.getNoCate());
		System.out.println(dto.getNoTitle());
		System.out.println(dto.getNoContent());
		System.out.println(dto.getReg_date());
		dao2.insert(dto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/notice.do");
		return mav;
	}

	@RequestMapping("notice.do")
	public ModelAndView listNoBoard(PageDTO pv) {
		ModelAndView mav = new ModelAndView();
		int totalRecord = dao2.countdata();
		if (totalRecord >= 1) {
			if (pv.getCurrentPage() == 0) {

				currentPage = 1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			pdto = new PageDTO(currentPage, totalRecord);

			mav.addObject("aList", dao2.listNo(pdto));
			mav.addObject("pv", pdto);
		}
		mav.setViewName("notice");
		return mav;

	}// end listMethod()////

	@RequestMapping("noview.do")
	public ModelAndView viewMethod(int currentPage, int num) {
		dao2.readCounter(num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dao2.content(num));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("noview");
		return mav;
	}

	@RequestMapping(value = "noupdate.do", method = RequestMethod.GET)
	public ModelAndView updateMethod(int num, int currentPage) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dao2.content(num));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("noupdate");
		return mav;
	}// end upadateMethod

	@RequestMapping(value = "noupdate.do", method = RequestMethod.POST)
	public ModelAndView updateProc(NoBoardDTO dto, int currentPage) {
		ModelAndView mav = new ModelAndView();
		System.out.println(dto.getNoContent());
		System.out.println(dto.getNoNum());
		dao2.update(dto);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/notice.do");
		return mav;
	}// end upadateMethod

	@RequestMapping(value = "nodelete.do")
	public ModelAndView deleteMethod(int num, int currentPage) {
		ModelAndView mav = new ModelAndView();
		dao2.delete(num);
		PageDTO pv = new PageDTO(currentPage, dao2.countdata());
		if (pv.getTotalPage() <= currentPage)
			mav.addObject("currentPage", pv.getTotalPage());
		else
			mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/notice.do");
		return mav;
	}// end deleteMethod

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
			System.out.println("없으니까 만든다");
		}
		File file = new File(root, name);
		multi.transferTo(file);
		FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(file));
		ImgcontentDTO dto = new ImgcontentDTO();
		dto.setName(name);
		dto.setNum(3);
		dto.setUrl("notyet");
		System.out.println(root + name);
		return "temp/" + name;
	}

	@RequestMapping("/mailForm.do")
	public String mailForm() {
		return "mailForm";
	}

	@RequestMapping("/mailSending.do")  
    public String mailSending(EmailDTO dto, HttpServletRequest req) { 
    
	   //System.out.println(mailSender);
       
       String setform = "123333test12333@gmail.com";
       String tomail = req.getParameter("tomail");
       String title = req.getParameter("e_title");
       String sendmail = req.getParameter("e_mail");
       String content = "보내신분 이메일 :"+ sendmail+"\n"+req.getParameter("e_content");
       System.out.println(sendmail+tomail + title + content);
       
       
       System.out.println("///////////////");
       System.out.println(dto.getE_title());
       System.out.println(dto.getE_mail());
       System.out.println(dto.getE_content());
       System.out.println("///////////////");

       
       dao3.insert(dto);  
       try {
          System.out.println("start : ");
          MimeMessage message = mailSender.createMimeMessage();
          System.out.println("message : " + message);
          MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
           
          messageHelper.setFrom(setform);
          messageHelper.setTo(tomail);
          messageHelper.setSubject(title);
          messageHelper.setText(content);
           
          mailSender.send(message);
       }catch (Exception e) {
          System.out.println(e);
       }
       
       return "redirect:/customer.do";
    }



}
