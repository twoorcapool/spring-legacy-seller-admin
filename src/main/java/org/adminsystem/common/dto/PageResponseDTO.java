package org.adminsystem.common.dto;

import java.util.List;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageResponseDTO<E> {
	
	private int page;
	private int size;
	private int total;
	private int start; //시작 페이지번호
	private int end; //끝 페이지번호
	private boolean prev;
	private boolean next;
	private List<E> dtoList;
	
	@Builder(builderMethodName = "withAll")
	public PageResponseDTO(PageRequestDTO pageRequestDTO, List<E> dtoList, int total) {
		
		this.page = pageRequestDTO.getPage();
		this.size = pageRequestDTO.getSize();
		this.total = total;
		this.dtoList = dtoList;
		
		this.end = (int) (Math.ceil(this.page / 10.0)) * 10; //올림
		this.start = this.end - 9;
		int last = (int)(Math.ceil((total/(double)size))); //전체 마지막 페이지번호
		this.end = end > last ? last : end;
		this.prev = this.start > 1 ;
		this.next = total > this.end * this.size;
		
	}

}
