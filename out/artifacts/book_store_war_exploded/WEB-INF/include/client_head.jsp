<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.itstudy.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: LUOJIAN
  Date: 2021/4/16
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${empty sessionScope.user}">
    <div class="header-right">
        <div class="destory"><a href="pages/user/login.jsp">登录</a></div>
        <div class="destory"><a href="pages/user/regist.jsp">注册</a></div>
        <div class="destory"><a href="pages/cart/cart.jsp">购物车</a></div>
        <div class="gohome"><a href="">返回</a></div>
    </div>
</c:if>
<c:if test="${not empty sessionScope.user}">
    <div class="header-right">
        <h3>欢迎<span>${sessionScope.user.username}</span>光临电子书城</h3>
        <div class="order"><a href="pages/order/order.jsp">我的订单</a></div>
        <div class="destory"><a href="UserServlet?method=logout">注销</a></div>
        <div class="gohome"><a href="">返回</a></div>
    </div>
</c:if>

<script type="text/javascript">
    $(function () {
        //退出登录提示
        $(".logout").click(function () {
            return confirm("确定要退出登录吗？");
        });
    })
</script>
