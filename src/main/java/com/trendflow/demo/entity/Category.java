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
@Table(name="CATEGORY")
public class Category {
	@Id
	@Column(name = "cate_id", unique = true)
	/* @GeneratedValue(strategy = GenerationType.IDENTITY) */
	private Integer cate_id;
	
	@Column(name = "cate_name")
	private String cate_name;
}
