package com.trendflow.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.trendflow.demo.entity.Member;

// Member 엔티티에 대한 데이터 베이스 엑세스 지원
public interface MemberRepository extends JpaRepository<Member, String> {
    public Member findByUserId(String userId);
}
