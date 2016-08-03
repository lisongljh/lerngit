<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>登录</title>
</head>
<body  id="mybody" style="background-color: gray">
	<div style="width: 100%;height: 25px;line-height: 25px;">成都根与芽信息管理系统</div>
	<div style="height: 45%"></div>

	<form action="<c:url value="/admin/loginCheck.html"/>" method="post">
		<div style="height: 30%">
			<div>
			<c:if test="${!empty error}">
				<font color="red"><c:out value="${error}"/></font>
			</c:if></div>
			<input type="text" name="userName" placeholder="请输入用户名" style="margin-left: 60%;width: 20%;height: 30px;border-radius:15px;">
			<input name="password" placeholder="请输入密码" style="margin-left: 60%;width: 20%;height: 30px;margin-top: 10px;border-radius:15px;"  type="password">
		</div>
		<input   style="margin-left: 68%;width: 12%;height: 30px;margin-top: 10px;border-radius:15px;"  type="submit" value="登录"/>
	</form>
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