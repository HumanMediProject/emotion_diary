package stepup.emotiondiary.dao;

import java.util.List;

import stepup.emotiondiary.dto.AuthDTO;
import stepup.emotiondiary.dto.GenderDTO;


public interface AdminDao {

	List<GenderDTO> getGenderTable();

	List<AuthDTO> getAuthTable();
	
	
}
