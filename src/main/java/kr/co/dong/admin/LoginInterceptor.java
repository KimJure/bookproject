package kr.co.dong.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	    @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	        HttpSession session = request.getSession();
	        Object user = session.getAttribute("user");
	        
	        if (user == null) {
	            // 로그인되지 않은 상태로 접근 시 처리할 로직 작성
	            response.sendRedirect("/board/loginForm");
	            return false;
	        }
	        
	        // 로그인된 상태일 때의 추가적인 로직 작성
	        
	        return true;
	    }
	    
	    @Override
	    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
	        // 메소드 구현
	    }

		@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
				ModelAndView modelAndView) throws Exception {
			// TODO Auto-generated method stub
			
		}
}
