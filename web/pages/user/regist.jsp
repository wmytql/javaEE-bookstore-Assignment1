<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<!DOCTYPE html>
<html>
  <head>
      <meta charset="UTF-8" />
      <title>会员注册页面</title>
      <jsp:include page="/WEB-INF/include/base.jsp"></jsp:include>
      <link type="text/css" rel="stylesheet" href="static/css/style.css" />
      <link rel="stylesheet" href="static/css/register.css" />
      <style type="text/css">
        .login_form {
          height: 420px;
          margin-top: 25px;
        }
      </style>
    <script type="text/javascript">
      $(function () {
        $("#codeImg").click(function () {
          $(this).prop("src","code.jpg?x="+ Math.random());
        });
      });

    </script>
  </head>
  <body >
    <div id="login_header">
      <a href="index.html">
        <img class="logo_img" alt="" src="static/img/logo.gif" />
      </a>
    </div>

    <div class="login_banner">
      <div class="register_form">
        <h1>注册会员</h1>
        <form action="UserServlet?method=regist" method="post">
          <div class="form-item">
            <div>
              <label>用户名称:</label>
              <input type="text" name="username" placeholder="请输入用户名"
                     value="${requestScope.user.username}"/>
            </div>
            <span class="errMess">用户名应为6~16位数组和字母组成</span>
          </div>
          <div class="form-item">
            <div >
              <label>用户密码:</label>
              <input type="password" name="password" placeholder="请输入密码"/>
            </div>
            <span class="errMess">密码的长度至少为8位</span>
          </div>
          <div class="form-item">
            <div>
              <label>确认密码:</label>
              <input type="password" name="rePassword" placeholder="请输入确认密码"/>
            </div>
            <span class="errMess">密码两次输入不一致</span>
          </div>
          <div class="form-item">
            <div>
              <label >用户邮箱:</label>
              <input type="text" name="email" placeholder="请输入邮箱"
                     value="${requestScope.user.email}"/>
            </div>
            <span class="errMess">请输入正确的邮箱格式</span>
          </div>
          <div class="form-item">
            <div>
              <label>验证码:</label>
              <div class="verify">
                <input type="text" name="code" placeholder="请输入验证码" />
                <img id="codeImg" src="code.jpg" alt="" style="height: 44px; width: 98px;"/>
              </div>
            </div>
            <span class="errMess">请输入正确的验证码</span>
          </div>
          <button class="btn">注册</button>
        </form>
      </div>
    </div>
    <div id="bottom">
      <span>
        电子书城.Copyright &copy;2021
      </span>
    </div>
  </body>
  <script type="text/javascript">
    //2.对注册中的用户名、密码、确认密码、邮箱进行格式验证，对验证码进行非空验证
    $(function () {

      //注册失败弹框功能
      <c:if test="${not empty requestScope.error_Msg}">
          //弹出提示信息
          alert("${requestScope.error_Msg}");
      </c:if>

      //注册失败Ajax渲染
      // $("[name='username']").change(function () {
      //   //获取用户输入的用户名数据并去除前后空格
      //   var username = $.trim(this.value);
      //   //检查username是否为空字符串
      //   if (username == "") {
      //     alert("请输入有效的用户名！");
      //     return;
      //   }
      //   //发送Ajax请求
      //   // 浏览器端：发送普通请求参数
      //   // 服务器端：返回JSON数据（ResultEntity格式）
      //   $.ajax({
      //     "url":"UserServlet",
      //     "type":"post",
      //     "data":{
      //       "method":"checkUsername",
      //       "username":username
      //     },
      //     "dataType":"json",
      //     "success":function (response) {
      //
      //     }
      //   });
      //
      // });

              <%--<%
                if (request.getAttribute("error_Msg") != null) {
                  //弹出提示信息
              %>
                    alert("<%=request.getAttribute("error_Msg")%>");
              <%
                }
              %>--%>


              //注册表单校验
              $(".btn").click(function () {
                //设置标志
                var flag = true;
                //隐藏错误信息
                $(".errMess").css("visibility","hidden");

                //对用户名进行验证 用户名应为6~16位数字和字母组成
                var reg_username = /^[0-9a-zA-Z]{6,16}$/;
                var username = $("[name='username']").val();
                if (!reg_username.test(username)) {  //验证不通过
                  $(".errMess:eq(0)").css("visibility","visible");
                  return false;
                }

                //对密码进行验证  密码的长度至少为8位
                var reg_password = /^.{8,}$/;
                var password = $("[name='password']").val();
                if (!reg_password.test(password)) { //验证不通过
                  $(".errMess:eq(1)").css("visibility","visible");
                  return false;
                }

                //对确认密码进行验证
                var rePassword = $("[name='rePassword']").val();
                if ($("[name='password']").val() != rePassword) {  //验证不通过
                  $(".errMess:eq(2)").css("visibility","visible");
                  return false;
                }

                //对邮箱进行验证
                var reg_email = /^\w+@\w+\.(com|cn|net)$/;
                var email = $("[name='email']").val();//验证不通过
                if (!reg_email.test(email)) {
                  $(".errMess:eq(3)").css("visibility","visible");
                  return false;
                }

                //对验证码非空判断
                if ($("[name='checkedcode']").val().length == 0) { //验证不通过
                  $(".errMess:eq(4)").css("visibility","visible");
                  return false;
                }
      });
    });
  </script>
</html>
