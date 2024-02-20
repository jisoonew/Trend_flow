package com.trendflow.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name="cover_image")
public class CoverImage {
	@Id
	@Column(name = "img_id", unique = true)
	private Integer imgId;
	
	@Column(name = "cos_id")
	private Integer cosId;
	
	private String imgPath;
	
	@Override
	public String toString() {
	    return "CoverImage{" +
	            "imgId=" + imgId +
	            ", cosId=" + cosId +
	            ", imgPath=" + imgPath +
	            "}";
	}
}
