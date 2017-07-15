<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<tiles:importAttribute name="title" scope="request"/>
<tiles:importAttribute name="css" scope="request"/>
<tiles:importAttribute name="js" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<title><spring:message code="${title}"/></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Security-Policy" content="default-src 'self';img-src 'self' data:;script-src 'self' 'unsafe-inline' 'unsafe-eval';style-src 'self' 'unsafe-inline' 'unsafe-eval'">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="Keywords" content="" />
<script src="${pageContext.request.contextPath}/javascript/jquery/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/javascript/main.js"></script>
<link href="${pageContext.request.contextPath}/style/main.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
<c:if test="${!empty css}">
<link href="<tiles:getAsString name="css"/>" type="text/css" rel="stylesheet" />
</c:if>
<c:if test="${!empty js}">
<script src="<tiles:getAsString name="js"/>"></script>
</c:if>
<tiles:insertAttribute name="message"/>
</head>
<body>
<div class="container"><tiles:insertAttribute name="header"/></div>
<div class="container"><tiles:insertAttribute name="body"/></div>
<div class="container footer"><tiles:insertAttribute name="footer"/></div>
</body>
</html>