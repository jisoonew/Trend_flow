package com.trendflow.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.trendflow.demo.entity.Cosmetic;

public interface CosmeticRepository extends JpaRepository<Cosmetic, Integer> {

}
