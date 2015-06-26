package org.kosta.gibuticon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.gibuticon.model.member.LoginCheck;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// @LoginCheck 어노테이션이 컨트롤러에 사용되었는지 체크함
		LoginCheck usingAuth = ((HandlerMethod) handler)
				.getMethodAnnotation(LoginCheck.class);
		System.out.println(usingAuth);
		// @LoginCheck 어노테이션이 있으면 로그인 체크
		if (usingAuth != null) {
			HttpSession session = request.getSession(false);
			if (session == null || session.getAttribute("mvo") == null) {
				// ajax 요청인지를 request의 header정보를 이용해 판단.
				String ajaxCall = request.getHeader("ajax");
				if (ajaxCall != null && ajaxCall.equals("true")) {
					System.out.println("ajax 요청이므로 ajax방식으로 응답");
					// client에게 error임을 응답한다.
					response.sendError(888);
				} else {
					String uri=request.getRequestURI();	
					String contextPath=request.getContextPath();
					System.out.println("interceptor uri:"+uri+" "+contextPath);
					response.sendRedirect("../member/loginModal.gibu?prev="+uri.replaceAll(contextPath+"/",""));
				}
				System.out.println("세션 만료 혹은 비로그인 상태로 실행 거부");
				return false;
			}
		}
		return true;
	}
}
