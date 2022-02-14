package com.human.team;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {   // 페이징에 필요한 클래스
	private int pageNum; // 페이지
	private int amount;  // 한번에 보여줄 게시물 수
	
	private String type;  // 검색종류
	private String keyword; // 검색어
	
	public Criteria() {
		this(1, 10);
	}
	public Criteria(int pageNum, int amount) { 
		this.pageNum = pageNum; this.amount = amount; 
	}
	public String[] getTypeArr() { 
		return type == null ? new String[] {} : type.split(""); 
	}
//	public String getListLink() { 
//		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("").queryParam("pageNum", this.pageNum) .queryParam("amount", this.amount).queryParam("type", this.type).queryParam("keyword", this.keyword);
//	}

	
	
	
}
