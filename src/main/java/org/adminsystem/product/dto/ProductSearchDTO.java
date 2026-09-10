package org.adminsystem.product.dto;

import java.nio.charset.StandardCharsets;
import java.util.List;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class ProductSearchDTO {

	private String keyword;
	private String pname;
	private List<Long> categoryId;
	private List<String> status;
	
	//페이지네이션용 링크
	public String getLink(){
		
		UriComponentsBuilder builder = UriComponentsBuilder.newInstance();		

        if (keyword != null && !keyword.trim().isEmpty()) {
            builder.queryParam("keyword", keyword);
        }
        if (categoryId != null && !categoryId.isEmpty()) {
            builder.queryParam("categoryId", categoryId);
        }
        if (status != null && !status.isEmpty()) {
            builder.queryParam("status", status);
        }
     
        String queryString = builder.build().encode(StandardCharsets.UTF_8).toUriString();
        
        return queryString.replace("?", "&"); //맨 앞의 '?'를 '&'로 교체
        
	}
	
}
