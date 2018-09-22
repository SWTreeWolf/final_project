package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import api.kakao.Kakao;
import api.naver.NaverLoginBO;
import dao.MemDAO;
import dto.MemDTO;

@Controller
public class SignInController {
   private HashMap<String, String> comparemap = new HashMap<>();
   private HashMap<String, String> naverMap = new HashMap<>();
   private String apiResult = null; // 네이버 apiresult

   private String token = ""; // 카카오 토큰
   OAuth2AccessToken oauthToken;

   public MemDAO dao;
   private MemDTO dto = new MemDTO();

   private NaverLoginBO naverLoginBO; // 네이버BO
   private Kakao kakao;

   public void setDao(MemDAO dao) {
      this.dao = dao;
   }

   public void setNaverLoginBO(NaverLoginBO naverLoginBO) {
      this.naverLoginBO = naverLoginBO;
   }

   public void setKakao(Kakao kakao) {
      this.kakao = kakao;
   }

   @RequestMapping("signin.do")
   public ModelAndView process(HttpSession session, RedirectAttributes attributes) {
      ModelAndView mav = new ModelAndView();
      String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
      System.out.println("네이버:" + naverAuthUrl);
      mav.addObject("url", naverAuthUrl);

      // 카카오, 네아로
      if (!comparemap.isEmpty()) {
         if (dao.compareMem(comparemap) == null) {
            attributes.addFlashAttribute("id", comparemap.get("id"));
            attributes.addFlashAttribute("mem_group", comparemap.get("mem_group"));

            // 네이버 로그인 시 넘기는 값들(이름, 성별, 닉네임, 이메일)
            attributes.addFlashAttribute("map", naverMap);

            // 회원가입 취소 시를 위함
            comparemap.remove("id");
            comparemap.remove("mem_group");

            mav.setViewName("redirect:/signup_detail.do");
            return mav;
         } else {
            dto.setId(comparemap.get("id"));
            dto.setMem_group(comparemap.get("mem_group"));
            session.setAttribute("dto", dao.searchMem(dto));
            mav.setViewName("redirect:/index.do");
            return mav;
         }
      }

      mav.setViewName("signin");
      return mav;
   }// end process()

   // 기본 로그인
   @RequestMapping(value = "salonLogin.do", method = RequestMethod.POST)
   public @ResponseBody String salonLoginProcess(MemDTO dto, String returnUrl, HttpSession session) {
      System.out.println(dto.getId() + " : " + dto.getPassword() + " : " + dto.getMem_group() + " : " + returnUrl);

      if (dao.searchMem(dto).getId() != null) {
         session.setAttribute("dto", dao.searchMem(dto));
         if (returnUrl != "") {
            return returnUrl;
         } else {
            return "index.do";
         }
      } else {
         System.out.println("안로그인");
         return "안 로그인";
      }
   }

   // 카카오 로그인
   @RequestMapping(value = "/kakaoLogin.do", produces = "application/json;charset=UTF-8", method = { RequestMethod.GET,
         RequestMethod.POST })
   public String kakaoLoginprocess(@RequestParam(value = "code", defaultValue = "false") String code) {
      if (!code.isEmpty() || !code.equals("false")) {
         initvalue();
         comparemap = new api.kakao.Kakao().recieveprocess(code);
         token = comparemap.get("token");
         comparemap.remove("token");
         System.out.println("확인용도 ///// " + token);
      }
      return "api_completelogin";
   }

   // 네이버 로그인 성공시 callback호출 메소드
   @RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
   public String callback(@RequestParam(defaultValue = "false") String code, @RequestParam String state,
         HttpSession session) {

      ModelAndView mav = new ModelAndView();
      if (!code.equals("false")) {
         try {
            oauthToken = naverLoginBO.getAccessToken(session, code, state);
            // 로그인 사용자 정보를 읽어온다.
            apiResult = naverLoginBO.getUserProfile(oauthToken);
            // System.out.println(apiResult.toString());

            JSONParser parser = new JSONParser();
            Object obj = parser.parse(apiResult.toString());

            JSONObject object = (JSONObject) obj;
            obj = parser.parse(object.get("response").toString());

            JSONObject userInfo = (JSONObject) obj;
            
            try {
               String[] email = userInfo.get("email").toString().split("@jr.");
               naverMap.put("nickname", userInfo.get("nickname").toString());
               naverMap.put("gender", userInfo.get("gender").toString());
               naverMap.put("email1", email[0].toString());
               naverMap.put("email2", email[1].toString());
               naverMap.put("name", userInfo.get("name").toString());
            }catch(NullPointerException e) {
               return "redirect:/unlink.do";
            }catch(ArrayIndexOutOfBoundsException e) {
            	String[] email = userInfo.get("email").toString().split("@");
                naverMap.put("nickname", userInfo.get("nickname").toString());
                naverMap.put("gender", userInfo.get("gender").toString());
                naverMap.put("email1", email[0].toString());
                naverMap.put("email2", email[1].toString());
                naverMap.put("name", userInfo.get("name").toString());
            }

            comparemap.put("id", userInfo.get("id").toString());
            comparemap.put("mem_group", "naver");
         } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } catch (org.json.simple.parser.ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
      return "api_completelogin";
   }

   // 로그아웃
   @RequestMapping(value = "signout.do")
   public String logoutProcess(HttpSession session) {
      session.invalidate();
      initvalue();
      return "redirect:/index.do";
   }

   private void initvalue() {
      dto.setId("");
      dto.setMem_grade("");
      comparemap.remove("id");
      comparemap.remove("mem_group");

      Set<String> set = naverMap.keySet();
      naverMap.keySet().removeAll(set);
   }// end initvalue()

   // 회원 탈퇴
   @RequestMapping("/unlink.do")
   public String unlinkProcess(HttpSession session) {
      HttpURLConnection connUnLink;

      HashMap<String, String> map = new HashMap<>();
      if (session.getAttribute("dto") == null) {
         try {
            connUnLink = (HttpURLConnection) naverLoginBO.getUnLinkURL(oauthToken).openConnection();
            connUnLink.setRequestMethod("POST");
            connUnLink.setRequestProperty("Content-type", "application/json");
            BufferedReader rd;
            if (connUnLink.getResponseCode() >= 200 && connUnLink.getResponseCode() <= 300) {
               rd = new BufferedReader(new InputStreamReader(connUnLink.getInputStream()));
            } else {
               rd = new BufferedReader(new InputStreamReader(connUnLink.getErrorStream()));
            }
            rd.close();
            connUnLink.disconnect();
            return "api_completelogin";
         } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }else {
         MemDTO dto = (MemDTO) session.getAttribute("dto");
         String id = dto.getId();
         String mem_group = dto.getMem_group();
         // System.out.println("memgroup : " + mem_group);
         map.put("id", id);
         map.put("mem_group", mem_group);
         try {
            if (mem_group.equals("kakao")) {
               System.out.println("kakao");
               connUnLink = (HttpURLConnection) kakao.getUnLinkURL().openConnection();
               connUnLink.setRequestMethod("POST");
               connUnLink.setRequestProperty("Authorization", "Bearer " + token);

               BufferedReader rd;
               if (connUnLink.getResponseCode() >= 200 && connUnLink.getResponseCode() <= 300) {
                  rd = new BufferedReader(new InputStreamReader(connUnLink.getInputStream()));
                  dao.deleteMem(map);
               } else {
                  rd = new BufferedReader(new InputStreamReader(connUnLink.getErrorStream()));
               }
               rd.close();
               connUnLink.disconnect();
            } else if (mem_group.equals("naver")) {
               System.out.println("naver");
               connUnLink = (HttpURLConnection) naverLoginBO.getUnLinkURL(oauthToken).openConnection();
               connUnLink.setRequestMethod("POST");
               connUnLink.setRequestProperty("Content-type", "application/json");
               BufferedReader rd;
               if (connUnLink.getResponseCode() >= 200 && connUnLink.getResponseCode() <= 300) {
                  rd = new BufferedReader(new InputStreamReader(connUnLink.getInputStream()));
                  dao.deleteMem(map);
               } else {
                  rd = new BufferedReader(new InputStreamReader(connUnLink.getErrorStream()));
               }
               rd.close();
               connUnLink.disconnect();
            } else if (mem_group.equals("salon")) {
               System.out.println("salon");
               dao.deleteMem(map);
            }
         } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
      
      return "redirect:/signout.do";
   }

}// end class