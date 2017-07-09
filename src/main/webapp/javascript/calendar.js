// JavaScript Document
var m_inputtext_id;	
var m_program_div1='⬅';
var m_program_div3='→';
var m_program_div4='↑'			
//window.onload= m_input_traversal;
//加载函数 m_input_traversal()***********************************************
window.onload=m_input_traversal;
function m_input_traversal(){
	var inpu= document.getElementsByTagName("input");                               
	    if(inpu.length>0){
		  for(var i=inpu.length-1;i>=0;i--){    
			   if(inpu[i].getAttribute("calendar")=="calendar") {
					inpu[i].setAttribute("onclick","m_call_program(this)");
                    inpu[i].setAttribute("readonly","readonly");
		        }
		    }
	    }
}

function m_call_program(obj){
    document.body.setAttribute("onmousedown","m_delete_program_judgment()");
	m_program_switch="b";
	m_inputtext_id=obj.getAttribute("id")
	obj.style.color="red";
//	document.getElementById(m_inputtext_id).value="";
		var calendar_adiv=document.createElement("div");
		var calendar_bdiv=document.createElement("div");
		calendar_adiv.id="m_new_div_a";
		calendar_bdiv.id="m_new_div_b";
		calendar_adiv.setAttribute("onMouseOver","m_program_switch_judgment('a')");
		calendar_adiv.setAttribute("onMouseOut","m_program_switch_judgment('b')" ); 
		calendar_bdiv.setAttribute("onMouseOver","m_program_switch_judgment('a')");
		calendar_bdiv.setAttribute("onMouseOut","m_program_switch_judgment('b')" ); 
		calendar_adiv.style.position="absolute";
		calendar_adiv.style.width="15px";
		calendar_adiv.style.height="30px";
		calendar_bdiv.style.position="absolute";
		var leftt = document.getElementById(m_inputtext_id).getBoundingClientRect().left;
		var rightt = document.getElementById(m_inputtext_id).getBoundingClientRect().right;
		var temknow=document.getElementById(m_inputtext_id).getBoundingClientRect();
		var topp=obj.getBoundingClientRect().top;
		var bodyTop=document.body.getBoundingClientRect().top;
		var bodyLeft=document.body.getBoundingClientRect().left;
		var wid=obj.offsetWidth; 
		var w=window.innerWidth;
		var h=window.innerHeight;
		var rightzhen=w-rightt;
		var shu0=3;
		var positionright=rightt+shu0-bodyLeft;
		calendar_adiv.style.left=positionright+"px";
		var shu1=15;
		var positionright2=positionright+shu1;
		calendar_bdiv.style.left=positionright2+"px";
		var positiontop=topp-bodyTop;
		calendar_adiv.style.top=positiontop+"px";
		calendar_bdiv.style.top=positiontop+"px";
		calendar_adiv.innerHTML=m_program_div1;
		document.body.appendChild(calendar_adiv);
		document.body.appendChild(calendar_bdiv);
		m_program_table=document.createElement("table");
		m_program_table.id="m_program_table_id"
        m_calendar(obj)	
}

function m_program_switch_judgment(obj){
 	 m_program_switch=obj;
}

function m_delete_program_judgment(obj){
	 if(m_program_switch=="b"||obj=="b"){
		var childa=document.getElementById("m_new_div_a");
	    var childb=document.getElementById("m_new_div_b");
		document.body.removeChild(childa);
		document.body.removeChild(childb);//alert(1)
		document.getElementById(m_inputtext_id).style.color="black";
	  }
}
function strToDate(str) {
 var dateStrs = str.split("-");
 if(dateStrs.length==3){
	 var year = parseInt(dateStrs[0], 10);
	 var month = parseInt(dateStrs[1], 10) - 1;
	 var day = parseInt(dateStrs[2], 10);
	 var date = new Date(year, month, day);
	 return date;
 }else{
	 return new Date;
 }

}
//---------------------------------------------------------------------日历-------------------------------------------------------------
function m_calendar(obj){
	var calendar_tr1=document.createElement("tr");
    if(obj.value==""){
        calendar_now=new Date;
    }else{
        calendar_now=strToDate(obj.value);
    }
	
	calendar_year=calendar_now.getFullYear();  
	calendar_month=calendar_now.getMonth();   
	calendar_nowmonth=calendar_month+1;          
	calendar_today=calendar_now.getDate();	
	
	var calendar_tr1_td1=document.createElement("td");
	calendar_tr1_td1.innerHTML="◀";
	calendar_tr1_td1.align="center";
	calendar_tr1_td1.setAttribute("onmousedown","calendar_tr1_td1()");
	calendar_tr1_td1.setAttribute("class","lastMnoth");
	calendar_tr1.appendChild(calendar_tr1_td1);
	
	var calendar_tr1_td2=document.createElement("td");
	calendar_tr1_td2.id="calendar_tr1_td2_id";
	calendar_tr1_td2.colSpan="5"; 
	calendar_tr1_td2.style.width="140px";
	calendar_tr1_td2.style.textAlign="center";
	calendar_tr1_td2.innerHTML=calendar_year+'年'+calendar_nowmonth+'月'+calendar_today+'日';
	calendar_tr1_td2.setAttribute("onclick","calendar_tr1_td2()");
	calendar_tr1.appendChild(calendar_tr1_td2);
	
	var calendar_tr1_td3=document.createElement("td");
	calendar_tr1_td3.innerHTML="▶"
	calendar_tr1_td3.align="center"
	calendar_tr1_td3.setAttribute("onclick","calendar_tr1_td3()")
	calendar_tr1_td3.setAttribute("class","lastMnoth");
	calendar_tr1.appendChild(calendar_tr1_td3);
	
	var calendar_tr2=document.createElement("tr");
	for(var i=0;i<7;i++)
	{   var calendar_tr2_td_week=["日","一","二","三","四","五","六"]
		var calendar_tr2_td=document.createElement("td");
		calendar_tr2_td.setAttribute("class","calendar_tr2_td_calss")
		calendar_tr2_td.innerHTML=calendar_tr2_td_week[i];
		calendar_tr2.appendChild(calendar_tr2_td);
	}
	m_program_table.appendChild(calendar_tr1);
	m_program_table.appendChild(calendar_tr2);
	document.getElementById("m_new_div_b").appendChild(m_program_table);
	m_calendar_traversal(calendar_year,calendar_month);
}
//创建日历所有日期*****************************************************************
function m_calendar_traversal(putin_year,putin_month)
{    calendar_tr3_clear() 
	 var calendar_showmonth=new Date(putin_year,putin_month+1,0); 
	 var calendar_endday=calendar_showmonth.getDate();
	 var calendar_showmonth_1=new Date(putin_year,putin_month,1);
	 var calendar_oneday_week=calendar_showmonth_1.getDay();		 
	 var calendar_lastmonth=new Date(putin_year,putin_month,0); 
	 var calendar_lastmonth_endday=calendar_lastmonth.getDate();	 
     var calendar_showmonth_row=Math.ceil((calendar_oneday_week+calendar_endday)/7);
	 var daynumber=0;
	 var calendar_thisyear_thismonth=0
	 for(var i=0;i<calendar_showmonth_row;i++){
		 var calendar_tr3=document.createElement("tr");
		 for(var j=0;j<7;j++){
			 daynumber+=1;
			 var calendar_tr3_td1=document.createElement("td")
			 calendar_tr3_td1.id="calendar_tr3_td1_id_grey";
			 if(daynumber<=calendar_oneday_week){ // alert(calendar_lastmonth_endday-calendar_oneday_week+daynumber) 
				 calendar_tr3_td1.innerHTML=calendar_lastmonth_endday-calendar_oneday_week+daynumber;
				 calendar_tr3.appendChild(calendar_tr3_td1)
			 }
			 else if(daynumber>calendar_oneday_week&daynumber<=(calendar_endday+calendar_oneday_week)){
				 calendar_tr3_td1.innerHTML=daynumber-calendar_oneday_week;
				 calendar_tr3.appendChild(calendar_tr3_td1);
				 calendar_tr3_td1.id="calendar_tr3_td1_id_white"
				 calendar_tr3_td1.setAttribute("onmouseover","calendar_tr3_td1_title_over(this)");
				 calendar_tr3_td1.setAttribute("onmouseout","calendar_tr3_td1_title_out(this)");
				 calendar_tr3_td1.setAttribute("onclick","calendar_tr3_td1_putin(this)");
				 if(daynumber-calendar_oneday_week==calendar_today && putin_month==calendar_month && putin_year==calendar_year){               //标记今天，背景红        
					calendar_tr3_td1.id="calendar_tr3_td1_id_red"
				 }
				 if(j==0 || j==6 ){
					calendar_tr3_td1.style.color="green";
				 }
			 }
			 else{
				 calendar_tr3_td1.innerHTML=daynumber-calendar_oneday_week-calendar_endday;
				 calendar_tr3.appendChild(calendar_tr3_td1);		 
			 }
		 }
		 document.getElementById("m_program_table_id").appendChild(calendar_tr3)
     }
}
//clear the day of calendar**********************
function calendar_tr3_clear(){
	var calendar_showtable=document.getElementById("m_program_table_id");
	var calendar_showtable_tr=calendar_showtable.getElementsByTagName("tr");
	for(var n=2;n<calendar_showtable_tr.length;){             //写成：for(var n=2;n<calendar_showtable_tr.length;n++)是错误的，因为length本身会变小。
	   calendar_showtable.removeChild(calendar_showtable_tr[n]);   //alert("calendar_showtable_tr.length执行后="+calendar_showtable_tr.length)
	}
}	 
//日历功能函数***************************************************************************************************************
//lastmonth**************************
function calendar_tr1_td1(){  
	calendar_now.setFullYear(calendar_now.getFullYear(),calendar_now.getMonth()-1,calendar_now.getDate());
	m_calendar_traversal(calendar_now.getFullYear(),calendar_now.getMonth())
	if(calendar_now.getMonth()==calendar_month && calendar_now.getFullYear()==calendar_year){
		    document.getElementById("calendar_tr1_td2_id").innerHTML=calendar_now.getFullYear()+"年"+(calendar_now.getMonth()+1)+"月"+calendar_now.getDate()+"日"	
		}
		else{
		document.getElementById("calendar_tr1_td2_id").innerHTML=calendar_now.getFullYear()+"年"+(calendar_now.getMonth()+1)+"月"
		}
}
//return now month************************
function calendar_tr1_td2(){
	calendar_now=new Date;
	document.getElementById("calendar_tr1_td2_id").innerHTML=calendar_now.getFullYear()+"年"+(calendar_now.getMonth()+1)+"月"+calendar_now.getDate()+"日"	
	m_calendar_traversal(calendar_now.getFullYear(),calendar_now.getMonth())
}
//next month*****************************
function calendar_tr1_td3(){
	calendar_now.setFullYear(calendar_now.getFullYear(),calendar_now.getMonth()+1,calendar_now.getDate());
	if(calendar_now.getMonth()==calendar_month && calendar_now.getFullYear()==calendar_year){
		    document.getElementById("calendar_tr1_td2_id").innerHTML=calendar_now.getFullYear()+"年"+(calendar_now.getMonth()+1)+"月"+calendar_now.getDate()+"日"	
		}
		else{
		document.getElementById("calendar_tr1_td2_id").innerHTML=calendar_now.getFullYear()+"年"+(calendar_now.getMonth()+1)+"月"
		}
	m_calendar_traversal(calendar_now.getFullYear(),calendar_now.getMonth())
}
//鼠标放上时颜色变红并在标题栏显示日期****
function calendar_tr3_td1_title_over(q){
	document.getElementById("calendar_tr1_td2_id").innerHTML=calendar_now.getFullYear()+"年"+(calendar_now.getMonth()+1)+"月"+q.innerHTML+"日"
    q.style.backgroundColor="pink";
}
//鼠标离开时颜色变白并变回原来的日期*******
function calendar_tr3_td1_title_out(q){
	if(q.innerHTML==calendar_today && calendar_now.getMonth()==calendar_month && calendar_now.getFullYear()==calendar_year){
	    q.style.backgroundColor="red";
	}
	else{
	    q.style.backgroundColor="#e6e6e6";
		if(calendar_now.getMonth()==calendar_month && calendar_now.getFullYear()==calendar_year){
		    document.getElementById("calendar_tr1_td2_id").innerHTML=calendar_now.getFullYear()+"年"+(calendar_now.getMonth()+1)+"月"+calendar_now.getDate()+"日"	
		}
		else{
		document.getElementById("calendar_tr1_td2_id").innerHTML=calendar_now.getFullYear()+"年"+(calendar_now.getMonth()+1)+"月"
		}
	}
}
//鼠标点击时将此日期输入进inputtext里**********
function calendar_tr3_td1_putin(q){
    document.getElementById(m_inputtext_id).value="";
    var month_temp_input=calendar_now.getMonth()+1;
    if(month_temp_input<10){
    	month_temp_input="0"+month_temp_input;
    }
    var date_temp_input=q.innerHTML;
    if(date_temp_input.length<2){
    	date_temp_input="0"+date_temp_input;
    }
    document.getElementById(m_inputtext_id).value=calendar_now.getFullYear()+"-"+month_temp_input+"-"+date_temp_input;
    m_delete_program_judgment("b");
}
