package org.adminsystem.product.service;

import java.util.List;

import org.adminsystem.common.dto.PageRequestDTO;
import org.adminsystem.common.dto.PageResponseDTO;
import org.adminsystem.product.dto.CategoryDTO;
import org.adminsystem.product.dto.ProductDTO;
import org.adminsystem.product.mapper.ProductMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Service
@RequiredArgsConstructor
@Log4j2
@Transactional
public class ProductServiceImpl implements ProductService{
	
	private final ProductMapper productMapper;

	@Override
	public PageResponseDTO<ProductDTO> list(PageRequestDTO pageRequestDTO) {
		
		List<ProductDTO> dtoList = productMapper.selectPage(pageRequestDTO);
		int total = productMapper.selectCount(pageRequestDTO);
		
		return PageResponseDTO.<ProductDTO>withAll()
				.dtoList(dtoList)
				.total(total)
				.pageRequestDTO(pageRequestDTO)
				.build();
	}
	
	@Override
	public List<CategoryDTO> getCategories() {
	    return productMapper.selectCategories();
	}

	@Override
	public ProductDTO getProductOne(int pno) {
		return productMapper.selectOne(pno);
	}
	
	
}
