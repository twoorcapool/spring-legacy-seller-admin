package org.adminsystem.product.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.adminsystem.common.dto.PageRequestDTO;
import org.adminsystem.common.dto.PageResponseDTO;
import org.adminsystem.product.dto.CategoryDTO;
import org.adminsystem.product.dto.ProductDTO;
import org.adminsystem.product.dto.ProductImageDTO;
import org.adminsystem.product.mapper.ProductMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.coobird.thumbnailator.Thumbnails;

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

	@Override
	public Long add(ProductDTO productDTO) {
		
		//상품등록
		productMapper.insertProduct(productDTO);
		
		Long pno = productDTO.getPno();
		
		//대표 이미지 처리
		MultipartFile[] files = productDTO.getFiles();
		
		for(int i = 0; i < files.length; i++) {
			
			MultipartFile file = files[i];
			
			//파일명 생성
			String originalName = file.getOriginalFilename();
	        String saveFileName = UUID.randomUUID().toString() + "_" + originalName;
	        
	        //파일 저장
	        File target = new File("/opt/homebrew/var/www/adminSystem/uploads/"+saveFileName);
	        
	        try {
				file.transferTo(target);
	
			} catch (IOException e) {
				e.printStackTrace();
			}
	        
	        //썸네일 파일
	        if (i == 0) {
	            String thumbnailFileName = "s_" + saveFileName;

	            File thumbnailTarget = new File(
	                    "/opt/homebrew/var/www/adminSystem/uploads/" + thumbnailFileName
	            );

	            try {
					Thumbnails.of(target)
					        .size(150, 150)
					        .toFile(thumbnailTarget);
				} catch (IOException e) {
					e.printStackTrace();
				}
	        }
	        
	        
	        ProductImageDTO imageDTO = ProductImageDTO.builder()
	        		.pno(pno)
	        		.filename(saveFileName)
	        		.imageType("THUMBNAIL")
	        		.ord(i)
	        		.fileUrl("/adminSystem/uploads/" + saveFileName)
	                .build();
			
	        productMapper.insertProductImage(imageDTO);
			
		}
		
		return pno;
	}
	
	
}
