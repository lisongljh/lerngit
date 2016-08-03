<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>成都根与芽后台管理系统</title>
</head>
<script type="application/javascript" src="../../js/jquery-1.4.3.js"></script>
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
			<div style="height: 35px;"><a >志愿者个人信息查询</a></div>
			<div style="height: 35px;color: rgb(100,100,100);"><a href="./webQuestionSearch.html">志愿者问题查询</a></div>
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
		<div id="tableUserlist">

		</div>
	</div>




</body>
<script type="text/javascript">
//function $(id){       //获指定id的element，方法形如jQuery
//    return document.getElementById(id);
//}

function getHeight(){
	var sh = screen.height-100;
	//document.getElementById("mybody").style.height=sh+"px"; //设定定高
	document.getElementById("mybody").style.height = sh +"px";

}

window.onload=function(){
	getHeight();
	alert("1");
	ajaxP();
	alert("2");
};
function ajaxP(){
	$.ajax({
				type:"POST",
				dataType: "json",
				url:"./getUserList.json",
				data:"doaction=auserList",
				success:function(data){
					createShowingTable(data);
				}
			}
	);
}
//动态的创建一个table
function createShowingTable(data) {

	alert("3");
	var tableStr = '<table style="width: 90%;margin-left: 5%;margin-top: 10%;border-spacing: collapse" border="1" cellpadding = "0px" cellspacing="0px">';
	tableStr = tableStr
			+ '<tr style="height: 25px">'
			+'<th style="width: 10%">姓名</th>'
			+'<th style="width: 20%">电话</th>'
			+'<th style="width: 10%">性别</th>'
			+'<th style="width: 10%">勋章(枚)</th>'
			+'<th style="width: 25%">已参与活动</th>'
			+'<th style="width: 25%">正报名活动</th>'

			+"</tr>";
	var len = data.length;
	for ( var i = 0; i < len; i++) {
		tableStr = tableStr + "<tr>"
				+"<td>"+ data[i].name + "</td>"
				+ "<td>"+ data[i].phone + "</td>"
				+ "<td>"+ data[i].sex + "</td>"
				+"<td>"+data[i].medal+"</td>"
				+"<td>"+"</td>"
				+"<td>"+"</td>"


				+"</tr>";
	}
	if(len==0){
		tableStr = tableStr + "<tr style='text-align: center'>"
				+"<td colspan='6'><font color='#cd0a0a'>"+ 暂无记录 + "</font></td>"
				+"</tr>";
	}
	tableStr = tableStr + "</table>";
	//添加到div中
	$("#tableUserlist").html(tableStr);
}
</script>
</html>