<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<script type="text/javascript">
	var arrKeys = new Array();	//登录后保存所有的 key
	function initializeKeys(){
	
		var coll = document.all; //遍历的有的标签
		
		for(i = 0; i < document.all.length; i++){
			e = document.all[i];
			var curkey = e.getAttribute("keys");
			
			if(curkey!=null){
				if(arrKeys.length>0){
					var flag = true;
					for(var key in arrKeys){
						//alert(arrKeys[key]);
						if(arrKeys[key] == curkey){
							flag = true;
							break;
						}else{
							flag = false;
						}
					}
					if(!flag){
						$(e).removeAttr("onclick");
						$(e).off();
						$(e).unbind();
						e.style.color="#999";
						$(e).attr("alt","无此权限!");
						$(e).attr("title","无此权限!");
						e.style.filter="progid:DXImageTransform.Microsoft.BasicImage(grayscale=1)";
						if(e.tagName == "A" || e.tagName == "a"){							
							$(e).removeAttr("href");
						}
						if(e.tagName == "input" || e.tagName== "INPUT" || e.tagName == "button" || e.tagName== "BUTTON"){
							$(e).attr("disabled","disabled");
						}
					}
				}
			
			}
		}
	}
	
	
	$(function(){
		initializeKeys();
	});
	
</script>

		<c:if test="${not empty ONLINE_SESSION_SYSUSERVO}">		
			<c:forEach items="${sessionScope.right}" var="r" varStatus="varStatus">
				<script>arrKeys[${varStatus.index}]='${empty r.code ? 1 : r.code }';</script>
			</c:forEach>
		</c:if>


</html>
