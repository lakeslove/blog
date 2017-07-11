<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.logo {
	margin-left: 8%;
	width: 50%;
	hight: 100px;
}

.logo a {
	height: 39px;
	display: block;
}

.search {
	position: relative;
	width: 26%;
	margin: 30px 15px;
}

.search input {
	line-height: 34px;
	left: 9px;
	top: 0;
	text-align: initial;
	white-space: nowrap;
	right: 9px;
	height: 35px;
	width: 94%;
	padding: 0 3% 0 3%;
	background-color: #fff;
	border: 1px solid #c8c8c8;
	border-radius: 3px;
	color: #ccc;
	font-weight: 400;
	font-size: 1.2em;
}

.navigation {
	background: #b0dce0;
}

.nav li {
	display: inline;
	margin: 15px 60px;
	font-size: 28px;
	font-weight: bolder;
}

.nav li a {
	text-decoration: none;
	color: #f3a;
}

.selected-nav {
	color: white;
}

#login {
	position: absolute;
	right: 30px;
}
</style>
<div class="subject row pr">
    <div class="col logo">
      <h1><a href="index.htm">微博客</a></h1>
    </div>
    <div class="col search">
      <form action="" target="_blank">
        <!-- <input class="" id="s" placeholder="search"  name="search" autocomplete="off"> -->
      </form>
    </div>
    <c:set var="USER_NAME" value='${sessionScope.SESSION_LOGIN_USER.getName()}'/>
    <c:if test="${empty USER_NAME}">
    <div id = "login"><a href="login.htm">登录</a>&nbsp;&nbsp;&nbsp;<a href="register.htm">注册</a></div>
    </c:if>
    <c:if test="${not empty USER_NAME}">
    <div id = "login"><a href="manager/mypage.htm">${USER_NAME}&nbsp;的博客</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.htm">退出</a></div>
    </c:if>
</div>
<div class="container navigation">
	<div class="row">
		<div class="col nav">
			<ul id="index-nav">
				<li><a href="index.htm" id="nav-index-id" title="首页" class="current">首页</a></li>
				<li><a href="prose.htm" id="nav-prose-id" title="散文">散文</a></li>
				<li><a href="poem.htm" id="nav-poem-id" title="诗歌">诗歌</a></li>
				<li><a href="novel.htm" id="nav-novel-id" title="微小说">微小说</a></li>
				<li><a href="notes.htm" id="nav-notes-id" title="杂记">杂记</a></li>
			</ul>
		</div>
	</div>
</div>