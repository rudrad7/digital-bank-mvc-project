package com.db.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.db.service.CustomerService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/bank")
public class DigitalBankController {
	
	
	@Autowired
	private CustomerService customerService;

	@RequestMapping("/login")
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("role") String role,Model model,HttpServletRequest request) {
		if ("admin".equals(username) && "123".equals(password) && "admin".equals(role)) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("role", role);
			return "admin-dashboard";
		} else if("customer".equals(username) && "123".equals(password) && "customer".equals(role)){
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("role", role);
			request.getSession().setAttribute("password", password);
			return "customer-dashboard";
		}else if( customerService.getCustomer(username, password)){
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("password", password);
			request.getSession().setAttribute("role", role);
			return "customer-dashboard";
        }else {
        	model.addAttribute("message", "Invalid username or password !").toString();
        	return "index";
        }
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "index";
	}
}
