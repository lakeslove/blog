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
	var row = $("#registerForm .table-margin-left").children("div");
	row.addClass("row");
	row.find("div").addClass("col-sm-12 col-sm-4");
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
<style>
/* #registerForm .table-margin-left >div .lab{
   text-align:right; 
} */
.formDiv{
width:70%;
margin:0 auto;
}
</style>
<div class="blocks">
<div class="content_center">
<div class="blocks_title textCentet">新用户注册</div>
<form:form id="registerForm" modelAttribute="user" action="register.htm" method="post" onsubmit="return allSubmit(checkParameters);">
<div class="table-margin-left formDiv">
<c:if test="${!empty validateError } ">
<div><div><span class="errorText"><c:out value="${validateError}"/></span></div></div>
</c:if>
<div><div class="lab">用户名</div><div><form:input id="name" type="text" path="name" placeholder="最长6位"/></div></div>
<div><div class="lab">密码</div><div><form:input id="password" type="password" path="password" placeholder="最长8位"/></div></div>
<div><div class="lab">邮箱</div><div><form:input id="email" type="text" path="email" placeholder="邮箱"/></div><div style="text-align:center;"><input type="button" id="getVerificationCode" value="获取验证码"/></div></div>
<div><div class="lab">验证码</div><div><input id="code" type="text" name="code" placeholder="验证码"/></div></div>
<div><br></div>
<div><div></div><div><input type="submit" value="提交"></div></div>
</div>
</form:form>
</div>
</div>