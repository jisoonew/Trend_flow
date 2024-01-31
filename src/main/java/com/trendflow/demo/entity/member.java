package com.trendflow.demo.entity;

import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="MEMBER")
@Data
public class member {

	@Id
	private String id;

	private String user_name;
	
	private String email;

	private String password;
	
	private String cell_phone;

	/* private String role; */

	 @Column(name = "createdate")
	 @CreationTimestamp 
	 private Timestamp createDate;
	 
}
