package com.trendflow.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.trendflow.demo.auth.PrincipalDetails;
import com.trendflow.demo.entity.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {
	
	// 메인 홈
	@GetMapping("/Trend_flow")
	public String Main(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model, HttpServletResponse response, HttpSession session) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setHeader("Expires", "0"); // Proxies.

		// 로그인 상태라면 
	    if (principalDetails != null) {
	    	// 세션을 사용한 이유 : 클라이언트와 서버 간의 상태를 유지하는 데 사용됨.
	    	session.setAttribute("userName", principalDetails.getUsername()+"님");
	    	// 로그인 유무
	    	model.addAttribute("loginInfo", true);
	        return "mainHome";
	    } else {
	    	model.addAttribute("loginInfo", false);
	    	return "mainHome";
	    }
	}

	
	// 내 정보
	@GetMapping("/myData")
	public String myData(@AuthenticationPrincipal PrincipalDetails principalDetails, HttpSession session) {
		session.setAttribute("userName", principalDetails.getUsername()+"님");
		return "myData";
	}

}
