package com.trendflow.demo.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name="COSMETIC")
public class Cosmetic {
	@Id
	@Column(name = "cos_id", unique = true)
	/* @GeneratedValue(strategy = GenerationType.IDENTITY) */
	private Integer cos_id;

	@Column(name = "cos_name")
	private String cos_name;

	@Column(name = "cos_price")
	private Integer cos_price;

	@Column(name = "cos_volume")
	private String cos_volume;
	
	@Column(name = "cos_delivery_data")
	private String cos_delivery_data;

	@Column(name = "cos_description")
	private String cos_description;

	@Column(name = "brand_id")
	private Integer brand_id;
	
	@Column(name = "category_id")
	private Integer category_id;

	@ManyToOne
    @JoinColumn(name = "category_id", referencedColumnName = "cate_id", insertable = false, updatable = false)
    private Category category;
	
	@Override
	public String toString() {
	    return "Cosmetic{" +
	            "cos_id=" + cos_id +
	            ", cos_name=" + cos_name +
	            ", cos_price=" + cos_price +
	            ", cos_volume=" + cos_volume +
	            ", cos_delivery_data=" + cos_delivery_data +
	            ", cos_description= " + cos_description+
	            ", brand_id= "+brand_id+
	            ", category_id="+ category_id +
	            "}";
	}
}
