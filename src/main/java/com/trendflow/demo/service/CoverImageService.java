package com.trendflow.demo.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.trendflow.demo.dto.CoverImageDto;
import com.trendflow.demo.entity.CoverImage;
import com.trendflow.demo.repository.CoverImageRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CoverImageService {
	private final CoverImageRepository coverImgRepository;
	
	@Transactional
	public List<CoverImageDto> CoverImageAll() {
		List<CoverImage> coverList = coverImgRepository.findAll();
		List<CoverImageDto> coverDtoList = new ArrayList<>();
		for(CoverImage coverIamge: coverList) {
			CoverImageDto coverDto = CoverImageDto.builder()
					.imgId(coverIamge.getImgId())
					.cosId(coverIamge.getCosId())
					.imgPath(coverIamge.getImgPath())
					.build();
			coverDtoList.add(coverDto);
		}
		return coverDtoList;
	}
    
	@Transactional
    public List<String> findAllImagePaths() {
        return coverImgRepository.findAllImagePaths();
    }
	
	// 특정 카테고리의 커버 이미지 출력
    @Transactional
    public List<String> findCoverImg(Integer codId) {
    	return coverImgRepository.findCoverImg(codId);
    }
}
