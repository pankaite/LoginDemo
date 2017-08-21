<%@page import="com.pye.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>Success</title>
	
	<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<br/>

<%
	User user = (User) session.getAttribute("user");
%>

<div class="container">
    <table class="table table-bordered">
        <tr>
            <th>用户名</th>
            <th>签名</th>
        </tr>
        <tr>
            <td><%= user.getUsername() %></td>
            <td><%= user.getSlogan() %></td>
        </tr>
    </table>
    
    <form action="queryall" method="post">
        <button type="submit" class="btn btn-default">查询全部</button>
    </form>

</div>

</body>
</html>