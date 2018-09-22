package api.kakao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.http.HttpMethod;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;


public class Kakao {
	final private String RequestUrl = "https://kapi.kakao.com/v1/user/me";
	final private String CLIENT_ID = "5dcaf38de951806f38e7fb7409f0917b";
	final private String REDIRECT_URI = "http://192.168.10.214:8090/mytiles/kakaoLogin.do"; //localhost로 바꿀 것
	final private String ADMIN_KEY = "350f943111ad651d444180c2be7ce2b9";
	private String token = "";

	public HashMap<String, String> recieveprocess(String code) {
		// 사용자 정보 요청
		//System.out.println(code);
		JsonNode get_token = getAccessToken(code);
		System.out.println(get_token);
		
		String token = get_token.path("access_token").asText();
		System.out.println("token : " + token);
		JsonNode userInfo = getKakaoUserInfo(token);
		System.out.println(userInfo);
		
		// Get id
		String id = userInfo.path("id").asText();
		String nickname = null;
		String thumbnailImage = null;
		String profileImage = null;
		String message = null;

		// 유저정보 카톡에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		HashMap<String, String> map = new HashMap<>();
		if (properties.isMissingNode()) {
			// if "name" node is missing
		} else {
			nickname = properties.path("nickname").asText();
			thumbnailImage = properties.path("thumbnail_image").asText();
			profileImage = properties.path("profile_image").asText();
			
			map.put("token", token);
			map.put("id", id);
			map.put("mem_group", "kakao");
		}
		
		return map;
	}
	
	/*@RequestMapping(value = "/kakaologout.do", produces = "application/json;charset=UTF-8", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String logoutprocess(String token) {
		String log_id = token;
		this.token = "";
		
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);

		// add header
		post.addHeader("Authorization", "Bearer " + log_id);

		JsonNode returnNode = null;
		try {
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();

			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Response Code : " + responseCode);

			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "redirect:/index.do";
	}*/
	
	//토큰 얻는 과정
	public JsonNode getAccessToken(String autorize_code){ 
	    final String RequestUrl = "https://kauth.kakao.com/oauth/token";
	    final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
	   
	    postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
	    postParams.add(new BasicNameValuePair("client_id", CLIENT_ID));    // REST API KEY
	    postParams.add(new BasicNameValuePair("redirect_uri", REDIRECT_URI));    // 리다이렉트 URI
	    postParams.add(new BasicNameValuePair("code", autorize_code));    // 로그인 과정중 얻은 code 값

	    final HttpClient client = HttpClientBuilder.create().build();
	    final HttpPost post = new HttpPost(RequestUrl);
	    
	    JsonNode returnNode = null;
	    
	    try {
	      post.setEntity(new UrlEncodedFormEntity(postParams));
	     
	      final HttpResponse response = client.execute(post);
	      final int responseCode = response.getStatusLine().getStatusCode();
	      
	      System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
	      System.out.println("Post parameters : " + postParams);
	      System.out.println("Response Code : " + responseCode);

	      //JSON 형태 반환값 처리
	      ObjectMapper mapper = new ObjectMapper();
	      returnNode = mapper.readTree(response.getEntity().getContent());
	    } catch (UnsupportedEncodingException e) {
	      e.printStackTrace();
	    } catch (ClientProtocolException e) {
	      e.printStackTrace();
	    } catch (IOException e) {
	      e.printStackTrace();
	    } finally {
	        // clear resources
	    }
	    
	    return returnNode;
	}
	
	
	//userInfo
	public JsonNode getKakaoUserInfo(String autorize_code) {
		// 로그인 후 code get(autorize_code)
		String code = autorize_code;

		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);

		// add header
		post.addHeader("Authorization", "Bearer " + autorize_code);

		JsonNode returnNode = null;
		try {
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
			System.out.println(post.toString());
			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Response Code : " + responseCode);

			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return returnNode;
	}
	
	//카카오 앱 연동해제 관련(회원탈퇴 부분)
	public URL getUnLinkURL() throws IOException {   
		StringBuilder url = new StringBuilder("https://kapi.kakao.com/v1/user/unlink");
        URL urlL = new URL(url.toString());
        return urlL;
    }
}// end class
