package org.adminsystem.common.dto;

import org.adminsystem.product.dto.ProductSearchDTO;

import lombok.Getter;

@Getter
public class PageRequestDTO {
	
	private int page;
	private int size;
	private ProductSearchDTO search;
	
	//조회용 링크
	public String getPageLink() {
	    
		StringBuilder builder = new StringBuilder();

	    builder.append("page=").append(page);
	    builder.append("&size=").append(size);

	    if (search != null) {
	        builder.append(search.getLink());
	    }

	    return builder.toString();
	}
	
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
	
	public void setSearch(ProductSearchDTO searchDTO) {
	    this.search = searchDTO;
	}
	

	
	
}
