package stepup.emotiondiary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import stepup.emotiondiary.service.UserService;

@Controller
public class HomeController {
	
	@Autowired
	UserService service;
	
	@GetMapping(value="")
	public String test(Model model) {
		
		model.addAttribute("map", service.getTest());
		
		
		return "Login";
	}
}