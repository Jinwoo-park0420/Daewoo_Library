/*
 * package com.spring.interceptor.security;
 * 
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.web.servlet.ModelAndView; import
 * org.springframework.web.servlet.ModelAndViewDefiningException; import
 * org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
 * 
 * import com.spring.domain.LoginVO; import com.spring.service.MemberService;
 * 
 * public class AuthInterceptor extends HandlerInterceptorAdapter {
 * 
 * @Autowired private MemberService service;
 * 
 * @Override public boolean preHandle(HttpServletRequest request,
 * HttpServletResponse response, Object handler) throws Exception { HttpSession
 * session = request.getSession(false); if (session != null) { Object obj =
 * session.getAttribute("vo1");
 * 
 * if (obj != null) return true; }
 * response.sendRedirect(request.getContextPath() + "/member/login"); return
 * false;
 * 
 * } }
 */