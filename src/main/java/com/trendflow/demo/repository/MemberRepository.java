package com.trendflow.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.trendflow.demo.entity.Member;

public interface MemberRepository extends JpaRepository<Member, String> {
    public Member findByUserId(String userId); // 메서드 이름 변경
}
