package com.accenture.controller;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import antlr.StringUtils;

import com.accenture.service.impl.LotteryServiceImpl;

@Controller
public class LotteryController {

	// ------- Constants (static final) ----------------------------------------
	@Autowired
	private LotteryServiceImpl LotteryService;

	// ------- Static Variables (static) ---------------------------------------

	// ------- Instance Variables (private) ------------------------------------

	// ------- Constructors ----------------------------------------------------

	// ------- Instance Methods (public) ---------------------------------------
	@RequestMapping(value = "/index.do")
	public String mainPage(Model model) {
		return "main";
	}

	@RequestMapping(value = "/beginToDraw.do")
	public @ResponseBody
	String beginToDraw(
			@RequestParam(value = "startDraw", required = false) String startDraw,
			HttpServletRequest request, Model model) {
		startDraw = "startDraw";

		if (startDraw.equals("startDraw")) {
			String randomEmpID = this.LotteryService.findRandomEmployeeID();
			return randomEmpID;
		} else {
			// return new ModelAndView("main", "error",
			// "User name or password is incorrect!");
			return null;
		}
	}

	@RequestMapping(value = "/login.do")
	public String loginPage(
			@RequestParam(value = "userName", required = false) String userName,
			@RequestParam(value = "password", required = false) String password,
			Model model) {
		if (userName==null || password==null) {
			return "loginPage";
		} else {
			boolean validUser = this.LotteryService.hasMatchedLoginUser(
					userName, password);
			if (validUser) {
				model.addAttribute("userName", userName);
				return "main";
			} else {
				model.addAttribute("error","User name or password is incorrect!");
				return "loginPage";
			}
		}
	}
	
	@RequestMapping(value="logoff.do")
	public String logOff(HttpServletRequest request){
		Enumeration<?> enu=request.getSession().getAttributeNames();
		while(enu.hasMoreElements()){
			String name=(String) enu.nextElement();
			request.getSession().removeAttribute(name);
		}
		return "main";
	}
	
	@RequestMapping(value="/register.do")
	public String registerPage(Model model){
		return "registerPage";
	}
	// ------- Instance Methods (protected) ------------------------------------

	// ------- Instance Methods (private) --------------------------------------

	// ------- Static Methods --------------------------------------------------

	// ------- Optional Inner Class ------------------------------------------

}
