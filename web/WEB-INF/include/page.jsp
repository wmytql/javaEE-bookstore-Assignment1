<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${requestScope.page.pageNo != 1}">
    <div>
        <a href="${requestScope.page.path}&pageNo=1">首页</a>
    </div>
    <div>
        <a href="${requestScope.page.path}&pageNo=${requestScope.page.pageNo-1}">上一页</a>
    </div>
</c:if>

<%--设置变量begin和end--%>
<c:choose>
    <%--当总页数小于5页的时候 变量从1到总页数   --%>
    <c:when test="${requestScope.page.totalPage < 5}">
        <c:set var="begin" value="1"></c:set>
        <c:set var="end" value="${requestScope.page.totalPage}"></c:set>
    </c:when>
    <%--当总页数小于3页的时候 变量从1到5    --%>
    <c:when test="${requestScope.page.pageNo < 3}">
        <c:set var="begin" value="1"></c:set>
        <c:set var="end" value="5"></c:set>
    </c:when>
    <%--当总页数>=5页的时候 变量从当前页码减2到当前页码加2       --%>
    <%--例如:当页码等于5页的时候  begin=3 end=7  正好5个数据   --%>
    <c:otherwise>
        <c:set var="begin" value="${requestScope.page.pageNo-2}"></c:set>
        <c:set var="end" value="${requestScope.page.pageNo+2}"></c:set>
        <%--当页码翻到最后5位数的时候 变量从总页码-4到总页码     --%>
        <%--例如:当总页码等于18的时候  begin=18-4=14  end=18  正好5个数据 --%>
        <c:if test="${pageScope.end > requestScope.page.totalPage}">
            <c:set var="begin" value="${requestScope.page.totalPage-4}"></c:set>
            <c:set var="end" value="${requestScope.page.totalPage}"></c:set>
        </c:if>
    </c:otherwise>
</c:choose>
<%--从begin到end遍历--%>
<ul>
    <c:forEach begin="${pageScope.begin}" end="${pageScope.end}" var="i">
        <c:choose>
            <%--选中哪个跳哪个--%>
            <c:when test="${requestScope.page.pageNo == pageScope.i}">
                <li class="active">
                    <a href="${requestScope.page.path}&pageNo=${pageScope.i}">${pageScope.i}</a>
                </li>
            </c:when>
            <c:otherwise>
                <li>
                    <a href="${requestScope.page.path}&pageNo=${pageScope.i}">${pageScope.i}</a>
                </li>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</ul>


<c:if test="${requestScope.page.pageNo != requestScope.page.totalPage}">
    <div>
        <a href="${requestScope.page.path}&pageNo=${requestScope.page.pageNo+1}">下一页</a>
    </div>
    <div>
        <a href="${requestScope.page.path}&pageNo=${requestScope.page.totalPage}">末页</a>
    </div>
</c:if>
<span>共${requestScope.page.totalPage}页</span>
<span>${requestScope.page.totalCount}条记录</span>
<span>到第</span>
<input type="text" id="pageNo_input"/>
<span>页</span>
<button id="pageBtn">确定</button>

<script type="text/javascript">
    $("#pageBtn").click(function () {
        var pageNo = $("#pageNo_input").val();
        location = "${requestScope.page.path}&pageNo=" + pageNo;
    });
</script>