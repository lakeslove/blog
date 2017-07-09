<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="javascripts/calculator.js"></script>
<script>
$(document).ready(function() {
	$.changeSelectedNav("nav-others-id");
});
</script>
<style>
@charset "utf-8";
/* CSS Document */
#m_program_table_id{
	box-shadow: 5px 5px 2px 6px rgba(204,204,204,0.6);
	border:#000 6px solid;
	border-collapse:collapse;
	width:210px;
	}
#calculator_table_button1_id{
	width:25%;
	height:40px;
	font-size:150%;
	text-align:center;
	border:#fff 3px solid;
	background-color:rgba(204,204,204,1);
	}
#calculator_table_button_id{
	width:25%;
	height:40px;
	font-size:200%;
	text-align:center;
	border:#fff 3px solid;
	background-color:rgba(255,0,0,1);
	}
#calculator_table_button2_id{
	width:50%;
	height:40px;
	font-size:200%;
	text-align:center;
	border:#fff 3px solid;
	background-color:rgba(204,204,204,1);
	}

#calendar_tr3_td1_id_grey{
	width:30px;
	text-align:center;
	border:#000 3px solid;
	background-color:rgba(204,204,204,1);
	}
#calendar_tr3_td1_id_white{
	width:30px;
	text-align:center;
	border:#000 3px solid;
	background-color:white;
	}
#calendar_tr3_td1_id_red{
	width:30px;
	text-align:center;
	font-size:110%;
	border:#000 3px solid;
	background-color:red;
	}
#calendar_tr1_td2_id{
	width:150px;
	text-align:center;
	font-size:110%;
	font-weight:bolder;
	border:#fff 3px solid;
	background-color:#CC0;
	}
.calendar_tr2_td_calss{                       <!--星期栏 ---- 式样-->
	width:30px;
	text-align:center;
	}
</style>	
<div class="blocks">
<br>
这是一个很失败的计算器，谨记<br>
<br>
<input class="calculator" id="m_inputtext_id" style="border:solid 1px;"/>
</div>
