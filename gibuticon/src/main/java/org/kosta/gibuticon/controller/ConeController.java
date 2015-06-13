package org.kosta.gibuticon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ConeController {
	
	@RequestMapping("cone/charge.gibu")
	public ModelAndView charge(){
		return new ModelAndView("cone/charge");
	}
	
	@RequestMapping("cone/mycone.gibu")
	public ModelAndView mycone(){
		return new ModelAndView("cone_mycone");
	}
}
