<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(document).ready(function() {
	$.changeSelectedNav("nav-files-id");
});
</script>
<div class="blocks">
<a href="filesList.htm"><div class="block">上传下载</div></a>
<div class="block">照片</div>
<div class="block">pdf</div>
<div class="block">csv</div>
<div class="block">excel</div>
<div class="block">断点续传</div>
</div>
