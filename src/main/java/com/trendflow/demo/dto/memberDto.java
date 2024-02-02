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
	@Size(min = 5, max = 20, message="5-20 사이에 글자")
	private String id;

	/*
	 * @NotBlank(message = "이름을 입력해주세요.")
	 * 
	 * @Pattern(regexp = "^[ㄱ-ㅎ가-힣a-z0-9-_]{2,10}$", message =
	 * "이름은 최대 10자까지 입력 가능합니다.") private String user_name;
	 * 
	 * @NotBlank(message = "이메일은 필수 입력 값입니다.")
	 * 
	 * @Email(message = "이메일 형식에 맞지 않습니다.") private String email;
	 * 
	 * @NotBlank(message = "비밀번호는 필수 입력 값입니다.")
	 * 
	 * @Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}", message
	 * = "비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8자 ~ 20자의 비밀번호여야 합니다.") private
	 * String password;
	 * 
	 * private String cell_phone;
	 * 
	 * private String role;
	 * 
	 * @CreationTimestamp private Timestamp createDate;
	 */

	@Builder
	public memberDto(String id, String user_name, String email, String password, String cell_phobne,
			Timestamp createDate) {
		this.id = id;
		/*
		 * this.user_name = user_name; this.email = email; this.password = password;
		 * this.cell_phone = cell_phobne; this.createDate = createDate;
		 */
	}
}
