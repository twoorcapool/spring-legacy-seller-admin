package org.adminsystem.product.dto;

import java.time.LocalDateTime;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductDTO {

    private Long pno;
    private String pname;
    private String pdesc;
    private int price;
    private Long categoryId;
    private Long sellerId;
    private int stock;
    private String status;
    private LocalDateTime regDate;
    private LocalDateTime modDate;
    
    private String categoryName;
    private String sellerName;
    
    //업로드 파일
    private MultipartFile[] files;
    
}
