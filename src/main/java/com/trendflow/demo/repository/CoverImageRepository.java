package com.trendflow.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.trendflow.demo.entity.CoverImage;

public interface CoverImageRepository extends JpaRepository<CoverImage, Integer> {
	@Query("SELECT ci.imgPath FROM CoverImage ci")
    List<String> findAllImagePaths();
}
