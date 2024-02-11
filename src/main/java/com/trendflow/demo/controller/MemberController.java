package com.trendflow.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.trendflow.demo.dto.memberDto;
import com.trendflow.demo.entity.Member;
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
	
	@GetMapping("/join")
	public String joinForm(@ModelAttribute("memberDto") memberDto memberDto) {
		return "join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute("memberDto") @Valid memberDto memberDto, BindingResult bindingResult, Member member, Model model, String confirmPassword) {

		// 회원가입 유효성 검사에서 오류가 나거나, DB의 중복 아이디를 사용할 경우 또는 비밀번호가 일치하지 않을 경우 회원 가입이 되지 않는다.
	    if(bindingResult.hasErrors() || memberRepository.existsById(member.getUserId()) || !memberDto.getPassword().equals(memberDto.getConfirmPassword())) {
	    	bindingResult.rejectValue("confirmPassword", "error.member", "비밀번호가 일치하지 않습니다.");
	    	return "join";
	    } else {
	        // 인코딩을 안하고 회원가입을 하게되면 비밀번호가 그냥 노출된채로 DB에 삽입되기때문에
	        // 시큐리티 로그인을 사용하지 못하게 된다.
	        member.setRole("ROLE_USER");
	        String rawPassword = member.getPassword();
	        String encPassword = passwordEncoder.encode(rawPassword);
	        member.setPassword(encPassword);
	        
	        memberRepository.save(member);
	        
	        return "redirect:/login";
	    }
	}

	
	@GetMapping("/user-id/{userId}/exists")
	public ResponseEntity<Boolean> checkUserId(@PathVariable String userId, Member member) {
		return ResponseEntity.ok(memberservice.checkUserId(userId));
	}
	
	
	@GetMapping("/admin")
	public @ResponseBody String admin() {
		return "admin";
		}
	
	@GetMapping("/user")
	public @ResponseBody String user() {
		return "user";
	}
	
	@GetMapping("/manager")
	public @ResponseBody String manager() {
		return "manager";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/info")
	public @ResponseBody String info() {
		return "개인정보";
	}
	
	@PreAuthorize("hasRole('ROLE_MANAGER') or hasRole('ROLE_ADMIN')")
	@GetMapping("/data")
	public @ResponseBody String data() {
		return "데이터 정보";
	}
}
