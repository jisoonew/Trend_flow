package com.trendflow.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.trendflow.demo.auth.PrincipalDetails;
import com.trendflow.demo.dto.CosmeticDto;
import com.trendflow.demo.entity.Cosmetic;
import com.trendflow.demo.entity.Member;
import com.trendflow.demo.service.CosmeticService;
import com.trendflow.demo.service.memberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {
	
	@Autowired
	memberService memberservice;
	
	@Autowired
	CosmeticService cosmeticService;
	
	// 메인 홈
	@GetMapping("/Trend_flow")
	public String Main(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model, HttpServletResponse response, HttpSession session) {
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
	
	@GetMapping("/newPro")
	public String newPro() {
		return "newPro";
	}
	
	@GetMapping("/bestPro")
	public String bestPro(@AuthenticationPrincipal PrincipalDetails principalDetails, HttpSession session, Model model) {
		// 로그인 상태라면 
	    if (principalDetails != null) {
	    	// 세션을 사용한 이유 : 클라이언트와 서버 간의 상태를 유지하는 데 사용됨.
	    	session.setAttribute("userName", principalDetails.getUsername()+"님");
	    	// 로그인 유무
	    	model.addAttribute("loginInfo", true);
	    	List<CosmeticDto> cosmeticDtoList = cosmeticService.findAll();
		    model.addAttribute("cosmeticList", cosmeticDtoList);
	        return "bestPro";
	    } else {
	    	model.addAttribute("loginInfo", false);
	    	return "bestPro";
	    }
	}

}
