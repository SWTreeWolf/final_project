package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import api.captcha.Captcha;
import dao.MemDAO;
import dto.MemDTO;

@Controller
public class SignUpController {
	public MemDAO dao;
	private Captcha captcha;
	
	public void setDao(MemDAO dao) {
		this.dao = dao;
	}

	public void setCaptcha(Captcha captcha) {
		this.captcha = captcha;
	}

	@RequestMapping("signup_detail.do")
	public ModelAndView detailProcess() { 
		ModelAndView mav = new ModelAndView();
		String key = captcha.keyIssued();		
		String img_name = captcha.imageIssue(key);
		System.out.println(img_name);
		
		mav.addObject("key", key);
		mav.addObject("img_name", img_name);
		mav.setViewName("signup_detail");
		return mav;
	}// end process()

	//captcha 이미지 새로고침
	@RequestMapping("signup_refresh.do")
	@ResponseBody
	public HashMap<String,String> refresh() {
		HashMap<String, String> map = new HashMap<String, String>();
		String key = captcha.keyIssued();
		String img_name = captcha.imageIssue(key);
		
		map.put("key", key);
		map.put("img_name", img_name);
		
		return map;
	}//end refresh()
	
	//captcha와 value 값 비교
	@RequestMapping("signup_compare.do")
	@ResponseBody
	public String captcha_compare(String key, String secretWord) {
		System.out.println("key = " + key);
		System.out.println("secretWord = " + secretWord);
		return captcha.CompareProcess(key, secretWord);
	}//end captcha_compare()
	
	@RequestMapping("singup_complete.do")
	public String completeProcess() {
		return "signup_complete";
	}// end process()
	
	@RequestMapping("overlap.do")
	@ResponseBody
	public List<MemDTO> overlapIdProcess(MemDTO dto){
		System.out.println(dto.getId());
		System.out.println(dto.getNickname());
		
		return dao.overlapMem(dto);
	}//end overlapProcess()
	
	@RequestMapping(value="insmem.do",method=RequestMethod.POST)
	public String insmemProcess(MemDTO dto,HttpServletRequest request) {
		System.out.println("@@@@@@@@@@@@@@@@"+dto.getName()+" : "+dto.getGender());
		
		dto.setEmail(request.getParameter("email1")+"@"+request.getParameter("email2"));
		dto.setPhone(request.getParameter("phone_first")+"-"+request.getParameter("phone_middle")+"-"+request.getParameter("phone_last"));
		dto.setDate_of_birth(request.getParameter("birth_y")+"-"+request.getParameter("birth_m")+"-"+request.getParameter("birth_d"));
		
		dao.salonInsMem(dto); 
		return "signup_complete";
	}
}// end class
