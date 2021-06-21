<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <jsp:include page="/WEB-INF/include/base.jsp"></jsp:include>
    <link rel="stylesheet" href="static/css/minireset.css"/>
    <link rel="stylesheet" href="static/css/common.css"/>
    <link rel="stylesheet" href="static/css/cart.css"/>
    <link rel="stylesheet" href="static/css/bookManger.css"/>
    <script type="text/javascript">
        $(function () {
            //确认删除提示
            $(".del").click(function () {
                return confirm("确定删除吗");
            });
        });
    </script>
</head>
<body>
<div class="header">
    <div class="w">
        <div class="header-left">
            <a href="index.jsp">
                <img src="static/img/logo.gif" alt=""/></a>
            <h1>图书管理系统</h1>
        </div>
        <jsp:include page="/WEB-INF/include/manager_head.jsp"></jsp:include>
    </div>
</div>
<div class="list">
    <div class="w">
        <div class="add">
            <a href="pages/manager/book_edit.jsp">添加图书</a>
        </div>
        <table>
            <thead>
            <tr>
                <th>图片</th>
                <th>商品名称</th>
                <th>价格</th>
                <th>作者</th>
                <th>销量</th>
                <th>库存</th>
                <th>操作</th>
            </tr>
            </thead>


            <tbody>

            <c:forEach items="${requestScope.page.list}" var="book">
                <tr>
                    <td><img src="${pageScope.book.imgPath}" alt=""></td>
                    <td>${pageScope.book.title}</td>
                    <td>${pageScope.book.price}</td>
                    <td>${pageScope.book.author}</td>
                    <td>${pageScope.book.sales}</td>
                    <td>${pageScope.book.stock}</td>
                    <td><a href="BookManagerServlet?method=editBook&id=${pageScope.book.id}">修改</a>
                        <a href="BookManagerServlet?method=deleteBook&id=${pageScope.book.id}" class="del">删除</a>
                    </td>
                </tr>
            </c:forEach>


            </tbody>
        </table>
        <div class="footer">
            <div class="footer-right">
                <jsp:include page="/WEB-INF/include/page.jsp"></jsp:include>
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
                        <img src="static/img/bottom1.png" alt=""/>

                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="static/img/bottom.png" alt=""/>

                    </a>
                </li>
                <li>
                    <a href="">
                        <img src="static/img/bottom2.png" alt=""/>

                    </a>
                </li>
            </ul>
        </div>
        <div class="content">
            <dl>

            </dl>
            <dl>

            </dl>
            <dl>

            </dl>
            <dl>

            </dl>
        </div>
    </div>
    <div class="down">
        电子书城.Copyright ©2021
    </div>
</div>
</body>
</html>
