package com.spring.domain;

import lombok.Data;

@Data
public class ChangeVO {

	private String userid;
	private String current_password;
	private String new_password;
	private String confirm_password;
	
}

