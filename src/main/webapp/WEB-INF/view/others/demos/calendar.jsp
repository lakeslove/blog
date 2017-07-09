<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="javascripts/calendar.js"></script>
<script>
$(document).ready(function() {
	$.changeSelectedNav("nav-others-id");
});
</script>
<div class="blocks">
<br>
这不是一个成功的日历，因为调用方法很蛋痛，<br>
需要设置calendar="calendar" id="m_inputtext_id"，<br>
需要设置id这就不好了，所以这不是一个插件，需要大改<br>
<br>
<input calendar="calendar" id="m_inputtext_id" style="border:solid 1px;"/>
</div>
