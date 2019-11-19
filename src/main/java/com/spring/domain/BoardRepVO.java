package com.spring.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardRepVO {
	
	private int bno;
	private int cno;
	private String reply;
	private String replyer;
	private Date regdate;
	private Date updatedate;
	
}