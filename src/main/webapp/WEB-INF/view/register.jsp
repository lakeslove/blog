<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(document).ready(function() {
	$("#getVerificationCode").click(function(){
		var emailValue = $("#email").val();
		$.AJAX({
			url :  "validateEmail.htm",
			type : "get",
			data : {"email":emailValue},
			dataType: "json",
			success : function(data) {
				
			}
		});
	})
/* 	var searchFormData = $('#searchUsersForm').serialize();
	var tempData = searchFormData + ('&currentPage=' + page);
	$.AJAX({
		url :  "searchUsers.htm",
		type : "post",
		data : tempData,
		dataType: "json",
		success : function(data) {
			showDatasInTable(data);
		}ß
	}); */
});
</script>
<div class="blocks_title">java</div>
<div class="blocks">
<form action="register.htm" method="post">
<table>
<tr><td>用户名</td><td></td></tr>
<tr><td>密码</td><td></td></tr>
<tr><td>邮箱</td><td><input type="text" id="email" placeholder="邮箱"><td><button id="getVerificationCode">获取验证码</button></td></tr>
<tr><td>验证码</td><td><input type="text" ></td></tr>
<tr><td colspan="2"></td></tr>
</table>
</form>
<form action="register.htm" method="post">
<table>

<tr><td colspan="2"><input type="submit" value="提交"></td></tr>
</table>
</form>
</div>