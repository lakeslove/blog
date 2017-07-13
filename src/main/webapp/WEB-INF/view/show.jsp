<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="${pageContext.request.contextPath}/style/showEssay.css" type="text/css" rel="stylesheet"/>
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
width:500px;
min-height:300px;
}
</style>

<div class="blocks">
<br>

<br>
<div class="content_center">
	<div class="title_input"><c:out value="${essay.getTitle()}"/>
		<div class="nowDate_div">时间: <fmt:formatDate value="${essay.getCreateDate()}" type="date" pattern="yyyy/MM/dd"/></div>
	</div>
	${content}
	<%-- <c:out value="${essay.getEssayContent().getContent()}"/> --%>
</div>
</div>