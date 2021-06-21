<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.itstudy.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>会员登录页面</title>
    <jsp:include page="/WEB-INF/include/base.jsp"></jsp:include>
    <link type="text/css" rel="stylesheet" href="static/css/style.css" />

  </head>
  <body>


    <div id="login_header">
      <a href="index.html">
        <img class="logo_img" alt="" src="static/img/logo.gif" />
      </a>
    </div>

    <div class="login_banner">
      <div id="l_content">
        <span class="login_word">欢迎登录</span>
      </div>

      <div id="content">
        <div class="login_form">
          <div class="login_box">
            <div class="tit">
              <h1>会员</h1>
            </div>
            <div class="msg_cont">
              <b></b>
              <span class="errorMsg">请输入用户名和密码</span>
            </div>
            <div class="form">
              <form action="UserServlet?method=login" method="post">
                <label>用户名称：</label>
                <input
                  class="itxt"
                  type="text"
                  placeholder="请输入用户名"
                  autocomplete="off"
                  tabindex="1"
                  name="username"
                  id="username"

                <c:if test="${not empty requestScope.username}">
                  <%--回显错误账号--%>
                  value="${requestScope.username}"
                </c:if>
                  <%--<%
                    if (request.getAttribute("username") != null && request.getAttribute("password") != null) {
                      %> value="<%=request.getParameter("username")%>"
                  <%
                    }
                  %>--%>

                />
                <br />
                <br />
                <label>用户密码：</label>
                <input
                  class="itxt"
                  type="password"
                  placeholder="请输入密码"
                  autocomplete="off"
                  tabindex="1"
                  name="password"
                  id="password"
                />
                <br />
                <br />
                <input type="submit" value="登录" id="sub_btn" />
              </form>

              <div class="tit">
                <a href="pages/user/regist.jsp">立即注册</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="bottom">
      <span>
        电子书城.Copyright &copy;2021
      </span>
    </div>
  </body>
  <script type="text/javascript">
    $(function () {
      $("#sub_btn").click(function () {

        //对登录中的用户名、密码进行非空验证
        //清空errorMsg里面的内容
        $(".errMess").empty();
        var username = $("#username").val();
        var password = $("#password").val();
        if (username == "" | password == "") {
          $(".errorMsg").html("用户名或密码不能为空！");
          return false;
        }
      });



      //从request域中获取验证结果信息
      <c:if test="${not empty requestScope.Msg}" >
          //request共享域中Msg有数据
          //修改标签里的内容
          $(".errMess").empty();
          $(".errorMsg").html("${requestScope.Msg}");
      </c:if>


      <%--<%
      if (request.getAttribute("Msg") != null) {
        %>
      $(".errMess").empty();
      $(".errorMsg").html("<%=request.getAttribute("Msg")%>");
      <%
      }
        %>--%>

    });


  </script>
</html>
