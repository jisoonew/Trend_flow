package com.trendflow.demo.dto;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class memberDto {

	@NotBlank(message = "아이디를 입력해주세요.")
	@Pattern(regexp = "[a-zA-Z0-9]{5,20}", message = "아이디는 영문, 숫자만 가능하며 5 ~ 20자리까지 가능합니다.")
	private String userId;

	@NotBlank(message = "이름을 입력해주세요.")
	@Pattern(regexp = "^[ㄱ-ㅎ가-힣a-z0-9-_]{2,5}$", message = "이름은 최대 5자까지 입력 가능합니다.")
	private String userName;

	@NotBlank(message = "이메일은 필수 입력 값입니다.")
	private String email;

	@NotBlank(message = "비밀번호는 필수 입력 값입니다.")
	@Pattern(regexp = "(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}", message = "비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8자 ~ 20자의 비밀번호여야 합니다.")
	private String password;

	@NotBlank(message = "핸드폰 번호를 입력해주세요.")
	@Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$", message = "핸드폰 번호의 약식과 맞지 않습니다. xxx-xxxx-xxxx")
	private String cell_phone;

	private String role;

	@CreationTimestamp
	private Timestamp createDate;

	@Builder
	public memberDto(String userId, String userName, String email, String password, String cell_phobne, Timestamp createDate) {
		this.userId = userId;
		this.userName = userName; 
		this.email = email; 
		this.password = password;
		this.cell_phone = cell_phobne; 
		this.createDate = createDate;
		 
	}
}
