package stepup.emotiondiary.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	@RequestMapping(value="/Login")
	public ModelAndView login(HttpServletResponse response) throws IOException{
		return new ModelAndView("Login");
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
}
