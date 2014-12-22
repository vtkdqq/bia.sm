<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<%@ include file="/common/inc.jsp" %>
<body>
<ul class="breadcrumb">
    <li>模块列表</li>
</ul>
	<div class="block p10">
		<!-- 搜索栏 -->
	    <div class="row pull-right" style="height: 50px;">
           <form action="${root}/menu/list?parentid=0"  method ="post" class="form-inline query">
              <label>模块名称：<input type="text" placeholder="请输入用户名称" style="width: 210px;" aria-controls="example" name="name" id="name" value="${vote.name}"/></label>
              <button class="btn btn-success" type="submit"  style="margin-left: 20px;">检&nbsp;&nbsp;索<i class=" icon-search icon-white"></i></button>
          </form>
	    </div>
        <a href="${root}/menu/edit" keys="1005302" class="btn btn-success" id="add_ad">添加菜单<i class="icon icon-plus icon-white"></i></a>
        <table class="table table-striped table-bordered mt10" >
            <thead>
                <tr role="row">
                	<th class="sorting_asc"style="width: 40px;">选择</th>
                    <th class="sorting_asc"style="width: 40px;">菜单ID</th>
                    <th class="sorting" style="width: 35px;" >菜单名称</th>
                    <th class="sorting" style="width: 100px;">菜单Code</th>
                    <th class="sorting" style="width: 40px;">菜单Url</th>
                    <th class="sorting" style="width: 40px;">菜单显示</th>
                    <th class="sorting" style="width: 50px;">操作</th>
                </tr>
            </thead>
            <tbody role="alert" aria-live="polite" aria-relevant="all">
            	<c:forEach items="${data.pageData}" var="menu" varStatus="rowStatus" >
                    <tr>
						<td>
						<input type="checkbox" name="cbitem" value="${dataItem.id }"/>
						</td>
						<td>${menu.id}</td>
						<td><a href="${root}/menu/list?parentid=${menu.id}"  target="mainFrame">${menu.menuname}</a></td>
						<td>${menu.menucode}</td>
						<td>${menu.menuurl}</td>
						<td>
							<c:choose>
								<c:when test="${menu.navmenu==0}">
									<font color='red'>隐藏</font>
								</c:when>
								<c:when test="${menu.navmenu==1}">
									<font color='green'>显示</font>
								</c:when>	
								<c:otherwise>
									<font color='gray'>未知:${menu.navmenu}</font>
								</c:otherwise>
							</c:choose>
						</td>
						<td class="operation">
							<a href="javascript:;" onclick="edit(${menu.id});">
							 	<img src="${root}/res/img/admin/pencil.png" title="修改用户信息"/>
							 </a>							
							 <a href="javascript:;" onclick="delUser(${menu.id},'${menu.menuname}');">
							 	<img src="${root}/res/img/admin/trashcan_delete.gif" title="删除用户"/>
							 </a>           
						</td>
						
					</tr>
					</c:forEach>
            </tbody>
        </table>
        <c:if test="${!empty data.pageData}">
                <jsp:include page="/common/page.jsp" flush="true">
                        <jsp:param name="pageUrl" value="${root}/user/list"/>
                </jsp:include>
        </c:if>
    </div>
</body>
</html>
