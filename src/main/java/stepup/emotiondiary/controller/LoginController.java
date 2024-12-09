package stepup.emotiondiary.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@RequestMapping(value="/Login")
	public ModelAndView login(HttpServletResponse response) throws IOException{
		return new ModelAndView("Login");
	}
	@PostMapping(value="/LoginAction")
	public String loginAction(Model model, String userId, String userPw) {
		
		System.out.println(userId);
		System.out.println(userPw);
		return "Login";
	}
	@RequestMapping(value="/Register")
	public ModelAndView register(HttpServletResponse response) throws IOException{
		return new ModelAndView("Register");
	}
	
	@RequestMapping(value="/ID-Finder")
	public ModelAndView idFinder(HttpServletResponse response) throws IOException{
		return new ModelAndView("ID-Finder");
	}
	@RequestMapping(value="/Password-Finder")
	public ModelAndView passwordFinder(HttpServletResponse response) throws IOException{
		return new ModelAndView("Password-Finder");
	}
	@RequestMapping(value="/Password-Reset")
	public ModelAndView passwordReset(HttpServletResponse response) throws IOException{
		return new ModelAndView("Password-Reset");
	}
}
