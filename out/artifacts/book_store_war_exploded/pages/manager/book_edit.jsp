<%@ page import="com.itstudy.bean.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <jsp:include page="/WEB-INF/include/base.jsp"></jsp:include>
    <link rel="stylesheet" href="static/css/minireset.css" />
    <link rel="stylesheet" href="static/css/common.css" />
    <link rel="stylesheet" href="static/css/style.css" />
    <link rel="stylesheet" href="static/css/cart.css" />
    <link rel="stylesheet" href="static/css/bookManger.css" />
    <link rel="stylesheet" href="static/css/register.css" />
    <link rel="stylesheet" href="static/css/book_edit.css" />
  </head>
  <body>
    <div class="header">
      <div class="w">
        <div class="header-left">
          <a href="index.jsp">
            <img src="static/img/logo.gif" alt=""
          /></a>
          <h1>编辑图书</h1>
        </div>
        <jsp:include page="/WEB-INF/include/manager_head.jsp"></jsp:include>
      </div>
    </div>
    <div class="login_banner">
      <div class="register_form">
        <form action="BookManagerServlet?method=saveOrUpdate&id=${requestScope.book.id}" method="post">
          <div class="form-item">
            <div>
              <label>名称:</label>
              <input type="text" placeholder="请输入名称" name="bookName" value="${requestScope.book.title}" />
            </div>
            <span class="errMess" >请输入正确的名称</span>
          </div>
          <div class="form-item">
            <div>
              <label>价格:</label>
              <input type="text" placeholder="请输入价格" name="price" value="${requestScope.book.price}"/>
            </div>
            <span class="errMess">请输入正确数字</span>
          </div>
          <div class="form-item">
            <div>
              <label>作者:</label>
              <input type="text" placeholder="请输入作者" name="author" value="${requestScope.book.author}"/>
            </div>
            <span class="errMess">请输入正确作者</span>
          </div>
          <div class="form-item">
            <div>
              <label>销量:</label>
              <input type="number" placeholder="请输入销量" name="sale" value="${requestScope.book.sales}"/>
            </div>
            <span class="errMess">请输入正确销量</span>
          </div>
          <div class="form-item">
            <div>
              <label>库存:</label>
              <input type="number" placeholder="请输入库存" name="stock" value="${requestScope.book.stock}"/>
            </div>
            <span class="errMess">请输入正确库存</span>
          </div>

          <button class="btn">提交</button>
        </form>
      </div>
    </div>
    <div class="bottom">
      电子书城.Copyright ©2021
    </div>
  </body>
</html>
