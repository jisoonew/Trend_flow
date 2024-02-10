package com.trendflow.demo.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.trendflow.demo.entity.Member;
import com.trendflow.demo.repository.MemberRepository;

@Service
public class PrincipalDetailsService implements UserDetailsService {

	@Autowired
	private MemberRepository memberRepository;
	
	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		Member memberEntity = memberRepository.findByUserId(userId);
		if(memberEntity != null) {
			return new PrincipalDetails(memberEntity);
		}
		return null;
	}

}
