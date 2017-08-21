package com.pye.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pye.entity.User;
import com.pye.service.UserService;

@Controller
public class Login {
	@Autowired
	private UserService userService;

	@RequestMapping("/login")
	public String index(){
		return "index";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(userService.verify(username, password)){
			request.getSession().setAttribute("user", userService.getUserByName(username));
			return "success";
		}
		else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/queryall", method = RequestMethod.POST)
	public String queryall(HttpServletRequest request, HttpServletResponse response){
		List<User> allUsers = new ArrayList<User>();
		allUsers = userService.getAllUsers();
		request.getSession().setAttribute("allUsers", allUsers);
		return "all";
	}
	
}
