package org.adminsystem.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/product/")
@Log4j2
@RequiredArgsConstructor
public class ProductController {

		@GetMapping("list")
		public void list() {
			log.info("product list");
		}
}
