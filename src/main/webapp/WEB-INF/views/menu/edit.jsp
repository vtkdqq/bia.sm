<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<%@ include file="/common/inc.jsp" %>
<script type="text/javascript">
$(document).ready(function() {

});
</script>
<ul class="breadcrumb">
    <li><a href="${root}/user/list">菜单列表</a> <span class="divider">/</span></li>
    <li class="active">${empty vote.id ?'新增菜单':'修改菜单'}</li>
</ul>
	<div class="block">
        <div class="block-content collapse in">
            <div class="span12">
			<!-- BEGIN FORM-->
			<form action="${root}/user/${empty meunu.id?'saveMeunuInfo':'updateVote'}" id="form_sample_1" class="form-horizontal" target="ajax" novalidate="novalidate">
				<input type="hidden" id="id" name="id" value="${vote.id}" />
				<input type="hidden" id="createUserid" name="createUserid" value="${sysUserVo.id}" />
				<fieldset>		
					<div class="control-group">
						<label class="control-label">用户名称：<span class="required"  style="color: red;">*</span></label>
						<div class="controls">
							<input type="text"  name="username" value="${vote.name}"  id="username"  style="width: 366px;" maxlength="20" data-required="1" class="required span6 m-wrap">
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">用户密码：<span class="required" style="color: red;">*</span></label>
						<div class="controls">
							<input id="password" class="required span6 m-wrap"  name="password" style="width: 366px;" maxlength="20"  value='' type="text" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">当前状态：<span class="required" style="color: red;"></span></label>
						<div class="controls">
							  <!--   <label style="overflow:hidden;width:100px;display: -webkit-inline-box;">
								  <input type="radio" name="status" value="1">启用
								</label>
								<label style="overflow:hidden;width:100px;">
								  <input type="radio" name="status" value="2">禁用
								</label>		
							  -->
							<select class="span5 m-wrap" name="status" id="status">
		                        <option value="1" <c:if test="${vote.status=='1'}">selected</c:if>>启用</option>
		                        <option value="0" <c:if test="${vote.status=='1'}">selected</c:if>>禁用</option>
			                </select>
						</div>
					</div>	
					<div class="form-actions" style="background-color: #FFFFFF;border-top: 0px solid #FFFFFF;">
						<button type="submit" id="add_adv" class="btn btn-primary">保&nbsp;&nbsp;存</button>	
						<button type="button" onclick="javascript:history.go(-1);tt(this.style.display='none')"  class="btn">取&nbsp;&nbsp;消</button>
					</div>
				</fieldset>
			</form>
		<!-- END FORM-->
		</div>
    </div>
</div>
</body>
</html>
