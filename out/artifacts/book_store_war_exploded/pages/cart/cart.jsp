<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <jsp:include page="/WEB-INF/include/base.jsp"></jsp:include>
    <link rel="stylesheet" href="static/css/minireset.css" />
    <link rel="stylesheet" href="static/css/common.css" />
    <link rel="stylesheet" href="static/css/cart.css" />

  </head>
  <body>
    <div class="header">
      <div class="w">
        <div class="header-left">
          <a href="index.jsp">
            <img src="static/img/logo.gif" alt=""
          /></a>
          <h1>我的购物车</h1>
        </div>
        <jsp:include page="/WEB-INF/include/client_head.jsp"></jsp:include>
      </div>
    </div>
    <div class="list">
      <div class="w">
        <table>
          <thead>
            <tr>
              <th>图片</th>
              <th>商品名称</th>

              <th>数量</th>
              <th>单价</th>
              <th>金额</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody>

            <c:forEach items="${sessionScope.cart.cartItemList}" var="cartItem">
              <tr>
                <td>
                  <img src="${pageScope.cartItem.book.imgPath}" alt="" />
                </td>
                <td>${pageScope.cartItem.book.title}</td>
                <td>
                  <span class="count subSpan">-</span>
                  <input class="count-num" type="text" bookId="${pageScope.cartItem.book.id}" value="${pageScope.cartItem.count}" />
                  <span class="count addSpan">+</span>
                </td>
                <td>${pageScope.cartItem.book.price}</td>
                <td>${pageScope.cartItem.amount}</td>
                <td><a href="addCartServlet?method=deleteCartItem&id=${pageScope.cartItem.book.id}" class="del">删除</a></td>
              </tr>


            </c:forEach>


          </tbody>
        </table>
        <div class="footer">
          <div class="footer-left">
            <a href="addCartServlet?method=clearCartItem" class="clear-cart">清空购物车</a>
            <a href="">继续购物</a>
          </div>
          <div class="footer-right">
            <div>共<span>${sessionScope.cart.totalCount}</span>件商品</div>
            <div class="total-price">总金额<span>${sessionScope.cart.totalAmount}</span>元</div>
            <a class="pay" href="OrderClientServlet?method=check">去结账</a>
          </div>
        </div>
      </div>
    </div>
    <div class="bottom">
      <div class="w">
        <div class="top">
          <ul>
            <li>
              <a href="">
                <img src="static/img/bottom1.png" alt="" />
              </a>
            </li>
            <li>
              <a href="">
                <img src="static/img/bottom.png" alt="" />
              </a>
            </li>
            <li>
              <a href="">
                <img src="static/img/bottom2.png" alt="" />
              </a>
            </li>
          </ul>
        </div>
        <div class="content">
          <dl>
            <dt>关于商城</dt>
          </dl>
          <dl>

          </dl>
          <dl>

          </dl>
          <dl>
            <dt>联系我们</dt>
            <dd>·</dd>
            <dd></dd>
          </dl>
        </div>
      </div>
      <div class="down">
        电子书城.Copyright ©2021
      </div>
    </div>
  </body>

  <script type="text/javascript">
    //删除提示

      //删除购物项提示
      $(".del").click(function () {
        return confirm("删除后不可恢复，您确定删除吗？");
      });

      //清空购物车提示
      $(".clear-cart").click(function () {
        return confirm("确定要清空购物车吗？删除后不可恢复");
      });

      //加
      $(".addSpan").click(function () {
        var count = $(this).prev().val()-(-1);
        var bookId = $(this).prev().attr("bookId");
        location = "addCartServlet?method=updateCartItem&bookId="+bookId+"&count="+count;
      });
      //减
      $(".subSpan").click(function () {
        var count = $(this).next().val()-1;
        var bookId = $(this).next().attr("bookId");
        location = "addCartServlet?method=updateCartItem&bookId="+bookId+"&count="+count;
      });

      //内容改变事件
      $(".count-num").change(function () {
        var count = $(this).val();
        var bookId = $(this).attr("bookId");
        location = "addCartServlet?method=updateCartItem&bookId="+bookId+"&count="+count;
      });




  </script>
</html>
