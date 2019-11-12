package com.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BookVO {
	private int bookno; //도서번호
	private String bookname; //도서명
	private String writer; //저자명
	private String genre; //도서 장르
	private String publisher; //출판사
	private int status; //도서상태
	private long isbn; //isbn
	private String bookImageURL; //도서 썸네일
}
