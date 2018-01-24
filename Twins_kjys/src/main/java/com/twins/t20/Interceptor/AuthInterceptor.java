package com.twins.t20.Interceptor;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
					 	    HttpServletResponse response,
						    Object handler
						    ) throws Exception {
		
		System.out.println("Auth pre handle.........");
		
		HttpSession session = request.getSession();	
		if(session.getAttribute("jmidx") == null) {
			
			String msg = "로그인 후 사용하여 주십시요.";
			
			try {
				msg = URLEncoder.encode(msg, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
					
			logger.info("Current user is not logined");
			response.sendRedirect("/twins/jmLoginController?msg="+msg);
			return false;
		}	
		logger.info("Current user is logined");
		
		return true;
	}
	
	
	
}
