package com.tjoeun.picok_project;


	import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.tjoeun.picok_project.oauth.NaverLoginBO;

	@Controller
	public class NaverLoginController {

		private static final Logger logger = LoggerFactory.getLogger(NaverLoginController.class);
		
		private NaverLoginBO naverLoginBO;
		private String apiResult;
		
		@Autowired
		public void setNaverLoginBO(NaverLoginBO naverLoginBO) {
			this.naverLoginBO = naverLoginBO;
		}

		
		
		@RequestMapping("callback")
		public String callback(HttpServletRequest request, Model model, HttpSession session,
				@RequestParam String code, @RequestParam String state) throws IOException, ParseException {
			//String code = request.getParameter("code");
			//String state = request.getParameter("state");
			
			OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
			
			//로그인 사용자 정보를 얻어온다.
			apiResult = naverLoginBO.getUserProfile(oauthToken);
			
			//사용자 정보를 json 형태로 바꾼다.
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			
			// top 레벨 단계 데이터 파싱 - response
			JSONObject response_obj = (JSONObject) jsonObj.get("response");
			// logger.info("response_obj: {}", response_obj);
			// top 레벨 단계 데이터 파싱 결과에서 name만 파싱
			String name = (String) response_obj.get("name");
			// logger.info("name: {}", name);
			
			// 파싱된 값을 세션에 저장한다.
			session.setAttribute("sessionId", response_obj);
			
			model.addAttribute("result", apiResult);		
			return "naverSuccess";
			
		}
		
	}
