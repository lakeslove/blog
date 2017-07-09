// JavaScript Document
var m_inputtext_id;	
var m_program_div1='←';
var m_program_div3='→';
var m_program_div4='↑'			
//加载函数 m_input_traversal()***********************************************
window.onload= m_input_traversal;
function m_input_traversal(){
	var inpu= document.getElementsByTagName("input");                               
	    if(inpu.length>0){
		  for(var i=inpu.length-1;i>=0;i--){    
			   if(inpu[i].className=="calculator") {
					inpu[i].setAttribute("onclick","m_call_program(this)");  
		        }
		    }
	    }
}
function m_calculator_click(obj){
	var m_input_text=document.getElementById(m_inputtext_id);
	switch (obj.innerHTML)
	{ 
	case 'AC' : 
	     m_input_text.value="";
		break;
	case '<': 
	    m_input_text.value = m_input_text.value.substring(0,m_input_text.value.length -1);    
		break;
	case '=': 
	    m_input_text.value=eval(m_input_text.value); 
		m_delete_program_judgment("b");   
	    break; 
	default:
	    m_input_text.value+=obj.innerHTML;
	}
}
function m_call_program(obj){
    document.body.setAttribute("onmousedown","m_delete_program_judgment()");
	m_program_switch="b";
	m_inputtext_id=obj.getAttribute("id")
	document.getElementById(m_inputtext_id).value="";
		var adiv=document.createElement("div");
		var bdiv=document.createElement("div");
		adiv.id="m_new_div_a";
		bdiv.id="m_new_div_b";
		adiv.setAttribute("onMouseOver","m_program_switch_judgment('a')");
		adiv.setAttribute("onMouseOut","m_program_switch_judgment('b')" ); 
		bdiv.setAttribute("onMouseOver","m_program_switch_judgment('a')");
		bdiv.setAttribute("onMouseOut","m_program_switch_judgment('b')" ); 
		adiv.style.position="absolute";
		adiv.style.width="30px";
		adiv.style.height="30px";
		bdiv.style.position="absolute";
		var leftt = document.getElementById(m_inputtext_id).getBoundingClientRect().left;
		var rightt = document.getElementById(m_inputtext_id).getBoundingClientRect().right;
		var topp=document.getElementById(m_inputtext_id).getBoundingClientRect().top;
		var wid=obj.offsetWidth; 
		var w=window.innerWidth;
		var h=window.innerHeight;
		var rightzhen=w-rightt;
		if(rightzhen>250){
			var shu0=5
			adiv.style.left=rightt+shu0;
			var shu1=30
			bdiv.style.left=rightt+shu1;
			adiv.style.top=topp;
			bdiv.style.top=topp;
			adiv.innerHTML=m_program_div1;
		}
		else if(leftt>250){
			var shu2=15
			var shu3=230
			adiv.style.left=leftt-shu2;
			bdiv.style.left=leftt-shu3;
			adiv.style.top=topp;
			bdiv.style.top=topp;
			adiv.innerHTML=m_program_div3;			
		}
		else{
			adiv.style.left=leftt+(wid/2);
			var shu4=30;
			bdiv.style.left=leftt-shu4;
			adiv.style.top=topp+shu4;
			bdiv.style.top=topp+shu4+shu4;
			adiv.innerHTML=m_program_div4;			 
		}
		document.body.appendChild(adiv);
		document.body.appendChild(bdiv);
		m_program_table=document.createElement("table");
		m_program_table.id="m_program_table_id"
		if(	obj.className=="calculator"){
			m_calculator()
		}
		else{
			m_calendar()
		}		
}
function m_calculator(){	
	var calculator_table_button=['AC','<','=','1','2','3','+','4','5','6','-','7','8','9','*','-/+','0','.','/']
	var calculator_table_number=0;
	for(var i=0;i<5;i++){
		var calculator_tr=document.createElement("tr");
		for(var j=0;j<4;j++){
			var calculator_tr_td=document.createElement("td");
			calculator_tr_td.innerHTML=calculator_table_button[calculator_table_number++];
			if(i>0&&i<4&&j<3||i==4&&j==1){
			calculator_tr_td.id="calculator_table_button_id";		
			}
			else{
			calculator_tr_td.id="calculator_table_button1_id";	
			}
			if(i==0&&j==2){
			j++;	
			calculator_tr_td.colSpan="2";
			calculator_tr_td.id="calculator_table_button2_id";
			}
			calculator_tr_td.setAttribute("onclick","m_calculator_click(this)");
			calculator_tr.appendChild(calculator_tr_td);
			}
	   m_program_table.appendChild(calculator_tr); 	
	}
	document.getElementById("m_new_div_b").appendChild(m_program_table);
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
	  }
}
