package stepup.emotiondiary.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import stepup.emotiondiary.dto.UserDTO;

@Mapper
public interface UserMapper {
	
	@Select("SELECT 12 + 12 AS 'HEROS'")
	public int debug();

	
	public int register(UserDTO userDto);
	
}
