package com.trendflow.demo.dto;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.CreationTimestamp;

import com.trendflow.demo.entity.Cosmetic;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
public class CosmeticDto {

	private Integer cos_id;

	private String cos_name;

	private Integer cos_price;

	private String cos_volume;
	
	private String cos_delivery_data;

	private String cos_description;

	private Integer brand_id;
	
	private Integer category_id;

	@Builder
	public CosmeticDto(Integer cos_id, String cos_name, Integer cos_price, String cos_volume, String cos_delivery_data, String cos_description,
			Integer brand_id, Integer category_id) {
		this.cos_id = cos_id;
		this.cos_name = cos_name; 
		this.cos_price = cos_price; 
		this.cos_volume = cos_volume;
		this.cos_delivery_data = cos_delivery_data; 
		this.cos_description = cos_description;
		this.brand_id = brand_id;
		this.category_id = category_id;
	}
}
