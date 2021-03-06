package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class Criteria {
//페이지와 글 개수를 넘기기 위한 클래스 pageNum과 amount 같이 전달
	private int pageNum; // 페이지 번호
	private int amount; // 한 페이지당 데이터 개수

	// 검색용
	private String type;
	private String keyword;

	public Criteria() {
		this(1, 10); // 기본 1페이지에 10개씩 담기
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// 검색조건을 배열로 만들기
	public String[] getTypeArr() {
	return type==null?new String[] {}:type.split("");
	// type : TCW => {'T','C','W'}
	}

}
