<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="root" value="${pageContext.request.contextPath}"/>
<%
String path = request.getContextPath();    
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;    
pageContext.setAttribute("basePath",basePath);    
%>

<!DOCTYPE html>
<html lang="zh">
<head>
<link rel="shortcut icon" href="${root}/res/img/favicon.ico">
<script type="text/javascript">
var BASEPATH = '${pageScope.basePath}';
var APIPATH = "${pageScope.basePath}";
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="http://web-res.qiniudn.com/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/res/css/wstyle.css" />
<title>运营系统</title>
</head>
<!--头部 开始-->
<div id="hd" class="clearfix">
    <a class="fl hd-title" href="<%=basePath%>/content.jsp" target="mainFrame">
    	<img src="logo.png" alt=""/>
    	运营系统
    </a>
	<div class="fr user-box">
		<div class="user-info">
		<em class="user-icon"></em>
		<span class="user-name">${ONLINE_SESSION_SYSUSERVO.userName}</span>
		<em>|</em>
			<a href="<%=basePath%>/sys/user/toupdatepwdinit/" target="mainFrame">修改密码</a>
		<em>|</em>
			<a href="<%=basePath%>/logout">退出</a>
		</div>
	</div>
</div>
<!--头部 结束-->

<!--左边导航 开始-->
<div id="left-nav" class="fl">
	<!--  
	<c:forEach items="${treeNode.childNodes }" var="node">
		<c:if test="${node.hasChildren}">
		<div class="nav-box">
			<div class="nav-fst">
				<em class="icon"><img src="log" width="20" height="20" alt=""/></em>
				<span class="nav-title" >${node.text}</span>
				<em class="arrow"></em>
			</div>
			<ul class="nav-sed">
				<c:forEach items="${node.childNodes }" var="childNode">
					<c:if test="${childNode.checkstate==1}">
						<li><a href="${pageScope.basePath}${childNode.value}" target="mainFrame">${childNode.text}</a></li>
					</c:if>					
				</c:forEach>
				<c:if test="${node.text=='系统管理'}">
					<li><a href="https://www.umeng.com/sso/login?service=http://www.umeng.com/users/login_redirect" target="_blank">友盟统计</a></li>
				</c:if>
			</ul>
		</div>
		</c:if>
	</c:forEach>
	-->
	
		<div class="nav-box">
			<div class="nav-fst">
				<em class="icon"><img src="${root}/res/img/admin/appuser.png" width="20" height="20" alt=""/></em>
				<span class="nav-title" >APP用户管理</span>
				<em class="arrow"></em>
			</div>
			<ul class="nav-sed" style="display: none;">
				<li><a href="${pageScope.basePath}appuser/list/" rel="appuser/list/" target="mainFrame">APP用户管理</a></li>	
			</ul>
		</div>
		<div class="nav-box">	
			<div class="nav-fst">
				<em class="icon"><img src="${root}/res/img/admin/sys.png" width="20" height="20" alt=""/></em>
				<span class="nav-title" >系统管理</span>
				<em class="arrow"></em>
			</div>
			<ul class="nav-sed" style="display: none;">
				<li><a href="${root}/user/list"  target="mainFrame">用户列表</a></li>
				<li><a href="${root}/menu/list?parentid=0"  target="mainFrame">模块管理</a></li>
				<li><a href="${root}/role/list/"  target="mainFrame">角色管理</a></li>							
			</ul>
		</div>
		
	</div>
	<!--左边导航 结束-->
	
<!-- 主框架  -->
<div style="margin-left:200px" id="mainFrameWrap">
    <iframe src="content.jsp" name="mainFrame" frameborder="0" width="100%" height="100%"></iframe>
</div>

<!-- 主框架结束  -->

<div id="ft cb">
	<p style="text-align: center">指尖城市版权所有 粤ICP备14048606号-1</p>
</div>

<script>
	
	$(document).ready(function() {
	    //自适应高度
		$('#left-nav').height($(window).height() - $("#hd").height() - 28);
	    $("#mainFrameWrap").height($(window).height() - $("#hd").height() - 28);
		$(window).resize(function() {
		    $('#left-nav').height($(window).height() - $("#hd").height() - 28);
		    $("#mainFrameWrap").height($(window).height() - $("#hd").height() - 28);
		});
			
		//左边导航伸缩特效
		$('#left-nav ul').hide();
		$('#left-nav .arrow').addClass('statu2');
		$('#left-nav').delegate('.nav-fst', 'click', function() {
			var childNav = $(this).next('ul');
			if(childNav.is(':hidden')) {
				childNav.slideDown("fast");
				$('#left-nav .arrow').addClass('statu2');
				$(this).find('.arrow').removeClass('statu2');
			} else {
				childNav.slideUp("fast");
				$(this).find('.arrow').addClass('statu2');
			}
		})
		.delegate('.nav-sed a', 'mouseover', function() {
			$(this).addClass('hover');
		})
		.delegate('.nav-sed a', 'mouseout', function() {
		    $(this).removeClass('hover');
		})
		.delegate('.nav-sed a', 'click', function() {
		    $('#left-nav .nav-sed a').removeClass('cur');
			$(this).addClass('cur');
		});		
		
	}); 
</script>		
</body>
</html>