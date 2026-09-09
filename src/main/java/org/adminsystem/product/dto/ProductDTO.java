package org.adminsystem.product.dto;

import java.time.LocalDateTime;

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
    
}
