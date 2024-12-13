package stepup.emotiondiary.dto;

import org.springframework.stereotype.Component;

@Component
public class DiaryDTO {

	private int diary_id;
	private int owner;
	private String title;
	private String time;
	private int emotion_type;
	private String content;
	
	public int getDiary_id() {
		return diary_id;
	}
	public void setDiary_id(int diary_id) {
		this.diary_id = diary_id;
	}
	public int getOwner() {
		return owner;
	}
	public void setOwner(int owner) {
		this.owner = owner;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getEmotion_type() {
		return emotion_type;
	}
	public void setEmotion_type(int emotion_type) {
		this.emotion_type = emotion_type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
	    return "DiaryDTO [title=" + title + ", content=" + content + ", time=" + time + ", emotion_type=" + emotion_type + "]";
	}
	
	

}