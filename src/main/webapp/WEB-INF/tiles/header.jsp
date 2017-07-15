<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.navigation {
	background: #b0dce0;
}

#navigation-row >div {
	font-size: 28px;
	line-height:55px;
/* 	font-weight: bolder; */
}
#navigation-row{
	width:84%;
	margin: 0 auto;
}

#navigation-row a {
	text-decoration: none;
	color: #f3a;
}

.login {
	position: absolute;
	right: 25px;
}
</style>
<div class="row" style="height:20px;">
	<div class="col-sm-12">
		<div class="login">
			<c:set var="USER_NAME"
				value='${sessionScope.SESSION_LOGIN_USER.getName()}' />
			<c:if test="${empty USER_NAME}">
				<a href="login.htm">登录</a>&nbsp;&nbsp;&nbsp;<a href="register.htm">注册</a>
			</c:if>
			<c:if test="${not empty USER_NAME}">
				<a href="${pageContext.request.contextPath}/manager/mypage.htm">${USER_NAME}&nbsp;的博客</a>
    	&nbsp;&nbsp;&nbsp;&nbsp;
    	<a href="${pageContext.request.contextPath}/logout.htm">退出</a>
			</c:if>
		</div>
	</div>
</div>
<div class="row">
    <div class="col-sm-12">
      <h1><a href="index.htm">微博客</a></h1>
    </div>
</div>
<div class="navigation">
<div id="navigation-row" class="row">
	<div>
		<a href="${pageContext.request.contextPath}/index.htm"
			id="nav-index-id" title="首页" class="current">首页</a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/prose.htm"
			id="nav-prose-id" title="散文">散文</a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/poem.htm" id="nav-poem-id"
			title="诗歌">诗歌</a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/novel.htm"
			id="nav-novel-id" title="小说">小说</a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/notes.htm"
			id="nav-notes-id" title="随笔">随笔</a>
	</div>
</div>
</div>
<script type="text/javascript">
$("#navigation-row div").addClass("col-xs-6 col-xs-4 col-sm-2 ");
</script>
