<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>成都根与芽后台管理系统</title>
</head>
<body  id="mybody" style="background-color: rgb(240,240,240);">
	<div id="left" style="width: 20%;height: 100%;float: left;">
		<div style="background-color: rgb(111,111,111);width: 2px;float: right;height: 90%;margin-top: 8%"></div>
	</div>
	<div id="right" style="width: 80%;height: 100%;float: right;">
		<table style="height: 50%;width: 90%;margin-left: 5%;margin-top: 10%;">
			<tr>
				<td>
					<a href="./webInfoSearch.html">志愿者个人信息咨询</a>
				</td>
				<td><a  href="./webQuestionSearch.html">志愿者问题查询</a></td>
			</tr>
			
			<tr>
				<td><a  href="./webActivit.html">活动管理</a></td>
				<td><a  href="./webActivitJoin.html">活动报名情况</a></td>
			</tr>
			
			<tr>
				<td><a  href="./webActivityPresent.html">活动参与情况</a></td>
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