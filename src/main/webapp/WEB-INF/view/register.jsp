<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="javascript/verification.js"></script>
<script>
$(document).ready(function() {
	$("#getVerificationCode").click(function(){
		var emailValue = $("#email").val();
		if(!isEmail(emailValue)){
			alert(messageError["error.email.format"]);
			return;
		}
		$.AJAX({
			url :  "getVerificationCode.htm",
			type : "post",
			data : {"email":emailValue},
			dataType: "json",
			success : function(data) {
				if(data.mark==true){
					alert(data.message);
				}else{
					alert(data.message);
				}
			}
		});
	})
});
function checkParameters(){
	var name = $("#name").val();
	if(name.length>6){
		alert("名字太长");
		return false;
	}
	var name = $("#password").val();
	if(name.length>8){
		alert("密码太长");
		return false;
	}
	return true;
}
</script>
<div class="blocks_title">新用户注册</div>
<div class="blocks">
<form:form id="registerForm" modelAttribute="user" action="register.htm" method="post" onsubmit="return allSubmit(checkParameters);">
<table>
<c:if test="${!empty validateError } ">
<tr><td colspan="2"><span class="errorText"><c:out value="${validateError}"/></span></td></tr>
</c:if>
<tr><td>用户名</td><td><form:input id="name" type="text" path="name" placeholder="最长6位"/></td></tr>
<tr><td>密码</td><td><form:input id="password" type="password" path="password" placeholder="最长8位"/></td></tr>
<tr><td>邮箱</td><td><form:input id="email" type="text" path="email" placeholder="邮箱"/><td><div class="vitualButton" id="getVerificationCode">获取验证码</div></td></tr>
<tr><td>验证码</td><td><input id="code" type="text" name="code" placeholder="验证码"/></td></tr>
<tr><td colspan="2"><input type="submit" value="提交"></td></tr>
</table>
</form:form>
</div>