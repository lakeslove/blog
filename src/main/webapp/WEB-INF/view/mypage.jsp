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
	myEssayList(1);
	
});
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
				"<td>"+resultList[i].title+"</td>"+
				"<td>"+resultList[i].flag+"</td>"+
				"<td>"+$.timeStampToDate(resultList[i].createDate)+"</td>"+
				"<td>"+"<a href='editblog.htm?id="+resultList[i].id+"'>编辑</a>"+"</td>"+
				"<td>"+"<a href='deleteUser.htm?userId="+resultList[i].id+"'>删除</a>"+"</td>"+
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
		        success:function(data){
		        	$("#resultPages").html(data.pagesString);
		 		   	$("#resultNumbers").html(data.numString);
		        }
			})
		}else{
	   		$("#myEssayListTbody").html("");
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
</script>
<style>
.leftBlock{
    position: relative;
    width: 20%;
    background: #e1eff1;
    height: 500px;
    padding:10px;
}
#personalData tr{
	height:40px;
}
#personalData .firstTd{
	width:60px;
}

.personalBlogList{
	padding:10px;
	width:72%;
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
<div class="blocks">
<div class="col leftBlock">
<table id="personalData">
<tr><td colspan="2" class="tdTextCenter">个人主页</td></tr>
<tr><td class="firstTd">昵称</td><td>${user.getName()}</td></tr>
<tr><td>标语</td><td>${user.getSlogan()}</td></tr>
<%-- <tr><td>兴趣</td><td>${userMessage.getInterest()}</td></tr> --%>
<tr><td colspan="2"><a href="setting.htm">设置</a></td></tr>
</table>
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
<table>
<tr>
<td><div id="resultPages"></div></td>
<td style="width:100px"></td>
<td><div id="resultNumbers"></div></td>
</tr>
</table>

</div>
</div>