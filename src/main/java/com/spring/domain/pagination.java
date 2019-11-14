package com.spring.domain;

import lombok.Data;

@Data
public class pagination {

	private int pagesize=10;
	private int rangesize=10;
	private int curpage=1;
	private int currange=1;
	private int listcnt;
	private int pagecnt;
	private int rangecnt;
	private int startpage=1;
	private int endpage=1;
	private int startindex=0;
	private int prevpage;
	private int nextpage;
}
