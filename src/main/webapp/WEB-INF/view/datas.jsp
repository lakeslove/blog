<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(document).ready(function() {
	$.changeSelectedNav("nav-datas-id");
});
</script>
<div class="blocks">
<a href="crud.htm"><div class="block">增删改查</div></a>
<a href=""><div class="block">联表查询</div></a>
<a href=""><div class="block">级联</div></a>
<a href=""><div class="block">其他知识</div></a>
</div>
