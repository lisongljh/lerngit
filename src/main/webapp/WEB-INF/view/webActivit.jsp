<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html,charset=utf-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>成都根与芽后台管理系统</title>
</head>
<script type="application/javascript" src="../js/jquery-1.4.3.js"></script>
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
	#nav { width:600px; height: 400px; border: 1px solid #D4CD49; position:fixed;left:28%;top:10%;background-color: rgb(240,240,240); }
</style>
<body  id="mybody">
	<div id="left" style="width: 20%;height: 100%;float: left;">
		<div style="background-color: rgb(111,111,111);width: 1%;float: right;height: 90%;margin-top: 8%"></div>
		<div style="width: 92%;float: left;margin-top: 30%;text-align: right;">
			<div style="height: 35px;color: rgb(100,100,100);"><a href="./webInfoSearch.html" >志愿者个人信息查询</a></div>
			<div style="height: 35px;color: rgb(100,100,100);"><a href="./webQuestionSearch.html">志愿者问题查询</a></div>
			<div style="height: 35px;"><a>活动管理</a></div>
			<div style="height: 35px;color: rgb(100,100,100);"><a href="./webActivitJoin.html">活动报名情况</a></div>
			<div style="height: 35px;color: rgb(100,100,100);"><a href="./webActivityPresent.html">活动参与情况</a></div>
		</div>
	</div>
	<div id="right" style="width: 80%;height: 100%;float: right;">
		<div style="height: 50px;width: 50px;float: left;margin-left: 5%;margin-top: 2%" onclick="creatTab()">
			<img alt="" src="../img/addbtn.png" style="height: 100%;width: 100%" >
			<div style="font-size: 12px;color: gray;">创建活动</div>
		</div>
		<div style="margin-top:2%;margin-left: 60%;width: 20%;">
			
			<input placeholder="" style="height: 25px;border-radius:15px;float: left;">
			<button style="float: right;" onclick="alert('搜索')">搜索</button>
		</div>
		<div id="tableActivity">

		</div>
		<%--<table style="width: 90%;margin-left: 5%;margin-top: 10%;border-spacing: collapse" border="1" cellpadding = "0px" cellspacing="0px">--%>
			<%--<tr style="height: 25px">--%>
				<%--<th style="width: 20%">活动名称</th>--%>
				<%--<th style="width: 10%">时间</th>--%>
				<%--<th style="width: 20%">地点</th>--%>
				<%--<th style="width: 30%">简介</th>--%>
				<%--<th style="width: 10%">二维码图片</th>--%>
				<%--<th style="width: 10%">删除或修改</th>--%>
			<%--</tr>--%>
			<%--<tr >--%>
				<%--<td>--%>
					<%----%>
				<%--</td>--%>
				<%--<td></td>--%>
				<%--<td></td>--%>
				<%--<td></td>--%>
				<%--<td></td>--%>
				<%--<td>--%>
					<%--<button style="float: left">删除</button>--%>
					<%--<button style="float: right;" onclick="xiugai()">修改</button>--%>
				<%--</td>--%>
			<%--</tr>--%>
			<%----%>
			<%--<tr>--%>
				<%--<td></td>--%>
				<%--<td></td>--%>
				<%--<td></td>--%>
				<%--<td></td>--%>
				<%--<td></td>--%>
				<%--<td>--%>
					<%--<button style="float: left" >删除</button>--%>
					<%--<button style="float: right;" onclick="xiugai()">修改</button>--%>
				<%--</td>--%>
			<%--</tr>--%>
			<%----%>
			<%--<tr>--%>
				<%--<td></td>--%>
				<%--<td></td>--%>
				<%--<td></td>--%>
				<%--<td></td>--%>
				<%--<td></td>--%>
				<%--<td>--%>
					<%--<button style="float: left">删除</button>--%>
					<%--<button style="float: right;" onclick="xiugai()">修改</button>--%>
				<%--</td>--%>
			<%--</tr>--%>
		<%--</table>--%>
	
	</div>
	
	<div id="nav" style="position: absolute;display: none"  >
	
		<form action="./createActivity.html" name="creat" method="post">
			<div style="height: 35px;width: 100%;background-color:rgb(111,111,111);text-align: center;line-height: 35px">创建活动
			
			</div>
			
			<div style="height: 15px;background-color:rgb(240,240,240);"></div>
			<div style="width: 90%;height: 30px;line-height: 30px;margin:0 auto;">
				<input name="activityname" id="nameid" placeholder="活动名称" style="width: 100%;height: 100%">
			</div>
			<div style="height: 5px;background-color:rgb(240,240,240);"></div>
			<div style="width: 90%;height: 30px;line-height: 30px;margin:0 auto;">
				<input name="activitime"  id="timeid" placeholder="活动时间" style="width: 100%;height: 100%">
			</div>
			<div style="height: 5px;background-color:rgb(240,240,240);"></div>
			<div style="width: 90%;height: 30px;line-height: 30px;margin:0 auto;">
				<input name="activityplace" id="palceid" placeholder="活动地点" style="width: 100%;height: 100%">
			</div>
			<div style="height: 10px;background-color:rgb(240,240,240);"></div>
			<div style="width: 90%;height:200px;margin:0 auto;">
				<textarea name="activityprofile" id="abstractid" rows="" cols="" placeholder="活动简介" style="width: 100%;height: 100%;resize:none" maxlength=""></textarea>
			</div>
			<div >
				<input  style="height: 20px;width: 50px;float: right;margin-right: 15px;margin-top: 15px;" type="submit"  onclick="finishCreat();"></input>
			</div>
		</form>

	</div>
</body>
<script type="text/javascript">


function getHeight(){
	var sh = screen.height-100;
	//document.getElementById("mybody").style.height=sh+"px"; //设定定高
	document.getElementById("mybody").style.height = sh +"px";
	
}

function finishCreat(){
	//检查表单是否为空
	var name = document.getElementById("nameid").value;
	if(name == ""){
		alert("活动名称不能为空！")
		return;
	}
	var time = document.getElementById("timeid").value;
	if(name == ""){
		alert("活动时间不能为空！")
		return;
	}
	var place = document.getElementById("placeid").value;
	if(name == ""){
		alert("活动地点不能为空！")
		return;
	}
	var absid = document.getElementById("abstractid").value;
	if(name == ""){
		alert("活动简介不能为空！")
		return;
	}

	document.getElementById("nav").style.display = "none";

}
function creatTab(){
	
	document.getElementById("nav").style.display = "block";

}

function xiugai(){
	var tab = document.getElementById("nav");
	if(tab.style.display == "block"){
		
	}else{
		tab.style.display = 'block';
	}
}

//window.onload=function()
//{
//	getHeight();
//}

window.onload=function(){
	getHeight();
	ajaxT();
};
function ajaxT(){
	$.ajax({
				type:"POST",
				dataType: "json",
				url:"./getActivity.json",
				data:"doaction=userList",
				success:function(data){
					createShowingTable(data);
				}
			}
	);
}
//动态的创建一个table
function createShowingTable(data) {
	var tableStr = '<table style="width: 90%;margin-left: 5%;margin-top: 10%;border-spacing: collapse" border="1" cellpadding = "0px" cellspacing="0px">';
	tableStr = tableStr
			+ '<tr style="height: 25px">'
			+'<th style="width: 20%">活动名称</th>'
			+'<th style="width: 10%">时间</th>'
			+'<th style="width: 20%">地点</th>'
			+'<th style="width: 30%">简介</th>'
					+'<th style="width: 30%">人数限制</th>'
			+'<th style="width: 10%">二维码图片</th>'
			+'<th style="width: 10%">删除或修改</th>'
			+"</tr>";
	var len = data.length;
	for ( var i = 0; i < len; i++) {
		tableStr = tableStr + "<tr>"
				+"<td>"+ data[i].actName + "</td>"
				+ "<td>"+ data[i].time + "</td>"
				+ "<td>"+ data[i].place + "</td>"
				+"<td>"+data[i].abstractContent+"</td>"
						+"<td>"+data[i].maxNum+"</td>"
						+"<td>"+data[i].qrcode+"</td>"

				+'<td>'
				+'<button style="float: left" >删除</button>'
				+'<button style="float: right;" onclick="xiugai()">修改</button>'
				+'</td>'
				+"</tr>";
	}
	if(len==0){
		tableStr = tableStr + "<tr style='text-align: center'>"
				+"<td colspan='6'><font color='#cd0a0a'>"+ 暂无记录 + "</font></td>"
				+"</tr>";
	}
	tableStr = tableStr + "</table>";
	//添加到div中
	$("#tableActivity").html(tableStr);
}
</script>
</html>