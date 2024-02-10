package com.trendflow.demo.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.trendflow.demo.entity.Member;
import com.trendflow.demo.repository.MemberRepository;

// 사용자의 정보를 가져오는 역할
@Service
public class PrincipalDetailsService implements UserDetailsService {

	@Autowired
	private MemberRepository memberRepository;
	
	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		// 전달된 사용자 아이디를 기반으로 데이터베이스에서 해당 사용자 정보를 조회한다.
		Member memberEntity = memberRepository.findByUserId(userId);
		// 조회된 정보가 있다면 PrincipalDetails로 반환
		if(memberEntity != null) {
			return new PrincipalDetails(memberEntity);
		}
		return null;
	}

}
