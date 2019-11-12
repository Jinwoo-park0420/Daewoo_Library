package com.spring.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardRepVO {
	
	private int bno;
	private int cno;
	private String writer;
	private Date regdate;
	private Date updatedate;
	private String reply;
	
}