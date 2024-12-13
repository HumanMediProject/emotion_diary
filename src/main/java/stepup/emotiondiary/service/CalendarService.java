package stepup.emotiondiary.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stepup.emotiondiary.dto.CalendarDTO;
import stepup.emotiondiary.mapper.CalendarMapper;

@Service
public class CalendarService {
	
	@Autowired
	CalendarMapper mapper;
	
	public List<CalendarDTO> getCalendar(String user_id) {
		List<CalendarDTO> list = new ArrayList<>();
		list = mapper.getCalendar(user_id); 
		return list;
	}

}
