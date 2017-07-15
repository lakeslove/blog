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
	$.changeSelectedNav("nav-poem-id");
	essayList(1);
	
});
function essayList(page) {
	var searchFormData = $('#searchUsersForm').serialize();
	var tempData = '&currentPage=' + page + '&flag=' + 1;
	$.AJAX({
		url :  "essaylist.htm",
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
				"<td>"+"<a target='_blank' href='show.htm?id="+resultList[i].id+"'>"+resultList[i].title+"</a>"+"</td>"+
				"<td>"+$.flagToLabel(resultList[i].flag)+"</td>"+
				"<td>"+$.timeStampToDate(resultList[i].createDate)+"</td>"+
				"</tr>"
				insertTds = insertTds+teminsertTds;
		}
		$("#essayListTbody").html(insertTds);
		if(sumPage>1){
			pageUtils.pageHelper({
				nowPage:page,
		        numPerPage:perPageNum,
		        sizeOfAll:sizeOfAll,
		        methodName:"essayList",
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
	$("#essayListTbody tr:odd").css("background","#e1eff1");
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
<div class="content_center">
<div class="col personalBlogList">
<table>
<tr id="trBlogList">
<td style="width:10%">No.</td>
<td style="width:40%">博客</td>
<td style="width:20%">类别</td>
<td style="width:30%">创作时间</td>
<tbody id="essayListTbody"></tbody>
</table>
<table>
<tr>
<td><div id="resultPages"></div></td>
<!-- <td style="width:100px"></td>
<td><div id="resultNumbers"></div></td> -->
</tr>
</table>
</div>
</div>
</div>