package com.spring.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class BookPageVO {
	//페이지 나누기와 관련된 정보를 담고 있는 객체
	private int startPage;
	private int endPage;
	private int nowPage;
	private boolean prev;
	private boolean next;
	//전체 게시물 수
	private int total;
	//현재페이지 번호, 페이지당 보여줄 게시물 수
	private BookCriteria cri;
	
	public BookPageVO(BookCriteria cri,int total) {
		this.total=total;
		this.cri=cri;
		// 계산에 의한 시작페이지와 끝나는 페이지
		this.endPage=(int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.startPage=this.endPage-9;
		this.nowPage=cri.getPageNum();
		
		//끝나는 페이지는 10개가 안될 수 도 있기 때문에 다시 한번 계산 필요
		int realEnd=(int)(Math.ceil((total/1.0) / cri.getAmount()));
		if(realEnd<this.endPage) {
			this.endPage=realEnd;
		}		
		this.prev=this.startPage>1;
		this.next=this.endPage<realEnd;
	}
}











