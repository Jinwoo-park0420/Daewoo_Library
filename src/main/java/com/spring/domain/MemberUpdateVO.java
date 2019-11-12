package com.spring.domain;

import lombok.Data;

@Data
public class MemberUpdateVO {
	
	private String userid;
	private String name;
	private String email;
	private String phone_number;

}
