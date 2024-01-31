package com.trendflow.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.trendflow.demo.entity.member;

public interface MemberRepository extends JpaRepository<member, String> {

}
