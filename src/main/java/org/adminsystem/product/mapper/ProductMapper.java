package org.adminsystem.product.mapper;

import java.util.List;
import org.adminsystem.common.dto.PageRequestDTO;
import org.adminsystem.product.dto.ProductDTO;

public interface ProductMapper {
	
	ProductDTO selectOne(Integer pno);
	
	List<ProductDTO> selectPage(PageRequestDTO page);
	
	int selectCount();
	
}
