package com.trendflow.demo.service;

import java.util.ArrayList;
import java.util.List;

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
	
	@Transactional
	public List<CosmeticDto> findAll() {
		List<Cosmetic> cosmeticList = cosmeticRepository.findAll();
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
}
