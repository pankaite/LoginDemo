package com.pye.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pye.entity.User;
import com.pye.service.UserService;

@Controller
public class handle {
	
	@Autowired
	private UserService userService;

	@RequestMapping("add")
	@ResponseBody
	public void add(User user){
		userService.addUser(user.getUsername(), user.getPassword(), user.getSlogan());
	}
	
	@RequestMapping("del")
	@ResponseBody
	public void del(User user){
		userService.deleteUserByName(user.getUsername());
	}
	
	@RequestMapping("update")
	@ResponseBody
	public void update(User user){
		userService.updateUser(user.getUsername(), user.getPassword(), user.getSlogan(), user.getId());
	}
	
//	@RequestMapping("query")
//	@ResponseBody
//	public List<User> query(User user){
//		List<User> users = new ArrayList<>();
//		users = userService.getUsersBy(user.getUsername(),user.getPassword(),user.getSlogan());
//		return users;
//	}
	
	@RequestMapping("query")
	@ResponseBody
	public Map<String, Object> query(User user){
		List<User> users = new ArrayList<>();
		users = userService.getUsersBy(user.getUsername(),user.getPassword(),user.getSlogan());
		Map<String, Object> map = new HashMap<>();
		map.put("recordsTotal", "100");
		map.put("data", users);
		return map;
	}
	
	@RequestMapping("queryAll")
	@ResponseBody
	public Map<String, Object> queryAll(){
		List<User> user = new ArrayList<>();
		user = userService.getAllUsers();
		Map<String, Object> map = new HashMap<>();
		map.put("recordsTotal", "100");
		map.put("data", user);
		return map;
	}
	
//	@RequestMapping("queryAll")
//	@ResponseBody
//	public List<User> queryAll(){
//		List<User> user = new ArrayList<>();
//		user = userService.getAllUsers();
//		Map<String, Object> map = new HashMap<>();
//		return user;
//	}
	

}
