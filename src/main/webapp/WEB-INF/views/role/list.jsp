<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<%@ include file="/common/inc.jsp" %>
<body>
<ul class="breadcrumb">
    <li>角色列表</li>
</ul>
	<div class="block p10">
		<!-- 搜索栏 -->
	    <div class="row pull-right" style="height: 50px;">
           <form action="${root}/menu/list?parentid=0"  method ="post" class="form-inline query">
              <label>权限名称：<input type="text" placeholder="请输入权限名称" style="width: 210px;" aria-controls="example" name="name" id="name" value="${vote.name}"/></label>
              <button class="btn btn-success" type="submit"  style="margin-left: 20px;">检&nbsp;&nbsp;索<i class=" icon-search icon-white"></i></button>
          </form>
	    </div>
        <a href="${root}/menu/edit" keys="1005302" class="btn btn-success" id="add_ad">添加新角色<i class="icon icon-plus icon-white"></i></a>
        <table class="table table-striped table-bordered mt10" >
            <thead>
                <tr role="row">
                	<th class="sorting_asc"style="width: 40px;">选择</th>
                    <th class="sorting_asc"style="width: 40px;">角色ID</th>
                    <th class="sorting" style="width: 35px;" >角色名称</th>
                    <th class="sorting" style="width: 60px;">角色状态</th>
                    <th class="sorting" style="width: 40px;">创建时间</th>
                    <th class="sorting" style="width: 40px;">给角色授权</th>
                    <th class="sorting" style="width: 50px;">操作</th>
                </tr>
            </thead>
            <tbody role="alert" aria-live="polite" aria-relevant="all">
            	<c:forEach items="${data.pageData}" var="role" varStatus="roleStatus" >
                    <tr>
						<td>
							<input type="checkbox" name="cbitem" value="${role.id }"/>
						</td>
						<td>${role.id}</td>
						<td>${role.rolename}</td>
						<td>
							<c:choose>
							<c:when test="${role.status==0}">
								<font color='red'>禁用</font>
							</c:when>
							<c:when test="${role.status==1}">
								<font color='green'>启用</font>
							</c:when>	
							<c:otherwise>
								<font color='gray'>未知:${role.status}</font>
							</c:otherwise>
						</c:choose>
						</td>
						<td><fmt:formatDate value="${role.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>
							 <a href="javascript:;" onclick="roleResourceSet(${role.id});">授权</a>
						</td>
						<td class="operation">
							<a href="javascript:;" onclick="edit(${role.id});">
							 	<img src="${root}/res/img/admin/pencil.png" title="修改角色信息"/>
							 </a>
							 
							 <c:choose>
								<c:when test="${role.status==0}">
									 <a href="javascript:;" onclick="changeRoleStatus(${role.id},1);">
		                            	<img src="${root}/res/img/admin/lock_unlock.png" title="启用角色"/>
		                            </a>
								</c:when>					
								<c:otherwise>
		                            <a href="javascript:;" onclick="changeRoleStatus(${role.id},0);">
		                            	<img src="${root}/res/img/admin/lock.png" title="禁用角色"/>
		                            </a>
								</c:otherwise>
							</c:choose>
							 <a href="javascript:;" onclick="delRole(${role.id},'${role.rolename}');">
							 	<img src="${root}/res/img/admin/trashcan_delete.gif" title="删除角色"/>
							 </a>       
						</td>
						
					</tr>
					</c:forEach>
            </tbody>
        </table>
        <c:if test="${!empty data.pageData}">
                <jsp:include page="/common/page.jsp" flush="true">
                        <jsp:param name="pageUrl" value="${root}/role/list"/>
                </jsp:include>
        </c:if>
    </div>
</body>
</html>
