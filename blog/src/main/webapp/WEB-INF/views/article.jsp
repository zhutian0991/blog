<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
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
        <h2 class="nh1" style=""><span>您现在的位置是：<a href="${pageContext.request.contextPath}/home.htm">网站首页</a>>><a href="javascript:;">信息浏览</a></span><b>${article.title}</b></h2>
        <div class="f_box">
          <p class="a_title">${article.title}</p>
          <p class="p_title"></p>
          <p class="box_p">
          	<span>发布时间：<fmt:formatDate value="${article.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
          	<span>作者：孤独客</span>
          	<span>分类【<a style="text-decoration: underline;" href="${pageContext.request.contextPath}/list.htm?id=${article.categoryid}">${article.category.name}</a>】</span>
          </p>
        </div>
        <ul class="about_content">
          <p>${article.content}</p>
        </ul>
      </div>
    </div>
    <div class="blank"></div>
  </div>
    <!--content end-->
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
</script>
</body>
</html>