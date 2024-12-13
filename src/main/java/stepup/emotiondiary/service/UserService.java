package stepup.emotiondiary.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stepup.emotiondiary.dao.UserDao;
import stepup.emotiondiary.dto.UserDTO;

@Service
public class UserService {
    @Autowired
    private UserDao userDao;
    
    private final SqlSession sqlSession;
    
    @Autowired
    public UserService(SqlSession sqlSession) {
    	this.sqlSession = sqlSession;
    }
    
    // 테스트용
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
    

    // 회원가입
    public int insertUser(UserDTO userDto) {
        return userDao.insertUser(userDto);
    }
    
    // 중복 확인
    public boolean checkEmail(String email) {
        Integer count = sqlSession.selectOne("checkEmail", email); // 직접 SQL 실행

        // 이메일 중복 확인
        return count != null && count > 0; // 중복이 있으면 true, 없으면 false
    }

    // 로그인
    public UserDTO selectUser(UserDTO userDto) {
        return userDao.selectUser(userDto);
    }

    // 아이디 찾기
    public int selectId(UserDTO userDto) {
        return userDao.selectId(userDto);
    }	

    // 비밀번호 재설정
    public int updatePassword(UserDTO userDto) {
        return userDao.updatePassword(userDto);
    }

    // 유저 삭제
    public boolean deleteUser(String email) {
        int result = userDao.deleteUser(email);
    	return result > 0 ;
    }

    // 유저 정보 전체 조회
	public UserDTO getUserInfo(UserDTO userDto) {
		return userDao.getUserInfo(userDto);
	}
}

