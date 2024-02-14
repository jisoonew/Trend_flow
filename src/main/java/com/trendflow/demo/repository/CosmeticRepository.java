package com.trendflow.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.trendflow.demo.entity.Cosmetic;

public interface CosmeticRepository extends JpaRepository<Cosmetic, Integer> {

}
