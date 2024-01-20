package com.example.demo.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class Test {

	@RequestMapping(value="/")
	public String test() {
		return "login";
	}
}
