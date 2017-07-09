<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="javascripts/pageUtils.js"></script>
<script>
$(document).ready(function() {
	$.changeSelectedNav("nav-datas-id");
	$("#searchUsersButton").click(function(){
		searchAdminUserList(1);
	})
});
function searchAdminUserList(page) {
	var searchFormData = $('#searchUsersForm').serialize();
	var tempData = searchFormData + ('&currentPage=' + page);
	$.AJAX({
		url :  "searchUsers.htm",
		type : "post",
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
				"<td>"+resultList[i].id+"</td>"+
				"<td>"+resultList[i].name+"</td>"+
				"<td>"+resultList[i].slogan+"</td>"+
				"<td>"+"<a href='editUser.htm?userId="+resultList[i].id+"'>编辑</a>"+"</td>"+
				"<td>"+"<a href='deleteUser.htm?userId="+resultList[i].id+"'>删除</a>"+"</td>"+
				"</tr>"
				insertTds = insertTds+teminsertTds;
		}
		$("#searchUsersResult").html(insertTds);
		if(sumPage>1){
			pageUtils.pageHelper({
				nowPage:page,
		        numPerPage:perPageNum,
		        sizeOfAll:sizeOfAll,
		        methodName:"turnPage",
		        success:function(data){
		        	$("#searchUsersResultPages").html(data.pagesString);
		 		   	$("#searchUsersResultNumbers").html(data.numString);
		        }
			})
		}else{
			$("#bodyTurnPageTop").html("");
	   		$("#bodyTurnPage").html("");
		}
	}
}
function turnPage(page){
	searchAdminUserList(page);
}
</script>
<style>
#searchUsersResultPagesDiv{
}
.dataListTable{
border-collapse: collapse;
}
.dataListTable td{
min-width:100px;
border: 1px solid #666666;
text-align: center;
}
</style>
<div class="small_content">
	<form id="searchUsersForm">
		<table>
			<tr>
				<td colspan="2">数据检索</td>
			</tr>
			<tr>
				<td>用户名:</td>
				<td><input name="name" /></td>
			</tr>
			<tr>
				<td>标语:</td>
				<td><textarea name="slogan" /></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="数据检索"
					id="searchUsersButton" /></td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<br>
	<table><tr><td>数据展示</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><a href="newUser.htm">添加新用户</a></td></tr></table>
	<br>
	<table class="dataListTable">
		<thead>
		<tr>
			<td>No.</td><td>id</td><td>name</td><td>slogan</td><td>编辑</td><td>删除</td>
		</tr>
		</thead>
		<tbody id="searchUsersResult">
		</tbody>
	</table>
	<div class="searchUsersResultPagesDiv">
	<div id="searchUsersResultPages"></div>
	<div id="searchUsersResultNumbers"></div>
	</div>
</div>