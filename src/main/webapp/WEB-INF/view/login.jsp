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
	
});
function checkParameters(){
	var email = $("#email").val();
	if(!isEmail(email)){
		$("#errorText").html(messageError["error.email.format"]);
		return false;
	}
	return true;
}
</script>
<div class="blocks">
<div class="content_center">
<form:form id="loginForm" modelAttribute="user" action="login.htm" method="post" onsubmit="return allSubmit(checkParameters);">
<table class="table-margin-left">
<tr><td colspan="2"><span id="errorText" class="errorText">
${validateError}
</span></td></tr>
<tr><td>邮箱</td><td><form:input id="email" type="email" path="email" placeholder="邮箱"/></td><td><form:errors path="email" cssClass="errorText"/></td></tr>
<tr><td>密码</td><td><form:input id="password" type="password" path="password" placeholder="最长8位"/></td></tr>
<tr><td colspan="2"><input type="submit" value="登录"></td></tr>
</table>
</form:form>
</div>
</div>