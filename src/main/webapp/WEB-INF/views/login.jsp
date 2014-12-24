<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html ">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<%
String path = request.getContextPath();    
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";    
pageContext.setAttribute("basePath",basePath);    
%>

<script language="JavaScript"> 
if (window != top) 
top.location.href = location.href; 
</script>

<link type="text/css" rel="stylesheet" href="${pageScope.basePath}res/css/login.css" />
</head>
<body>
<div class="login_bg">
</div>

<div class="login_div">
	<div style="height:350px;"></div>
    <div class="loginBox" style=" font-size:20px">
    	<form action="${root}/user/login" method="post" id="sysform">
			<table width="320" border="0" cellpadding="5" cellspacing="5">
	          <tr>
	            <td colspan="2">
	              <input type="text" name="username" id="username" value="" class="inputUser"/>
	            </td>
	          </tr>
	          <tr>
	            <td colspan="2">
	              <input type="password" name="password" id="password" value="" class="inputPass"/>
	              <font color="red">${sign}</font>
	            </td>
	          </tr>
	          <tr>
	            <td>
<!-- 	            <a>忘记密码？</a> -->
	            </td>
	            <td align="right"><input name="" type="submit" value="登 录" class="login_btn"/></td>
	          </tr>
	        </table>
		</form>
  </div>
</div>
<div id="only_for_chrome" style="display: none">
    <p class="chrome-tip">此站点只支持Chrome浏览器，请更换您的浏览器！</p>
    <p class="chrome-link"><a href="http://rj.baidu.com/soft/detail/14744.html?ald" target="_blank">立即下载Chrome浏览器</a></p>
</div>
<script>
    if(!/chrome/i.test(navigator.userAgent)){
        document.getElementById("only_for_chrome").style.display = "block";
    }
</script>
</body>
</html>
