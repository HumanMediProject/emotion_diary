package stepup.emotiondiary.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import stepup.emotiondiary.dto.CalendarDTO;
import stepup.emotiondiary.service.CalendarService;

@Controller
public class StatisticsController {
	
	
	@Autowired
	CalendarService service;
	
	@GetMapping(value="/Today-Statistics")
	public String getStatics(HttpServletResponse response) throws IOException{
		return "Today-Statistics";
	}
	
	@GetMapping(value="/ChartViewer")
	public String getChart(HttpServletResponse response) throws IOException{
		return "chartviewer";
	}
	
	@GetMapping(value="/Month-Calendar")
	public String monthCalendar(HttpServletResponse response, Model model/*, @RequestParam String user_id*/) throws IOException{
		
	    List<CalendarDTO> calendar = null;
	    try {
	    	String user_id= "duck2498";
	        calendar = service.getCalendar(user_id);
	        model.addAttribute("calendarList", calendar); // model을 사용하여 데이터를 뷰에 전달
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
       
		
		return "Month-Calendar";
	}
	
	
	
}
