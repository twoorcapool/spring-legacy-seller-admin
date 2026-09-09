package org.adminsystem.product;

import java.util.List;

import org.adminsystem.common.dto.PageRequestDTO;
import org.adminsystem.product.dto.ProductDTO;
import org.adminsystem.product.mapper.ProductMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import lombok.extern.log4j.Log4j2;

@ExtendWith(SpringExtension.class)
@Log4j2
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductMapperTests {

	@Autowired(required = false)
    ProductMapper productMapper;
	
	@Test
	public void testSelectPage() {
		PageRequestDTO page = new PageRequestDTO();
		page.setPage(2);
		page.setSize(3);
		List<ProductDTO> list = productMapper.selectPage(page);
		list.forEach( p -> log.info(p));
	}
	
	@Test
	public void testSelectOne() {
		ProductDTO product = productMapper.selectOne(1);
		log.info(product);
	}
}
