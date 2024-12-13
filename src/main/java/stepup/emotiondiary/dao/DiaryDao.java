package stepup.emotiondiary.dao;

import java.util.List;

import stepup.emotiondiary.dto.DiaryDTO;

public interface DiaryDao {
	
	int insertDiary(DiaryDTO diaryDto);
	
	List<DiaryDTO> getDiaryList(int owner);
	
	int updateDiary(DiaryDTO diaryDto);

	int deleteDiary(int diaryDto);
	

}
