
/**
 * 所有页面初始化时都要执行的函数
 */
$(document).ready(function(){
	//禁用所有的input的按回车就提交功能
	$("input").attr("onkeydown","if(event.keyCode==13){return false;}");
	//ajax预处理
	$.ajaxPretrate();
})

/**
 * ajax预处理
 */
jQuery.extend({ajaxPretrate:function(){
	$(document).ajaxSend(function(event,XMLHttpRequest,options){
//		XMLHttpRequest.setRequestHeader(, );
	}).ajaxStart(function() {
//		$.forbidALL();
	}).ajaxSuccess(function(event, XMLHttpRequest, ajaxOptions) {
//		$.ajaxSuccessException(event, XMLHttpRequest, ajaxOptions);
	}).ajaxError(function(event, XMLHttpRequest, ajaxOptions, thrownError) {
//		$.ajaxErrorException(event, XMLHttpRequest, ajaxOptions);
	}).ajaxComplete(function() {
//		$.allowAll();
	});
}});

jQuery.extend({changeSelectedNav:function(id){
//	$("#"+id).css("color","white");
	$("#"+id).parent("li").addClass("active")
}});

jQuery.extend({timeStampToDate:function(timeStamp){
	var newdate = new Date();
	newdate.setTime(timeStamp);
	return newdate.toLocaleDateString();
}});

jQuery.extend({flagToLabel:function(flag){
	var label;
	switch(flag){
	case 0:
		label = "散文";
		break;
	case 1:
		label = "诗歌";
		break;
	case 2:
		label = "小说";
		break;
	case 3:
		label = "随笔";
		break;
	default:
		label = "散文";
		break;
	}
	return label;
}});

//对ajax的封装
jQuery.extend({AJAX:function(settings){
	if (settings.url.indexOf('?') != -1) {
		settings.url = settings.url + '&random=' + Math.random();
	} else {
		settings.url = settings.url + '?random=' + Math.random();
	}
	if(settings.type==undefined){
		settings.type="GET";
	}
	if(settings.async==undefined){
		settings.async=true;
	}
	if(settings.dataType==undefined){
		settings.dataType="json";
	}
	$.ajax({
		url :  settings.url,
		type : settings.type,
		data : settings.data,
		cache: false,
		async : settings.async,
		scriptCharset: 'utf-8',
		dataType: settings.dataType,
		success : function(data) {
			settings.success(data);
		}
	});
}});


/**
 * 递归循环来对一个js对象进行转义
 */
jQuery.extend({objectConvert:function(o){
	for(var name in o){
		if(o[name]==null){
			o[name] = "";
		}else{
			if(typeof o[name] =="object"){
				$.objectConvert(o[name]);
			}else{
				o[name] = $.stringConvert(o[name]);
			}
		}
	}
	return o;
}});

/**
 * 对一个字符串进行转义
 */
jQuery.extend({stringConvert:function(string){
	if (string != null&&(typeof string === "string")) {
		string = string.replace(/&/ig, "&amp;");
		string = string.replace(/ /ig, "&nbsp;");
		string = string.replace(/</ig, "&lt;");
		string = string.replace(/>/ig, "&gt;");
		string = string.replace(/'/ig, "&apos;");
		string = string.replace(/"/ig, "&quot;");
        string = string.replace(/\r\n|\r|\n|\n\r/ig, "<br>");
		string = string.replace(/'\'/g, "&#92;");
	}
	if(string==null){
		string = "";
	}
	return string;
}});

/**
 * 递归循环来对一个JSON对象进行转义
 */
jQuery.extend({JSONobjectConvert:function(o){
	for(var name in o){
		if(o[name]==null){
			o[name] = "";
		}else{
			if(typeof o[name] =="object"){
				$.objectConvert(o[name]);
			}else{
				o[name] = $.JSONstringConvert(o[name]);
			}
		}
	}
	return o;
}});

/**
 * 对一个JSON字符串进行转义
 */
jQuery.extend({JSONstringConvert:function(string){
	if (string != null&&(typeof string === "string")) {
		string = string.replace(/ /ig, "&nbsp;");
		string = string.replace(/'/ig, "&apos;");
        string = string.replace(/\r\n|\r|\n|\n\r/ig, "<br>");
		string = string.replace(/'\'/g, "&#92;");
	}
	if(string==null){
		string = "";
	}
	return string;
}});

function allSubmit(fun){
//	j$.forbidALL();
	try{
		var temResult = fun();
		if(temResult){
			console.log("the result of temFunction()："+temResult);
//			j$.forbidALL();
		}else{
//			j$.allowAll();
		}
		return temResult;
	}catch(e){
		console.log(e)
		return false;
	}
}