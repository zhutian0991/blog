<%@page import="com.guduke.blog.entity.Article"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="UTF-8">
  <head>
    <%@include file="/WEB-INF/views/common/head.jsp" %>
	<link rel="stylesheet" href="${APP_PATH}/css/main.css">
	<link rel="stylesheet" href="${APP_PATH}/css/pagination.css">
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	table tbody tr:nth-child(odd){background:#F4F4F4;}
	table tbody td:nth-child(even){color:#C00;}
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
			<div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
			  </div>
			  <div class="panel-body">
			  <button type="button" class="btn btn-primary" style="float:left;" onclick="window.location.href='${APP_PATH}/category/edit.htm'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
			  <br>
 			  <hr style="clear:both;">
          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr>
                  <th width="30">#</th>
				  <th width="100">文章分类</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody>
				<c:forEach items="${categories}" var="category" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${category.name}</td>
						<td>
							<button type="button" onclick="window.location.href='${APP_PATH}/category/edit.htm?id=${category.id}'" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>
							<button type="button" onclick="deleteCategory(${category.id},'${category.name}')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>
						</td>
					</tr>
				</c:forEach>
              </tbody>
			  <tfoot>
			     <tr>
				     <td colspan="6" align="center">
						<div id="Pagination" class="pagination"></div>
					 </td>
				 </tr>			
			  </tfoot>
            </table>
          </div>
			  </div>
			</div>
        </div>
      </div>
    </div>

    <%@include file="/WEB-INF/views/common/script.jsp" %>
	<script src="${APP_PATH}/script/docs.min.js"></script>
    <script src="${APP_PATH}/jquery/jquery.pagination.js"></script>
        <script type="text/javascript">
            var dataObj = {};
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
            }); 
            
            //删除分类
		    function deleteCategory(id,name){
            	layer.confirm("确定要删除["+name+"]嘛？",  {icon: 3, title:'提示'}, function(cindex){
            		$.ajax({
            			url:"${APP_PATH}/category/delete.do",
            			type:"post",
            			data:{"id":id},
            			success:function(result){
            				if(result.success){
            					layer.msg("分类删除成功！", {time:1000, icon:6},function(){
            						window.location.href="${APP_PATH}/category/list.htm";
            					});
            				}
            			}
            		});
    				layer.close(cindex);
    			}, function(cindex){
    			    layer.close(cindex);
    			});
		    }
        </script>
  </body>
</html>