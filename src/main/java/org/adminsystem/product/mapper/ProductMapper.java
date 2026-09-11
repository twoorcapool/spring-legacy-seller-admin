package org.adminsystem.product.mapper;

import java.util.List;

import org.adminsystem.common.dto.PageRequestDTO;
import org.adminsystem.product.dto.CategoryDTO;
import org.adminsystem.product.dto.ProductDTO;

public interface ProductMapper {
	
	ProductDTO selectOne(Integer pno);
	
	List<ProductDTO> selectPage(PageRequestDTO page);
	
	int selectCount(PageRequestDTO page);
	
	List<CategoryDTO> selectCategories();
	
	int insertProduct(ProductDTO productDTO); //등록된 행 개수를 반환.

}
