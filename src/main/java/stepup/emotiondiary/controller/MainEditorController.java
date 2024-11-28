package stepup.emotiondiary.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainEditorController {

	@RequestMapping(value="/Main")
	public ModelAndView main(HttpServletResponse response) throws IOException{
		return new ModelAndView("Main");
	}
	
	@RequestMapping(value="/Editor")
	public ModelAndView editor(HttpServletResponse response) throws IOException{
		return new ModelAndView("Editor");
	}
	
	@RequestMapping(value="/Editor-Focused")
	public ModelAndView editorFocused(HttpServletResponse response) throws IOException{
		return new ModelAndView("Editor");
	}
	
	
}
