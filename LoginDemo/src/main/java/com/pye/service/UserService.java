package com.pye.service;

import java.util.List;

import com.pye.entity.User;

public interface UserService {
	
	public List<User> getAllUsers();
		
	public User getUserByName(String name);
	
	public void deleteUserByName(String name);
	
	public void addUser(String name, String password, String slogan);
	
	public void updateUser(String name, String password, String slogan,int id);
	
	public List<User> getUsersBy(String name, String password, String slogan);
	
	public boolean verify(String username, String password);
	
}
