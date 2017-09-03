<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>孤独客博客</title>
<meta name="keywords" content="孤独客博客" />
<meta name="description" content="孤独客博客" />
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/main1.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
</head>
<body>
<div id="wrapper">
  <header>
    <div class="headtop"></div>
    <div class="contenttop">
    <div class="logo f_l" style="display: inline-block;">孤独客博客</div>
	
    <div class="search f_r" style="display: inline-block;">
      <p>${suser.motto}</p>
    </div>
	  <div class="blank"></div>
      <nav>
        <div class="navigation">
          <ul class="menu">
            <li><a href="${pageContext.request.contextPath}/home.htm">网站首页</a></li>
            <li><a href="javascript:;">关于我</a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/about.htm">个人简介</a></li>
              </ul>
            </li>
            <c:forEach items="${categories}" var="category">
            	<li><a href="${pageContext.request.contextPath}/list.htm?id=${category.id}">${category.name}</a>
            </c:forEach>
			<li><a href="${pageContext.request.contextPath}/shuo.htm">碎言碎语</a> </li>
          </ul>
        </div>
      </nav>
    <SCRIPT type=text/javascript>
	// Navigation Menu
	$(function() {
		$(".menu ul").css({display: "none"}); // Opera Fix
		$(".menu li").hover(function(){
			$(this).find('ul:first').css({visibility: "visible",display: "none"}).slideDown("normal");
		},function(){
			$(this).find('ul:first').css({visibility: "hidden"});
		});
	});
</SCRIPT> 
  </div>
</header>
<div class="container">
  <div class="con_content">
    <div class="about_box">
      <h2 class="nh1"><span>您现在的位置是：<a href="${pageContext.request.contextPath}/home.htm">网站首页</a>>><a href="${pageContext.request.contextPath}/list.htm?id=${category.id}">${category.name}</a></span><b>${category.name}</b></h2>
      <div class="dtxw box">

      </div>
      <div class="pagelist">
      	<div id="Pagination" class="pagination"></div>
      </div>
    </div>
  </div>
  <div class="blank"></div>
  <!-- container代码 结束 -->
  
  <footer>
    <div class="footer">
      <div class="f_l">
        <p>All Rights Reserved 版权所有：<a href="${pageContext.request.contextPath}/home.htm">孤独客博客</a></p>
      </div>
      <div class="f_r textr">
        <p>Design by Guduke</p>
      </div>
    </div>
  </footer>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
<script type="text/javascript">
	$(function(){
		queryArticle(0);
	});
	function queryArticle(pageindex){
    	var id = ${id};
		var dataObj = {"pageNo":(pageindex+1),"pageSize":6,"categorieid":id};
	    var loadingindex = -1;
	    var content = "";
	    $.ajax({
	    	url:"${pageContext.request.contextPath}/articleList.do",
	    	type:"post",
	    	data:dataObj,
	    	success:function(result){
	    		if(result.success){
					var articles = result.page.data;
					var totalSize = result.page.totalSize;
					$.each(articles,function(index,article){
						var time = (new Date(article.createtime)).toLocaleDateString();
				        content+='<li>';
				        content+='  <div class="dttext f_l">';
				        content+='    <ul>';
				        content+='      <h2><a href="${pageContext.request.contextPath}/showArticle.htm?id='+article.id+'">'+article.title+'</a></h2>';
				        content+='      <p>'+article.digest+'</p>';
				        content+='      <span>发表时间：'+time+'</span>';
				        content+='    </ul>';
				        content+='  </div>';
				        content+='</li>';
					});
					$(".dtxw").html(content);
            		$("#Pagination").pagination(totalSize, {
            			num_edge_entries: 1, //边缘页数
            			num_display_entries: 4, //主体页数
            			current_page:pageindex,
            			prev_text:"上一页",
            			next_text:"下一页",
            			callback: queryArticle,
            			items_per_page:6 //每页显示1项
            		});							
	    		}
	    	}
	    });
    }	
</script>
</body>
</html>