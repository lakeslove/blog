<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(document).ready(function() {
	
});
</script>
<style>
#searchUsersResultPagesDiv{
}
</style>
<div class="small_content">
	<form:form id="usersForm" modelAttribute="user" action="saveUser.htm">
	<form:input path="id" class="inputHidden"/>
		<table>
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td>用户名:</td>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><form:input path="password" /></td>
			</tr>
			<tr>
				<td>标语:</td>
				<td><form:textarea path="slogan" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="提交"/></td>
			</tr>
		</table>
	</form:form>
</div>