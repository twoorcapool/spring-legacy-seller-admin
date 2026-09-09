package org.adminsystem.product.controller;

import org.adminsystem.common.dto.PageRequestDTO;
import org.adminsystem.product.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/product/")
@Log4j2
@RequiredArgsConstructor
public class ProductController {
	
	private final ProductService productService;

	@GetMapping("list")
	public void list(
			@ModelAttribute("requestDTO") PageRequestDTO requestDTO,
			Model model) {
		model.addAttribute("responseDTO", productService.list(requestDTO));
	}
}
