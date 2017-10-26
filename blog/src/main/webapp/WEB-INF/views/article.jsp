<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>${article.title}</title>
<meta name="keywords" content="微光空间" />
<meta name="description" content="微光空间" />
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/main1.css" rel="stylesheet">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon" />
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
    <div class="logo f_l" style="display: inline-block;">微光空间</div>
	
    <div class="search f_r" style="display: inline-block;">
      <p>${suser.motto}</p>
    </div>
	  <div class="blank"></div>
      <nav>
        <div class="navigation">
          <ul class="menu">
            <li><a href="${pageContext.request.contextPath}/home.htm">网站首页</a></li>
            <li><a href="javascript:;">我的文章</a>
            	<ul>
	            <c:forEach items="${categories}" var="category">
	            	<li><a href="${pageContext.request.contextPath}/list.htm?id=${category.id}">${category.name}</a>
	            </c:forEach>            	
            	</ul>
            </li>
 			<li><a href="${pageContext.request.contextPath}/shuo.htm">碎言碎语</a> </li>
            <li><a href="javascript:;">关于我</a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/about.htm">个人简介</a></li>
              </ul>
            </li>
            <li><a href="${pageContext.request.contextPath}/message.htm">留言板</a></li>
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
        <h2 class="nh1" style=""><span>您现在的位置是：<a href="${pageContext.request.contextPath}/home.htm">网站首页</a>>><a href="javascript:;">信息浏览</a></span><b>${article.title}</b></h2>
        <div class="f_box">
          <p class="a_title">${article.title}</p>
          <p class="p_title"></p>
          <p class="box_p">
          	<span>发布时间：<fmt:formatDate value="${article.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
          	<span>作者：微光</span>
          	<span>分类【<a style="text-decoration:none;" href="${pageContext.request.contextPath}/list.htm?id=${article.categoryid}">${article.category.name}</a>】</span>
          </p>
        </div>
        <ul class="about_content">
          <p>${article.content}</p>
        </ul>
        <div class="nextinfos">
          <c:if test="${not empty preArticle}">
	      	<p>上一篇：<a href="${pageContext.request.contextPath}/showArticle.htm?id=${preArticle.id}">${preArticle.title}</a></p>
	      </c:if>
	      <c:if test="${not empty nextArticle}">
	      	<p>下一篇：<a href="${pageContext.request.contextPath}/showArticle.htm?id=${nextArticle.id}">${nextArticle.title}</a></p>
	      </c:if>
        </div>
        <div id="uyan_frame"></div>
		<script type="text/javascript" src="http://v2.uyan.cc/code/uyan.js?uid=2142725"></script>
      </div>
    </div>
    <div class="blank"></div>
  </div>
    <!--content end-->
  <footer>
    <div class="footer">
      <div class="f_l">
        <p>All Rights Reserved 版权所有：<a href="http://www.guduke.cn/">微光空间</a> 备案号：湘ICP备17018824</p>
      </div>
      <div class="f_r textr">
        <p>Design by Guduke</p>
      </div>
    </div>
  </footer>
</div>	
</script>
</body>
</html>