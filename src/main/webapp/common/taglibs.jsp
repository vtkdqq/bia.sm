<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!-- 提示 -->
<script src="<%=basePath %>res/js/artDialog/lib/jquery-1.10.2.js"></script>
<link   href="<%=basePath %>res/js/artDialog/css/ui-dialog.css" rel="stylesheet">
<script src="<%=basePath %>res/js/artDialog/dist/dialog-min.js"></script>
<script type="text/javascript">
(function (d) {
    d['okValue'] = '确定';
    d['cancelValue'] = '取消';
    d['title'] = '信息提示';
    // [more..]
})(art.dialog.defaults);
</script>