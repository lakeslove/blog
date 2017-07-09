<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var test=${user};
var jsonStr = eval(test);
    
//  var jsonStr = eval(str1);
  
  alert(jsonStr.age)

</script>
</head>
<body>
java<br>
name of user : ${userName}


<%-- <spring:hasBindErrors name="save.htm">
    <c:if test="${errors.fieldErrorCount > 0}">
        Modelエラー：<br/>
        <c:forEach items="${errors.fieldErrors}" var="error">
            <spring:message var="message" code="${error.code}"
            	arguments="${error.arguments}" text="${error.defaultMessage}"/>
            ${error.field}------${message}<br/>
        </c:forEach>
    </c:if>
    <c:if test="${errors.globalErrorCount > 0}">
        グローバル エラー：<br/>
        <c:forEach items="${errors.globalErrors}" var="error">
            <spring:message var="message" code="${error.code}" arguments="${error.arguments}" text="${error.defaultMessage}"/>
            <c:if test="${not empty message}">
                ${message}<br/>
            </c:if>
        </c:forEach>
    </c:if>
</spring:hasBindErrors> --%>
<%-- <spring:hasBindErrors name="formtest.htm">
    <c:if test="${errors.fieldErrorCount > 0}">
        Modelエラー：<br/>
        <c:forEach items="${errors.fieldErrors}" var="error">
            <spring:message var="message" code="${error.code}"
            	arguments="${error.arguments}" text="${error.defaultMessage}"/>
            ${error.field}------${message}<br/>
        </c:forEach>
    </c:if>
    <c:if test="${errors.globalErrorCount > 0}">
        グローバル エラー：<br/>
        <c:forEach items="${errors.globalErrors}" var="error">
            <spring:message var="message" code="${error.code}" arguments="${error.arguments}" text="${error.defaultMessage}"/>
            <c:if test="${not empty message}">
                ${message}<br/>
            </c:if>
        </c:forEach>
    </c:if>
</spring:hasBindErrors> --%>
<div><spring:hasBindErrors name="user">
	
	<c:forEach items="${errors.allErrors }" var = "error" varStatus="index" >
		${error.defaultMessage }
	</c:forEach>
</spring:hasBindErrors></div>

<%-- <form:form modelAttribute="user" action="save.htm" method = "post">

	<table>
		<tr>
			<td>id</td>
			<td><form:input path="id"/></td>
			<td><form:errors path="id" /></td>
		</tr>
		<tr>
			<td>name</td>
			<td><form:textarea path="name"/></td>
			<td><form:errors path="name" /></td>
		</tr>
		<tr>
			<td>age</td>
			<td><form:input path="age"/></td>
			<td><form:errors path="age" /></td>
		</tr>
	</table>
	<input type="submit"/>
</form:form> --%>





</body>
</html>