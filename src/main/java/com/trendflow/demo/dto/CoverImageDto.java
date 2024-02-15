package com.trendflow.demo.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
public class CoverImageDto {
	private Integer imgId;

	private Integer cosId;

	private String imgPath;
	
	@Builder
	public CoverImageDto(Integer imgId, Integer cosId, String imgPath) {
		this.imgId = imgId;
		this.cosId = cosId;
		this.imgPath = imgPath;
	}
}
