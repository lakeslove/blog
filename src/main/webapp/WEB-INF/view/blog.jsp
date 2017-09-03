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
	
});
function checkParameters(){
	var flag = $("#flag").val();
	if(flag!=0&&flag!=1&&flag!=2&&flag!=3){
		$("#errorText").html(messageError["error.input.flag.error"]);
		return false;
	}
	return true;
}
</script>
<style>
.blogContent{
width:100%;
min-height:500px;
}
</style>

<div class="blocks">
<div class="content_center">
<form:form id="saveBlog" modelAttribute="essay" action="saveblog.htm" method="post" onsubmit="return allSubmit(checkParameters);">
<form:input path="id" type="title" cssClass="hidden"/>
<table style="width:100%">
<tr><td colspan="2"><span id="errorText" class="errorText">
${errorText}
</span></td></tr>
<tr><td>标题</td><td><form:input id="title" type="text" path="title" placeholder="标题"/></td></tr>
<tr>
<td>类别</td>
<td><form:select id="flag" path="flag" items="${select}" itemLabel="label"  
        itemValue="value"></form:select> </td>
</tr>
<tr>
<td colspan="2">
<%-- <form:textarea path="content" rows="" cols="" cssClass="blogContent"></form:textarea> --%>
<textarea name="content" rows="" cols="" class="blogContent"><c:out value="${content}"></c:out></textarea>
</td>
</tr>
<tr><td colspan="2"><input type="submit" value="保存"></td></tr>
</table>
</form:form>
</div>
</div>