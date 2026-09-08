package org.adminsystem.dashboard.controller;

import org.adminsystem.product.controller.ProductController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/dashboard/")
@Log4j2
@RequiredArgsConstructor
public class DashboardController {
	
	@GetMapping("main")
	public void main() {
		log.info("dashboard");
	}

}
