<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>  
<link   href="${root}/res/js/artDialog/css/ui-dialog.css" rel="stylesheet">
<script src="${root}/res/js/artDialog/dist/dialog-min.js"></script>
<div class="pagination pagination-centered">
    <ul>
        <!-- 分页首页按钮 -->          
        <c:choose>    
		   <c:when test="${data.pageNo <= 1}"> <li class="disabled"><span>首页</span></li></c:when> 
		   <c:otherwise>  <li><a href="${param.pageUrl}${fn:indexOf(param.pageUrl,'?')!=-1?"&":"?"}pageNo=1" class="redirect">首页</a></li>
		   </c:otherwise>  
		</c:choose>  
        <!-- 前一页按钮 -->  
        <c:choose>    
		   <c:when test="${data.pageNo <= 1}"> 
		   		<li class="disabled"><span>上一页</span></li>
		   	</c:when> 
		   <c:otherwise>
		   		<li><a href="${param.pageUrl}${fn:indexOf(param.pageUrl,'?')!=-1?"&":"?"}pageNo=${data.pageNo - 1}" class="redirect">上一页</a></li>
		   </c:otherwise>  
		</c:choose>  
          <!-- 下一页按钮 -->
        <c:choose>    
		   <c:when test="${data.pageNo >= data.pageTotal}"> <li class="disabled"><span>下一页</span></li> </c:when> 
		   <c:otherwise><li><a href="${param.pageUrl}${fn:indexOf(param.pageUrl,'?')!=-1?"&":"?"}pageNo=${data.pageNo + 1}" class="redirect">下一页</a></li>
		   </c:otherwise>  
		</c:choose>  
  
        <!-- 分页尾页按钮 -->  
        <c:choose>    
		   <c:when test="${data.pageNo >= data.pageTotal}"><li class="disabled"><span>尾页</span></li> </c:when> 
		   <c:otherwise> <li><a href="${param.pageUrl}${fn:indexOf(param.pageUrl,'?')!=-1?"&":"?"}pageNo=${data.pageTotal}" class="redirect">尾页</a></li>
		   </c:otherwise>  
		</c:choose>        
    </ul>  
    
    <ul>
    	<li><a> 第 <input id="page" type="text" id="current_page" autocomplete="off" value="${page.pageNo }"
                style="margin-bottom: -9px; margin-top: -10px; width: 15px; height: 12px;"> 页
        </a></li>  
        <li><a  id="skip" href="javascript:;" onclick="skipPage()">转到</a></li>
    </ul>
   
    
    <ul class="pull-right">  
        <li class="disabled"><a>第${data.pageNo*20-20+1} - ${data.pageNo*20>data.dataTotal?data.dataTotal:data.pageNo*20} 条记录 / 共${data.dataTotal}条 / 共${data.pageTotal}页</a></li>  
    </ul>  
</div>  

<script>
function skipPage(){
    var number = $("#page").val().trim();
    var total  = Math.ceil("${data.dataTotal}"/20); // 总页码数

    // 判断页码是否是正整数
    if(!/^[1-9]+[0-9]*]*$/.test(number)){
        alert("页码有误！");
        return false;
    }
    (number > total) && (number = total); // 如果页码超出则取最后一页
    var url = "${param.pageUrl}${fn:indexOf(param.pageUrl,'?')!=-1?'&':'?'}pageNo=" + number;
    var targetForm = $("form.query");
    if(targetForm.length){
        targetForm.attr("action", url).submit();
    }
    return false;
}
$(".redirect").click(function(){
    var url = $(this).attr("href") || "";
    var targetForm = $("form.query");
    if(targetForm.length){
        targetForm.attr("action", url).submit();
    }
    return false;
});
</script>
