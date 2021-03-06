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
				  <li><a href="${APP_PATH}/article/list.htm">文章列表</a></li>
				  <li class="active">新增</li>
				</ol>
			<div class="panel panel-default">
              <div class="panel-heading">新增文章<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
				<form role="form" id="formBtn" enctype="multipart/form-data">
				  <table>
				  	<tr>
				  		<td>
				  			<div class="form-group">
				  			<select name="categoryid" id="fcategorieid" style="width: 120px;margin-right: 10px;" class="form-control">
				  				<c:forEach items="${categories}" var="categorie">
				  					<option value="${categorie.id}">${categorie.name}</option>
				  				</c:forEach>
							</select>
							</div>
				  		</td>
				  		<td>
				  			<div class="form-group">
				  			<input style="width: 600px;" type="text" class="form-control" id="ftitle" name="title" placeholder="请输入标题">
				  			</div>
				  		</td>
				  	</tr>
				  </table>
				  <script id="container" name="content" type="text/plain"></script>
				  <button type="button" id="formSubmit" class="btn btn-success"><i class="glyphicon glyphicon-check"></i>发表文章</button>
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
			    $("#formSubmit").click(function(){
			    	var title = $("#ftitle").val();
			    	title = $.trim(title);
			    	if(title==""){
			    		layer.msg("请输入标题", {time:2000, icon:5, shift:6});
			    		return;
			    	}
			    	var content = UE.getEditor('container').getContent();
			    	var digest = UE.getEditor('container').getContentTxt();
			    	if(digest.length>100){
			    		digest = digest.substring(0,100);
			    	}
			    	content = $.trim(content);
			    	if(content==""){
			    		layer.msg("请输入内容", {time:2000, icon:5, shift:6});
			    		return;
			    	}
			    	$.ajax({
			    		url:"${APP_PATH}/article/insert.do",
			    		type:"post",
			    		data:{
			    			"categoryid":$("#fcategorieid").val(),
			    			"title":title,
			    			"content":content,
			    			"digest":digest
			    		},
			    		success:function(result){
			    			if(result.success){
			    				layer.msg("发表文章成功", {time:2000, icon:6},function(){
			    					window.location.href="${APP_PATH}/article/list.htm";
			    				});
			    			}else{
			    				layer.msg("发表文章失败", {time:2000, icon:5, shift:6});
			    			}
			    		}
			    	});
			    });
            });
            var ue = UE.getEditor('container');
        </script>
  </body>
</html>
