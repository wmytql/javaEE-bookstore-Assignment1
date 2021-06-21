<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>书城首页</title>
    <jsp:include page="/WEB-INF/include/base.jsp"></jsp:include>
    <link rel="stylesheet" href="static/css/minireset.css" />
    <link rel="stylesheet" href="static/css/common.css" />
    <link rel="stylesheet" href="static/css/iconfont.css" />
    <link rel="stylesheet" href="static/css/index.css" />
    <link rel="stylesheet" href="static/css/swiper.min.css" />
</head>
<body>
<div id="app">
    <div class="topbar">
        <div class="w">
            <div class="topbar-left">
                <i>送至:</i>
                <i>北京</i>
                <i class="iconfont icon-ai-arrow-down"></i>
            </div>


            <c:if test="${empty sessionScope.user}" var="user">
                <div class="topbar-right">
                    <a href="pages/user/login.jsp" class="login">登录</a>
                    <a href="pages/user/regist.jsp" class="register">注册</a>
                    <a href="pages/cart/cart.jsp" class="cart iconfont icon-gouwuche">购物车

                        <c:if test="${not empty sessionScope.cart.cartItemList}">
                            <div class="cart-num">${sessionScope.cart.totalCount}</div>
                        </c:if>
                    </a>
                    <a href="pages/manager/manager.jsp" class="admin">后台管理</a>
                </div>
            </c:if>
            <c:if test="${not empty sessionScope.user}" var="user">
                <%--登录后风格--%>
                <div class="topbar-right">
                    <span>欢迎您，<b>${sessionScope.user.username}</b></span>
                    <a href="UserServlet?method=logout" class="register" id="logout">注销</a>
                    <a href="pages/cart/cart.jsp" class="cart iconfont icon-gouwuche">购物车
                        <c:if test="${not empty sessionScope.cart.cartItemList}">
                            <div class="cart-num">${sessionScope.cart.totalCount}</div>
                        </c:if>
                    </a>
                    <a href="pages/manager/manager.jsp" class="admin">后台管理</a>
                </div>
            </c:if>


        </div>
    </div>
    <div class="header w">
        <a href="#" class="header-logo"></a>
        <div class="header-nav">
            <ul>
                <li><a href="#">java</a></li>
                <li><a href="#">前端</a></li>
                <li><a href="#">小说</a></li>
                <li><a href="#">文学</a></li>
                <li><a href="#">青春文学</a></li>
                <li><a href="#">艺术</a></li>
                <li><a href="#">管理</a></li>
            </ul>
        </div>
        <div class="header-search">
            <input type="text" placeholder="十万个为什么" />
            <button class="iconfont icon-search"></button>
        </div>
    </div>
    <div class="banner w clearfix">
        <div class="banner-left">
            <ul>
                <li>
                    <a href="">
                        <span>文学 鉴赏</span>
                        <i class="iconfont icon-jiantou"></i
                        ></a>
                </li>
                <li>
                    <a href="">
                        <span>社科 研究</span>
                        <i class="iconfont icon-jiantou"></i
                        ></a>
                </li>
                <li>
                    <a href="">
                        <span>少儿 培训</span>
                        <i class="iconfont icon-jiantou"></i
                        ></a>
                </li>
                <li>
                    <a href="">
                        <span>艺术 赏析</span>
                        <i class="iconfont icon-jiantou"></i
                        ></a>
                </li>
                <li>
                    <a href="">
                        <span>生活 周边</span>
                        <i class="iconfont icon-jiantou"></i
                        ></a>
                </li>
                <li>
                    <a href="">
                        <span>文教 科技</span>
                        <i class="iconfont icon-jiantou"></i
                        ></a>
                </li>
                <li>
                    <a href="">
                        <span>热销 畅读</span>
                        <i class="iconfont icon-jiantou"></i
                        ></a>
                </li>
            </ul>
        </div>
        <div class="banner-right">
            <div class="swiper-container">
                <ul class="swiper-wrapper">
                    <li class="swiper-slide">
                        <img src="static/uploads/banner4.jpg" alt="">
                        <!-- <div class="banner-img"></div> -->
                    </li>
                    <li class="swiper-slide">
                        <img src="static/uploads/banner5.jpg" alt="">
                        <!-- <div class="banner-img"></div> -->
                    </li>
                    <li class="swiper-slide">
                        <img src="static/uploads/banner6.jpg" alt="">
                        <!-- <div class="banner-img"></div> -->
                    </li>
                </ul>
                <div class="swiper-button-prev"></div>

                <div class="swiper-button-next"></div>

                <!-- Add Pagination -->
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>
    <div class="books-list ">
        <div class="w">
            <div class="list">
                <div class="list-header">
                    <div class="title">图书列表</div>
                    <div class="price-search">
                        <span>价格:</span>
                        <input type="text" id="minPrice" name="${param.min}" value="${requestScope.minPrice}">
                        <span>-元</span>
                        <input type="text" id="maxPrice" name="${param.max}" value="${requestScope.maxPrice}">
                        <span>元</span>
                        <button id="searchBtn">查询</button>
                    </div>
                </div>
                <div class="list-content">

                    <c:forEach items="${requestScope.page.list}" var="book">
                        <div class="list-item">
                            <img src="${pageScope.book.imgPath}" alt="">
                            <p>书名:${pageScope.book.title}</p>
                            <p>作者:${pageScope.book.author}</p>
                            <p>价格:￥${pageScope.book.price}</p>
                            <p>销量:${pageScope.book.sales}</p>
                            <p>库存:${pageScope.book.stock}</p>
                            <button class="addCart" book_id="${pageScope.book.id}">加入购物车</button>
                        </div>
                    </c:forEach>
                </div>


                <div class="list-footer">
                    <jsp:include page="/WEB-INF/include/page.jsp"></jsp:include>
                </div>
            </div>
        </div>

    </div>
    <div class="cate w">
        <div class="list">
            <a href="" class="list-item">
                <i class="iconfont icon-java"></i>
                <span>java</span>
            </a>
            <a href="" class="list-item"
            ><i class="iconfont icon-h5"></i>h5</a
            >
            <a href="" class="list-item">
                <i class="iconfont icon-python"></i>python
            </a>
            <a href="" class="list-item"
            ><i class="iconfont icon-tianchongxing-"></i>pm</a
            >
            <a href="" class="list-item"
            ><i class="iconfont icon-php_elephant"></i>php</a
            >
            <a href="" class="list-item"
            ><i class="iconfont icon-go"></i>go</a
            >
        </div>
        <a href="" class="img">
            <img src="static/uploads/cate4.jpg" alt="" />
        </a>
        <a href="" class="img">
            <img src="static/uploads/cate5.jpg" alt="" />
        </a>
        <a href="" class="img">
            <img src="static/uploads/cate6.jpg" alt="" />
        </a>
    </div>
    <div class="books">
        <div class="w">
            <div class="seckill">
                <div class="seckill-header">
                    <div class="title">
                        图书秒杀
                    </div>
                    <!-- <i class="iconfont icon-huanyipi"></i> -->
                </div>
                <div class="seckill-content">

                    <a href="" class="tip">
                        <h5>距离结束还有</h5>
                        <i class="iconfont icon-shandian"></i>
                        <div class="downcount">
                            <span class="time">00</span>
                            <span class="token">:</span>
                            <span class="time">00</span>
                            <span class="token">:</span>
                            <span class="time">00</span>
                        </div>
                    </a>


                    <a href="" class="books-sec">
                        <img src="static/uploads/congwanqingdaominguo.jpg" alt="">
                        <p>从晚晴到民国</p>
                        <div>
                            <span class="cur-price">￥28.9</span>
                            <span class="pre-price">￥36.5</span>
                        </div>
                        <button>立即购买</button>
                    </a>
                    <a href="" class="books-sec">
                        <img src="static/uploads/cyuyanrumenjingdian.jpg" alt="">
                        <p>c语言入门经典</p>
                        <div>
                            <span class="cur-price">￥55.9</span>
                            <span class="pre-price">￥68.5</span>
                        </div>
                        <button>立即购买</button>
                    </a>
                    <a href="" class="books-sec">
                        <img src="static/uploads/fusang.jpg" alt="">
                        <p>扶桑</p>
                        <div>
                            <span class="cur-price">￥30.9</span>
                            <span class="pre-price">￥47.5</span>
                        </div>
                        <button>立即购买</button>
                    </a>
                    <a href="" class="books-sec">
                        <img src="static/uploads/geihaizideshi.jpg" alt="">
                        <p>给孩子的诗</p>
                        <div>
                            <span class="cur-price">￥18.9</span>
                            <span class="pre-price">￥25.5</span>
                        </div>
                        <button>立即购买</button>
                    </a>




                    </ul>
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
                            <img src="static/img/bottom1.png" alt="">

                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="static/img/bottom.png" alt="">

                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="static/img/bottom2.png" alt="">
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


</div>
<script src="static/script/swiper.min.js"></script>
<script>
    var swiper = new Swiper('.swiper-container', {
        autoplay: true,
        pagination: {
            el: '.swiper-pagination',
            dynamicBullets: true
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev'
        }
    })

    $(function () {
        $("#searchBtn").click(function () {
            var min = $("#minPrice").val();
            var max = $("#maxPrice").val();
            location = "BookClientServlet?method=getPageByPrice&min="+min+"&max="+max;
        });


        //退出登录提示
        $("#logout").click(function () {
            return confirm("确定要退出登录吗？");
        });

        //加入购物车
        $(".addCart").click(function () {
            var book_id = $(this).attr("book_id");
            location = "addCartServlet?method=addCart&book_id="+book_id;
        });

    });

</script>
</body>
</html>
