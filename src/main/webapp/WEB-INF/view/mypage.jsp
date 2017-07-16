<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="${pageContext.request.contextPath}/javascript/pageUtils.js"></script>
<script>
$(document).ready(function() {
	$("#personalData .row div:even").addClass("col-sm-4 col-sm-12");
	$("#personalData .row div:odd").addClass("col-sm-8 col-sm-12");
	myEssayList(1);
});
function setLeftBlockHeight(){
	var heightTmp = $("#blocksDiv").css("height");
	$("#leftBlock").css("height",heightTmp);
}
function myEssayList(page) {
	var searchFormData = $('#searchUsersForm').serialize();
	var tempData = '&currentPage=' + page;
	$.AJAX({
		url :  "myEssayList.htm",
		type : "get",
		data : tempData,
		dataType: "json",
		success : function(data) {
			showDatasInTable(data);
		}
	});
}
function showDatasInTable(data){
	var sizeInCurrentPage = data.sizeInCurrentPage;
	var sizeOfAll = data.sizeOfAll;
	var sumPage = data.sumPage;
	var resultList = data.listInCurrentPage;
	var page=data.currentPage;
	var perPageNum = data.perPageNum;
	var startNo = (page-1)*perPageNum+1;
	var insertTds = "";
	if(sizeOfAll>0){
		for(var i =0;i<resultList.length;i++){
			resultList[i] = $.JSONobjectConvert(resultList[i]);
			var teminsertTds =
				"<tr class='list-content-datas'>"+
				"<td>"+(i+startNo)+"</td>"+
				"<td>"+"<a target='_blank' href='../show.htm?id="+resultList[i].id+"'>"+resultList[i].title+"</a>"+"</td>"+
				"<td>"+$.flagToLabel(resultList[i].flag)+"</td>"+
				"<td>"+$.timeStampToDate(resultList[i].createDate)+"</td>"+
				"<td>"+"<a href='editblog.htm?id="+resultList[i].id+"'>编辑</a>"+"</td>"+
				"<td>"+"<a onclick='deleteBlog("+resultList[i].id+")'>删除</a>"+"</td>"+
				"</tr>"
				insertTds = insertTds+teminsertTds;
		}
		$("#myEssayListTbody").html(insertTds);
		if(sumPage>1){
			pageUtils.pageHelper({
				nowPage:page,
		        numPerPage:perPageNum,
		        sizeOfAll:sizeOfAll,
		        methodName:"myEssayList",
		        type:1,
		        success:function(data){
		        	$("#resultPages").html(data.pagesString);
		 		   	$("#resultNumbers").html(data.numString);
		        }
			})
		}else{
			$("#resultPages").html("");
 		   	$("#resultNumbers").html("");
		}
		trColor();
	}
}
function turnPage(page){
	myEssayList(page);
}
function trColor(){
	$("#myEssayListTbody tr:odd").css("background","#e1eff1");
}
function deleteBlog(id){
	var r=confirm("你确定要删除此博客吗？");
	if (r==false){
		return false;  
	}
	window.location.href="deleteblog.htm?id="+id;
}
</script>
<style>
.leftBlock{
    position: relative;
    width: 20%;
    background: #e1eff1;
    height: 500px;
    padding:10px;
}
#personalData >div >div{
	height:36px;
}
#personalData .firstTd{
	width:60px;
}
#personalData{
margin:0 auto;
}

.personalBlogList{
	padding:10px;
	width:78%;
}
.personalBlogList table{
	width:100%;
}
.tdTextCenter{
	text-align: center;
}

.personalBlogList tr{
	height:35px;
}
#trBlogList{
	background-color: bisque;
}
</style>
<div class="blocks" id ="blocksDiv">
<div id="leftBlock" class="col leftBlock">
<div id="personalData" class="row">
<div ><div class="tdTextCenter">个人主页</div></div>
<div class="row"><div class="firstTd">昵称</div><div>${user.getName()}</div></div>
<div class="row"><div>标语</div><div>${user.getSlogan()}</div></div>
<%-- <tr><td>兴趣</td><td>${userMessage.getInterest()}</td></tr> --%>
<div class="row"><div><a href="setting.htm">设置</a></div></div>
</div>
</div>
<div class="col personalBlogList">
<table>
<tr><td colspan="6" class="tdTextCenter">博客列表</td></tr>
<tr><td colspan="2" ><a href="newblog.htm">写博客</a></td></tr>
<tr id="trBlogList">
<td style="width:10%">No.</td>
<td style="width:35%">博客</td>
<td style="width:15%">类别</td>
<td style="width:20%">创作时间</td>
<td style="width:10%">编辑</td>
<td style="width:10%">删除</td></tr>
<tbody id="myEssayListTbody"></tbody>
</table>
<div class="row">
<div id="resultPages" class=" col-sm-8 col-xs-12"></div>
<div id="resultNumbers" class="col-sm-4 col-xs-12" ></div>
<!-- <div id="resultPages"></div>
<div id="resultNumbers" ></div> -->
</div>
</div>
</div>