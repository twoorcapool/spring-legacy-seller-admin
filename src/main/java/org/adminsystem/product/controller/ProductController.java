package org.adminsystem.product.controller;

import org.adminsystem.common.dto.PageRequestDTO;
import org.adminsystem.product.dto.ProductDTO;
import org.adminsystem.product.dto.ProductSearchDTO;
import org.adminsystem.product.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
			@ModelAttribute("searchDTO") ProductSearchDTO searchDTO,
			Model model) {
	    requestDTO.setSearch(searchDTO); //파라미터 바인딩 전용 DTO
		model.addAttribute("responseDTO", productService.list(requestDTO));
		model.addAttribute("categories", productService.getCategories());
	}
	
	@GetMapping("read/{pno}")
	public String read(
			@PathVariable("pno") Integer pno,
			@ModelAttribute("requestDTO") PageRequestDTO requestDTO,
			@ModelAttribute("searchDTO") ProductSearchDTO searchDTO,
			Model model){
		requestDTO.setSearch(searchDTO); //파라미터 바인딩 전용 DTO
		model.addAttribute("product", productService.getProductOne(pno));
		return "product/read";
	}
	
	@GetMapping("add")
	public void addGET(Model model) {
		model.addAttribute("categories", productService.getCategories());
	}
	
	@PostMapping("add")
	public String addPOST(
			ProductDTO productDTO,
			RedirectAttributes rttr) {
		Long pno = productService.add(productDTO);
		rttr.addFlashAttribute("result", "상품 등록이 완료되었습니다.");
		return "redirect:/product/read/"+pno;
	}
}
