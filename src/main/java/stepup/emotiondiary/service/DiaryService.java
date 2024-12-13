package stepup.emotiondiary.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stepup.emotiondiary.dao.DiaryDao;
import stepup.emotiondiary.dto.DiaryDTO;

@Service
public class DiaryService {

	@Autowired
	DiaryDao diaryDao;
	
	public int insertDiary(DiaryDTO diaryDto) {
		return diaryDao.insertDiary(diaryDto);
	}
	
	public List<DiaryDTO> getDiaryList(int owner) {
		return diaryDao.getDiaryList(owner);
	}
	
	public int updateDiary(DiaryDTO diaryDto) {
		return diaryDao.updateDiary(diaryDto);
	}
	
	public int deleteDiary(int diaryDto) {
		return diaryDao.deleteDiary(diaryDto);
	}
}
