<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(document).ready(function() {
	$.changeSelectedNav("nav-others-id");
	$("#gunGame").click(function(){
		$("#showDiv").load("html/gunGame.html");
	});
	$("#canvasCar").click(function(){
		$("#showDiv").load("html/car_canvas.html");
	});
	$("#cssCar").click(function(){
		$("#showDiv").load("html/car_css3.html");
	});
	$("#cssClock").click(function(){
		$("#showDiv").load("html/clock.html");
	});
});
</script>
<style>
.blocks{
position:relative;
}
</style>
<button class="blocks_title" id="gunGame">canvas射击游戏</button>
<button class="blocks_title" id="canvasCar">canvas小车动画</button>
<button class="blocks_title" id="cssCar">CSS小车动画</button>
<button class="blocks_title" id="cssClock">CSS钟表动画</button>
<button class="blocks_title" id="svgPicture">SVG画板</button>
<div class="blocks" id="showDiv"></div>


