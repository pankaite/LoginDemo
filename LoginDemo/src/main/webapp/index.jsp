<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Login</title>
	
	<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<br/>
<%-- 该部分注释在网页中不会被显示--%> 
<!-- 该部分注释在网页中会被显示--> 

<div class="container" style="width: 50%">
    <form action="login" method="post">
        <div class="form-group">
            <label for="username">用户名:</label>
            <input type="text" class="form-control" name="username" placeholder="请输入用户名" id="username"/>
        </div>
        <div class="form-group">
            <label for="password"> 密码:</label>
            <input type="password" class="form-control" name="password" placeholder="请输入密码" id="password"/>
        </div>
        <button type="submit" class="btn btn-default">登录</button>
    </form>
</div>

</body>
</html>
