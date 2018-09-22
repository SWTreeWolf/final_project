package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class instaController {
	@RequestMapping("insta.do")
	public String process() {
		return "insta";
	}//end process()
}//end class
