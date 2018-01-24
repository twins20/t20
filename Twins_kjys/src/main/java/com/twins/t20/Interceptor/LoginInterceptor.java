package com.twins.t20.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, 
						   HttpServletResponse response,
						   Object handler,
						   ModelAndView modelAndView) throws Exception {
		
		System.out.println("로그인 체크 클래스 실행");	
		System.out.println("post handle.........");

		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();

		
////		Object jmid = modelAndView.getModel().get("jmid");
////		Object jmidx = modelAndView.getModel().get("jmidx");
////		
////		if(jmid != null){
////			session.setAttribute("jmid", jmid);
////			session.setAttribute("jmidx", jmidx);
////		}
				
		Object jmidx = modelMap.get("jmidx");
		Object jmid = modelMap.get("jmid");
			
		if(jmidx != null) {
			
			logger.info("New login successed");
			session.setAttribute("jmidx", jmidx);
			session.setAttribute("jmid", jmid);						
		}
		else logger.info("Login failed");
	}
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
					 	    HttpServletResponse response,
						    Object handler
						    ) throws Exception {
		
		System.out.println("pre handle.........");
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("jmidx") != null) {
			
			logger.info("Previous login data cleared");
			session.removeAttribute("jmidx");
			session.removeAttribute("jmid");	
		}
		
		return true;
	}	
}
