package stepup.emotiondiary.dto;

import org.springframework.stereotype.Component;

@Component
public class UserDTO {
	
	private int user_id;
	private String email;
	private String name;
	private int gender;
	private String diary_passcode;
	private String hashed_password;
	private int authentication_provider;
	
	
	public String getDiary_passcode() {
		return diary_passcode;
	}
	public void setDiary_passcode(String diary_passcode) {
		this.diary_passcode = diary_passcode;
	}
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getHashed_password() {
		return hashed_password;
	}
	public void setHashed_password(String hashed_password) {
		this.hashed_password = hashed_password;
	}
	public int getAuthentication_provider() {
		return authentication_provider;
	}
	public void setAuthentication_provider(int authentication_provider) {
		this.authentication_provider = authentication_provider;
	}
	
	

}
