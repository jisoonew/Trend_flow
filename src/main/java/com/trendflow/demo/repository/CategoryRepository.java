package com.trendflow.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.trendflow.demo.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
	@Query("SELECT ci.imgPath FROM CoverImage ci")
    List<String> findAllBasicProduct();
}
