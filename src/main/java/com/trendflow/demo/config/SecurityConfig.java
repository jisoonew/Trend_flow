package com.trendflow.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		http.authorizeRequests()
			.antMatchers("/Trend_flow/**").permitAll() // 권한 없이도 접근 가능
			.antMatchers("/user/**").authenticated()
			.antMatchers("/manager/**").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_MANAGER')")
			.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
			.anyRequest().permitAll()
			.and()
			.formLogin()
			.loginPage("/login")
			.usernameParameter("userId") // 로그인 jsp의 name과 PrincipalDetailsService의 loadUserByUsername의 매개변수 일치하기 위함.
			.loginProcessingUrl("/login")
			.defaultSuccessUrl("/Trend_flow")
			.and()
			.logout()
			.logoutUrl("/logout") // 로그아웃 URL
			.logoutSuccessUrl("/Trend_flow") // 로그아웃 성공 시 해당 페이지로 이동
			.invalidateHttpSession(true); // 로그아웃 시 생성되었던 세션 삭제
	}

	@Bean
	public BCryptPasswordEncoder PasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
}