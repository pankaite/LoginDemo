package com.pye.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pye.entity.User;
import com.pye.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl  implements UserService{
	@Autowired
	private UserMapper userMapper;

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	@Override
	public List<User> getAllUsers() {
		return userMapper.selectUser();
	}

	@Override
	public User getUserByName(String name) {
		return userMapper.selectUserByUsername(name).get(0);
	}
	
	@Override
	public void addUser(String name, String password, String slogan) {
		userMapper.insertUser(name, password, slogan);		
	}
	
	@Override
	public void deleteUserByName(String name) {
		userMapper.deleteUser(name);		
	}
	
	@Override
	public void updateUser(String name, String password, String slogan, int id) {
		userMapper.updateUser(name, password, slogan, id);
		
	}
	
	@Override
	public List<User> getUsersBy(String name, String password, String slogan) {
		return userMapper.getUsersBy(name, password, slogan);
	}
	
	@Override
	public boolean verify(String username, String password) {
		if (username == "" || password == "") {
			return false;
		}
		else if(userMapper.selectUserByUsername(username).get(0).getPassword().equals(password)){
			return true;
		}
		else {
			return false;
		}
	}
}
