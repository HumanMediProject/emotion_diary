package stepup.emotiondiary.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import stepup.emotiondiary.dto.CalendarDTO;

@Mapper
public interface CalendarMapper {

	List<CalendarDTO> getCalendar(String user_id);

	
	
}
