<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(document).ready(function() {
	$.changeSelectedNav("nav-index-id");
});
</script>
<div class="blocks">
<div class="content_center" >
<div style="margin:0 auto;width:80%;background-color:rgb(245, 245, 245);padding:2%;">
网站源码: <a href="https://github.com/lakeslove/blog" target="_blank">https://github.com/lakeslove/blog</a>
<br>
因为服务器在华北，数据库在华东，所以访问请求较慢，囧RZ....
<br>
因为邮箱服务器用的是163的个人邮件转发的，所以这速度。。。你懂的
<br><br>
这是一个用SSM(SpringMVC+Tiles+Spring+Mybatis)搭建的简易框架.<br>
主要目的有如下几个:<br>
<ol>
<li>整合框架,下次写网站直接拿来改改用就好</li>
<li>添加写网站时常用的共同方法</li>
<li>测试框架中的各种功能</li>
</ol>
这个网站实现的功能如下<br>
<ol>
<li>用Mybatis进行增删改查</li>
<li>发送邮件来注册用户</li>
<li>翻页展示</li>
</ol>
网站的数据库设计如下<br>
<img src="image/db.png" class="img-responsive" style="width:400px;">
</div>
</div>
</div>
