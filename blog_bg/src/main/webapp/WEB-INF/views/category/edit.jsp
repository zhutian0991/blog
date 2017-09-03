<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="GB18030">
  <head>
    <%@include file="/WEB-INF/views/common/head.jsp" %>
	<link rel="stylesheet" href="${APP_PATH}/css/main.css">
	<link rel="stylesheet" href="${APP_PATH}/css/doc.min.css">
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	</style>
  </head>

  <body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <div><img src="${APP_PATH}/img/logo.png" width="50" style="float:left;margin-top:5px;"><a class="navbar-brand" style="font-size:32px;" href="#">博客后台管理系统</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li style="padding-top:8px;padding-right: 8px;">
				<div class="btn-group">
				  <button type="button" class="btn btn-default btn-success">
					<i class="glyphicon glyphicon-user"></i>${suser.username}
				  </button>
			    </div>
			</li>
			<li style="padding-top:8px;padding-right: 8px;">
				<div class="btn-group">
				    <button type="button" class="btn btn-info">
					  <li><a href="${APP_PATH}/loginout.htm"><i class="glyphicon glyphicon-log-out"></i> 退出系统</a></li>
					</button>
				</div>
			</li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
			<div class="tree">
				<ul style="padding-left:0px;" class="list-group">
					<c:forEach items="${smenu}" var="menu">
					<c:if test="${empty menu.children}">
						<li class="list-group-item tree-closed" >
							<a href="${APP_PATH}/${menu.url}"><i class="glyphicon glyphicon glyphicon-tasks"></i>${menu.name}</a> 
						</li>
					</c:if>
					<c:if test="${not empty menu.children}">
					<li class="list-group-item tree-closed">
						<span><i class="glyphicon glyphicon glyphicon-tasks"></i>${menu.name}<span class="badge" style="float:right">${fn:length(menu.children)}</span></span> 
						<ul style="margin-top:10px;display:none;">
						<c:forEach items="${menu.children}" var="children">
							<li style="height:30px;">
								<a href="${APP_PATH}/${children.url}"><i class="glyphicon glyphicon-minus-sign"></i>${children.name}</a> 
							</li>
						</c:forEach>
						</ul>
					</li>
					</c:if>	
					</c:forEach>				
				</ul>
			</div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
				  <li><a href="${APP_PATH}/main.htm">首页</a></li>
				  <li><a href="${APP_PATH}/category/list.htm">分类列表</a></li>
				  <li class="active">文章分类</li>
				</ol>
			<div class="panel panel-default">
              <div class="panel-heading">文章分类<div style="float:right;cursor:pointer;"></div></div>
			  <div class="panel-body">
				<form role="form" id="formBtn" >
				  <div class="form-group">
					<input style="width: 400px;" type="text" value="${category.name}" class="form-control" id="fname" placeholder="请输入文章分类">
					<input type="hidden" id="fid" name="id" value="${param.id}" >
				  </div>
				  <button style="margin-top: 10px;" type="button" id="formSubmit" class="btn btn-success"><i class="glyphicon glyphicon-pencil"></i>提交数据</button>
				</form>
			  </div>
			</div>
        </div>
      </div>
    </div>
    <%@include file="/WEB-INF/views/common/script.jsp" %>
    <script type="text/javascript" src="${APP_PATH}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${APP_PATH}/ueditor/ueditor.all.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
        <script type="text/javascript">
            $(function () {
			    $(".list-group-item").click(function(){
				    if ( $(this).find("ul") ) {
						$(this).toggleClass("tree-closed");
						if ( $(this).hasClass("tree-closed") ) {
							$("ul", this).hide("fast");
						} else {
							$("ul", this).show("fast");
						}
					}
				});
            })
            
            $("#formSubmit").click(function(){
            	var name = $("#fname").val();
            	name = $.trim(name);
            	if(name==""){
            		layer.msg("分类名称不能为空", {time:1000, icon:5, shift:6},function(){
            			$("#fname").focus();
            		});
            		return;
            	}
            	var id =$("#fid").val();
            	var dataObj={};
            	if(id==""){
            		url = "${APP_PATH}/category/insert.do";
            		dataObj={"name":name};
            	}else{
            		url = "${APP_PATH}/category/update.do";
            		dataObj={"id":id,"name":name};
            	}
            	$.ajax({
            		url:url,
            		type:"post",
            		data:dataObj,
            		success:function(result){
            			if(result.insert){
            				layer.msg("添加分类成功！", {time:1000, icon:6},function(){
            					window.location.href="${APP_PATH}/category/list.htm";
            				});
            			}
            			
            			if(result.update){
            				layer.msg("修改分类成功！", {time:1000, icon:6},function(){
            					window.location.href="${APP_PATH}/category/list.htm";
            				});
            			}
            		}
            	});
            })
        </script>
  </body>
</html>
