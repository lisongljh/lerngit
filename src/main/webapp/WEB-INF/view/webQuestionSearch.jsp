<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>成都根与芽后台管理系统</title>
</head>
<style>
	tr{height: 25px;}
	body{
	padding:0px;  
	margin:0px;  
	padding-top:20px;  
	nt-size:10pt; 
    background: -moz-linear-gradient(top, #DAE6F4 100%, #CDDCE6 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(100%,#DAE6F4), color-stop(100%,#CDDCE6));
    background: -webkit-linear-gradient(top, #DAE6F4 100%,#CDDCE6 100%);
    background: -o-linear-gradient(top, #DAE6F4 100%,#CDDCE6 100%);
    background: -ms-linear-gradient(top, #DAE6F4 100%,#CDDCE6 100%);
    background: linear-gradient(to bottom, #DAE6F4 100%,#CDDCE6 100%);
    font-family: '微软雅黑';
	}
</style>
<body  id="mybody" style="background-color: rgb(240,240,240);">
	<div id="left" style="width: 20%;height: 100%;float: left;">
		<div style="background-color: rgb(111,111,111);width: 1%;float: right;height: 90%;margin-top: 8%"></div>
		<div style="width: 92%;float: left;margin-top: 30%;text-align: right;">
			<div style="height: 35px;color: rgb(100,100,100);"><a href="./webInfoSearch.html" >志愿者个人信息查询</a></div>
			<div style="height: 35px;"><a>志愿者问题查询</a></div>
			<div style="height: 35px;"><a href="./webActivit.html">活动管理</a></div>
			<div style="height: 35px;color: rgb(100,100,100);"><a href="./webActivitJoin.html">活动报名情况</a></div>
			<div style="height: 35px;color: rgb(100,100,100);"><a href="./webActivityPresent.html">活动参与情况</a></div>
		</div>
	</div>
	<div id="right" style="width: 80%;height: 100%;float: right;">
		<div style="margin-top:2%;margin-left: 60%;width: 20%;">
			<input placeholder="" style="height: 25px;border-radius:15px;float: left;">
			<button style="float: right;">搜索</button>
		</div>
		<table style="width: 90%;margin-left: 5%;margin-top: 10%;border-spacing: collapse" border="1" cellpadding = "0px" cellspacing="0px">
			<tr style="height: 25px">
				<th style="width: 10%">姓名</th>
				<th style="width: 45%">问题内容</th>
				<th style="width: 45%">回答情况</th>

			</tr>
			<tr >
				<td></td>
				<td></td>
				<td></td>

			</tr>
			
			<tr>
				<td></td>
				<td></td>
				<td></td>

			</tr>
			
			<tr>
				<td></td>
				<td></td>
				<td></td>

			</tr>
		</table>
	
	</div>
</body>
<script type="text/javascript">
function $(id){       //获指定id的element，方法形如jQuery
    return document.getElementById(id);
}

function getHeight(){
	var sh = screen.height-100;
    $("mybody").style.height=sh+"px"; //设定定高
}

window.onload=function()
{
	getHeight();
}
</script>
</html>