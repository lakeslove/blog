//调用示例
//必须的变量 nowPage,numPerPage,sizeOfAll,methodName,success
//可选的变量 num,prePagesString,preNumString
//	pageUtils.pageHelper({
//        nowPage:19,
//        numPerPage:9,
//        sizeOfAll:234,
//        methodName:"test",
//        num:6,
//        prePagesString:"翻页:",
//        preNumString:"条目:",
//        success:function(data){
//            alert(data.pagesString);
//            document.getElementById("pages").innerHTML=data.pagesString;
//            alert(data.numString);
//            document.getElementById("nums").innerHTML=data.numString;
//        }
//    });
//
//    function test(page){
//        alert(page)
//    }
//添加入jquery示例
//jQuery.extend({
//    pageHelper:pageHelper,
//    pageUtils:pageUtils
//});
var pageUtils ={
    pageHelper:pageHelper
}
//必须的变量 nowPage,numPerPage,sizeOfAll,methodName,success
//可选的变量 num,prePagesString,preNumString
function pageHelper(settings){
    //为了兼容ie9,所以变量需要预先定义值
        var nowPage=settings.nowPage;
        var numPerPage=settings.numPerPage;
        var sizeOfAll=settings.sizeOfAll;
        var methodName =settings.methodName;
        var type=settings.type;
        var Num = 5;
        var pagesString = "";
        var numString = "";
        var data={};
        if(settings.num!=undefined||settings.num>0){
            Num = settings.num;
        }
        if(settings.prePagesString!=undefined){
            pagesString=settings.prePagesString;
        }
        if(settings.preNumString!=undefined){
            numString=settings.preNumString;
        }
         
        if(typeof settings.success=="function"){
        	switch(type){
        	case 1:
        		createSimplePagesString();
        	break;
        	default:
        		createBootstrapPageString();
        	break;
        	}
            settings.success(data);
        }
        
        function createSimplePagesString(){
            //获取翻页
        	var sumpage = sizeOfAll%numPerPage==0?parseInt(sizeOfAll/numPerPage):parseInt(sizeOfAll/numPerPage)+1; 
            var startPage = parseInt((nowPage-1)/Num)*Num+1; var endPage = (startPage +Num-1)>sumpage?sumpage:startPage +Num-1;
            if(nowPage>Num){ 
                pagesString = pagesString+'<a style="color:blue;" onclick="'+methodName+'('+1+')">首页</a>　'; 
                var preStartPage=startPage-Num; 
                pagesString = pagesString+'<a style="color:blue;" onclick="'+methodName+'('+preStartPage+')">上一页</a>　';
            } 
            for(var i=startPage;i<=endPage;i++){ 
                if(i==nowPage){ 
                    pagesString=pagesString +i+ '　'; 
                }else{ 
                    pagesString=pagesString + '<a style="color:blue;" onclick="'+methodName+ '('+i+ ')">'+i+ '</a>　'; 
                } 
            } 
            if((startPage+Num-1)<sumpage){ 
                var nextStartPage=startPage+Num; 
                pagesString=pagesString + '<a style="color:blue;" onclick="'+methodName+ '('+nextStartPage+ ')">下一页</a>　';
                pagesString=pagesString + '<a style="color:blue;" onclick="'+methodName+ '('+sumpage+ ')">尾页</a>'; 
            } 
            //获取条目
            var startSize=parseInt((nowPage-1))*numPerPage+1; 
            var endSize=(startSize +numPerPage-1)<sizeOfAll?(startSize +numPerPage-1):sizeOfAll; 
            numString=numString + startSize + " - " + endSize; 
            numString=numString + " / " +sizeOfAll; 
            //将结果放进data对象中
            data["pagesString"] = pagesString;
            data["numString"] = numString;
        }
        
        function createBootstrapPageString(){
        	var sumpage = sizeOfAll%numPerPage==0?parseInt(sizeOfAll/numPerPage):parseInt(sizeOfAll/numPerPage)+1;
    		if(sumpage<2){
    			return '<ul class="pagination"><li><span style="border:1px solid #fff;"></span></li></ul>';
    		}
    		var Num = 5;
    		var pagesString = '<ul class="pagination">';
    		var startPage = parseInt((nowPage-1)/Num)*Num+1;
    		var endPage = (startPage +Num-1)>sumpage?sumpage:startPage +Num-1;
    		if(nowPage>Num){
    			pagesString = pagesString+'<li><a onclick="'+methodName+'('+1+')"><span>首页</span></a></li>';
    			var preStartPage=startPage-Num;
    			pagesString = pagesString+'<li><a onclick="'+methodName+'('+preStartPage+')"><span>&laquo;</span></a></li>';
    		}else{
    			pagesString = pagesString+'<li class="disabled"><span aria-hidden="true">首页</span></li>';
    			var preStartPage=startPage-Num;
    			pagesString = pagesString+'<li class="disabled"><span aria-hidden="true">&laquo;</span></li>';
    		}
    		for(var i=startPage;i<=endPage;i++){
    			if(i==nowPage){
    				pagesString =pagesString +'<li class="active"><span>'+i+'</span></li>'
    			}else{
    				pagesString =pagesString +'<li><a onclick="'+methodName+'('+i+')"><span>'+i+'</span></a></li>';
    			}
    		}
    		if((startPage+Num-1)<sumpage){
    			var nextStartPage=startPage+Num;
    			pagesString =pagesString +'<li><a onclick="'+methodName+'('+nextStartPage+')"><span>&raquo;</span></a></li>';
    			pagesString =pagesString +'<li><a onclick="'+methodName+'('+sumpage+')"><span>末页</span></a></li>';
    		}else{
    			var nextStartPage=startPage+Num;
    			pagesString =pagesString +'<li class="disabled"><span aria-hidden="true">&raquo;</span></li>　';
    			pagesString =pagesString +'<li class="disabled"><span aria-hidden="true">末页</span></li>';
    		}
    		pagesString = pagesString + "</ul>";
    		//将结果放进data对象中
            data["pagesString"] = pagesString;
            data["numString"] = "";
    	}
}

