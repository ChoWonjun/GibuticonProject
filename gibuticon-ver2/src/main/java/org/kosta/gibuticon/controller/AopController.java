package org.kosta.gibuticon.controller;

import javax.annotation.Resource;

import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.kosta.gibuticon.model.service.AopService;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Component
// context-componet scan 대상이 되도록 하여 컨테이너가 bean을 생성하도록 한다.
@Aspect
// Aspect 어노테이션을 명시하여 공통기능정의 빈임을 컨테이너에게 알린다.
@Controller
public class AopController {
	@Resource
	private AopService aopService;
	
	
	/**
	 * 
	 * 
	 * 조원준
	 * @return
	 */
	@AfterThrowing("execution(public * org.kosta.gibuticon.model.service..*ServiceImpl.*(..))")
	public String errorView(){
		return "error";
	}
	
}
