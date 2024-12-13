package stepup.emotiondiary.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import stepup.emotiondiary.dto.DiaryDTO;
import stepup.emotiondiary.service.DiaryService;

@Controller
@RequestMapping("/diary")
public class DiaryController {

    @Autowired
    private DiaryService diaryService;

    // 1. 일기 생성
    @PostMapping("/create")
    public String insertDiary(@ModelAttribute DiaryDTO diaryDto, RedirectAttributes redirectAttributes, HttpSession session) {
        if (diaryDto.getTitle() == null || diaryDto.getContent() == null) {
            redirectAttributes.addFlashAttribute("error", "모든 값을 입력해주세요");
            return "redirect:/Editor";
        }
        Integer userId = (Integer) session.getAttribute("userId");
        System.out.println("Session userId: " + userId);
        if (userId == null) {
        	redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
        	return "redirect:/Login";
        }
        
        diaryDto.setOwner(userId);
        System.out.println("Diary owner before insert: " + diaryDto.getOwner());
        
        int result = diaryService.insertDiary(diaryDto);
        if (result > 0) {
            return "redirect:/Today-Statistics";
        } else {
            redirectAttributes.addFlashAttribute("error", "일기 등록에 실패했습니다");
            return "redirect:/Editor";
        }
    }

    // 2. 일기 조회
    @GetMapping("/getDiary")
    public String getDiaries(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        // 세션에서 owner (userId) 가져오기
        Integer owner = (Integer) session.getAttribute("userId");
        if (owner == null) {
            model.addAttribute("", "로그인이 필요합니다.");
            return "redirect:/Login";
        }

        // 다이어리 목록 조회
        List<DiaryDTO> diaries = diaryService.getDiaryList(owner);
        
        // diaries가 비어 있지 않다면, 그 내용을 출력
        if (diaries != null && !diaries.isEmpty()) {
            model.addAttribute("diaries", diaries);
            System.out.println("diaries: " + diaries);
            return "DiaryList"; // 다이어리 목록 JSP 페이지
        } else {
            // 쿼리 파라미터로 메시지 전달
            redirectAttributes.addFlashAttribute("error", "등록된 일지가 없습니다.");
            return "redirect:/Main"; // 메인 페이지로 리디렉션
        }
    }

    // 3. 일기 수정
    @PostMapping("/update")
    public String updateDiary(@ModelAttribute DiaryDTO diaryDto, RedirectAttributes redirectAttributes) {
        if (diaryDto.getTitle() == null || diaryDto.getContent() == null) {
            redirectAttributes.addFlashAttribute("error", "모든 값을 입력해주세요");
            return "redirect:/Editor";
        }
        int result = diaryService.updateDiary(diaryDto);
        if (result > 0) {
            redirectAttributes.addFlashAttribute("success", "일기가 성공적으로 수정되었습니다");
            return "redirect:/Today-Statistics";
        } else {
            redirectAttributes.addFlashAttribute("error", "일기 수정에 실패했습니다");
            return "redirect:/Editor";
        }
    }

    // 4. 일기 삭제
    @PostMapping("/delete/{id}")
    public String deleteDiary(@PathVariable("id") int diaryId, RedirectAttributes redirectAttributes) {
        int result = diaryService.deleteDiary(diaryId);
        if (result > 0) {
            redirectAttributes.addFlashAttribute("success", "일기가 성공적으로 삭제되었습니다");
        } else {
            redirectAttributes.addFlashAttribute("error", "일기 삭제에 실패했습니다");
        }
        return "redirect:/Today-Statistics";
    }

}
