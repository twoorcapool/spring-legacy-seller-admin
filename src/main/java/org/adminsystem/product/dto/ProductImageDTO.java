package org.adminsystem.product.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductImageDTO {
	
	private Long imageId;
    private Long pno;
    private String filename;
    private String fileUrl;
    private String imageType;
    private Integer ord;
    private LocalDateTime regDate;
    private LocalDateTime modDate;
    
    

}
