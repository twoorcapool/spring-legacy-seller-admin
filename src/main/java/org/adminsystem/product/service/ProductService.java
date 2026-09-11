package org.adminsystem.product.service;

import java.util.List;

import org.adminsystem.common.dto.PageRequestDTO;
import org.adminsystem.common.dto.PageResponseDTO;
import org.adminsystem.product.dto.CategoryDTO;
import org.adminsystem.product.dto.ProductDTO;

public interface ProductService {
	
	PageResponseDTO<ProductDTO> list(PageRequestDTO pageRequestDTO);
	
	List<CategoryDTO> getCategories();
	
	ProductDTO getProductOne(int pno);
	
	Long add(ProductDTO productDTO); //등록된 상품 번호 반환. 
	
}
