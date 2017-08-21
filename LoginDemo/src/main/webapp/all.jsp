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
	<link href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" rel="stylesheet">
	
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
	
</head>
<body>
<br/>

<!-- <p id="status">asd</p> -->

<%-- <%
	List<User> allUsers = (List<User>) session.getAttribute("allUsers");
%> --%>
<div class="container">

<%-- 	<table class="table table-bordered" align="center" border="1" cellspacing="0">
		<tr>
			<th>username</th>
			<th>slogan</th>
		</tr>
		<c:forEach items="${allUsers}" var="c" varStatus="st">
			<tr>
				<td>${c.username}</td>
				<td>${c.slogan}</td>
			</tr>
		</c:forEach>
	</table> --%>
	
		<label for="id">ID:</label>
        <input type="text" class="form-control" name="id" placeholder="请输入id" id="id"/>
		<label for="username">用户名:</label>
        <input type="text" class="form-control" name="username" placeholder="请输入用户名" id="username"/>
        <label for="password">密码:</label>
        <input type="text" class="form-control" name="password" placeholder="请输入密码" id="password"/>
        <label for="slogan">签名:</label>
        <input type="text" class="form-control" name="slogan" placeholder="请输入签名" id="slogan"/>
        
        <button  class="btn btn-default" onclick="add()">添加</button>
        <button  class="btn btn-default" onclick="del()">删除</button>
        <button  class="btn btn-default" onclick="update()">更新</button>
        <button  class="btn btn-default" onclick="query()">查询</button>
        <br/><br/><br/>

		<table id="example" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>ID</th>
					<th>用户名</th>
					<th>密码</th>
					<th>签名</th>
				</tr>
			</thead>
		</table>
<!-- 		<table id="example1" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>ID</th>
					<th>用户名</th>
					<th>密码</th>
					<th>签名</th>
				</tr>
			</thead>
		</table> -->

	</div>



<script>
function add(){
	
	var jsonData = {  
            "username" : $("#username").val(),  
            "password" : $("#password").val(),
            "slogan" : $("#slogan").val()  
    };
		//contentType:'application/json;charset=utf-8',
		//数据格式是json串，商品信息
		//data:JSON.stringify(jsonData),
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath }/add',
		data:jsonData,
		success:function(data){//返回json结果
			//alert(data.name);
			//location.reload()			
			queryAll();
		}
		
	});	
	
}

function del(){
	
	var jsonData = {  
            "username" : $("#username").val()
    };
		//contentType:'application/json;charset=utf-8',
		//数据格式是json串，商品信息
		//data:JSON.stringify(jsonData),
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath }/del',
		data:jsonData,
		success:function(data){//返回json结果
			//alert(data);
			//location.reload();			
			queryAll();
		}
		
	});	
	
}

function update(){
	
	var jsonData = {  
			"id" : $("#id").val(),
            "username" : $("#username").val(),  
            "password" : $("#password").val(),
            "slogan" : $("#slogan").val()  
    };
		//contentType:'application/json;charset=utf-8',
		//数据格式是json串，商品信息
		//data:JSON.stringify(jsonData),
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath }/update',
		data:jsonData,
		success:function(data){//返回json结果
			//alert(data.name);
			//location.reload()			
			queryAll();
		}
		
	});	
	
}

function query(){
	/*
	var jsonData = {  
            "username" : $("#username").val(),  
            "password" : $("#password").val(),
            "slogan" : $("#slogan").val()  
    };
	*/
	var url = '${pageContext.request.contextPath }/query';
	//oTable.clear();
	oTable.ajax.url(url).load();
	//oTable.draw();
	
		//contentType:'application/json;charset=utf-8',
		//数据格式是json串，商品信息
		//data:JSON.stringify(jsonData),
/*  		$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath }/query',
		data: jsonData,
		success:function(data){//返回json结果
			//alert(data[0].id);
			//oTable.draw();
			//location.reload()			
			//oTable.data = data;
		}
	});	 */  
	
}


function buildTable(url){	

	 oTable = $('#example').DataTable( {
		//destroy: true,
		//Retrieve: true,
		"info":false,
		"paging":false,
		"serverSide":true,
    	"ajax":{
    		"url" : url,
			"type" : "POST",
			"data":getParam,
			//"dataSrc" : 'data',
			//"dataSrc" : '',
			//"data" : data
    	},
    	"columns": [
                  { data: 'id' },
                  { data: 'username' },
                  { data: 'password' },
                  { data: 'slogan' }
              ]
    } );
//	 oTable.on('xhr.dt', function ( e, settings, json, xhr ) {
//     	var aa = JSON.stringify(json.data[0].username);
//     	alert(aa);
//    		 $('#status').html(json.data[0].username );
//	    } );
}
function getParam(){
	var jsonData = {  
            "username" : $("#username").val(),  
            "password" : $("#password").val(),
            "slogan" : $("#slogan").val()  
    };
	
	return jsonData;
}
/* 	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath }/query',
		success:function(data){
			buildTable(data);
		}
	}); */



function queryAll(){
	var url = '${pageContext.request.contextPath }/queryAll';
	if (typeof oTable != 'undefined' && oTable != null) { // 为了避免多次初始化datatable()
			//oTable.clear(); // 清空数据
			//oTable.ajax.reload();
			oTable.ajax.url(url).load();
			//oTable.draw(); // 重新加载数据
		} else {
			buildTable(url);
		}
	}

	var oTable;
	$(document).ready(function() {
		//buildTable();	
		queryAll();
	}); 
</script>
</body>
</html>