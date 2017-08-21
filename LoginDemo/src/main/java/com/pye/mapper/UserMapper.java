package com.pye.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pye.entity.User;

public interface UserMapper {
	
	@Select("select * from logindemo")
	public List<User> selectUser();

	@Select("select * from logindemo where username = #{username}")
	public List<User> selectUserByUsername(@Param("username")String username);
	
	@Insert("insert into logindemo (username, password,slogan ) values (#{username}, #{password}, #{slogan})")
	public void insertUser(@Param("username")String username,@Param("password")String password,@Param("slogan")String slogan);
	
	@Delete("delete from logindemo where username = #{username}")
	public void deleteUser(@Param("username")String username);
	
	@Update("update logindemo set username =#{username}, password = #{password}, slogan = #{slogan} where id = #{id}")
	public void updateUser(@Param("username")String username,@Param("password")String password,@Param("slogan")String slogan,@Param("id")int id);
	
	@Select("select * from logindemo where username =#{username} or password = #{password} or slogan = #{slogan}")
	public List<User> getUsersBy(@Param("username")String username,@Param("password")String password,@Param("slogan")String slogan);
}
