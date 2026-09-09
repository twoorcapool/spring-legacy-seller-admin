package org.adminsystem.product.service;

import org.adminsystem.common.dto.PageRequestDTO;
import org.adminsystem.common.dto.PageResponseDTO;
import org.adminsystem.product.dto.ProductDTO;

public interface ProductService {
	
	PageResponseDTO<ProductDTO> list(PageRequestDTO pageRequestDTO);
}
