package stepup.emotiondiary.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import stepup.emotiondiary.dto.UserDTO;
import stepup.emotiondiary.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    
    // 회원가입
    @PostMapping("/register")
    public String registerUser(@ModelAttribute UserDTO userDto, RedirectAttributes redirectAttributes) {
    	int result = userService.insertUser(userDto);
    	if (result > 0) {
    		return "Login";            
    	} else {
    		redirectAttributes.addFlashAttribute("error", "회원가입에 실패했습니다.");
    		return "Register";
    	}
    }

    // 로그인
    @PostMapping("/login")
    public String loginUser(@ModelAttribute UserDTO userDto, HttpSession session, RedirectAttributes redirectAttributes) {
        UserDTO result = userService.selectUser(userDto);
        if (result != null) {
        	// 로그인 성공시 세션에 저장
        	session.setAttribute("email", result.getEmail());
        	session.setAttribute("hashedPassword", result.getHashed_password());
        	session.setAttribute("userId", result.getUser_id());
            return "redirect:/Main";            
        } else {
            redirectAttributes.addFlashAttribute("error", "이메일 또는 비밀번호가 잘못되었습니다.");
            return "redirect:/Login";
        }
    }
    
    // 이메일 중복확인
    @PostMapping("/checkEmail")
    public ResponseEntity<String> checkEmail(@RequestParam("email") String email) {

        if (email.trim().isEmpty()) {
            return new ResponseEntity<>("false", HttpStatus.OK);  // String 타입으로 반환
        }

        boolean isDuplicate = userService.checkEmail(email);
        return new ResponseEntity<>(isDuplicate ? "true" : "false", HttpStatus.OK);  // true/false를 String으로 반환
    }
    	
    // 유저 정보 조회
    @GetMapping("/userInfo")
    public String getUserInfo(HttpSession session, Model model) {
        // 세션에서 이메일과 비밀번호를 가져오기
        String email = (String) session.getAttribute("email");
        String hashedPassword = (String) session.getAttribute("hashedPassword");
        
        UserDTO userDto = new UserDTO();
        userDto.setEmail(email);
        userDto.setHashed_password(hashedPassword);        
 
        // 서비스에서 DAO 호출 (세션에서 값을 넘겨줌)
        UserDTO result = userService.getUserInfo(userDto);
        if (result != null) {
            model.addAttribute("userInfo", result);  // 사용자 정보 반환
            return "/User-Info"; // 사용자 정보 페이지
        } else {
            // 정보가 없으면 로그인 페이지로 리다이렉트
            return "redirect:/user/login";
        }
    }

    // ID 찾기
    @GetMapping("/idFinder")
    public String idFinder(@RequestParam("name") String name, 
                           Model model, 
                           RedirectAttributes redirectAttributes) {
        UserDTO userDto = new UserDTO();
        userDto.setName(name);

        int userId = userService.selectId(userDto);

        if (userId > 0) {
            model.addAttribute("userId", userId);
            return "User-Id-Result";
        } else {
            redirectAttributes.addFlashAttribute("error", "아이디를 찾을 수 없습니다.");
            return "redirect:/user/ID-Finder";
        }
    }

    // 비밀번호 찾기
    @PostMapping("/passwordFinder")
    public String passwordFinder(@ModelAttribute UserDTO userDto, RedirectAttributes redirectAttributes) {
        int result = userService.updatePassword(userDto);
        if (result > 0) {
            return "Password-Reset";
        } else {
            redirectAttributes.addFlashAttribute("error", "비밀번호 변경에 실패했습니다.");
            return "redirect:/user/Password-Finder";
        }
    }
    
    // 유저 탈퇴
    @GetMapping("/delete")
    public String deleteUser(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
    	String email = (String)session.getAttribute("email");
    	
    	if (email == null) {
    		redirectAttributes.addFlashAttribute("error", "로그인 후 이용해주세요.");
    		return "redirect:/Login";
    	}
    	
    	boolean isDeleted = userService.deleteUser(email);
    	
        if (isDeleted) {
            session.invalidate(); // 세션 종료
            redirectAttributes.addFlashAttribute("message", "탈퇴가 완료되었습니다."); 
            return "redirect:/Login"; // 메인 페이지로 리다이렉트
        } else {
            model.addAttribute("error", "탈퇴에 실패하였습니다.");
            return "user-info"; // 유저 정보 페이지로 돌아가기
        }
    }
}
