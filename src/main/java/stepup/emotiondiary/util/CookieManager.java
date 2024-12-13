package stepup.emotiondiary.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {

	// 쿠키 생성
	public static void makeCookie(HttpServletResponse response
									, String name, String value, int maxAge){
		Cookie cookie = new Cookie(name, value);
		cookie.setPath("/");
		cookie.setMaxAge(maxAge);
		
		response.addCookie(cookie);
		
	}
	
	// 쿠키 삭제  -- 유효기간만 0으로 만들면 됨
	// 쿠키 값을 반환
	public static void deleteCookie(HttpServletResponse response, String name){
		Cookie cookie = new Cookie(name, "");
		cookie.setPath("/");
		cookie.setMaxAge(0);
		
		response.addCookie(cookie);
	}
	
	
	public static String getCookieValue(HttpServletRequest request, String name) {
		Cookie[] cookies = request.getCookies();
		
		for(Cookie c : cookies){
			if(c.getName().equals(name)){
				return c.getValue();
			}
		}
		return "";
	}
	
}
