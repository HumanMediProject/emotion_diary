package stepup.emotiondiary.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stepup.emotiondiary.dto.UserDTO;
import stepup.emotiondiary.mapper.UserMapper;

@Service
public class UserService {
	
	@Autowired
	UserMapper mapper;
	
	public int getTest() {
		int result = mapper.debug();
		
		
		return result;
	}

	public int register(UserDTO userDto) {
		int res = mapper.register(userDto);
		return res;
	}
	

}
