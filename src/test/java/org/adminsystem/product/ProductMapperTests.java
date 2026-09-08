package org.adminsystem.product;

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
    ProductMapper mapper;
	
	@Test
	public void testTime() {
		log.info(mapper.getTime());
	}
}
