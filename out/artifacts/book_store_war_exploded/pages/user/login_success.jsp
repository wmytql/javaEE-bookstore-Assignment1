<%@ page import="com.itstudy.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会员注册页面</title>
	<jsp:include page="/WEB-INF/include/base.jsp"></jsp:include>
<link type="text/css" rel="stylesheet" href="static/css/style.css" >
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
	
	h1 a {
		color:red;
	}
</style>


</head>
<body>
		<div id="header">
				<a href="index.jsp">
					<img class="logo_img" alt="" src="static/img/logo.gif" />
				</a>
				<div>
					<span>欢迎<span class="um_span">${sessionScope.user.username}</span>光临电子书城</span>
					<a href="pages/order/order.jsp">我的订单</a>
					<a href="UserServlet?method=logout" class="logout">注销</a>&nbsp;&nbsp;
					<a href="">返回</a>
				</div>
		</div>
		
		<div id="main">
		
			<h1>欢迎回来 <a href="index.jsp">转到主页</a></h1>
	
		</div>
		
		<div id="bottom">
			<span>
				电子书城.Copyright &copy;2021
			</span>
		</div>
</body>



</html>