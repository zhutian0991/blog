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
<form class="form-inline" role="form" style="float:left;">
	<div class="btn-group" style="padding-right: 20px;">
	  <button type="button" class="btn btn-default">文章类型</button>
	  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    <span class="caret"></span>
	    <span class="sr-only">Toggle Dropdown</span>
	  </button>
	  <ul class="dropdown-menu" id="categoryMenu">
	  	<li onclick="queryCategorie(0)"><a href="javascript:;">全部文章</a></li>
	  	<c:forEach items="${categories}" var="categorie">
	  		<li onclick="queryCategorie(${categorie.id})"><a href="javascript:;">${categorie.name}</a></li>
	  	</c:forEach>
	  </ul>
	</div>  
  <div class="form-group has-feedback">
    <div class="input-group">
      <div class="input-group-addon">查询条件</div>
      <input id="fqname" class="form-control has-success" type="text" placeholder="请输入查询条件">
    </div>
  </div>
  <button type="button" id="queryname" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
</form>
<button type="button" id="bathDelete" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
<button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='${APP_PATH}/article/add.htm'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
<br>
 <hr style="clear:both;">
          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30">#</th>
				  <th width="30"><input type="checkbox" id="allBtn"></th>
				  <th width="100">文章类型</th>
                  <th>文章标题</th>
                  <th width="200">创建时间</th>
                  <th width="80">推荐文章</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody>	
					
              </tbody>
			  <tfoot>
			     <tr>
				     <td colspan="7" align="center">
						<div id="Pagination" class="pagination footer"></div>
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
			    queryArticle(0);
            });
            
            //根据分类查询文章
            function queryCategorie(categorieid){
            	dataObj = {"categorieid":categorieid};
           		queryArticle(0);
            }
            
            //查询相应标题的文章
            $("#queryname").click(function(){
            	var qname = $("#fqname").val();
            	qname = $.trim(qname);
            	if(qname==""){
            		layer.msg("查询条件不能为空", {time:2000, icon:5, shift:6},function(){
            			$("#fqname").focus();
            		});
            		return;
            	}
            	dataObj = {"qname":qname};
            	queryArticle(0);
            });
            
            //查询文章并进行分页处理
            function queryArticle(pageindex){
            	dataObj["pageNo"] = pageindex+1;
            	dataObj["pageSize"] = 5;
			    var loadingindex = -1;
			    var content = "";
			    $.ajax({
			    	url:"${APP_PATH}/article/show.do",
			    	type:"post",
			    	data:dataObj,
			    	beforeSend:function(){
			    		loadingindex = layer.load(2, {time: 10*1000});
			    		return true;
			    	},
			    	success:function(result){
			    		layer.close(loadingindex);
			    		if(result.success){
							var articles = result.page.data;
							var totalSize = result.page.totalSize;
							$.each(articles,function(index,article){
								var time = (new Date(article.createtime)).toLocaleDateString() + " " + (new Date(article.createtime)).toLocaleTimeString()
					            content+='<tr>';
					            content+='  <td>'+(index+1)+'</td>';
								content+='  <td><input type="checkbox" value="'+article.id+'"></td>';
					            content+='  <td>'+article.category.name+'</td>';
					            content+='  <td>'+article.title+'</td>';
					            content+='  <td>'+time+'</td>';
								if(article.mark==1){
									content+='  <td><input type="checkbox" checked="checked" id="commendBtn_'+article.id+'" onclick="commendArticle('+article.id+')"></td>';
								}else{
									content+='  <td><input type="checkbox" id="commendBtn_'+article.id+'" onclick="commendArticle('+article.id+')"></td>';
								}
					            content+='  <td>';
								content+='     <button type="button" onclick="window.location.href=\'${APP_PATH}/article/read.htm?id='+article.id+'\'" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-search"></i></button>';
								content+='     <button type="button" onclick="window.location.href=\'${APP_PATH}/article/edit.htm?id='+article.id+'\'" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>';
								content+='	   <button type="button" onclick="deleteArticle('+article.id+',\''+article.title+'\')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
								content+=' </td>';
					            content+='</tr>';
							});
							$(".table tbody").html(content);
		            		$("#Pagination").pagination(totalSize, {
		            			num_edge_entries: 1, //边缘页数
		            			num_display_entries: 4, //主体页数
		            			current_page:pageindex,
		            			prev_text:"上一页",
		            			next_text:"下一页",
		            			callback: queryArticle,
		            			items_per_page:5 //每页显示1项
		            		});							
			    		}
			    	}
			    });
            }
            
            //删除单个文章
		    function deleteArticle(id,title){
            	layer.confirm("确定要删除["+title+"]嘛？",  {icon: 3, title:'提示'}, function(cindex){
            		$.ajax({
            			url:"${APP_PATH}/article/delete.do",
            			type:"post",
            			data:{"id":id},
            			success:function(result){
            				if(result.success){
            					layer.msg("文章删除成功！", {time:2000, icon:6},function(){
            						queryArticle(0);
            					});
            				}
            			}
            		});
    				layer.close(cindex);
    			}, function(cindex){
    			    layer.close(cindex);
    			});
		    }
            
		   //选中相应的选项
		    $("#allBtn").click(function(){
		    	var flag = this.checked;
		    	var items = $(".table tbody input");
		    	$.each(items,function(i,item){
		    		item.checked = flag;
		    	});
		    });
		  
		   //批量删除多篇文章
		    $("#bathDelete").click(function(){
		    	var ids = "";
		    	var items = $(".table tbody :checked");
		    	if(items.length==0){
		    		layer.msg("请选择要删除的文章", {time:2000, icon:5, shift:6});
		    		return;
		    	}else{
			    	$.each(items,function(i,item){
			    		var id = item.value;
			    		if(i>0){
			    			ids += "&id="+id;
			    		}else{
			    			ids += "id="+id;
			    		}
			    	});
	            	layer.confirm("确定要删除这些文章嘛？",  {icon: 3, title:'提示'}, function(cindex){
	            		$.ajax({
	            			url:"${APP_PATH}/article/bathDelete.do",
	            			type:"post",
	            			data:ids,
	            			success:function(result){
	            				if(result.success){
	            					layer.msg("文章删除成功！", {time:2000, icon:6},function(){
	            						queryArticle(0);
	            					});
	            				}
	            			}
	            		});
	    				layer.close(cindex);
	    			}, function(cindex){
	    			    layer.close(cindex);
	    			});			    	
		    	}
		    	
		    });
		   
		   //文章推荐设置
		   function commendArticle(id){
			   var commendBtn = "commendBtn_"+id;
			   var flag = $("#"+commendBtn)[0].checked;
			   $.ajax({
				   url:"${APP_PATH}/article/updateMark.do",
				   type:"post",
				   data:{
					   "id":id,
					   "mark":flag?"1":"0"
				   },
				   success:function(result){
					   if(result.success){
						   queryArticle(0);
					   }
				   }
			   });
		   }
        </script>
  </body>
</html>