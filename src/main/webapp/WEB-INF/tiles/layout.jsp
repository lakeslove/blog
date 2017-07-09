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
<meta http-equiv="Content-Security-Policy" content="default-src 'self';img-src 'self' data:;script-src 'self' 'unsafe-inline' 'unsafe-eval';style-src 'self' 'unsafe-inline' 'unsafe-eval'">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="Keywords" content="" />
<script src="javascript/jquery/jquery-3.1.1.min.js"></script>
<script src="javascript/main.js"></script>
<link href="style/main.css" type="text/css" rel="stylesheet" />
<c:if test="${!empty css}">
<link href="<tiles:getAsString name="css"/>" type="text/css" rel="stylesheet" />
</c:if>
<c:if test="${!empty js}">
<script src="<tiles:getAsString name="js"/>"></script>
</c:if>
</head>
<body>
<div id="position" style="position:relative">
<div class="header"><tiles:insertAttribute name="header"/></div>
<div class="contenter"><tiles:insertAttribute name="body"/></div>
<div class="footer"><tiles:insertAttribute name="footer"/></div>
</div>
</body>
</html>