package org.adminsystem.common.dto;

import lombok.Getter;
import lombok.ToString;

@Getter
public class PageRequestDTO {
	
	private int page;
	private int size;
	private String type; //검색조건
	private String keyword; //검색키워드
	
	//기본값 지정
	public PageRequestDTO(){
		this.page = 1;
		this.size = 10;
	}
	
	//limit
	public int getLimit() { //size와 동일.
		return this.size;
	}
	
	//offset
	public int getOffset() { //skip
		return (page-1)*size;
	}
	
	//page 유효성검증
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		if(page > 10000) {
			this.page = 100;
			return;
		}
		this.page = page;
	}
	
	//size 유효성검증
	public void setSize(int size) {
	        
		 if (size < 10) {
	            this.size = 10;
	            return;
	        }
	        if (size > 100) {
	            this.size = 100;
	            return;
	        }
	        this.size = size;
	    }
	
	
}
