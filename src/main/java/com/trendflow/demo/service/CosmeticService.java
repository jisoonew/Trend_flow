package com.trendflow.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.trendflow.demo.dto.CosmeticDto;
import com.trendflow.demo.entity.Cosmetic;
import com.trendflow.demo.repository.CosmeticRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CosmeticService {
	private final CosmeticRepository cosmeticRepository;
	
	@Transactional //하나의 트랜잭션 내에서 실행됩니다. 이는 메서드 실행 도중 예외가 발생하면 해당 트랜잭션을 롤백하여 데이터 일관성을 유지하는 데 도움을 준다.
	public List<CosmeticDto> findAll() {
		List<Cosmetic> cosmeticList = cosmeticRepository.findAll(); // 모든 코스메틱 정보를 데이터베이스에서 조회
		
		List<CosmeticDto> cosmeticDtoList = new ArrayList<>();
		
		for(Cosmetic cosmetic: cosmeticList) {
			CosmeticDto cosmeticDto = CosmeticDto.builder()
					.cos_id(cosmetic.getCos_id())
					.cos_name(cosmetic.getCos_name())
					.cos_price(cosmetic.getCos_price())
					.cos_volume(cosmetic.getCos_volume())
					.cos_delivery_data(cosmetic.getCos_delivery_data())
					.cos_description(cosmetic.getCos_description())
					.brand_id(cosmetic.getBrand_id())
					.category_id(cosmetic.getCategory_id())
					.build();
			cosmeticDtoList.add(cosmeticDto);
		}
		return cosmeticDtoList;
	}

//	기초 화장품 데이터
    public List<Cosmetic> findCosmeticsByCategoryId(Integer categoryId) {
        return cosmeticRepository.findByCategoryId(categoryId);
    }
    
}
