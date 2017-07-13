<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/verification.js"></script>
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
	var name = $("#slogan").val();
	if(name.length>20){
		alert("标语太长");
		return false;
	}
	return true;
}
</script>
<div class="blocks">
<div class="content_center">
<div class="blocks_title textCentet">个人信息设定</div>
<br>
<br>
<form:form id="settingForm" modelAttribute="user" action="setting.htm" method="post" onsubmit="return allSubmit(checkParameters);">
<table class="table-margin-left">
<c:if test="${!empty validateError } ">
<tr><td colspan="2"><span class="errorText"><c:out value="${validateError}"/></span></td></tr>
</c:if>
<tr><td>用户名</td><td><form:input id="name" type="text" path="name" placeholder="最长6位"/></td></tr>
<tr><td>密码</td><td><form:input id="password" type="password" path="password" placeholder="最长8位"/></td></tr>
<tr><td>标语</td><td><form:input id="slogan" type="text" path="slogan" placeholder="标语"/></td></tr>
<tr><td colspan="2"><input type="submit" value="提交"></td></tr>
</table>
</form:form>
</div>
</div>