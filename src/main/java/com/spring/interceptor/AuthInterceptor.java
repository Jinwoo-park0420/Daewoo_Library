package com.spring.interceptor;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


import com.spring.domain.LoginVO;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 세션이 있는지 확인 후 세션이 있는 경우 컨트룰러 진입
HttpSession session=request.getSession(false);
	if(session!=null)
	{
		LoginVO vo1=(LoginVO)session.getAttribute("vo1");
		if(vo1!=null)
			return true;
		
	}
	response.sendRedirect(request.getContextPath()+"/login");
		// 세션이 없다면 로그인 화면으로 이동
		return false;
	}

}
