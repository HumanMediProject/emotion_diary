package stepup.emotiondiary.dao;


import stepup.emotiondiary.dto.UserDTO;

public interface UserDao {
	int insertUser(UserDTO userDto);
	
	UserDTO selectUser(UserDTO userDto);
	
	int checkEmail(String email);
	
	int selectId(UserDTO userDto);
	
	int updatePassword(UserDTO userDto);

	int deleteUser(String email);

	UserDTO getUserInfo(UserDTO userDto);

}
