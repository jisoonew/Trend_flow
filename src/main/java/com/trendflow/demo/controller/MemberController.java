package com.trendflow.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.trendflow.demo.dto.memberDto;
import com.trendflow.demo.entity.member;
import com.trendflow.demo.repository.MemberRepository;
import com.trendflow.demo.service.memberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberController {

	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private BCryptPasswordEncoder  passwordEncoder;
	
	@Autowired
	private memberService memberservice;
	
	@GetMapping({"/", "/join"})
	public String joinForm(@ModelAttribute("memberDto") memberDto memberDto) {
		return "join";
	}
	
	@PostMapping({"/" ,"/join"})
	public String join(@ModelAttribute("memberDto") @Valid memberDto memberDto, BindingResult bindingResultt, member member) {
		if(bindingResultt.hasErrors()) {
			return "join";
		}
		// 인코딩을 안하고 회원가입을 하게되면 비밀번호가 그냥 노출된채로 DB에 삽입되기때문에
		// 시큐리티 로그인을 사용하지 못하게 된다.
		String rawPassword = member.getPassword();
		String encPassword = passwordEncoder.encode(rawPassword);
		member.setPassword(encPassword);
		
		memberRepository.save(member);	
		
		return "redirect:/login";
	}
	
	@GetMapping("/admin")
	public @ResponseBody String admin() {
		return "admin";
		}
	
	@GetMapping("/manager")
	public @ResponseBody String manager() {
		return "manager";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
}
