<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	font: 100% 宋体, 新宋体;
	background: #666666;
	margin: 0; /* 最好将 body 元素的边距和填充设置为 0 以覆盖不同的浏览器默认值 */
	padding: 0;
	text-align: center;
	/* 在 IE 5* 浏览器中，这会将容器居中。文本随后将在 #container 选择器中设置为默认左对齐 */
	color: #000000;
}

.twoColFixLt #container {
	width: 1200px; /* 使用比最大宽度 (800px) 小 20px 的宽度可显示浏览器界面元素，并避免出现水平滚动条 */
	background: #FFFFFF;
	margin: 0 auto; /* 自动边距（与宽度一起）会将页面居中 */
	border: 1px solid #000000;
	text-align: left; /* 这将覆盖 body 元素上的“text-align: center”。 */
}

.twoColFixLt #sidebar1 {
	float: left; /* 由于此元素是浮动的，因此必须指定宽度 */
	width: 200px;
	/* 在符合标准的浏览器中或者在 Internet Explorer 中的标准模式下，此 div 的实际宽度除了包括宽度外，还包括填充和边框 */
	background: #EBEBEB; /* 将显示背景色，其宽度等于栏中内容的长度，*/
	padding: 15px 10px 15px 20px;
}

.twoColFixLt #mainContent {
	margin: 0 0 0 250px;
	/* 此 div 元素的左边距会在页面的左下方创建栏 — 无论 sidebar1 div 中包含多少内容，都将保留栏空白。如果您希望在 #sidebar1 中的内容结束时，用 #mainContent div 的文本填充 #sidebar1 空白，则可以删除此边距。 */
	padding: 0 20px 20px; /* 请记住，填充是 div 方块内部的空间，边距则是 div 方块外部的空间 */
}

.fltrt { /* 此类可用来使页面中的元素向右浮动。浮动元素必须位于页面上要与之相邻的元素之前。 */
	float: right;
	margin-left: 8px;
}

.fltlft { /* 此类可用来使页面上的元素向左浮动 */
	float: left;
	margin-right: 8px;
}

.clearfloat { /* 此类应当放在 div 或 break 元素上，而且该元素应当是完全包含浮动的容器关闭之前的最后一个元素 */
	clear: both;
	height: 0;
	font-size: 1px;
	line-height: 0px;
}
-->
</style>
</head>
<body class="twoColFixLt">
	<div id="container" style="margin-top: 20px;">
		<div id="sidebar1">
			<h3>Sidebar1 内容</h3>
			<!-- end #sidebar1 -->
		</div>
		<div id="mainContent">
			<div class="modal-body" style="height:inherit;overflow:hidden;">
				
            </div>
		</div>
		<!-- end #container -->
	</div>
</body>
</html>