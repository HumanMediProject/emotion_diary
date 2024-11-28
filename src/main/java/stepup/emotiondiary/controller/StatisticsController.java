package stepup.emotiondiary.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StatisticsController {
	
	@RequestMapping(value="/Today-Statistics")
	public ModelAndView getStatics(HttpServletResponse response) throws IOException{
		return new ModelAndView("Today-Statistics");
	}
	
	@RequestMapping(value="/ChartViewer")
	public ModelAndView getChart(HttpServletResponse response) throws IOException{
		return new ModelAndView("chartviewer");
	}
	
	@RequestMapping(value="/Month-Calendar")
	public ModelAndView monthCalendar(HttpServletResponse response) throws IOException{
		return new ModelAndView("Month-Calendar");
	}
	
	
	
}
