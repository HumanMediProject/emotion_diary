package stepup.emotiondiary.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stepup.emotiondiary.dao.AdminDao;
import stepup.emotiondiary.dto.AuthDTO;
import stepup.emotiondiary.dto.GenderDTO;

@Service
public class AdminService {
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	GenderDTO genderDTO;
	
	@Autowired
	AuthDTO authDTO;
	
	public List<GenderDTO> getGenderTable(){
		
		return adminDao.getGenderTable();
		
	}
	
	public List<AuthDTO> getAuthProviderTable(){
		return adminDao.getAuthTable();
	}
}
