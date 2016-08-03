<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>加入根与芽</title>
</head>
<body style="font-family: '微软雅黑'">
<form action="http://203.195.219.36/zhuce.php" method="post">
	<div>
		<div style="top: 20px;width: 70%;float: left;height: 120px;left: 30px">
			<div style="height: 15px"></div>
			<div style="left: 50px;font-family: '黑体'"><font size="6"  color="#88d3ac">加入根与芽</font></div>
			<div><font size="2" class="#d3d3d3">欢迎加入成都根与芽，您的每一份支持</font></div>
			<div><font size="2" class="#d3d3d3">都会让我们的环境变得更加绿色和美好</font></div>
			
		</div>
		<div style="float: right;width: 30%;height: 120px;">
			<img   src="./lightgreen.png" style="width: 100px;height: 100px;"/>
			
		</div>
	</div>
	
	<div>
		<div style="height: 20px"></div>
		<div>
			<font size="3" class="#949494">注册形式</font>
		</div>
		<div style="height: 20px"></div>
		<div>
			 <div style="width: 30%;height:50px;float: left;"><label><input name="userType" type="radio" value="1"  />个人 </label></div>
			 <div style="width: 35%;height:50px;float: left;"><label><input name="userType" type="radio" value="2"  />学校 </label></div>
			 <div style="width: 35%;height:50px;float: right;"><label><input name="userType" type="radio" value="3"  />组织 </label></div>
		</div>
		
		
	</div>
	<div style="height: 50px"></div>
	<div>
		<div style="height: 20px"></div>
		<font size="3" class="#949494">真实姓名</font>
		<div style="height: 20px"></div>
		<label><input name="name" style="width: 85%;height: 20px;top: 30px" value=""></label>		
	</div>
	
	<div>
		<div style="height: 30px"></div>
		<font size="3" class="#949494">年龄</font>
		<div style="height: 10px"></div>
		<div>
			 <div style="width: 30%;float: left;"><label><input name="age" type="radio" value="1"  />8~18岁 </label></div>
			 <div style="width: 35%;float: left;"><label><input name="age" type="radio" value="2"  />18~24岁 </label></div>
			 <div style="width: 35%;float: right;"><label><input name="age" type="radio" value="3"  />24岁以上 </label></div>
		</div>
	</div>
	
	<div>
		<div style="height: 50px"></div>
		<font size="3" class="#949494">电话</font>
		<div style="height: 30px"></div>
		<label><input name="phone" style="width: 85%;height: 20px;top: 30px" value=""></label>
	</div>

	<div>
		<div style="height: 50px"></div>
		<div>
			<font size="3" class="#949494">特长</font>
		</div>
		<div style="height: 30px"></div>
		<div>
			 <div style="width: 30%;float: left;"><label><input onclick="changeOtherType(0)" name="techang" type="radio" value="1"  />平面设计 </label></div>
			 <div style="width: 35%;float: left;"><label><input onclick="changeOtherType(0)"  name="techang" type="radio" value="2"  />摄影 </label></div>
			 <div style="width: 35%;float: right;"><label><input onclick="changeOtherType(0)"  name="techang" type="radio" value="3"  />乐器 </label></div>
		</div>
		<div>
			 <div style="width: 30%;float: left;"><label><input onclick="changeOtherType(0)"  name="techang" type="radio" value="4"  />运动 </label></div>
			 <div style="width: 35%;float: left;"><label><input onclick="changeOtherType(1)"  name="techang" type="radio" value="5"  />外语翻译</label></div>
			 <div style="width: 35%;float: right;"><label><input onclick="changeOtherType(1)" name="techang" type="radio" value="6"  />其他 </label></div>
		</div>
		
		
	</div>
	<div style="height: 30px"></div>
	<div>
	<div style="height: 20px"></div>
	<input style="width: 30%;margin-left:30%;background-color:#88d3ac" type="submit"  value="加入" /></div>
	<input id = "openId" name="openId" type="hidden"  value = "o32JAuDg8NYHTvdkVDSAQiE8Gmfc">
</form>
</body>
<script type="text/javascript">
window.onload=function(){
	var n=self.location.href.indexOf("=")
	if(n>0){
		var openId = self.location.href.substr(n+1);

		document.getElementById("openId").value = openId;

	}
}

function changeInputType(i){

		document.getElementById("userTypeOther").disabled="";

} 

function changeOtherType(i){
	

} 


</script>
</html>