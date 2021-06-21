<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>我的订单</title>
    <jsp:include page="/WEB-INF/include/base.jsp"></jsp:include>
    <link rel="stylesheet" href="static/css/minireset.css" />
    <link rel="stylesheet" href="static/css/common.css" />
    <link rel="stylesheet" href="static/css/cart.css" />
    <link rel="stylesheet" href="static/css/bookManger.css" />
    <link rel="stylesheet" href="static/css/orderManger.css" />
  </head>
  <body>
    <div class="header">
      <div class="w">
        <div class="header-left">
          <a href="index.jsp">
            <img src="static/img/logo.gif" alt=""
          /></a>
          <h1>我的订单</h1>
        </div>
        <jsp:include page="/WEB-INF/include/client_head.jsp"></jsp:include>
      </div>
    </div>
    <div class="list">
      <div class="w">
        <table>
          <thead>
            <tr>
              <th>订单号</th>
              <th>订单日期</th>
              <th>订单金额</th>
              <th>订单数量</th>
              <th>订单状态</th>
              <th>订单详情</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>12354456895</td>
              <td>
                2021.04.23
              </td>
              <td>90.00</td>
              <td>88</td>
              <td><a href="" class="send">等待发货</a></td>
              <td><a href="">查看详情</a></td>
            </tr>
            <tr>
              <td>12354456895</td>
              <td>
                2021.04.23
              </td>
              <td>90.00</td>
              <td>88</td>
              <td><a href="" class="send">未发货</a></td>
              <td><a href="">查看详情</a></td>
            </tr>
            <tr>
              <td>12354456895</td>
              <td>
                2021.04.23
              </td>
              <td>90.00</td>
              <td>88</td>
              <td><a href="" class="send">已发货</a></td>
              <td><a href="">查看详情</a></td>
            </tr>
          </tbody>
        </table>
        <div class="footer">
          <div class="footer-right">
            <div>首页</div>
            <div>上一页</div>
            <ul>
              <li class="active">1</li>
              <li>2</li>
              <li>3</li>
            </ul>
            <div>下一页</div>
            <div>末页</div>
            <span>共10页</span>
            <span>30条记录</span>
            <span>到第</span>
            <input type="text" />
            <span>页</span>
            <button>确定</button>
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
