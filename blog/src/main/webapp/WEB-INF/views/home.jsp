<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>孤独客博客</title>
<meta name="keywords" content="孤独客博客" />
<meta name="description" content="孤独客博客" />
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
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
  <div class="jztop"></div>
  <div class="container">
    <div class="bloglist f_l">
      <c:forEach items="${articles}" var="article" varStatus="status">
      <h3><a href="${pageContext.request.contextPath}/showArticle.htm?id=${article.id}">${article.title}</a></h3>
      <figure><img src="${pageContext.request.contextPath}/images/img_${status.count}.jpg"></figure>
      <ul>
        <p>${article.digest}</p>
        <a href="${pageContext.request.contextPath}/showArticle.htm?id=${article.id}" class="readmore">阅读全文&gt;&gt;</a>
      </ul>
      <p class="dateview">
	      <span><fmt:formatDate value="${article.createtime}" pattern="yyyy-MM-dd"/></span>
	      <span>作者：孤独客</span>
	      <span>个人博客：[<a href="${pageContext.request.contextPath}/list.htm?id=${article.categoryid}">${article.category.name}</a>]</span>
      </p>     
      </c:forEach>
    </div>
    <div class="r_box f_r">
      <div class="tit01">
        <h3 class="tit">关注我</h3>
        <div class="gzwm">
          <ul>
            <li><a class="email" >我的电话</a></li>
            <li><a class="qq" href="#" title="${suser.email}">我的邮箱</a></li>
            <li><a class="tel" href="#" title="${suser.qq}">我的QQ</a></li>
            <li><a class="prize" href="#">个人奖项</a></li>
          </ul>
        </div>
      </div>
      <!--tit01 end-->
      
      <div class="ph">
        <h3 class="tit">文章列表</h3>
        <ul class="rank">
          <c:forEach items="${rankArticles}" var="rankArticle">
          	<li><a href="${pageContext.request.contextPath}/showArticle.htm?id=${rankArticle.id}">${rankArticle.title}</a></li>
          </c:forEach>
        </ul>
      </div>
      <div class="ad"> <img src="${pageContext.request.contextPath}/images/03.jpg"> </div>
    </div>
  </div>
  <!-- container代码 结束 -->
  <div class="jzend"></div>
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
</body>
</html>