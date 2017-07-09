<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="javascripts/pictureUtil.js"></script>
<script>
$(document).ready(function() {
	$.changeSelectedNav("nav-others-id");
});
// 设置绘图环境  
function getPostion(){
    var img_x = $("#positon_x").val();
    var img_y = $("#positon_y").val();
    var img_w = $("#positon_w").val();
    var img_h = $("#positon_h").val();
    var img_angle = $("#positon_angle").val();
    var position = {
        "x":img_x,
        "y":img_y,
        "w":img_w,
        "h":img_h,
        "angle":img_angle
    }
    return position;
}
function setCutPosition(){
    var postion = getPostion();
    $("#testImg").css({
        "-webkit-transform":"rotate("+postion.angle+"deg)"
    });
    var cutDiv = $("#cutDiv");
    cutDiv.css({
        "top":postion.y+"px",
        "left":postion.x+"px",
        "width":postion.w+"px",
        "height":postion.h+"px",
        "border":"solid 1px red"
    })
}
function createString(){
    var postion = getPostion();
    var img = document.getElementById("testImg");
    var imgString = pictureUtil.imgString(img,postion.x,postion.y,postion.w,postion.h,postion.angle);
    $("#testImg2").attr("src",imgString);
}
</script>
<style>
.imgBlock{
position:relative;
margin:50px;
width:200px;
height:200px;
border:red solid 1px;
}
#testImg {
	top: 0px;
	left: 0px;
}
#cutDiv{
position: absolute;
}

#testImg2 {
}

#inputTable {
	position: absolute;
	top: 50px;
	left: 320px;
}
.blocks{
position:relative;
height:600px;
}

</style>
<div class="blocks_title">JS小例子</div>
<div class="blocks">
	<div class="imgBlock">
	<img src = "images/model.jpg" id="testImg">
    <div id="cutDiv"></div>
	</div>
	<div class="imgBlock">
    <img src = "" id="testImg2">
    </div>
    <table id="inputTable">
        <tr><td>x:</td><td><input id="positon_x" value="-50"/></td></tr>
        <tr><td>y:</td><td><input id="positon_y" value="50"/></td></tr>
        <tr><td>w:</td><td><input id="positon_w" value="100"/></td></tr>
        <tr><td>h:</td><td><input id="positon_h" value="100"/></td></tr>
        <tr><td>angle:</td><td><input id="positon_angle" value="45"/></td></tr>
        <tr><td>set</td><td><button onclick="setCutPosition()">set</button></td></tr>
        <tr><td>cut</td><td><button onclick="createString()">cut</button></td></tr>
    </table>
</div>
